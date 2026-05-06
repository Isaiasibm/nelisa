<?php
namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (! defined('URL')) {
    header("Location: /");
    exit();
}

/**
 * Controller Inventário
 *
 * @copyright (c) 2019, IBM - NELISA
 */
class ControllerInventario
{

    private $Resultado;
    private $Dados;
    private $UserId;
    private $PageId;
    private $LimiteResultado = 40;
    private $ResultadoPg;

    public function getResultadoPg()
    {
        return $this->ResultadoPg;
    }

    public function getResultado()
    {
        return $this->Resultado;
    }

    

    public function registarInventario()
    {
        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $this->Dados = $this->Dados ?? [];

        $inventarioModel = new \App\adms\Models\admsInventario();

        if (! empty($this->Dados['btnSubmitInventario'])) {
            unset($this->Dados['btnSubmitInventario']);

            if ($inventarioModel->cadastrarInventario($this->Dados)) {
                $_SESSION['msgcad'] = $inventarioModel->getMsg();
                header("Location: " . URLADM . "ControllerInventario/contagemInventario/" . $inventarioModel->getResultado());
                exit();
            }

            $_SESSION['msg'] = $inventarioModel->getMsg();
        }

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $this->Dados['tiposInventario'] = $inventarioModel->listarTiposInventario();
        $this->Dados['estadosInventario'] = $inventarioModel->listarEstadosInventario();
        $this->Dados['codigoInventario'] = $this->Dados['codigo'] ?? $inventarioModel->gerarCodigoInventario();
        $carregarView = new \Core\ConfigView("adms/Views/inventario/registar_inventario", $this->Dados);
        $carregarView->renderizar();
    }


    public function contagemInventario($idInventario = null)
    {
        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $this->Dados = $this->Dados ?? [];
        $inventarioModel = new \App\adms\Models\admsInventario();
        $idInventario = (int) ($idInventario ?? ($this->Dados['id_inventario'] ?? 0));

        if (! empty($this->Dados['btnGuardarContagem'])) {
            $idInventario = (int) ($this->Dados['id_inventario'] ?? 0);
            $dadosContagem = [
                'id_produto' => (int) ($this->Dados['id_produto'] ?? 0),
                'nome_produto' => trim((string) ($this->Dados['nome_produto'] ?? '')),
                'bar_code' => trim((string) ($this->Dados['bar_code'] ?? '')),
                'preco_compra_referencia' => (float) ($this->Dados['preco_compra_referencia'] ?? 0),
                'preco_venda_referencia' => (float) ($this->Dados['preco_venda_referencia'] ?? 0),
                'quantidade_sistema_abertura' => (int) ($this->Dados['quantidade_sistema_abertura'] ?? 0),
                'quantidade_sistema_contagem' => ($this->Dados['quantidade_sistema_contagem'] ?? '') === ''
                    ? null
                    : (int) $this->Dados['quantidade_sistema_contagem'],
                'quantidade_fisica' => (int) ($this->Dados['quantidade_fisica'] ?? 0),
                'observacao' => trim((string) ($this->Dados['observacao_item'] ?? '')),
            ];

            if ($inventarioModel->atualizarContagemItem($idInventario, $dadosContagem)) {
                $_SESSION['msgcad'] = $inventarioModel->getMsg();
            } else {
                $_SESSION['msg'] = $inventarioModel->getMsg();
            }

            header("Location: " . URLADM . "ControllerInventario/contagemInventario/" . $idInventario);
            exit();
        }

        if (! empty($this->Dados['btnFinalizarInventario'])) {
            $idInventario = (int) ($this->Dados['id_inventario'] ?? 0);

            if ($inventarioModel->finalizarInventario($idInventario)) {
                $_SESSION['msgcad'] = $inventarioModel->getMsg();
            } else {
                $_SESSION['msg'] = $inventarioModel->getMsg();
            }

            header("Location: " . URLADM . "ControllerInventario/contagemInventario/" . $idInventario);
            exit();
        }

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $this->Dados['inventariosEmAndamento'] = $inventarioModel->listarInventariosEmAndamento();
        $this->Dados['idInventarioAtual'] = $idInventario;
        $this->Dados['inventarioAtual'] = $idInventario > 0 ? $inventarioModel->buscarInventario($idInventario) : null;
        $this->Dados['itensInventarioAtual'] = $idInventario > 0 ? $inventarioModel->listarItensInventario($idInventario) : [];
        $carregarView = new \Core\ConfigView("adms/Views/inventario/contagem_inventario", $this->Dados);
        $carregarView->renderizar();
    }

}
