<?php
namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (! defined('URL')) {
    header("Location: /");
    exit();
}

/**
 * Controller VeEstoquendas
 *
 * @copyright (c) 2025, Nelisa Farma
 */
class ControllerEstoque
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

    public function adicionarProdutoEstoque()
    {

        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];

        $cadProduto = new \App\adms\Models\admsProduto();

        if (! empty($this->Dados['btnSubmitProduto'])):
            unset($this->Dados['btnSubmitProduto']);

            /*
            if (!empty($CadPessoa->verificaDocumento($this->Dados["documento"]))) {

                $_SESSION['msgcad'] = "<div class='alert alert-danger'>O número do documento que tentou registar, já existe!</div>";
              
          }else{        
          */

            // ====================== Script Para Registar Dados do Produto ====================

            #ARRAY DE DADOS PARA INSERIR NA TABELA PRODUTO
            $dadosProduto = ['bar_code' => $this->Dados["bar_code"], 'nome_produto'            => $this->Dados["nome_produto"], 'descricao_produto' => $this->Dados["descricao_produto"],
                'id_categoria'              => $this->Dados["id_categoria"], 'preco_compra'        => $this->Dados["preco_compra"], 'preco_venda'       => $this->Dados["preco_venda"],
                'quantidade_estoque'        => $this->Dados["quantidade_estoque"], 'id_fabricante' => $this->Dados["id_fabricante"], 'id_forncedor'     => $this->Dados["id_forncedor"], 'data_fabrico'         => $this->Dados["data_fabrico"],
                'data_validade'             => $this->Dados["data_validade"], 'data_compra'        => $this->Dados["data_compra"], 'id_tipo_produto'    => $this->Dados["id_tipo_produto"], 'quantidade_pacote' => $this->Dados["quantPacote"], 'id_user' => (int) $_SESSION['usuario_id'], 'created_at' => date('Y-m-d H:i:s')];

            $cadProduto->cadastrarProduto($dadosProduto);

            if ($cadProduto->getResultado() >= 1) {

                $_SESSION['msgcad'] = "<div class='alert alert-success'>Produto registado com sucesso!
			                                    </div>";
                unset($this->Dados);
            } else {

                $_SESSION['msgcad'] = "<div class='alert alert-danger'>" . "Não foi possível registar o produto" . "</div>";
            }

        //===================================== Fim Script regista Produto ==============================

        endif;
        $listarMenu          = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView        = new \Core\ConfigView("adms/Views/produtos/adicionarProdutoEstoque", $this->Dados);
        $carregarView->renderizar();

    }

    public function listarEstoque()
    {

        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $this->Dados  = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];
        $estoqueModel = new \App\adms\Models\admsEstoque();

        $filtros = [];
        if (! empty($this->Dados['btnFiltrarEstoque'])) {
            $filtros = [
                'texto_busca'        => trim((string) ($this->Dados['texto_busca'] ?? '')),
                'id_fornecedor'      => (int) ($this->Dados['id_fornecedor'] ?? 0),
                'id_user'            => (int) ($this->Dados['id_user'] ?? 0),
                'id_categoria'       => (int) ($this->Dados['id_categoria'] ?? 0),
                'id_tipo_produto'    => (int) ($this->Dados['id_tipo_produto'] ?? 0),
                'id_estado'          => (int) ($this->Dados['id_estado'] ?? 0),
                'lote'               => trim((string) ($this->Dados['lote'] ?? '')),
                'data_compra_ini'    => trim((string) ($this->Dados['data_compra_ini'] ?? '')),
                'data_compra_fim'    => trim((string) ($this->Dados['data_compra_fim'] ?? '')),
                'data_registo_ini'   => trim((string) ($this->Dados['data_registo_ini'] ?? '')),
                'data_registo_fim'   => trim((string) ($this->Dados['data_registo_fim'] ?? '')),
                'validade_ate'       => trim((string) ($this->Dados['validade_ate'] ?? '')),
                'somente_disponivel' => ! empty($this->Dados['somente_disponivel']) ? 1 : 0,
                'somente_vencidos'   => ! empty($this->Dados['somente_vencidos']) ? 1 : 0,
            ];

            if (! empty($filtros['data_compra_ini']) && ! empty($filtros['data_compra_fim'])
                && strtotime($filtros['data_compra_ini']) > strtotime($filtros['data_compra_fim'])) {
                $_SESSION['msg'] = "<div class='alert alert-danger'>A data inicial de compra não pode ser maior que a data final.</div>";
            }

            if (! empty($filtros['data_registo_ini']) && ! empty($filtros['data_registo_fim'])
                && strtotime($filtros['data_registo_ini']) > strtotime($filtros['data_registo_fim'])) {
                $_SESSION['msg'] = "<div class='alert alert-danger'>A data inicial de registo não pode ser maior que a data final.</div>";
            }

            $filtros = array_filter($filtros, function ($valor) {
                return $valor !== '' && $valor !== null && $valor !== 0;
            });
        }

        if (! empty($filtros)) {
            $this->Dados['listEstoque'] = $estoqueModel->listarEstoqueComFiltros($filtros);
        } else {
            $this->Dados['listEstoque'] = $estoqueModel->listarEstoqueGeral();
        }

        $this->Dados['filtrosEstoque']            = $this->Dados;
        $this->Dados['fornecedoresFiltroEstoque'] = $estoqueModel->listarFornecedoresFiltroEstoque();
        $this->Dados['usuariosFiltroEstoque']     = $estoqueModel->listarUsuariosFiltroEstoque();
        $this->Dados['categoriasFiltroEstoque']   = $estoqueModel->listarCategoriasFiltroEstoque();
        $this->Dados['tiposFiltroEstoque']        = $estoqueModel->listarTiposFiltroEstoque();
        $this->Dados['estadosFiltroEstoque']      = $estoqueModel->listarEstadosFiltroEstoque();

        $listarMenu          = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView        = new \Core\ConfigView("adms/Views/estoque/listarEstoque", $this->Dados);
        $carregarView->renderizar();
    }

    public function detalhesProdutoEstoque($idProduto = null)
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $idProduto = (int) ($idProduto ?? 0);
        if ($idProduto < 1) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Produto inválido.</div>";
            header("Location: " . URLADM . "controllerEstoque/listarEstoque");
            exit();
        }

        $estoqueModel = new \App\adms\Models\admsEstoque();
        $produto      = $estoqueModel->buscarResumoProdutoEstoque($idProduto);

        if (empty($produto)) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Produto não encontrado no estoque.</div>";
            header("Location: " . URLADM . "controllerEstoque/listarEstoque");
            exit();
        }

        $listarMenu                     = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu']            = $listarMenu->itemMenu();
        $this->Dados['produtoEstoque']  = $produto;
        $this->Dados['entradasProduto'] = $estoqueModel->listarEntradasProduto($idProduto);

        $carregarView = new \Core\ConfigView("adms/Views/estoque/detalhesProdutoEstoque", $this->Dados);
        $carregarView->renderizar();
    }

    public function detalhesEntradaEstoque($idEntrada = null)
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $idEntrada = (int) ($idEntrada ?? 0);
        if ($idEntrada < 1) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Entrada de estoque inválida.</div>";
            header("Location: " . URLADM . "controllerEstoque/listarEstoque");
            exit();
        }

        $estoqueModel = new \App\adms\Models\admsEstoque();
        $entrada      = $estoqueModel->buscarEntradaEstoquePorId($idEntrada);

        if (empty($entrada)) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Entrada de estoque não encontrada.</div>";
            header("Location: " . URLADM . "controllerEstoque/listarEstoque");
            exit();
        }

        $listarMenu                    = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu']           = $listarMenu->itemMenu();
        $this->Dados['entradaEstoque'] = $entrada;

        $carregarView = new \Core\ConfigView("adms/Views/estoque/detalhesEntradaEstoque", $this->Dados);
        $carregarView->renderizar();
    }

    public function editarEntradaEstoque($idEntrada = null)
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $idEntrada = (int) ($idEntrada ?? 0);
        if ($idEntrada < 1) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Entrada de estoque inválida.</div>";
            header("Location: " . URLADM . "controllerEstoque/listarEstoque");
            exit();
        }

        $this->Dados  = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];
        $estoqueModel = new \App\adms\Models\admsEstoque();
        $entrada      = $estoqueModel->buscarEntradaEstoquePorId($idEntrada);

        if (empty($entrada)) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Entrada de estoque não encontrada.</div>";
            header("Location: " . URLADM . "controllerEstoque/listarEstoque");
            exit();
        }

        if (! empty($this->Dados['btnEditarEntradaEstoque'])) {
            unset($this->Dados['btnEditarEntradaEstoque']);

            $dadosUpdate = [
                'id_produto'            => (int) ($this->Dados['id_produto'] ?? $entrada['id_produto']),
                'id_fornecedor'         => (int) ($this->Dados['id_fornecedor'] ?? 0),
                'id_fabricante'         => ! empty($this->Dados['id_fabricante']) ? (int) $this->Dados['id_fabricante'] : null,
                'lote'                  => $this->Dados['lote'] ?? null,
                'quantidade'            => (int) ($this->Dados['quantidade'] ?? 0),
                'preco_compra'          => $this->Dados['preco_compra'] ?? null,
                'data_validade'         => $this->Dados['data_validade'] ?? null,
                'id_user'               => (int) ($_SESSION['usuario_id'] ?? $entrada['id_user']),
                'preco_venda'           => $this->Dados['preco_venda'] ?? null,
                'data_compra'           => $this->Dados['data_compra'] ?? null,
                'id_estado'             => (int) ($this->Dados['id_estado'] ?? 0),
                'quantidade_disponivel' => (int) ($this->Dados['quantidade_disponivel'] ?? 0),
            ];

            $estoqueModel->editarEntradaEstoque($idEntrada, $dadosUpdate);

            if ($estoqueModel->getResultado()) {
                $_SESSION['msgcad'] = "<div class='alert alert-success'>Entrada de estoque atualizada com sucesso.</div>";
                header("Location: " . URLADM . "controllerEstoque/detalhesEntradaEstoque/{$idEntrada}");
                exit();
            }

            $mensagemErro       = $estoqueModel->getMsg() ?: "<b>Erro:</b> Não foi possível atualizar a entrada de estoque.";
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>{$mensagemErro}</div>";
            $entrada            = $estoqueModel->buscarEntradaEstoquePorId($idEntrada);
        }

        $listarMenu                    = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu']           = $listarMenu->itemMenu();
        $this->Dados['entradaEstoque'] = $entrada;

        $carregarView = new \Core\ConfigView("adms/Views/estoque/editarEntradaEstoque", $this->Dados);
        $carregarView->renderizar();
    }

}
