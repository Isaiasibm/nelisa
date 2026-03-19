<?php
namespace App\adms\Controllers;

class ControllerRequisicao extends Controller
{
    private $Dados;
    private $result;

    public function ReciveRequest()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        header('Content-Type: application/json; charset=utf-8');

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

        $vendaModel = new \App\adms\Models\admsVenda();

        // 1) validar ação
        if (empty($this->Dados['accao']) || $this->Dados['accao'] !== "RealizarVenda") {
            echo json_encode(['success' => false, 'message' => 'Ação inválida']);
            exit;
        }

        // 2) validar turno - com fallback para consulta ao BD se sessão expirou
        $idTurnoAtivo = null;

        if (! empty($_SESSION['turno_id'])) {
            $idTurnoAtivo = (int) $_SESSION['turno_id'];
        } else {
            // Sessão expirou? Tenta recuperar turno ativo da BD
            if (! empty($_SESSION['usuario_id'])) {
                $turnoModel = new \App\adms\Models\AdmsTurno();
                $turnoAtivo = $turnoModel->buscarTurnoDoUsuarioAgora((int) $_SESSION['usuario_id']);

                if ($turnoAtivo && ((int) $turnoAtivo['id_status'] === 2)) {
                    // Turno ainda está ativo (status 2 = em_andamento)
                    $idTurnoAtivo = (int) $turnoAtivo['id'];
                    // Restaura na sessão para próximas requisições
                    $_SESSION['turno_id'] = $idTurnoAtivo;
                }
            }
        }

        if (empty($idTurnoAtivo)) {
            echo json_encode([
                'success' => false,
                'message' => 'Nenhum turno ativo. Inicie um turno para registar vendas.',
            ]);
            exit;
        }

        // 3) validar carrinho
        $carrinho = json_decode($this->Dados['carrinho'] ?? '[]', true);
        if (empty($carrinho) || ! is_array($carrinho)) {
            echo json_encode(['success' => false, 'message' => 'Carrinho vazio ou dados inválidos']);
            exit;
        }

        // 4) (RECOMENDADO) idempotência para evitar duplicação
        // Requer criar tabela tb_request_venda (SQL abaixo) + métodos no model.
        $requestId = trim($this->Dados['request_id'] ?? '');

        if ($requestId !== '') {
            $ja = $vendaModel->buscarRequestVenda($requestId);
            if ($ja) {
                echo json_encode([
                    'success'       => true,
                    'numero_fatura' => $ja['numero_fatura'] ?? '',
                    'message'       => 'Venda já processada anteriormente. Se desejar realizar outra venda, selecione novamente os produtos.',
                ]);
                exit;
            }
        }

        // 5) registar venda (1x)
        $DadosVenda = [
            'total'      => (double) $this->Dados['totalVenda'],
            'id_usuario' => (int) $_SESSION['usuario_id'],
            'id_turno'   => $idTurnoAtivo,
            'data_venda' => date('Y-m-d H:i:s'),
        ];

        $vendaModel->cadastrarVenda($DadosVenda);

        if ($vendaModel->getResultado() < 1) {
            echo json_encode(['success' => false, 'message' => 'Falha ao realizar a venda']);
            exit;
        }

        $idVenda = (int) $vendaModel->getResultado();

        // número da fatura
        $dataHoje     = date('Y-m-d');
        $totalHoje    = $vendaModel->contarVendasDoDia($dataHoje);
        $numeroFatura = 'FAT-' . str_pad($idVenda, 4, '0', STR_PAD_LEFT) . '-' . str_pad($totalHoje, 4, '0', STR_PAD_LEFT);

        // 6) registar itens e tentar atualizar estoque
        foreach ($carrinho as $item) {
            $idProduto = (int) ($item["id"] ?? 0);
            $qtd       = (int) ($item["quantidade"] ?? 0);
            $preco     = (double) ($item["preco"] ?? 0);
            $subtotal  = (double) ($item["subtotal"] ?? 0);

            if ($idProduto <= 0 || $qtd <= 0) {
                continue; // ignora item inválido
            }

            $itensVenda = [
                'id_venda'       => $idVenda,
                'id_produto'     => $idProduto,
                'quantidade'     => $qtd,
                'preco_unitario' => $preco,
                'subtotal'       => $subtotal,
                'id_usuario'     => (int) $_SESSION['usuario_id'],
                'created'        => date('Y-m-d H:i:s'),
            ];

            $vendaModel->cadastrarItemVenda($itensVenda);

            if ($vendaModel->getResultado() < 1) {
                echo json_encode(['success' => false, 'message' => 'Falha ao registar itens de venda']);
                exit;
            } else {
                // Se item registrado com sucesso, decrementa estoque
                $vendaModel->decrementarEstoque($item["id"], $item["quantidade"]);

            }
        }

        // 7) registar pagamento (1x, FORA do loop)
        $emDinheiro    = (double) ($this->Dados['emDinheiro'] ?? 0);
        $multicaixa    = (double) ($this->Dados['multicaixa'] ?? 0);
        $transferencia = (double) ($this->Dados['transferencia'] ?? 0);

        $valorTotalPago = $emDinheiro + $multicaixa + $transferencia;

        $pagVenda = [
            'id_venda'    => $idVenda,
            'valor_total' => (double) $this->Dados["totalVenda"],
            'valor_pago'  => $valorTotalPago,
            'troco'       => (double) ($this->Dados["troco"] ?? 0),
            'id_usuario'  => (int) $_SESSION['usuario_id'],
            'created_at'  => date('Y-m-d H:i:s'),
        ];

        $vendaModel->cadastrarPagamentoVenda($pagVenda);

        if ($vendaModel->getResultado() < 1) {
            echo json_encode(['success' => false, 'message' => 'Falha ao registar pagamento']);
            exit;
        }

        $idPagamento = (int) $vendaModel->getResultado();

        // 8) detalhes pagamento (0..3)
        if ($emDinheiro > 0) {
            $vendaModel->cadastrarDetalhesPagamento([
                'id_pagamento'       => $idPagamento,
                'id_forma_pagamento' => 1,
                'valor_pagamento'    => $emDinheiro,
                'id_usuario'         => (int) $_SESSION['usuario_id'],
                'created_at'         => date('Y-m-d H:i:s'),
            ]);
        }

        if ($multicaixa > 0) {
            $vendaModel->cadastrarDetalhesPagamento([
                'id_pagamento'       => $idPagamento,
                'id_forma_pagamento' => 2,
                'valor_pagamento'    => $multicaixa,
                'id_usuario'         => (int) $_SESSION['usuario_id'],
                'created_at'         => date('Y-m-d H:i:s'),
            ]);
        }

        if ($transferencia > 0) {
            $vendaModel->cadastrarDetalhesPagamento([
                'id_pagamento'       => $idPagamento,
                'id_forma_pagamento' => 3,
                'valor_pagamento'    => $transferencia,
                'id_usuario'         => (int) $_SESSION['usuario_id'],
                'created_at'         => date('Y-m-d H:i:s'),
            ]);
        }

        // 9) gravar request_id (idempotência) se existir
        if ($requestId !== '') {

            $vendaModel->gravarRequestVenda([
                'request_id'    => $requestId,
                'id_venda'      => $idVenda,
                'numero_fatura' => $numeroFatura,
                'created_at'    => date('Y-m-d H:i:s'),
            ]);
        }

        // 10) resposta com dados da fatura
        echo json_encode([
            'success'       => true,
            'numero_fatura' => $numeroFatura,
            'id_venda'      => $idVenda,
            'message'       => 'Venda realizada com sucesso',
        ]);
        exit;
    }
}
