<?php
namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (! defined('URL')) {
    header("Location: /");
    exit();
}

/**
 * Controller Vendas
 *
 * @copyright (c) 2025, Nelisa Farma
 */
class ControleVendas extends Controller
{

    private $Resultado;
    private $Dados;
    private $UserId;
    private $PageId;
    private $ResultadoPg;

    public function getResultadoPg()
    {
        return $this->ResultadoPg;
    }

    public function getResultado()
    {
        return $this->Resultado;
    }

    public function registarVenda()
    {

        $listarMenu   = new \App\adms\Models\AdmsMenu();
        $listProdutos = new \App\adms\Models\admsProduto();

        $this->Dados['menu']     = $listarMenu->itemMenu();
        $this->Dados['listProd'] = $listProdutos->listarProdutos();
        // var_dump($this->Dados['listProd']);

        //Há uma requisição ajax que realiza o processo via javascript

        $carregarView = new \Core\ConfigView("adms/Views/vendas/registarVenda", $this->Dados);
        $carregarView->renderizar();
    }

    public function registarVendaAntendente()
    {

        $listarMenu   = new \App\adms\Models\AdmsMenu();
        $listProdutos = new \App\adms\Models\admsProduto();

        $this->Dados['menu']     = $listarMenu->itemMenu();
        $this->Dados['listProd'] = $listProdutos->listarProdutos();
        // var_dump($this->Dados['listProd']);

        //Há uma requisição ajax que realiza o processo via javascript

        $carregarView = new \Core\ConfigView("adms/Views/vendas/registarVendaAtendente", $this->Dados);
        $carregarView->renderizar();
    }

    public function relatVendas()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $this->Dados    = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];
        $listVendaModel = new \App\adms\Models\admsVenda();

        $filtros             = [];
        $tipoFiltro          = (int) ($this->Dados['tipoFiltro'] ?? 0);
        $descricaoListaAtual = 'Relatório geral de vendas líquidas (vendas - devoluções).';

        if (! empty($this->Dados['btnFiltrarRelatorio'])) {
            $idUsuario   = (int) ($this->Dados['id_usuario'] ?? 0);
            $idTurno     = (int) ($this->Dados['id_turno'] ?? 0);
            $nomeUsuario = trim((string) ($this->Dados['nome_usuario'] ?? ''));

            if ($tipoFiltro === 1) {
                if ($idUsuario < 1) {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Selecione o usuário para listar as vendas.</div>";
                } else {
                    $filtros['id_usuario'] = $idUsuario;
                    $descricaoListaAtual   = "Relatório de vendas líquidas do usuário {$nomeUsuario}.";
                }
            } elseif ($tipoFiltro === 2) {
                $mesRef = trim((string) ($this->Dados['mes_ref'] ?? ''));
                if ($idUsuario < 1 || $mesRef === '') {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Selecione usuário e mês para este critério.</div>";
                } else {
                    $filtros['id_usuario'] = $idUsuario;
                    $filtros['mes_ref']    = $mesRef;
                    $descricaoListaAtual   = "Relatório de vendas líquidas do usuário {$nomeUsuario} no mês {$mesRef}.";
                }
            } elseif ($tipoFiltro === 3) {
                if ($idUsuario < 1 || $idTurno < 1) {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Selecione usuário e turno para este critério.</div>";
                } else {
                    $filtros['id_usuario'] = $idUsuario;
                    $filtros['id_turno']   = $idTurno;
                    $descricaoListaAtual   = "Relatório de vendas líquidas do usuário {$nomeUsuario} no turno #{$idTurno}.";
                }
            } elseif ($tipoFiltro === 4) {
                $dataInicial = trim((string) ($this->Dados['data_inicial'] ?? ''));
                $dataFinal   = trim((string) ($this->Dados['data_final'] ?? ''));

                if ($idUsuario < 1 || $dataInicial === '' || $dataFinal === '') {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Selecione usuário, data inicial e data final para este critério.</div>";
                } else {
                    $filtros['id_usuario'] = $idUsuario;
                    $filtros['data_ini']   = date('Y-m-d', strtotime($dataInicial)) . ' 00:00:00';
                    $filtros['data_fim']   = date('Y-m-d', strtotime($dataFinal)) . ' 23:59:59';
                    $descricaoListaAtual   = 'Relatório de vendas líquidas do usuário ' . $nomeUsuario
                    . ' no intervalo de ' . date('d/m/Y', strtotime($dataInicial))
                    . ' até ' . date('d/m/Y', strtotime($dataFinal)) . '.';
                }
            } elseif ($tipoFiltro === 5) {
                $dataRef = trim((string) ($this->Dados['data_ref'] ?? ''));
                if ($dataRef === '') {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Informe a data para listar as vendas gerais.</div>";
                } else {
                    $filtros['data_ini'] = date('Y-m-d', strtotime($dataRef)) . ' 00:00:00';
                    $filtros['data_fim'] = date('Y-m-d', strtotime($dataRef)) . ' 23:59:59';
                    $descricaoListaAtual = 'Relatório geral de vendas líquidas na data '
                    . date('d/m/Y', strtotime($dataRef)) . '.';
                }
            } elseif ($tipoFiltro === 6) {
                $dataInicial = trim((string) ($this->Dados['data_inicial'] ?? ''));
                $dataFinal   = trim((string) ($this->Dados['data_final'] ?? ''));
                if ($dataInicial === '' || $dataFinal === '') {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Informe data inicial e data final para este critério.</div>";
                } else {
                    $filtros['data_ini'] = date('Y-m-d', strtotime($dataInicial)) . ' 00:00:00';
                    $filtros['data_fim'] = date('Y-m-d', strtotime($dataFinal)) . ' 23:59:59';
                    $descricaoListaAtual = 'Relatório geral de vendas líquidas no intervalo de '
                    . date('d/m/Y', strtotime($dataInicial)) . ' até '
                    . date('d/m/Y', strtotime($dataFinal)) . '.';
                }
            }
        }

        $this->Dados['usuariosVenda']       = $listVendaModel->listarUsuariosComVendas();
        $this->Dados['turnosVenda']         = $listVendaModel->listarTurnosComVendas();
        $this->Dados['filtrosRelatorio']    = $this->Dados;
        $this->Dados['descricaoListaAtual'] = $descricaoListaAtual;

        if (! empty($filtros)) {
            $this->Dados['listVenda'] = $listVendaModel->listarVendasRelatFiltros($filtros);
        } else {
            $this->Dados['listVenda'] = $listVendaModel->listarVendasRelatGeral();
        }

        $listarMenu          = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView        = new \Core\ConfigView("adms/Views/vendas/relatVenda", $this->Dados);
        $carregarView->renderizar();
    }

    // =========================================================
    // DEVOLUÇÃO
    // =========================================================

    /** Lista todas as vendas com acção de ver itens / devolver tudo */
    public function listarVendas()
    {

        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];
        $vendaModel  = new \App\adms\Models\admsVenda();

        $filtros    = [];
        $tipoFiltro = (int) ($this->Dados['tipoFiltro'] ?? 0);

        if (! empty($this->Dados['btnFiltrarVendas'])) {
            $idUsuario = (int) ($this->Dados['id_usuario'] ?? 0);
            $idTurno   = (int) ($this->Dados['id_turno'] ?? 0);

            if ($tipoFiltro === 1) {
                if ($idUsuario > 0) {
                    $filtros['id_usuario'] = $idUsuario;
                }
            } elseif ($tipoFiltro === 2) {
                $mesRef = trim((string) ($this->Dados['mes_ref'] ?? ''));
                if ($idUsuario > 0 && $mesRef !== '') {
                    $filtros['id_usuario'] = $idUsuario;
                    $filtros['mes_ref']    = $mesRef;
                }
            } elseif ($tipoFiltro === 3) {
                if ($idUsuario > 0 && $idTurno > 0) {
                    $filtros['id_usuario'] = $idUsuario;
                    $filtros['id_turno']   = $idTurno;
                }
            } elseif ($tipoFiltro === 4) {
                $dataInicial = trim((string) ($this->Dados['data_inicial'] ?? ''));
                $dataFinal   = trim((string) ($this->Dados['data_final'] ?? ''));
                if ($idUsuario > 0 && $dataInicial !== '' && $dataFinal !== '') {
                    $filtros['id_usuario'] = $idUsuario;
                    $filtros['data_ini']   = date('Y-m-d', strtotime($dataInicial)) . ' 00:00:00';
                    $filtros['data_fim']   = date('Y-m-d', strtotime($dataFinal)) . ' 23:59:59';
                }
            } elseif ($tipoFiltro === 5) {
                $dataRef = trim((string) ($this->Dados['data_ref'] ?? ''));
                if ($dataRef !== '') {
                    $filtros['data_ini'] = date('Y-m-d', strtotime($dataRef)) . ' 00:00:00';
                    $filtros['data_fim'] = date('Y-m-d', strtotime($dataRef)) . ' 23:59:59';
                }
            } elseif ($tipoFiltro === 6) {
                $dataInicial = trim((string) ($this->Dados['data_inicial'] ?? ''));
                $dataFinal   = trim((string) ($this->Dados['data_final'] ?? ''));
                if ($dataInicial !== '' && $dataFinal !== '') {
                    $filtros['data_ini'] = date('Y-m-d', strtotime($dataInicial)) . ' 00:00:00';
                    $filtros['data_fim'] = date('Y-m-d', strtotime($dataFinal)) . ' 23:59:59';
                }
            }
        }

        $listarMenu                   = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu']          = $listarMenu->itemMenu();
        $this->Dados['usuariosVenda'] = $vendaModel->listarUsuariosComVendas();
        $this->Dados['turnosVenda']   = $vendaModel->listarTurnosComVendas();
        $this->Dados['filtrosVenda']  = $this->Dados;

        if (! empty($filtros)) {
            $this->Dados['listVendas'] = $vendaModel->listarVendasComResumoFiltros($filtros);
        } else {
            $this->Dados['listVendas'] = $vendaModel->listarVendasComResumo();
        }
        // var_dump($this->Dados['listVendas']);

        $carregarView = new \Core\ConfigView("adms/Views/vendas/listarVendas", $this->Dados);
        $carregarView->renderizar();
    }

    /** Mostra os itens de uma venda com opção de devolver por item */
    public function itensDaVenda($idVenda = null)
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $idVenda = (int) ($idVenda ?? 0);
        if ($idVenda < 1) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Venda inválida.</div>";
            header("Location: " . URLADM . "controleVendas/listarVendas");
            exit();
        }

        $vendaModel = new \App\adms\Models\admsVenda();

        $listarMenu             = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu']    = $listarMenu->itemMenu();
        $this->Dados['idVenda'] = $idVenda;
        $this->Dados['itens']   = $vendaModel->listarItensDaVenda($idVenda);

        $carregarView = new \Core\ConfigView("adms/Views/vendas/itensDaVenda", $this->Dados);
        $carregarView->renderizar();
    }

    /** POST: devolve um único item */
    public function devolverItem()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $post = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];

        $idVenda       = (int) ($post['id_venda'] ?? 0);
        $idItemVenda   = (int) ($post['id_item_venda'] ?? 0);
        $idProduto     = (int) ($post['id_produto'] ?? 0);
        $quantidade    = (int) ($post['quantidade'] ?? 0);
        $precoUnitario = (float) ($post['preco_unitario'] ?? 0);
        $motivo        = trim($post['motivo'] ?? '');
        $idUsuario     = (int) ($_SESSION['usuario_id'] ?? 0);

        $vendaModel = new \App\adms\Models\admsVenda();
        $res        = $vendaModel->processarDevolucaoItem(
            $idVenda, $idItemVenda, $idProduto,
            $quantidade, $precoUnitario, $motivo, $idUsuario
        );

        if ($res['success']) {
            $_SESSION['msgcad'] = "<div class='alert alert-success'>" . htmlspecialchars($res['message']) . "</div>";
        } else {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>" . htmlspecialchars($res['message']) . "</div>";
        }

        header("Location: " . URLADM . "controleVendas/itensDaVenda/{$idVenda}");
        exit();
    }

    /** POST/GET: devolve todos os itens da venda de uma vez */
    public function devolverVendaCompleta($idVenda = null)
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $idVenda   = (int) ($idVenda ?? 0);
        $motivo    = trim(filter_input(INPUT_POST, 'motivo', FILTER_DEFAULT) ?? '');
        $idUsuario = (int) ($_SESSION['usuario_id'] ?? 0);

        if ($idVenda < 1) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Venda inválida.</div>";
            header("Location: " . URLADM . "controleVendas/listarVendas");
            exit();
        }

        $vendaModel = new \App\adms\Models\admsVenda();
        $res        = $vendaModel->processarDevolucaoVendaCompleta($idVenda, $idUsuario, $motivo);

        if ($res['success']) {
            $_SESSION['msgcad'] = "<div class='alert alert-success'>" . htmlspecialchars($res['message']) . "</div>";
        } else {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>" . htmlspecialchars($res['message']) . "</div>";
        }

        header("Location: " . URLADM . "controleVendas/listarVendas");
        exit();
    }

}
