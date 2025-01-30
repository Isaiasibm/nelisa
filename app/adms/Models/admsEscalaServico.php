<?php

namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
}
/**
 * Descricao de ModelsMilitar
 *
 * @copyright (c) 2019, Jose Reis - DI
 */
class admsEscalaServico
{

    private $Resultado;
    private $EspecialistaId;
    private $Dados;
    private $msg;
    private $RowCount;
    private $ResultadoPaginacao;
    private $PageId;

    const Entity = 'tb_pessoa';

    function getResultado()
    {
        return $this->Resultado;
    }

    function getMsg()
    {
        return $this->msg;
    }

    function getRowCount()
    {
        return $this->RowCount;
    }


    public function verificarAnoMesEscala($anoMes, $tiposerv)
    {
        $verificarEcala = new \App\adms\Models\helper\AdmsRead();
        $verificarEcala->exeRead("tb_escala_servico", "WHERE id_tipo=:id_tipo AND data_servico LIKE '$anoMes%'", "id_tipo={$tiposerv}");
        return $verificarEcala->getResultado();
    }

    public function verificarDataEscala($data, $tiposerv)
    {
        $verificarEcala = new \App\adms\Models\helper\AdmsRead();
        $verificarEcala->exeRead("tb_escala_servico", "WHERE id_tipo=:id_tipo AND data_servico='$data'", "id_tipo={$tiposerv}");
        return $verificarEcala->getResultado();
    }








    public function CarregarMilitaresNovosDisponiveis($tipoServico, $limite)
    {

        $vis = new \App\adms\Models\helper\AdmsRead();
        $vis->fullRead("SELECT DISTINCT tb_militar.NIP, tb_militar.Cod_Patente,tb_militar.Cod_Unidade FROM tb_militar INNER JOIN tb_tipo_servico_posto ON tb_tipo_servico_posto.idPosto=tb_militar.Cod_Patente WHERE tb_tipo_servico_posto.idTipoServico=:idTipoServico AND NIP NOT IN(SELECT tb_escala_servico.nip_militar FROM tb_escala_servico GROUP BY tb_escala_servico.nip_militar) AND tb_militar.disponibilidade = 1 LIMIT $limite", "idTipoServico={$tipoServico}");

        return $vis->getResultado();
    }

    public function CarregarMilitaresAntigosDisponiveis($tipoServico, $limite)
    {
        $vis = new \App\adms\Models\helper\AdmsRead();
        $vis->fullRead("SELECT DISTINCT tb_militar.NIP, tb_militar.Cod_Patente,tb_militar.Cod_Unidade FROM tb_militar 
                    INNER JOIN tb_tipo_servico_posto ON tb_tipo_servico_posto.idPosto=tb_militar.Cod_Patente
                WHERE tb_tipo_servico_posto.idTipoServico=:idTipoServico AND tb_militar.disponibilidade = 1 AND NIP IN(SELECT tb_escala_servico.nip_militar FROM tb_escala_servico GROUP BY tb_escala_servico.nip_militar) AND DAYNAME(tb_militar.data_ultimo_servico) ORDER BY tb_militar.data_ultimo_servico ASC LIMIT $limite", "idTipoServico={$tipoServico}");

        return $vis->getResultado();
    }

    public function carregarReservas($tipoServico, $anoMes, $limite)
    {
        $vis = new \App\adms\Models\helper\AdmsRead();
        $vis->fullRead("SELECT DISTINCT tb_militar.NIP,
                    tb_patente.Patente,
                    tb_militar.Cod_Patente,
                    tb_militar.Cod_Unidade,
                    tb_pessoa.Nome,
                    tb_pessoa.Apelido,tb_u_e_o.Designacao_Unidade
                    FROM tb_militar 
                    INNER JOIN tb_tipo_servico_posto 
                    ON tb_tipo_servico_posto.idPosto=tb_militar.Cod_Patente 
                    INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa
                    INNER JOIN tb_patente ON tb_patente.Cod_Patente=tb_militar.Cod_Patente
                    INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_militar.Cod_Unidade

                    WHERE tb_tipo_servico_posto.idTipoServico=:idTipoServico AND NIP NOT IN(SELECT tb_escala_servico.nip_militar FROM tb_escala_servico WHERE tb_escala_servico.data_servico LIKE '$anoMes%') AND tb_militar.disponibilidade = 1 ORDER BY tb_militar.data_ultimo_servico ASC LIMIT $limite", "idTipoServico={$tipoServico}");

        return $vis->getResultado();
    }


    public function buscarDadosMilitarEscalado($id)
    {

        $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
        $listarMilitarUeo->fullRead("SELECT tb_escala_servico.id,tb_militar.NIP, tb_pessoa.Nome,tb_pessoa.Apelido,tb_pessoa.Telefone, tb_patente.Patente,tb_u_e_o.Designacao_Unidade,tb_militar.data_ultimo_servico, tb_escala_servico.data_servico,tb_tiposervico.tipo_servico, tb_estado_servico.estado_servico
            FROM tb_pessoa
            INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
            INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
            INNER JOIN tb_u_e_o  ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
            INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP
            INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
            INNER JOIN tb_estado_servico ON tb_escala_servico.id_estado_servico=tb_estado_servico.id_estado_servico
                WHERE tb_escala_servico.id=:id LIMIT 1", "id={$id}");

        return $listarMilitarUeo->getResultado();
    }

    public function visualizar($nip)
    {

        $this->nip = (int) $nip;
        $Visualizar = new \App\adms\Models\helper\AdmsRead();

        $Visualizar->fullRead("SELECT tb_escala_servico.id,tb_militar.NIP, tb_pessoa.Nome,tb_pessoa.Apelido,tb_pessoa.Telefone,tb_pessoa.Data_Nascimento,tb_sexo.Designacao_Sexo, tb_patente.Patente,tb_u_e_o.Designacao_Unidade,tb_militar.data_ultimo_servico, tb_escala_servico.data_servico,tb_tiposervico.tipo_servico
                FROM tb_pessoa
                INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
                INNER JOIN tb_sexo ON tb_pessoa.Cod_Sexo = tb_sexo.Cod_Sexo
                INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
                INNER JOIN tb_u_e_o  ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
                INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP
                                INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
                
                WHERE tb_militar.NIP=:nip ", "nip={$this->nip}");

        return $Visualizar->getResultado();
    }



    public function buscarDadosMilitar($nip)
    {

        $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
        $listarMilitarUeo->fullRead("SELECT NIP,Nome,Apelido,Telefone,Data_Nascimento,Designacao_Sexo, tb_patente.Patente,tb_u_e_o.Designacao_Unidade,tb_pessoa.Cod_Sexo,tb_militar.Cod_Unidade
                FROM tb_pessoa
                INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
                INNER JOIN tb_sexo ON tb_pessoa.Cod_Sexo = tb_sexo.Cod_Sexo
                INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
                INNER JOIN tb_u_e_o   ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
                WHERE nip = :nip", "nip={$nip}");
        return $listarMilitarUeo->getResultado();
    }

    public function lisEscala($tipoServico, $anoMes)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico
from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_tiposervico.id=$tipoServico AND tb_escala_servico.data_servico LIKE '$anoMes%' order by tb_escala_servico.data_servico asc");

        return $listEscala->getResultado();
    }

    public function lisEscalaData($tipoServico, $data)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico
from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_tiposervico.id=$tipoServico AND tb_escala_servico.data_servico='$data'");

        return $listEscala->getResultado();
    }

    public function lisEscalaIntervaloData($tipoServico, $data, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico
from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_tiposervico.id=$tipoServico AND tb_escala_servico.data_servico BETWEEN '$data' AND '$data2' order by tb_escala_servico.data_servico asc");

        return $listEscala->getResultado();
    }


    public function lisGeralData($data)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico,tb_tiposervico.tipo_servico
from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_escala_servico.data_servico='$data'");

        return $listEscala->getResultado();
    }

    public function lisGeralUeo($unidade)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico,tb_tiposervico.tipo_servico
from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_u_e_o.Cod_Unidade=$unidade ORDER BY tb_tiposervico.id ASC, tb_escala_servico.data_servico ");

        return $listEscala->getResultado();
    }

    public function lisGeralUeoMes($ueo, $anoMes)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico,tb_tiposervico.tipo_servico
from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_u_e_o.Cod_Unidade=$ueo AND tb_escala_servico.data_servico LIKE '$anoMes%' ORDER BY tb_tiposervico.id ASC, tb_escala_servico.data_servico ");
        return $listEscala->getResultado();
    }

    public function lisGeralUeoTipoServicoMes($ueo, $tipoServico, $anoMes)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico,tb_tiposervico.tipo_servico
from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_u_e_o.Cod_Unidade=$ueo AND tb_tiposervico.id=$tipoServico AND tb_escala_servico.data_servico LIKE '$anoMes%' ORDER BY tb_tiposervico.id ASC, tb_escala_servico.data_servico ");

        return $listEscala->getResultado();
    }

    public function lisGeralUeoData($ueo, $data)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico,tb_tiposervico.tipo_servico
from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_u_e_o.Cod_Unidade=$ueo AND tb_escala_servico.data_servico= '$data' ORDER BY tb_tiposervico.id ASC, tb_escala_servico.data_servico ");

        return $listEscala->getResultado();
    }

    public function notificacaoIndividualDados($idEscala)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome,tb_pessoa.Apelido,tb_patente.Patente,tb_u_e_o.Designacao_Unidade,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico
                FROM tb_pessoa INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa INNER JOIN tb_escala_servico 
                ON tb_escala_servico.nip_militar=tb_militar.NIP
                INNER JOIN tb_patente 
                ON tb_escala_servico.Cod_Patente =tb_patente.Cod_Patente
                INNER JOIN tb_u_e_o 
                ON tb_escala_servico.Cod_u_e_o=tb_u_e_o.Cod_Unidade
                INNER JOIN tb_tiposervico 
                ON tb_escala_servico.id_tipo=tb_tiposervico.id
                WHERE tb_escala_servico.id=$idEscala");

        return $listEscala->getResultado();
    }


    public function lisAusente()
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP 
ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }




    public function graficoUnidadeGeralAusente($data)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_u_e_o.Designacao_Unidade,COUNT(tb_escala_servico.Cod_u_e_o) as quantidade, ((COUNT(*)/(SELECT COUNT(*) from tb_escala_servico WHERE tb_escala_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico LIKE '$data%'))*100) AS percentagem
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
WHERE tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico LIKE '$data%' GROUP BY tb_escala_servico.Cod_u_e_o");

        return $listEscala->getResultado();
    }



    public function graficoUnidadeGeralAusenteIntervalo($data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_u_e_o.Designacao_Unidade,COUNT(tb_escala_servico.Cod_u_e_o) as quantidade, ((COUNT(*)/(SELECT COUNT(*) from tb_escala_servico WHERE tb_escala_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' ))*100) AS percentagem
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
WHERE tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' GROUP BY tb_escala_servico.Cod_u_e_o");

        return $listEscala->getResultado();
    }




    public function graficoTipoServicoMesAusente($data)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_tiposervico.tipo_servico,COUNT(tb_escala_servico.id_tipo) as quantidade, ((COUNT(*)/(SELECT COUNT(*) from tb_escala_servico WHERE tb_escala_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico LIKE '$data%'))*100) AS percentagem
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
WHERE tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico LIKE '$data%' GROUP BY tb_tiposervico.tipo_servico");

        return $listEscala->getResultado();
    }

    public function graficoTipoServicoMesAusenteIntervalo($data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_tiposervico.tipo_servico,COUNT(tb_escala_servico.id_tipo) as quantidade, ((COUNT(*)/(SELECT COUNT(*) from tb_escala_servico WHERE tb_escala_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2'))*100) AS percentagem
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
WHERE tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' GROUP BY tb_tiposervico.tipo_servico");

        return $listEscala->getResultado();
    }


    public function lisAusTipoMes($tipoServico, $anoMes)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_escala_servico.id_tipo=$tipoServico AND tb_escala_servico.data_servico LIKE '$anoMes%' AND tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }



    public function lisAusTipoIntervalo($tipoServico, $data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_escala_servico.id_tipo=$tipoServico AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' AND tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }


    public function lisAusIntervalo($data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' AND tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }

    public function lisAusUeo($ueo)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_u_e_o.Cod_Unidade=$ueo AND tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }

    public function lisAusUeoIntervalo($ueo, $data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_u_e_o.Cod_Unidade=$ueo AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' AND tb_estado_servico.id_estado_servico=2 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }



    public function lisPresenca()
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP 
ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }


    public function lisPresTipoMes($tipoServico, $anoMes)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_escala_servico.id_tipo=$tipoServico AND tb_escala_servico.data_servico LIKE '$anoMes%' AND tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }



    public function lisPresTipoIntervalo($tipoServico, $data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_escala_servico.id_tipo=$tipoServico AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' AND tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }


    public function lisPresIntervalo($data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' AND tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }

    public function lisPresUeo($ueo)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_u_e_o.Cod_Unidade=$ueo AND tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }

    public function lisPresUeoIntervalo($ueo, $data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,
tb_estado_servico.estado_servico,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,
tb_motivo_ausencia.descricao_motivo,tb_patente.Patente
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
INNER JOIN tb_motivo_ausencia ON tb_escala_servico.id_motivo_ausencia=tb_motivo_ausencia.id
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_u_e_o.Cod_Unidade=$ueo AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' AND tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP ORDER BY tb_escala_servico.data_servico DESC");

        return $listEscala->getResultado();
    }





    public function graficoUnidadeGeralPresente($data)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_u_e_o.Designacao_Unidade,COUNT(tb_escala_servico.Cod_u_e_o) as quantidade, ((COUNT(*)/(SELECT COUNT(*) from tb_escala_servico WHERE tb_escala_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico LIKE '$data%'))*100) AS percentagem
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
WHERE tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico LIKE '$data%' GROUP BY tb_escala_servico.Cod_u_e_o");

        return $listEscala->getResultado();
    }



    public function graficoUnidadeGeralPresenteIntervalo($data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_u_e_o.Designacao_Unidade,COUNT(tb_escala_servico.Cod_u_e_o) as quantidade, ((COUNT(*)/(SELECT COUNT(*) from tb_escala_servico WHERE tb_escala_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' ))*100) AS percentagem
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
WHERE tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' GROUP BY tb_escala_servico.Cod_u_e_o");

        return $listEscala->getResultado();
    }




    public function graficoTipoServicoMesPresente($data)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_tiposervico.tipo_servico,COUNT(tb_escala_servico.id_tipo) as quantidade, ((COUNT(*)/(SELECT COUNT(*) from tb_escala_servico WHERE tb_escala_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico LIKE '$data%'))*100) AS percentagem
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
WHERE tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico LIKE '$data%' GROUP BY tb_tiposervico.tipo_servico");

        return $listEscala->getResultado();
    }

    public function graficoTipoServicoMesPresenteIntervalo($data1, $data2)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_tiposervico.tipo_servico,COUNT(tb_escala_servico.id_tipo) as quantidade, ((COUNT(*)/(SELECT COUNT(*) from tb_escala_servico WHERE tb_escala_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2'))*100) AS percentagem
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
WHERE tb_estado_servico.id_estado_servico=1 AND data_servico < CURRENT_TIMESTAMP AND tb_escala_servico.data_servico BETWEEN '$data1' AND '$data2' GROUP BY tb_tiposervico.tipo_servico");

        return $listEscala->getResultado();
    }
















    public function lisMilitaresGeral()
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_pessoa.Nome, tb_militar.NIP, tb_patente.Patente, tb_disponibilidade.designacao_disponibilidade,tb_militar.data_ultimo_servico,tb_u_e_o.Designacao_Unidade,tb_pessoa.Telefone,
            tb_militar.cod_ramo, tb_patente.Patente_EMGA
            FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa
            INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
            INNER JOIN tb_disponibilidade ON tb_militar.disponibilidade=tb_disponibilidade.id_disponibilidade
            INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade");

        return $listEscala->getResultado();
    }

    public function lisMilitaresUeo($ueo)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome,tb_pessoa.Apelido,tb_u_e_o.Designacao_Unidade,tb_patente.Patente,tb_militar.data_ultimo_servico,
            tb_militar.cod_ramo, tb_patente.Patente_EMGA
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
WHERE  tb_u_e_o.Cod_Unidade=$ueo
 ORDER BY tb_militar.data_ultimo_servico ASC");

        return $listEscala->getResultado();
    }


    public function lisMilitaresDisponiveis($disponib)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome,tb_pessoa.Apelido,tb_u_e_o.Designacao_Unidade,tb_patente.Patente,tb_militar.data_ultimo_servico,
            tb_militar.cod_ramo, tb_patente.Patente_EMGA
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
WHERE tb_militar.disponibilidade=$disponib
ORDER BY tb_militar.data_ultimo_servico ASC");

        return $listEscala->getResultado();
    }

    public function lisMilitaresDisponiveisUeo($disponib, $ueo)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_militar.NIP, tb_pessoa.Nome,tb_pessoa.Apelido,tb_u_e_o.Designacao_Unidade,tb_patente.Patente,tb_militar.data_ultimo_servico,
        tb_militar.cod_ramo, tb_patente.Patente_EMGA
FROM tb_militar INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa 
INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
WHERE tb_militar.disponibilidade=$disponib AND tb_u_e_o.Cod_Unidade=$ueo
ORDER BY tb_militar.data_ultimo_servico ASC");

        return $listEscala->getResultado();
    }

    public function lisReserva($idEscalaServico)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_pessoa.Nome as nome_reserva, tb_pessoa.Apelido as apelido_reserva, tb_reserva.nip_Militar_reserva,tb_patente.Patente as patente_reserva,tb_u_e_o.Designacao_Unidade as unidade_reserva
FROM tb_reserva INNER JOIN tb_militar ON tb_reserva.nip_Militar_reserva=tb_militar.NIP 
INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa
INNER JOIN tb_u_e_o ON tb_reserva.id_unidade_reserva=tb_u_e_o.Cod_Unidade
INNER JOIN tb_patente ON tb_reserva.id_patente_reserva=tb_patente.Cod_Patente
WHERE tb_reserva.id_escala_servico=:idEscala", "idEscala={$idEscalaServico}");
        return $listEscala->getResultado();
    }

    public function lisEscalaQueNaoTemReserva($tipoServico, $anoMes)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_escala_servico.data_servico
FROM tb_escala_servico INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id WHERE tb_escala_servico.id NOT IN(SELECT tb_reserva.id_escala_servico FROM tb_reserva) AND tb_escala_servico.data_servico LIKE '$anoMes%' AND tb_tiposervico.id=$tipoServico ORDER BY data_servico ASC");

        return $listEscala->getResultado();
    }

    public function imprimirEscala($tipoServico, $data)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id as idEsc,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico
                from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
                INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
                INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
                INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
                INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
                WHERE tb_tiposervico.id=$tipoServico AND tb_escala_servico.data_servico LIKE '$data%' order by tb_escala_servico.data_servico asc");

        return $listEscala->getResultado();
    }

    public function buscaReservaImprimirEscala($idEscala)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_pessoa.Nome as nome_reserva, tb_pessoa.Apelido as apelido_reserva, tb_reserva.nip_Militar_reserva,tb_reserva.id_unidade_reserva,tb_patente.Patente as patente_reserva,tb_u_e_o.Designacao_Unidade as unidade_reserva
                FROM tb_reserva INNER JOIN tb_militar ON tb_reserva.nip_Militar_reserva=tb_militar.NIP 
                INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa
                INNER JOIN tb_u_e_o ON tb_reserva.id_unidade_reserva=tb_u_e_o.Cod_Unidade
                INNER JOIN tb_patente ON tb_reserva.id_patente_reserva=tb_patente.Cod_Patente
                WHERE tb_reserva.id_escala_servico= $idEscala");

        return $listEscala->getResultado();
    }



    public function lisEscalaProcessadaAgora($nip)
    {

        $listEscala = new \App\adms\Models\helper\AdmsRead();
        $listEscala->fullRead("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.data_ultimo_servico,tb_militar.NIP,tb_tiposervico.tipo_servico
                from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
                INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
                INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
                INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
                INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
                WHERE tb_escala_servico.nip_militar=:nip", "nip={$nip}");

        return $listEscala->getResultado();
    }


    public function listarUEORamo($ramo)
    {

        $listarUEORamo = new \App\adms\Models\helper\AdmsRead();
        $listarUEORamo->fullRead("SELECT Cod_Unidade,Designacao_Unidade
                FROM tb_u_e_o
               
                WHERE Cod_Ramo = :Cod_Ramo", "Cod_Ramo={$ramo}");

        return $listarUEORamo->getResultado();
    }



    public function verificaNIP($NIP)
    {

        $verificarNIP = new \App\adms\Models\helper\AdmsRead();
        $verificarNIP->exeRead("tb_militar", "WHERE nip=:nip", "nip={$NIP}");
        return $verificarNIP->getResultado();
    }

    public function verificaDocumento($doc)
    {

        $verificarNIP = new \App\adms\Models\helper\AdmsRead();
        $verificarNIP->exeRead("tb_pessoa", "WHERE Numero_Documento=:doc", "doc={$doc}");
        return $verificarNIP->getResultado();
    }

    public function processaEscala(array $dadosEscala)
    {
        $this->Dados = $dadosEscala;
        $this->ValidarDados();
        if ($this->Resultado) :
            $Create = new \App\adms\Models\helper\AdmsCreate;

            $Create->exeCreate('tb_escala_servico', $this->Dados);

            if ($Create->getResultado() >= 1) :

                $this->Resultado = $Create->getResultado();
            else :
                $this->msg = "<b>Erro:</b> Escala não processada! Tente novamente";
                $this->Resultado = 0;
            endif;

        else :
            $this->msg = "<b>Erro:</b> Preencha de forma correta os campos";
            $this->Resultado = 0;
        endif;
    }

    public function processaReserva(array $dadosReserva)
    {
        $this->Dados = $dadosReserva;
        $this->ValidarDados();
        if ($this->Resultado) :
            $Create = new \App\adms\Models\helper\AdmsCreate;
            $Create->exeCreate('tb_reserva', $this->Dados);

            if ($Create->getResultado() >= 1) :
                $this->Resultado = $Create->getResultado();
            else :
                $this->msg = "<b>Erro:</b> Reservas não escaladas! Tente novamente";
                $this->Resultado = 0;
            endif;
        else :
            $this->msg = "<b>Erro:</b> Preencha de forma correta os campos";
            $this->Resultado = 0;
        endif;
    }


    public function confirmePresenca($Dados)
    {
        $this->Dados = $Dados;


        $upAltSenha = new \App\adms\Models\helper\AdmsUpdate();
        $upAltSenha->exeUpdate("tb_escala_servico", array('id_estado_servico' => $this->Dados['estadoServico'], 'observacao' => $this->Dados['observacao']), "WHERE id =:id", "id=" . $this->Dados["idEscala"]);
        if ($upAltSenha->getResultado()) {

            if ($this->Dados['estadoServico'] == 1) {
                # code...

                $upAltSenha->exeUpdate("tb_militar", array('data_ultimo_servico' => $this->Dados['data_ultimo_servico']), "WHERE NIP =:nip", "nip=" . $this->Dados["nipEscalado"]);
                if ($upAltSenha->getResultado()) {
                    $_SESSION['msg'] = "<div class='alert alert-success'>Dados actualizados!</div>";
                    $this->Resultado = true;
                } else {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Erro:Dados não actualizados!</div>";
                    $this->Resultado = false;
                }
            }
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro:Dados não actualizados!</div>";
            $this->Resultado = false;
        }
    }


    public function alterarData($Dados)
    {
        $this->Dados = $Dados;

        $upAltSenha = new \App\adms\Models\helper\AdmsUpdate();
        $upAltSenha->exeUpdate("tb_escala_servico", array('data_servico' => $this->Dados['dataNova'], 'observacao' => $this->Dados['observacao']), "WHERE id =:id", "id=" . $this->Dados["idEscala"]);

        if ($upAltSenha->getResultado()) {
            $_SESSION['msg'] = "<div class='alert alert-success'>Dados actualizados!</div>";
            $this->Resultado = true;
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro:Dados não actualizados!</div>";
            $this->Resultado = false;
        }
    }

    private function validarDados()
    {
        $this->Dados = array_map('strip_tags', $this->Dados);
        $this->Dados = array_map('trim', $this->Dados);
        if (in_array('', $this->Dados)) :
            $this->Resultado = false;
        else :
            //$this->Dados['password'] = md5($this->Dados['password']);
            $this->Resultado = true;
        endif;
    }


    public function buscarUEO($codUEO)
    {

        $buscarUEO = new \App\adms\Models\helper\AdmsRead();
        $buscarUEO->fullRead("SELECT Cod_Unidade,Designacao_Unidade
                FROM tb_u_e_o
               
                WHERE Cod_Unidade = :Cod_Unidade", "Cod_Unidade={$codUEO}");

        return $buscarUEO->getResultado();
    }
}
