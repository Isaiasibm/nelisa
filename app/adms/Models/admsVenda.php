<?php
namespace App\adms\Models;

if (! defined('URL')) {
    header("Location: /");
    exit();
}

/**
 * Model para vendas (usado pelo ControllerRequisicao::ReciveRequest)
 *
 * Tabelas esperadas (ajuste nomes/colunas se no teu BD forem diferentes):
 * - venda (id_venda PK, total, id_usuario, id_turno, data_venda)
 * - tb_item_venda (id_item PK, id_venda, id_produto, quantidade, preco_unitario, subtotal, id_usuario, created)
 * - tb_pagamento_venda (id_pagamento PK, id_venda, valor_total, valor_pago, troco, id_usuario, created_at)
 * - tb_detalhes_pagamento (id PK, id_pagamento, id_forma_pagamento, valor_pagamento, id_usuario, created_at)
 * - tb_estoque (id PK, id_produto, quantidade_disponivel, id_localizacao, data_validade, created_at)
 * - tb_request_venda (request_id UNIQUE, id_venda, numero_fatura, created_at)  [idempotência]
 * - tb_alerta_estoque (id PK, id_venda, id_produto, quantidade_vendida, quantidade_faltou, mensagem, status, id_usuario, created_at)
 */
class AdmsVenda
{
    private mixed $resultado = null;
    private array $dados     = [];

    // ✅ Ajusta aqui se no teu BD o nome da tabela de alertas for outro
    private string $tabelaAlertas = 'tb_alerta_estoque';

    public function getResultado(): mixed
    {
        return $this->resultado;
    }

    /* =========================================================
     * 1) IDEMPOTÊNCIA (tb_request_venda)
     * ========================================================= */

    public function buscarRequestVenda(string $requestId): ?array
    {
        $requestId = trim($requestId);
        if ($requestId === '') {
            return null;
        }

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT request_id, id_venda, numero_fatura, created_at
             FROM tb_request_venda
             WHERE request_id = :rid
             LIMIT 1",
            "rid={$requestId}"
        );

        $res = $read->getResultado();
        return ! empty($res) ? $res[0] : null;
    }

    public function gravarRequestVenda(array $dados): void
    {
        $this->dados = $dados;

        $create = new \App\adms\Models\helper\AdmsCreate();
        $create->exeCreate("tb_request_venda", [
            'request_id'    => (string) ($this->dados['request_id'] ?? ''),
            'id_venda'      => (int) ($this->dados['id_venda'] ?? 0),
            'numero_fatura' => (string) ($this->dados['numero_fatura'] ?? ''),
            'created_at'    => (string) ($this->dados['created_at'] ?? date('Y-m-d H:i:s')),
        ]);

        $this->resultado = $create->getResultado(); // esperado: id_venda
    }

    /* =========================================================
     * 2) VENDA / ITENS
     * ========================================================= */

    public function cadastrarVenda(array $dados): void
    {
        $this->dados = $dados;

        $create = new \App\adms\Models\helper\AdmsCreate();
        $create->exeCreate("venda", [
            'total'      => (float) ($this->dados['total'] ?? 0),
            'id_usuario' => (int) ($this->dados['id_usuario'] ?? 0),
            'id_turno'   => (int) ($this->dados['id_turno'] ?? 0),
            'data_venda' => (string) ($this->dados['data_venda'] ?? date('Y-m-d H:i:s')),
        ]);

        $this->resultado = $create->getResultado(); // esperado: id_venda
    }

    public function cadastrarItemVenda(array $dados): void
    {
        $create = new \App\adms\Models\helper\AdmsCreate();
        $create->exeCreate("tb_item_venda", [
            'id_venda'       => (int) ($dados['id_venda'] ?? 0),
            'id_produto'     => (int) ($dados['id_produto'] ?? 0),
            'quantidade'     => (int) ($dados['quantidade'] ?? 0),
            'preco_unitario' => (float) ($dados['preco_unitario'] ?? 0),
            'subtotal'       => (float) ($dados['subtotal'] ?? 0),
            'id_usuario'     => (int) ($dados['id_usuario'] ?? 0),
            'created'        => (string) ($dados['created'] ?? date('Y-m-d H:i:s')),
        ]);

        $this->resultado = $create->getResultado(); // esperado: id do item
    }

    public function contarVendasDoDia(string $dataYmd): int
    {
        $ini = $dataYmd . " 00:00:00";
        $fim = $dataYmd . " 23:59:59";

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT COUNT(*) AS total
             FROM venda
             WHERE data_venda BETWEEN :ini AND :fim",
            "ini={$ini}&fim={$fim}"
        );

        $res = $read->getResultado();
        return ! empty($res) ? (int) $res[0]['total'] : 0;
    }

    /* =========================================================
     * 3) ESTOQUE (total disponível + decremento)
     * ========================================================= */

    public function getTotalDisponivelProduto(int $idProduto): int
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT COALESCE(SUM(quantidade_disponivel),0) AS total
             FROM tb_estoque
             WHERE id_produto = :id
               AND quantidade_disponivel > 0
               AND (id_localizacao IN (1,2) OR id_localizacao IS NULL)",
            "id={$idProduto}"
        );

        $res = $read->getResultado();
        return ! empty($res) ? (int) $res[0]['total'] : 0;
    }

    /**
     * Decrementa do estoque em FIFO (por validade e created_at).
     * Retorna TRUE se conseguiu baixar a quantidade toda; FALSE se faltou.
     */

    public function decrementarEstoqueFalso(int $idProduto, int $qtd): bool
    {
        if ($idProduto <= 0 || $qtd <= 0) {
            return true;
        }

        $pdo = \App\adms\Models\helper\AdmsConn::connect();

        try {
            $pdo->beginTransaction();

            // pega lotes com quantidade disponível
            $sql = "SELECT id, quantidade_disponivel
                    FROM tb_estoque
                    WHERE id_produto = :id_produto
                      AND quantidade_disponivel > 0
                      AND (id_localizacao IN (1,2) OR id_localizacao IS NULL)
                    ORDER BY
                      CASE WHEN data_validade IS NULL THEN 1 ELSE 0 END,
                      data_validade ASC,
                      created_at ASC";

            $stmt = $pdo->prepare($sql);
            $stmt->execute([':id_produto' => $idProduto]);
            $rows = $stmt->fetchAll(\PDO::FETCH_ASSOC);

            $restante = $qtd;

            foreach ($rows as $r) {
                if ($restante <= 0) {
                    break;
                }

                $idEstoque = (int) $r['id'];
                $disp      = (int) $r['quantidade_disponivel'];
                if ($disp <= 0) {
                    continue;
                }

                $tirar = min($disp, $restante);
                $novo  = $disp - $tirar;

                $up = $pdo->prepare("UPDATE tb_estoque SET quantidade_disponivel = :novo WHERE id = :id");
                $up->execute([':novo' => $novo, ':id' => $idEstoque]);

                $restante -= $tirar;
            }

            $pdo->commit();

            // se ainda sobrou, então não havia estoque suficiente
            return ($restante <= 0);
        } catch (\Throwable $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }

            return false;
        }
    }

    public function decrementarEstoque($idProduto, $quantidadeVendida)
    {
        $estoqueRestante = (int) $quantidadeVendida;

        if ((int) $idProduto <= 0 || $estoqueRestante <= 0) {
            return; // apenas sai
        }

        // FIFO: mais antiga → mais recente
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id, quantidade_disponivel
         FROM tb_estoque
         WHERE id_produto = :id
           AND quantidade_disponivel > 0
         ORDER BY created_at ASC, id ASC",
            "id={$idProduto}"
        );

        $entradas = $read->getResultado();

        if (empty($entradas)) {
            return; // não tem estoque, apenas sai
        }

        $update = new \App\adms\Models\helper\AdmsUpdate();

        foreach ($entradas as $entrada) {

            if ($estoqueRestante <= 0) {
                break;
            }

            $idEstoque  = (int) $entrada['id'];
            $disponivel = (int) $entrada['quantidade_disponivel'];

            if ($disponivel <= 0) {
                continue;
            }

            // Quanto consumir desta entrada
            $consumido = min($disponivel, $estoqueRestante);

            $novaQuantidade = $disponivel - $consumido;

            // Nunca deixar negativo (garantia extra)
            if ($novaQuantidade < 0) {
                $novaQuantidade = 0;
            }

            $estoqueRestante -= $consumido;

            $update->exeUpdate(
                "tb_estoque",
                ["quantidade_disponivel" => $novaQuantidade],
                "WHERE id = :id",
                "id={$idEstoque}"
            );
        }

        // Se ainda sobrar estoqueRestante, simplesmente ignora.
        // Nada é retornado.
    }

    /* =========================================================
     * 4) ALERTA DE ESTOQUE
     * ========================================================= */

    public function criarAlertaEstoque(array $dados): void
    {
        try {
            $create = new \App\adms\Models\helper\AdmsCreate();
            $create->exeCreate($this->tabelaAlertas, [
                'id_venda'           => (int) ($dados['id_venda'] ?? 0),
                'id_produto'         => (int) ($dados['id_produto'] ?? 0),
                'quantidade_vendida' => (int) ($dados['quantidade_vendida'] ?? 0),
                'quantidade_faltou'  => (int) ($dados['quantidade_faltou'] ?? 0),
                'mensagem'           => (string) ($dados['mensagem'] ?? ''),
                'status'             => (int) ($dados['status'] ?? 0),
                'id_usuario'         => (int) ($dados['id_usuario'] ?? 0),
                'created_at'         => (string) ($dados['created_at'] ?? date('Y-m-d H:i:s')),
            ]);

            $this->resultado = $create->getResultado();
        } catch (\Throwable $e) {
            // não quebra a venda por causa do alerta
            $this->resultado = 0;
        }
    }

    /* =========================================================
     * 5) PAGAMENTO / DETALHES
     * ========================================================= */

    public function cadastrarPagamentoVenda(array $dados): void
    {
        $create = new \App\adms\Models\helper\AdmsCreate();
        $create->exeCreate("tb_pagamento_venda", [
            'id_venda'    => (int) ($dados['id_venda'] ?? 0),
            'valor_total' => (float) ($dados['valor_total'] ?? 0),
            'valor_pago'  => (float) ($dados['valor_pago'] ?? 0),
            'troco'       => (float) ($dados['troco'] ?? 0),
            'id_usuario'  => (int) ($dados['id_usuario'] ?? 0),
            'created_at'  => (string) ($dados['created_at'] ?? date('Y-m-d H:i:s')),
        ]);

        $this->resultado = $create->getResultado(); // esperado: id_pagamento
    }

    public function cadastrarDetalhesPagamento(array $dados): void
    {
        $create = new \App\adms\Models\helper\AdmsCreate();
        $create->exeCreate("tb_detalhes_pagamento", [
            'id_pagamento'       => (int) ($dados['id_pagamento'] ?? 0),
            'id_forma_pagamento' => (int) ($dados['id_forma_pagamento'] ?? 0),
            'valor_pagamento'    => (float) ($dados['valor_pagamento'] ?? 0),
            'id_usuario'         => (int) ($dados['id_usuario'] ?? 0),
            'created_at'         => (string) ($dados['created_at'] ?? date('Y-m-d H:i:s')),
        ]);

        $this->resultado = $create->getResultado();
    }

    /* =========================================================
     * 5.1) RELATÓRIO DE VENDAS (COM DESCONTO DE DEVOLUÇÕES)
     * ========================================================= */

    public function listarVendasRelatGeral(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                i.id_produto,
                p.nome_produto,
                tp.descrição AS tipoProduto,
                i.id_usuario,
                u.nome AS nome_user,
                i.preco_unitario AS preco_venda,
                SUM(i.quantidade - COALESCE(dev.qtd_devolvida, 0)) AS quant,
                SUM((i.quantidade - COALESCE(dev.qtd_devolvida, 0)) * i.preco_unitario) AS subtotal
             FROM tb_item_venda i
             INNER JOIN tb_produtos p ON p.id_produto = i.id_produto
             INNER JOIN tb_tipo_produto tp ON tp.id = p.id_tipo_produto
             INNER JOIN adms_usuarios u ON u.id = i.id_usuario
             LEFT JOIN (
                 SELECT di.id_item_venda, SUM(di.quantidade) AS qtd_devolvida
                 FROM tb_devolucao_item di
                 INNER JOIN tb_devolucao_venda dv ON dv.id = di.id_devolucao_venda
                 INNER JOIN tb_item_venda iv ON iv.id_item_venda = di.id_item_venda
                 WHERE dv.id_venda = iv.id_venda
                 GROUP BY di.id_item_venda
             ) dev ON dev.id_item_venda = i.id_item_venda
             GROUP BY i.id_produto, p.nome_produto, tp.descrição, i.id_usuario, u.nome, i.preco_unitario
             HAVING quant > 0
             ORDER BY p.nome_produto ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function listarVendasRelatGeralData(string $data1, string $data2): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                i.id_produto,
                p.nome_produto,
                tp.descrição AS tipoProduto,
                i.id_usuario,
                u.nome AS nome_user,
                i.preco_unitario AS preco_venda,
                SUM(i.quantidade - COALESCE(dev.qtd_devolvida, 0)) AS quant,
                SUM((i.quantidade - COALESCE(dev.qtd_devolvida, 0)) * i.preco_unitario) AS subtotal
             FROM tb_item_venda i
             INNER JOIN tb_produtos p ON p.id_produto = i.id_produto
             INNER JOIN tb_tipo_produto tp ON tp.id = p.id_tipo_produto
             INNER JOIN adms_usuarios u ON u.id = i.id_usuario
             LEFT JOIN (
                 SELECT di.id_item_venda, SUM(di.quantidade) AS qtd_devolvida
                 FROM tb_devolucao_item di
                 INNER JOIN tb_devolucao_venda dv ON dv.id = di.id_devolucao_venda
                 INNER JOIN tb_item_venda iv ON iv.id_item_venda = di.id_item_venda
                 WHERE dv.id_venda = iv.id_venda
                 GROUP BY di.id_item_venda
             ) dev ON dev.id_item_venda = i.id_item_venda
             WHERE i.created BETWEEN :data1 AND :data2
             GROUP BY i.id_produto, p.nome_produto, tp.descrição, i.id_usuario, u.nome, i.preco_unitario
             HAVING quant > 0
             ORDER BY p.nome_produto ASC",
            "data1={$data1}&data2={$data2}"
        );

        return $read->getResultado() ?: [];
    }

    public function listarVendasRelatUserData(int $idUser, string $data1, string $data2): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                i.id_produto,
                p.nome_produto,
                tp.descrição AS tipoProduto,
                i.id_usuario,
                u.nome AS nome_user,
                i.preco_unitario AS preco_venda,
                SUM(i.quantidade - COALESCE(dev.qtd_devolvida, 0)) AS quant,
                SUM((i.quantidade - COALESCE(dev.qtd_devolvida, 0)) * i.preco_unitario) AS subtotal
             FROM tb_item_venda i
             INNER JOIN tb_produtos p ON p.id_produto = i.id_produto
             INNER JOIN tb_tipo_produto tp ON tp.id = p.id_tipo_produto
             INNER JOIN adms_usuarios u ON u.id = i.id_usuario
             LEFT JOIN (
                                 SELECT di.id_item_venda, SUM(di.quantidade) AS qtd_devolvida
                                 FROM tb_devolucao_item di
                                 INNER JOIN tb_devolucao_venda dv ON dv.id = di.id_devolucao_venda
                                 INNER JOIN tb_item_venda iv ON iv.id_item_venda = di.id_item_venda
                                 WHERE dv.id_venda = iv.id_venda
                                 GROUP BY di.id_item_venda
             ) dev ON dev.id_item_venda = i.id_item_venda
             WHERE i.id_usuario = :idUser
               AND i.created BETWEEN :data1 AND :data2
             GROUP BY i.id_produto, p.nome_produto, tp.descrição, i.id_usuario, u.nome, i.preco_unitario
             HAVING quant > 0
             ORDER BY p.nome_produto ASC",
            "idUser={$idUser}&data1={$data1}&data2={$data2}"
        );

        return $read->getResultado() ?: [];
    }

    public function listarVendasRelatFiltros(array $filtros = []): array
    {
        $where  = [];
        $params = [];

        if (! empty($filtros['id_usuario'])) {
            $where[]              = 'v.id_usuario = :id_usuario';
            $params['id_usuario'] = (int) $filtros['id_usuario'];
        }

        if (! empty($filtros['id_turno'])) {
            $where[]            = 'v.id_turno = :id_turno';
            $params['id_turno'] = (int) $filtros['id_turno'];
        }

        if (! empty($filtros['mes_ref'])) {
            $where[]           = "DATE_FORMAT(v.data_venda, '%Y-%m') = :mes_ref";
            $params['mes_ref'] = (string) $filtros['mes_ref'];
        }

        if (! empty($filtros['data_ini']) && ! empty($filtros['data_fim'])) {
            $where[]            = 'v.data_venda BETWEEN :data_ini AND :data_fim';
            $params['data_ini'] = (string) $filtros['data_ini'];
            $params['data_fim'] = (string) $filtros['data_fim'];
        }

        $sqlWhere = '';
        if (! empty($where)) {
            $sqlWhere = ' WHERE ' . implode(' AND ', $where);
        }

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                i.id_produto,
                p.nome_produto,
                tp.descrição AS tipoProduto,
                i.id_usuario,
                u.nome AS nome_user,
                i.preco_unitario AS preco_venda,
                SUM(i.quantidade - COALESCE(dev.qtd_devolvida, 0)) AS quant,
                SUM((i.quantidade - COALESCE(dev.qtd_devolvida, 0)) * i.preco_unitario) AS subtotal
             FROM tb_item_venda i
             INNER JOIN venda v ON v.id_venda = i.id_venda
             INNER JOIN tb_produtos p ON p.id_produto = i.id_produto
             INNER JOIN tb_tipo_produto tp ON tp.id = p.id_tipo_produto
             INNER JOIN adms_usuarios u ON u.id = i.id_usuario
             LEFT JOIN (
                 SELECT di.id_item_venda, SUM(di.quantidade) AS qtd_devolvida
                 FROM tb_devolucao_item di
                 INNER JOIN tb_devolucao_venda dv ON dv.id = di.id_devolucao_venda
                 INNER JOIN tb_item_venda iv ON iv.id_item_venda = di.id_item_venda
                 WHERE dv.id_venda = iv.id_venda
                 GROUP BY di.id_item_venda
             ) dev ON dev.id_item_venda = i.id_item_venda
             {$sqlWhere}
             GROUP BY i.id_produto, p.nome_produto, tp.descrição, i.id_usuario, u.nome, i.preco_unitario
             HAVING quant > 0
             ORDER BY p.nome_produto ASC",
            http_build_query($params)
        );

        return $read->getResultado() ?: [];
    }

    /* =========================================================
     * 6) DEVOLUÇÃO
     * ========================================================= */

    /** Lista todas as vendas com resumo (totais, vendedor, qtd devolvida) */
    public function listarVendasComResumo(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                v.id_venda,
                v.data_venda,
                v.total,
                u.nome AS vendedor,
                COUNT(DISTINCT i.id_item_venda)             AS qtd_itens,
                COALESCE(SUM(di.quantidade), 0)  AS qtd_devolvida
             FROM venda v
             LEFT JOIN adms_usuarios u   ON u.id = v.id_usuario
             LEFT JOIN tb_item_venda i   ON i.id_venda = v.id_venda
             LEFT JOIN tb_devolucao_item di ON di.id_item_venda = i.id_item_venda
             GROUP BY v.id_venda, v.data_venda, v.total, u.nome
             ORDER BY v.data_venda DESC"
        );
        return $read->getResultado() ?: [];
    }

    public function listarUsuariosComVendas(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT DISTINCT u.id, u.nome
             FROM venda v
             INNER JOIN adms_usuarios u ON u.id = v.id_usuario
             ORDER BY u.nome ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function listarTurnosComVendas(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT DISTINCT t.id,
                    v.id_usuario,
                    CONCAT('#', t.id, ' - ', DATE_FORMAT(t.inicio_previsto, '%d/%m/%Y %H:%i')) AS turno
             FROM venda v
             INNER JOIN tb_turnos t ON t.id = v.id_turno
             WHERE v.id_usuario IS NOT NULL
             ORDER BY t.id DESC"
        );

        return $read->getResultado() ?: [];
    }

    public function listarVendasComResumoFiltros(array $filtros = []): array
    {
        $where  = [];
        $params = [];

        if (! empty($filtros['id_usuario'])) {
            $where[]              = 'v.id_usuario = :id_usuario';
            $params['id_usuario'] = (int) $filtros['id_usuario'];
        }

        if (! empty($filtros['id_turno'])) {
            $where[]            = 'v.id_turno = :id_turno';
            $params['id_turno'] = (int) $filtros['id_turno'];
        }

        if (! empty($filtros['mes_ref'])) {
            $where[]           = "DATE_FORMAT(v.data_venda, '%Y-%m') = :mes_ref";
            $params['mes_ref'] = (string) $filtros['mes_ref'];
        }

        if (! empty($filtros['data_ini']) && ! empty($filtros['data_fim'])) {
            $where[]            = 'v.data_venda BETWEEN :data_ini AND :data_fim';
            $params['data_ini'] = (string) $filtros['data_ini'];
            $params['data_fim'] = (string) $filtros['data_fim'];
        }

        $sqlWhere = '';
        if (! empty($where)) {
            $sqlWhere = ' WHERE ' . implode(' AND ', $where);
        }

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                v.id_venda,
                v.data_venda,
                v.total,
                u.nome AS vendedor,
                COUNT(DISTINCT i.id_item_venda) AS qtd_itens,
                COALESCE(SUM(di.quantidade), 0) AS qtd_devolvida
             FROM venda v
             LEFT JOIN adms_usuarios u ON u.id = v.id_usuario
             LEFT JOIN tb_item_venda i ON i.id_venda = v.id_venda
             LEFT JOIN tb_devolucao_item di ON di.id_item_venda = i.id_item_venda
             {$sqlWhere}
             GROUP BY v.id_venda, v.data_venda, v.total, u.nome
             ORDER BY v.data_venda DESC",
            http_build_query($params)
        );

        return $read->getResultado() ?: [];
    }

    /** Lista itens de uma venda com saldo devolvível por item */
    public function listarItensDaVenda(int $idVenda): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                i.id_item_venda              AS id_item,
                i.id_venda,
                i.id_produto,
                p.nome_produto,
                i.quantidade,
                i.preco_unitario,
                i.subtotal,
                COALESCE(SUM(di.quantidade), 0) AS qtd_ja_devolvida
             FROM tb_item_venda i
             JOIN tb_produtos p ON p.id_produto = i.id_produto
             LEFT JOIN tb_devolucao_item di ON di.id_item_venda = i.id_item_venda
             WHERE i.id_venda = :id_venda
             GROUP BY i.id_item_venda, i.id_venda, i.id_produto, p.nome_produto,
                      i.quantidade, i.preco_unitario, i.subtotal",
            "id_venda={$idVenda}"
        );
        return $read->getResultado() ?: [];
    }

    /** Retorna a última linha de estoque do produto (para incremento na devolução) */
    private function buscarUltimoEstoque(int $idProduto): ?array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id, quantidade_disponivel
             FROM tb_estoque
             WHERE id_produto = :id
             ORDER BY id DESC
             LIMIT 1",
            "id={$idProduto}"
        );
        $res = $read->getResultado();
        return ! empty($res) ? $res[0] : null;
    }

    /** Processa a devolução de um único item */
    public function processarDevolucaoItem(
        int $idVenda,
        int $idItemVenda,
        int $idProduto,
        int $quantidade,
        float $precoUnitario,
        string $motivo,
        int $idUsuario
    ): array {
        if ($quantidade <= 0) {
            return ['success' => false, 'message' => 'Quantidade inválida.'];
        }

        // Verificar saldo devolvível
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT i.quantidade,
                    COALESCE(SUM(di.quantidade), 0) AS ja_devolvida
             FROM tb_item_venda i
             LEFT JOIN tb_devolucao_item di ON di.id_item_venda = i.id_item_venda
             WHERE i.id_item_venda = :id
             GROUP BY i.id_item_venda, i.quantidade
             LIMIT 1",
            "id={$idItemVenda}"
        );
        $row = $read->getResultado();
        if (empty($row)) {
            return ['success' => false, 'message' => 'Item de venda não encontrado.'];
        }

        $saldo = (int) $row[0]['quantidade'] - (int) $row[0]['ja_devolvida'];
        if ($quantidade > $saldo) {
            return ['success' => false, 'message' => "Quantidade a devolver ({$quantidade}) excede o saldo devolvível ({$saldo})."];
        }

        // Última entrada de estoque do produto
        $estoque = $this->buscarUltimoEstoque($idProduto);
        if (! $estoque) {
            return ['success' => false, 'message' => 'Não foi possível localizar o estoque do produto.'];
        }

        // Cabeçalho da devolução
        $cDev = new \App\adms\Models\helper\AdmsCreate();
        $cDev->exeCreate('tb_devolucao_venda', [
            'id_venda'   => $idVenda,
            'motivo'     => $motivo ?: null,
            'id_usuario' => $idUsuario,
            'created_at' => date('Y-m-d H:i:s'),
        ]);
        $idDevolucao = (int) $cDev->getResultado();
        if ($idDevolucao < 1) {
            return ['success' => false, 'message' => 'Falha ao criar registo de devolução.'];
        }

        // Item da devolução
        $cItem = new \App\adms\Models\helper\AdmsCreate();
        $cItem->exeCreate('tb_devolucao_item', [
            'id_devolucao_venda' => $idDevolucao,
            'id_item_venda'      => $idItemVenda,
            'id_produto'         => $idProduto,
            'quantidade'         => $quantidade,
            'preco_unitario'     => $precoUnitario,
            'subtotal_devolvido' => $quantidade * $precoUnitario,
            'motivo'             => $motivo ?: null,
            'id_usuario'         => $idUsuario,
            'created_at'         => date('Y-m-d H:i:s'),
        ]);
        if ($cItem->getResultado() < 1) {
            return ['success' => false, 'message' => 'Falha ao registar item da devolução.'];
        }

        // Repor na última entrada de estoque
        $upd = new \App\adms\Models\helper\AdmsUpdate();
        $upd->exeUpdate(
            'tb_estoque',
            ['quantidade_disponivel' => (int) $estoque['quantidade_disponivel'] + $quantidade],
            'WHERE id = :id',
            'id=' . (int) $estoque['id']
        );

        $this->resultado = $idDevolucao;
        return ['success' => true, 'message' => 'Devolução registada com sucesso.'];
    }

    /** Processa a devolução completa de todos os itens da venda de uma vez */
    public function processarDevolucaoVendaCompleta(int $idVenda, int $idUsuario, string $motivo): array
    {
        $itens = $this->listarItensDaVenda($idVenda);
        if (empty($itens)) {
            return ['success' => false, 'message' => 'Nenhum item encontrado para esta venda.'];
        }

        // Verificar se há saldo a devolver
        $temSaldo = false;
        foreach ($itens as $item) {
            if (((int) $item['quantidade'] - (int) $item['qtd_ja_devolvida']) > 0) {
                $temSaldo = true;
                break;
            }
        }
        if (! $temSaldo) {
            return ['success' => false, 'message' => 'Todos os itens desta venda já foram devolvidos.'];
        }

        // Um único cabeçalho para toda a venda
        $cDev = new \App\adms\Models\helper\AdmsCreate();
        $cDev->exeCreate('tb_devolucao_venda', [
            'id_venda'   => $idVenda,
            'motivo'     => $motivo ?: 'Devolução completa da venda',
            'id_usuario' => $idUsuario,
            'created_at' => date('Y-m-d H:i:s'),
        ]);
        $idDevolucao = (int) $cDev->getResultado();
        if ($idDevolucao < 1) {
            return ['success' => false, 'message' => 'Falha ao criar registo de devolução.'];
        }

        $erros = [];
        foreach ($itens as $item) {
            $saldo = (int) $item['quantidade'] - (int) $item['qtd_ja_devolvida'];
            if ($saldo <= 0) {
                continue;
            }

            $estoque = $this->buscarUltimoEstoque((int) $item['id_produto']);
            if (! $estoque) {
                $erros[] = "Produto #{$item['id_produto']} ({$item['nome_produto']}): estoque não encontrado";
                continue;
            }

            $cItem = new \App\adms\Models\helper\AdmsCreate();
            $cItem->exeCreate('tb_devolucao_item', [
                'id_devolucao_venda' => $idDevolucao,
                'id_item_venda'      => (int) $item['id_item'],
                'id_produto'         => (int) $item['id_produto'],
                'quantidade'         => $saldo,
                'preco_unitario'     => (float) $item['preco_unitario'],
                'subtotal_devolvido' => $saldo * (float) $item['preco_unitario'],
                'motivo'             => $motivo ?: 'Devolução completa da venda',
                'id_usuario'         => $idUsuario,
                'created_at'         => date('Y-m-d H:i:s'),
            ]);

            // Repor na última entrada
            $upd = new \App\adms\Models\helper\AdmsUpdate();
            $upd->exeUpdate(
                'tb_estoque',
                ['quantidade_disponivel' => (int) $estoque['quantidade_disponivel'] + $saldo],
                'WHERE id = :id',
                'id=' . (int) $estoque['id']
            );
        }

        $msg = 'Devolução completa processada com sucesso.';
        if (! empty($erros)) {
            $msg .= ' Avisos: ' . implode('; ', $erros);
        }
        $this->resultado = $idDevolucao;
        return ['success' => true, 'message' => $msg];
    }
}
