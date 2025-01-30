<?php

namespace App\adms\Models\helper;

if (!defined('URL')) {
    header("Location: /");
    exit();
}
/**
 * Descricao de ModelsPesquisaInfractor
 *
 * @copyright (c) year, FabioCalixto - DI
 */
class ModelsPesquisaInfractor {

    //codigo da class
    private $Resultado;
    private $Dados;
    private $Msg;
    private $RowCount;
    private $ResultadoPaginacao;
    private $PageId;

    function getResultado() {
        return $this->Resultado;
    }

    function getMsg() {
        return $this->Msg;
    }

    function getRowCount() {
        return $this->RowCount;
    }

    public function pesquisarInfractores($PageId = null, $Dados = null) {

        $this->PageId = $PageId;
        $this->Dados = $Dados;

        $this->PageId = strip_tags($this->PageId);
        $this->PageId = trim($this->PageId);

        $this->Dados['name'] = strip_tags($this->Dados['name']);
        $this->Dados['name'] = trim($this->Dados['name']);

        if (!empty($this->Dados['name'])):
            $this->pesquisarInfractoresComp();
        elseif (!empty($this->Dados['name'])):
            $this->pesquisarInfractoresUnidade();

        endif;

        return $this->Resultado;
    }

            private function pesquisarInfractoresComp() {
                $Paginacao = new \App\adms\Models\helper\ModelsPaginacao(URLADM . 'consulta-unidade/pesquisar-unidade/', 'name=' . $this->Dados['name']);
                $Paginacao->condicao($this->PageId, 1);
                $this->ResultadoPaginacao = $Paginacao->paginacaoFullRead("SELECT
        tab_infratores.nome_infractor,
        tb_estado_processo.descricao_proc,
        tb_processo.processo,
        tb_u_e_o.designacao_Unidade,
        tb_patente.patente,
        tab_infraccoes.designacao_infraccao,
        tab_infratores.id
        FROM
        tb_processo
        INNER JOIN tb_estado_processo ON tb_estado_processo.id = tb_processo.situacaoprocesso_id
        INNER JOIN tab_infratores ON tb_processo.id = tab_infratores.n_processo
        INNER JOIN tb_u_e_o ON tb_u_e_o.id = tab_infratores.cod_Unidade
        INNER JOIN tb_patente ON tb_patente.id = tab_infratores.cod_patente
        INNER JOIN tab_infraccoes ON tab_infraccoes.id = tab_infratores.id_infraccoes
        WHERE tb_u_e_o.id =:name ", "name={$this->Dados['name']}");
                //var_dump($this->ResultadoPaginacao);

                $Listar = new \App\adms\Models\helper\AdmsRead();
                $Listar->fullRead('SELECT
        tab_infratores.nome_infractor,
        tb_estado_processo.descricao_proc,
        tb_processo.processo,
        tb_u_e_o.designacao_Unidade,
        tb_patente.patente,
        tab_infraccoes.designacao_infraccao,
        tab_infratores.id
        FROM
        tb_processo
        INNER JOIN tb_estado_processo ON tb_estado_processo.id = tb_processo.situacaoprocesso_id
        INNER JOIN tab_infratores ON tb_processo.id = tab_infratores.n_processo
        INNER JOIN tb_u_e_o ON tb_u_e_o.id = tab_infratores.cod_Unidade
        INNER JOIN tb_patente ON tb_patente.id = tab_infratores.cod_patente
        INNER JOIN tab_infraccoes ON tab_infraccoes.id = tab_infratores.id_infraccoes
        WHERE tb_u_e_o.id =:name LIMIT :limit OFFSET :offset', "name={$this->Dados['name']}&limit={$Paginacao->getLimiteResultado()}&offset={$Paginacao->getOffset()}");
                if ($Listar->getResultado()):
                    $this->Resultado = $Listar->getResultado();
                    //var_dump($this->Resultado);
                    $this->Resultado = array($this->Resultado, $this->ResultadoPaginacao);
                else:
                    $Paginacao->paginaInvalida();
                endif;
            }

            private function pesquisarInfractoresUnidade() {
                $Paginacao = new \App\adms\Models\helper\ModelsPaginacao(URLADM . 'consulta-unidade/pesquisar-unidade/', 'name=' . $this->Dados['name']);
                $Paginacao->condicao($this->PageId, 1);
                $this->ResultadoPaginacao = $Paginacao->paginacaoFullRead("SELECT
                tab_infratores.nome_infractor,
                tb_estado_processo.descricao_proc,
                tb_processo.processo,
                tb_u_e_o.designacao_Unidade,
                tb_patente.patente,
                tab_infraccoes.designacao_infraccao,
                tab_infratores.id
                FROM
                tb_processo
                INNER JOIN tb_estado_processo ON tb_estado_processo.id = tb_processo.situacaoprocesso_id
                INNER JOIN tab_infratores ON tb_processo.id = tab_infratores.n_processo
                INNER JOIN tb_u_e_o ON tb_u_e_o.id = tab_infratores.cod_Unidade
                INNER JOIN tb_patente ON tb_patente.id = tab_infratores.cod_patente
                INNER JOIN tab_infraccoes ON tab_infraccoes.id = tab_infratores.id_infraccoes
                WHERE tb_u_e_o.id =:name ", "name={$this->Dados['name']}");
                //var_dump($this->ResultadoPaginacao);

                $Listar = new \App\adms\Models\helper\AdmsRead();
                $Listar->fullRead('SELECT
        tab_infratores.nome_infractor,
        tb_estado_processo.descricao_proc,
        tb_processo.processo,
        tb_u_e_o.designacao_Unidade,
        tb_patente.patente,
        tab_infraccoes.designacao_infraccao,
        tab_infratores.id
        FROM
        tb_processo
        INNER JOIN tb_estado_processo ON tb_estado_processo.id = tb_processo.situacaoprocesso_id
        INNER JOIN tab_infratores ON tb_processo.id = tab_infratores.n_processo
        INNER JOIN tb_u_e_o ON tb_u_e_o.id = tab_infratores.cod_Unidade
        INNER JOIN tb_patente ON tb_patente.id = tab_infratores.cod_patente
        INNER JOIN tab_infraccoes ON tab_infraccoes.id = tab_infratores.id_infraccoes
        WHERE tb_u_e_o.id =:name LIMIT :limit OFFSET :offset', "name={$this->Dados['name']}&limit={$Paginacao->getLimiteResultado()}&offset={$Paginacao->getOffset()}");
                if ($Listar->getResultado()):
                    $this->Resultado = $Listar->getResultado();
                    //var_dump($this->Resultado);
                    $this->Resultado = array($this->Resultado, $this->ResultadoPaginacao);
                else:
                    $Paginacao->paginaInvalida();
                endif;
            }

        }
