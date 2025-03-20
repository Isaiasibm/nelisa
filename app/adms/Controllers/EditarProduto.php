<?php

namespace App\adms\Controllers;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

/**
 * Description of EditarUsuario
 *
 * @copyright (c) year, Cesar Szpak - Celke
 */
class EditarProduto
{

    private $Dados;
    private $DadosId;

    public function editProduto($DadosId = null)
    {
        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $this->DadosId = (int) $DadosId;
        if (!empty($this->DadosId)) {
            $this->editProdutoPriv();
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: Produto não encontrado!</div>";
            $UrlDestino = URLADM . 'controllerEstoque/listarEstoque';
            header("Location: $UrlDestino");
        }
    }

    private function editProdutoPriv()
    {
        if (!empty($this->Dados['EditProduto'])) {
            unset($this->Dados['EditProduto']);
            $editarProduto = new \App\adms\Models\AdmsEditarProduto();
            $editarProduto->altProduto($this->Dados);
            if ($editarProduto->getResultado()) {
                $UrlDestino = URLADM . 'ver-pagina/ver-pagina/' . $this->Dados['id'];
                header("Location: $UrlDestino");
            } else {
                $this->Dados['form'] = $this->Dados;
                $this->editProdutoViewPriv();
            }
        } else {
            $verPagina = new \App\adms\Models\AdmsEditarProduto();
            $this->Dados['form'] = $verPagina->verPagina($this->DadosId);
            $this->editProdutoViewPriv();
        }
    }

    private function editProdutoViewPriv()
    {
        if ($this->Dados['form']) {
            $listarSelect = new \App\adms\Models\AdmsEditarProduto();
            $this->Dados['select'] = $listarSelect->listarCadastrar( $this->DadosId);

            var_dump($this->Dados['select']);
            die();

            $botao = ['vis_pagina' => ['menu_controller' => 'ver-pagina', 'menu_metodo' => 'ver-pagina']];
            $listarBotao = new \App\adms\Models\AdmsBotao();
            $this->Dados['botao'] = $listarBotao->valBotao($botao);

            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/produtos/editarProduto", $this->Dados);
            $carregarView->renderizar();
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: Produto não encontrado!</div>";
            $UrlDestino = URLADM . 'controllerEstoque/listarEstoque';
            header("Location: $UrlDestino");
        }
    }

}
