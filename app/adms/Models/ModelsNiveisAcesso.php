<?php

/**
 * Descricao de ModelsNiveisAcesso
 *
 * @copyright (c) year, Cesar Szpak - Celke
 */
class ModelsNiveisAcesso {

    private $Resultado;
    private $NiveilAcessoId;
    private $Dados;
    private $Msg;
    private $RowCount;
    private $ResultadoPaginacao;
   const Entity = 'niveis_acessos';
    function getResultado() {
        return $this->Resultado;
    }

    function getMsg() {
        return $this->Msg;
    }

    function getRowCount() {
        return $this->RowCount;
    }

    public function listar($PageId) {
        $Paginacao = new ModelsPaginacao(URL . 'controle-niveis-acesso/index');
        $Paginacao->condicao($PageId, 20);
        $this->ResultadoPaginacao = $Paginacao->paginacao('niveis_acessos');

        $Listar = new ModelsRead();
        $Listar->ExeRead('niveis_acessos', 'ORDER BY id ASC LIMIT :limit OFFSET :offset', "limit={$Paginacao->getLimiteResultado()}&offset={$Paginacao->getOffset()}");
        if ($Listar->getResultado()):
            $this->Resultado = $Listar->getResultado();
            return array($this->Resultado, $this->ResultadoPaginacao);
        else:
            $Paginacao->paginaInvalida();
        endif;
    }

    function cadastrar(array $Dados) {
        $this->Dados = $Dados;
        $this->validarDados();
        if ($this->Resultado):
            $this->inserir();
        endif;
    }

    private function validarDados() {
        $this->Dados = array_map('strip_tags', $this->Dados);
        $this->Dados = array_map('trim', $this->Dados);
        if (in_array('', $this->Dados)):
            $this->Resultado = false;
        else:
            $this->Resultado = true;
        endif;
    }

    private function inserir() {

        $Create = new ModelsCreate();
        $Create->ExeCreate('niveis_acessos', $this->Dados);
        if ($Create->getResultado()):
            $this->Resultado = $Create->getResultado();
        endif;
    }

    public function visualizar($NiveilAcessoId) {
        $this->NiveilAcessoId = (int) $NiveilAcessoId;
        $Visualizar = new ModelsRead();
        $Visualizar->ExeRead('niveis_acessos', 'WHERE id=:id LIMIT :limit', "id={$this->NiveilAcessoId}&limit=1");
        $this->Resultado = $Visualizar->getResultado();
        $this->RowCount = $Visualizar->getRowCount();
        return $this->Resultado;
    }



    public function editar($NiveilAcessoId, array $Dados) {
        $this->NiveilAcessoId = (int) $NiveilAcessoId;
        $this->Dados = $Dados;
        $this->validarDados();
        if ($this->Resultado):
            $this->alterar();
        endif;
    }

    private function alterar() {
        $Update = new ModelsUpdate();
        $Update->ExeUpdate('niveis_acessos', $this->Dados, 'WHERE id =:id', "id={$this->Dados['id']}");
        if ($Update->getResultado()):
            $this->Resultado = true;
        else:
            $this->Resultado = false;
        endif;
   }

   
   public function apagar($NivelAcessoId) {
       $this->NiveilAcessoId = (int) $NivelAcessoId;
       $this->Dados = $this->visualizar($this->NiveilAcessoId);
       if ($this->getRowCount() >= 0):
           
           $ApagarNivelAcesso = new ModelsDelete();
          $ApagarNivelAcesso->ExeDelete('niveis_acessos', 'WHERE id=:id', "id={$this->NiveilAcessoId}");
          $this->Resultado = $ApagarNivelAcesso->getResultado();
           
           else:
           
           
       endif;
       
       
   }
   
   
}
