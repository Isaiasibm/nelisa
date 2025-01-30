<?php
namespace App\adms\Models; 
use PDOException;

if (!defined('URL')) {
    header("Location: /");
    exit();
} 
/**
 * Descricao de ModelsMilitar
 *
 * @copyright (c) 2019, Jose Reis - DI
 */
class ModelsMilitar {

    private $Resultado;
    private $EspecialistaId;
    private $Dados;
    private $msg;
    private $RowCount; 
    private $ResultadoPaginacao;
    private $PageId;

    const Entity = 'tb_pessoa';

    function getResultado() {
        return $this->Resultado;
    }

    function getMsg() {
        return $this->msg;
    }

    function getRowCount() {
        return $this->RowCount;
    }


      public function CarregarNip($tipoServico,$diasMes)
            {
                    $vis = new \App\adms\Models\helper\AdmsRead();
                   /* $vis->fullRead("select tb_militar.NIP FROM tb_militar LIMIT :limit","limit=$diasMes");  */

                    $vis->fullRead("select tb_militar.NIP FROM tb_militar INNER JOIN tb_tipo_servico_posto ON tb_tipo_servico_posto.idPosto=tb_militar.Cod_Patente WHERE tb_tipo_servico_posto.idTipoServico=$tipoServico limit $diasMes");  

                        return $vis->getResultado();
            }





    public function buscarDadosMilitar($nip){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT NIP,Nome,Apelido,Telefone,Data_Nascimento,Designacao_Sexo,tb_patente.Patente,tb_u_e_o.Designacao_Unidade,tb_pessoa.Cod_Sexo,tb_militar.Cod_Unidade, tb_disponibilidade.designacao_disponibilidade
                FROM tb_pessoa
                INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
                INNER JOIN tb_sexo ON tb_pessoa.Cod_Sexo = tb_sexo.Cod_Sexo
                INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
                INNER JOIN tb_u_e_o   ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
                INNER JOIN tb_disponibilidade ON tb_militar.disponibilidade=tb_disponibilidade.id_disponibilidade
                WHERE nip = :nip", "nip={$nip}");
            
            return $listarMilitarUeo->getResultado();

        }

        //===============================================================================

        public function buscarMilitarEspecifico($NipMilitar){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT tb_pessoa.Nome, tb_pessoa.Apelido, tb_pessoa.Telefone, tb_militar.NIP, tb_patente.Patente, tb_patente.Patente_EMGA, tb_disponibilidade.designacao_disponibilidade,tb_militar.data_ultimo_servico,
            tb_u_e_o.Designacao_Unidade, tb_u_e_o.Cod_Unidade,
            tb_ramo.Cod_Ramo, tb_ramo.Designacao_Ramo,
            tb_pessoa.Cod_Pessoa, tb_militar.Cod_Militar, tb_patente.Cod_Patente, tb_militar.cod_ramo, tb_disponibilidade.id_disponibilidade
            FROM tb_pessoa 
            INNER JOIN tb_militar ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
            INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
            INNER JOIN tb_disponibilidade ON tb_militar.disponibilidade=tb_disponibilidade.id_disponibilidade
            INNER JOIN tb_u_e_o  ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
            INNER JOIN tb_ramo ON tb_ramo.Cod_Ramo = tb_u_e_o.Cod_Ramo
            WHERE tb_militar.NIP={$NipMilitar} LIMIT 1");

            return $listarMilitarUeo->getResultado();

        }

        public function buscarEscalasDeSevicoMilitar($NipMilitar){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT tb_escala_servico.id,tb_militar.NIP, tb_pessoa.Nome,tb_pessoa.Apelido,tb_pessoa.Telefone, tb_patente.Patente,tb_u_e_o.Designacao_Unidade,tb_militar.data_ultimo_servico, tb_escala_servico.data_servico,tb_tiposervico.tipo_servico, tb_estado_servico.estado_servico
            FROM tb_pessoa
            INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
            INNER JOIN tb_patente ON tb_militar.Cod_Patente=tb_patente.Cod_Patente
            INNER JOIN tb_u_e_o  ON tb_militar.Cod_Unidade=tb_u_e_o.Cod_Unidade
            INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP
            INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id
            INNER JOIN tb_estado_servico ON tb_escala_servico.id_estado_servico=tb_estado_servico.id_estado_servico
            WHERE tb_militar.NIP={$NipMilitar}");

            return $listarMilitarUeo->getResultado();

        }


        public function verificarNIPparaEditarMilitar($NipMilitar, $codMilitar){
             $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT * FROM tb_militar WHERE tb_militar.NIP={$NipMilitar} AND tb_militar.Cod_Militar<>{$codMilitar}");
            return $listarMilitarUeo->getResultado();
        }

        public function verificarTelefoneparaEditarMilitar($telefone, $codPessoa){
             $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT * FROM tb_pessoa WHERE tb_pessoa.Telefone={$telefone} AND tb_pessoa.Cod_Pessoa<>{$codPessoa}");
            return $listarMilitarUeo->getResultado();
        }


        public function editarPessoa(array $DadosPessoa, $codPessoa){
            $this->Dados = $DadosPessoa;

            $upload = new \App\adms\Models\helper\AdmsUpdate();
            $upload->exeUpdate("tb_pessoa", $this->Dados, "WHERE Cod_Pessoa =:id", "id=" . $codPessoa);

            if ($upload->getResultado()) {
                $this->Resultado = true;
            } else {
                $this->Resultado = false;
            }
        }

        public function editarMilitar(array $DadosMilitar, $codMilitar){
            //$this->Dados['modified'] = date("Y-m-d H:i:s");
            $this->Dados = $DadosMilitar;

            $upload = new \App\adms\Models\helper\AdmsUpdate();
            $upload->exeUpdate("tb_militar", $this->Dados, "WHERE Cod_Militar =:id", "id=" . $codMilitar);

            if ($upload->getResultado()) {
                $_SESSION['msg'] = "<div class='alert alert-success'>Militar atualizado com sucesso!</div>";
                $this->Resultado = true;
            } else {
                $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: O Militar não foi atualizado!</div>";
                $this->Resultado = false;
            }
        }

        //===============================================================================

        public function buscarDadosMilitarPorRamo($ramo){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT 
            tb_patente.Cod_Classe,
            tb_militar.NIP,
            tb_pessoa.Cod_Sexo
            FROM
            tb_militar
            INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
            INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
            INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente
            WHERE tb_u_e_o.Cod_Ramo=:ramo", "ramo={$ramo}");
            
            return $listarMilitarUeo->getResultado();

        }

        public function listarUEORamo($ramo){

            $listarUEORamo = new \App\adms\Models\helper\AdmsRead();
            $listarUEORamo->fullRead("SELECT Cod_Unidade,Designacao_Unidade
                FROM tb_u_e_o
               
                WHERE Cod_Ramo = :Cod_Ramo", "Cod_Ramo={$ramo}");
            
            return $listarUEORamo->getResultado();

        }



      public function verificaNIP($NIP){

        $verificarNIP = new \App\adms\Models\helper\AdmsRead();
        $verificarNIP->exeRead("tb_militar", "WHERE nip=:nip", "nip={$NIP}");
        return $verificarNIP->getResultado();

    }

  public function processaEscala(array $dadosEscala) {
        $this->Dados = $dadosEscala;
        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_escala_servico', $this->Dados);
        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b>Erro:</b> Escala não processada! Tente novamente"; 
          $this->Resultado = 0;           
        endif;

        else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os campos dos Dados Pessoais"; 
          $this->Resultado = 0;
        endif;
    }

    public function cadastrarPessoa(array $DadosPessoa) {
        $this->Dados = $DadosPessoa;
     /*   $this->ValidarDados();

        if ($this->Resultado): */
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_pessoa', $this->Dados);
        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b>Erro:</b> Dados Pessoais nao registados! Tente novamente"; 
          $this->Resultado = 0;           
        endif;

       /* else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os campos dos Dados Pessoais"; 
          $this->Resultado = 0;
        endif; */
    }
    public function cadastrarMilitar(array $DadosMilitar) {

        $this->Dados = $DadosMilitar;
        
     /*   $this->ValidarDados();
 //var_dump($this->Dados);
        if ($this->Resultado):
        */ 
            $Create = new \App\adms\Models\helper\AdmsCreate;
        $Create->exeCreate('tb_militar', $this->Dados);
        if ($Create->getResultado()):
            $this->Resultado = $Create->getResultado();
        else:
          $this->Resultado = 0;
          $this->msg = "<b>Erro:</b> Militar nao registado.Preencha de forma correta os campos!";
        endif;
     //   endif;
        
    }



    public function apagarMilitar($idMiltar){

        $Apagar = new \App\adms\Models\helper\AdmsDelete();
        $Apagar->exeDelete("tb_militar", "WHERE cod_militar=:cod_militar", "cod_militar={$idMiltar}");
        $this->Resultado = $Apagar->getResultado();
    }
    public function apagarPessoa($idPessoa){

        $Apagar = new \App\adms\Models\helper\AdmsDelete();
        $Apagar->exeDelete("tb_pessoa", "WHERE cod_pessoa=:cod_pessoa", "cod_pessoa={$idPessoa}");
        $this->Resultado = $Apagar->getResultado();
    }


    private function validarDados() {
        $this->Dados = array_map('strip_tags', $this->Dados);
        $this->Dados = array_map('trim', $this->Dados);
        if (in_array('', $this->Dados)):
            $this->Resultado = false;
        else:
            //       $this->Dados['password'] = md5($this->Dados['password']);
            $this->Resultado = true;
        endif;
    }

 
/*Acrescentado Recentemente*/
    public function alterarDadosPessoa(array $DadosPessoa){
         $this->Dados = $DadosPessoa;
        $this->ValidarDados();
        if ($this->Resultado):
           $alterarDadosPessoa = new \App\adms\Models\helper\AdmsUpdate;
           $alterarDadosPessoa->exeUpdate("tb_pessoa", $this->Dados, "
         WHERE Cod_Pessoa = :cod_pessoa", "cod_pessoa={$this->Dados['cod_pessoa']}");

            $this->Resultado=$alterarDadosPessoa->getResultado();
            return $this->Resultado;
            
        endif;

    } 
    

    //====================================================================================================
    //====================================================================================================
    //====================================================================================================
    //=========================================================================================
    public function editar_Pessoa(array $DadosPessoa, $id)
    {
        $this->Dados = $DadosPessoa;
        $Upload = new \App\adms\Models\helper\AdmsUpdate;

   

        try {
            $Upload->exeUpdate("tb_pessoa", $this->Dados, "WHERE cod_pessoa=:id_pessoa", "id_pessoa={$id}");
            $Upload->getResultado();
            return true;
        } catch (PDOException $e) {
            return false;
        }
    }

    //=========================================================================================
    public function editar_Militar(array $DadosMilitar, $id)
    {
        $this->Dados = $DadosMilitar;
        $Upload = new \App\adms\Models\helper\AdmsUpdate;

        try {
            $Upload->exeUpdate("tb_militar", $this->Dados, "WHERE Cod_Militar=:id_militar", "id_militar={$id}");
            $Upload->getResultado();
            return true;
        } catch (PDOException $e) {
            return false;
        }

    }

    //====================================================================================================
    
    
    public function buscarUEO($codUEO){
        
            $buscarUEO = new \App\adms\Models\helper\AdmsRead();
            $buscarUEO->fullRead("SELECT Cod_Unidade,Designacao_Unidade
                FROM tb_u_e_o 
                WHERE Cod_Unidade = :Cod_Unidade", "Cod_Unidade={$codUEO}");
                return $buscarUEO->getResultado();
    }

    public function alterarDadosMilitar(array $DadosMilitar){

        $this->Dados = $DadosMilitar;
       $this->ValidarDados();

        if ($this->Resultado):
           $alterarDadosMilitar = new \App\adms\Models\helper\AdmsUpdate;
        $alterarDadosMilitar->exeUpdate("tb_militar", $this->Dados, "
         WHERE Cod_Militar = :cod_militar", "cod_militar={$this->Dados['cod_militar']}");

            $this->Resultado=$alterarDadosMilitar->getResultado();
            
            return $this->Resultado;


            
        endif;
    }
    


}
