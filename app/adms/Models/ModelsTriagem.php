<?php
namespace App\adms\Models;

date_default_timezone_set('Africa/Luanda');
 

if (!defined('URL')) {
    header("Location: /");
    exit();
} 
/**
 * Descricao de ModelsProva
 *
 * @copyright (c) 2019, Jose Reis - DI
 */
class ModelsTriagem {

    private $Resultado;
    private $idTriagem;
    private $Dados;
    private $msg;
    private $RowCount; 
    private $ResultadoPaginacao;
    private $PageId;

    const Entity = 'tb_provaaptidaofisica';

    function getResultado() {
        return $this->Resultado;
    }

    function getMsg() {
        return $this->msg;
    }

    function getRowCount() {
        return $this->RowCount;
    }


      public function verificarTriagemMilitar($nip,$prova){

            $buscarTriagem = new \App\adms\Models\helper\AdmsRead();
            $buscarTriagem->fullRead("SELECT tb_triagem.id,Observacao,Data_Triagem,Peso,Altura,Pulso,Diastolica,Sistolica,Cod_Motivo,tb_motivo.Designacao FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_motivo ON tb_triagem.Cod_Motivo=tb_motivo.id
             WHERE NIP=:NIP AND tb_faserealizacaoprova.id_Prova=:id_Prova", "NIP={$nip}&id_Prova={$prova}");
            
            return $buscarTriagem->getResultado();

      }

      public function estatisticaProvaRamo($ramo,$prova,$dataTriagem = null){




        $estatisticaProvaRamo = new \App\adms\Models\helper\AdmsRead();

        if ($dataTriagem==null) {
          
            $estatisticaProvaRamo->fullRead("SELECT 

            tb_triagem.Cod_Motivo,
            COUNT(tb_patente.Cod_Classe) AS aptos,
            tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo=1 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}");

            $this->Resultado["aptos"] = $estatisticaProvaRamo->getResultado();



             $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS TA_Alta,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo=2 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}");

             $this->Resultado["TA_ALTA"] = $estatisticaProvaRamo->getResultado();
             
            $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS TA_Baixa,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo=3 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}");

            $this->Resultado["TA_Baixa"] = $estatisticaProvaRamo->getResultado();
             
            $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS gestante,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo=5 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}");

            $this->Resultado["Gestante"] = $estatisticaProvaRamo->getResultado();

            $estatisticaProvaRamo->fullRead("SELECT 

              
              COUNT(tb_patente.Cod_Classe) AS Outros,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo >3 AND tb_triagem.Cod_Motivo <>5 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}");

            $this->Resultado["Outros"] = $estatisticaProvaRamo->getResultado();

              $estatisticaProvaRamo->fullRead("SELECT 

              tb_pessoa.Cod_Sexo,
              COUNT(tb_patente.Cod_Classe) AS masculino,
              tb_patente.Cod_Classe AS classe

              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_pessoa.Cod_Sexo=1 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}");

              $this->Resultado["M"] = $estatisticaProvaRamo->getResultado();

             $estatisticaProvaRamo->fullRead("SELECT 

                  tb_pessoa.Cod_Sexo,
                  COUNT(tb_patente.Cod_Classe) AS femenino,
                  tb_patente.Cod_Classe AS classe


                  FROM tb_triagem
                  INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
                  INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
                  INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
                  INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
                  INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
                  WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_pessoa.Cod_Sexo=2 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}");

             $this->Resultado["F"] = $estatisticaProvaRamo->getResultado();

        }else{

          $estatisticaProvaRamo->fullRead("SELECT 

            tb_triagem.Cod_Motivo,
            COUNT(tb_patente.Cod_Classe) AS aptos,
            tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo=1 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

            $this->Resultado["aptos"] = $estatisticaProvaRamo->getResultado();



             $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS TA_Alta,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo=2 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

             $this->Resultado["TA_ALTA"] = $estatisticaProvaRamo->getResultado();
             
            $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS TA_Baixa,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo=3 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

            $this->Resultado["TA_Baixa"] = $estatisticaProvaRamo->getResultado();
             
            $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS gestante,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo=5 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

            $this->Resultado["Gestante"] = $estatisticaProvaRamo->getResultado();

            $estatisticaProvaRamo->fullRead("SELECT 

              
              COUNT(tb_patente.Cod_Classe) AS Outros,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_triagem.Cod_Motivo >3 AND tb_triagem.Cod_Motivo <>5 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

            $this->Resultado["Outros"] = $estatisticaProvaRamo->getResultado();

              $estatisticaProvaRamo->fullRead("SELECT 

              tb_pessoa.Cod_Sexo,
              COUNT(tb_patente.Cod_Classe) AS masculino,
              tb_patente.Cod_Classe AS classe

              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_pessoa.Cod_Sexo=1 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

              $this->Resultado["M"] = $estatisticaProvaRamo->getResultado();

             $estatisticaProvaRamo->fullRead("SELECT 

                  tb_pessoa.Cod_Sexo,
                  COUNT(tb_patente.Cod_Classe) AS femenino,
                  tb_patente.Cod_Classe AS classe


                  FROM tb_triagem
                  INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
                  INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
                  INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
                  INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
                  INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
                  WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Ramo=:Cod_Ramo AND tb_pessoa.Cod_Sexo=2 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Ramo={$ramo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

             $this->Resultado["F"] = $estatisticaProvaRamo->getResultado();
         

        }
           
            return $this->getResultado();


      }

      public function relatorioProva($ueo,$prova,$estado){

        $relatorioTriagem = new \App\adms\Models\helper\AdmsRead();
        
        $relatorioTriagem->fullRead("SELECT Peso,tb_triagem.Altura,Pulso,Diastolica,Sistolica,tb_motivo.Designacao,tb_triagem.NIP,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_motivo ON tb_triagem.Cod_Motivo=tb_motivo.id
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente
              INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa              
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_militar.Cod_Unidade=:Cod_Unidade AND tb_motivo.Cod_Estado=:Cod_Estado ORDER BY tb_militar.Cod_Patente,tb_pessoa.Nome ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}&Cod_Estado={$estado}");
              return $relatorioTriagem->getResultado();
      }

      public function estatisticaProvaUEO($ueo,$prova,$dataTriagem=null){

        $estatisticaProvaRamo = new \App\adms\Models\helper\AdmsRead();
        if ($dataTriagem==null) {
          
            $estatisticaProvaRamo->fullRead("SELECT 

            tb_triagem.Cod_Motivo,
            COUNT(tb_patente.Cod_Classe) AS aptos,
            tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo=1 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}");

            $this->Resultado["aptos"] = $estatisticaProvaRamo->getResultado();



             $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS TA_Alta,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo=2 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}");

             $this->Resultado["TA_ALTA"] = $estatisticaProvaRamo->getResultado();
             
            $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS TA_Baixa,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo=3 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}");

            $this->Resultado["TA_Baixa"] = $estatisticaProvaRamo->getResultado();
             
            $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS gestante,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo=5 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}");

            $this->Resultado["Gestante"] = $estatisticaProvaRamo->getResultado();

            $estatisticaProvaRamo->fullRead("SELECT 

              
              COUNT(tb_patente.Cod_Classe) AS Outros,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo >3 AND tb_triagem.Cod_Motivo <>5 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}");

            $this->Resultado["Outros"] = $estatisticaProvaRamo->getResultado();

              $estatisticaProvaRamo->fullRead("SELECT 

              tb_pessoa.Cod_Sexo,
              COUNT(tb_patente.Cod_Classe) AS masculino,
              tb_patente.Cod_Classe AS classe

              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_pessoa.Cod_Sexo=1 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}");

              $this->Resultado["M"] = $estatisticaProvaRamo->getResultado();

             $estatisticaProvaRamo->fullRead("SELECT 

                  tb_pessoa.Cod_Sexo,
                  COUNT(tb_patente.Cod_Classe) AS femenino,
                  tb_patente.Cod_Classe AS classe


                  FROM tb_triagem
                  INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
                  INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
                  INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
                  INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
                  INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
                  WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_pessoa.Cod_Sexo=2 GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}");

             $this->Resultado["F"] = $estatisticaProvaRamo->getResultado();

        }else{

          $estatisticaProvaRamo->fullRead("
            SELECT 

            tb_triagem.Cod_Motivo,
            COUNT(tb_patente.Cod_Classe) AS aptos,
            tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo=1 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

            $this->Resultado["aptos"] = $estatisticaProvaRamo->getResultado();



             $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS TA_Alta,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo=2 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

             $this->Resultado["TA_ALTA"] = $estatisticaProvaRamo->getResultado();
             
            $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS TA_Baixa,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo=3 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

            $this->Resultado["TA_Baixa"] = $estatisticaProvaRamo->getResultado();
             
            $estatisticaProvaRamo->fullRead("SELECT 

              tb_triagem.Cod_Motivo,
              COUNT(tb_patente.Cod_Classe) AS gestante,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo=5 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

            $this->Resultado["Gestante"] = $estatisticaProvaRamo->getResultado();

            $estatisticaProvaRamo->fullRead("SELECT 

              
              COUNT(tb_patente.Cod_Classe) AS Outros,
              tb_patente.Cod_Classe AS classe


              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_triagem.Cod_Motivo >3 AND tb_triagem.Cod_Motivo <>5 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

            $this->Resultado["Outros"] = $estatisticaProvaRamo->getResultado();

              $estatisticaProvaRamo->fullRead("SELECT 

              tb_pessoa.Cod_Sexo,
              COUNT(tb_patente.Cod_Classe) AS masculino,
              tb_patente.Cod_Classe AS classe

              FROM tb_triagem
              INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
              INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
              INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
              INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
              INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
             WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_pessoa.Cod_Sexo=1 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

              $this->Resultado["M"] = $estatisticaProvaRamo->getResultado();

             $estatisticaProvaRamo->fullRead("SELECT 

                  tb_pessoa.Cod_Sexo,
                  COUNT(tb_patente.Cod_Classe) AS femenino,
                  tb_patente.Cod_Classe AS classe


                  FROM tb_triagem
                  INNER JOIN tb_faserealizacaoprova ON tb_triagem.id_Fase =tb_faserealizacaoprova.id_Fase
                  INNER JOIN tb_militar ON tb_triagem.NIP = tb_militar.NIP
                  INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa = tb_pessoa.Cod_Pessoa
                  INNER JOIN tb_u_e_o ON tb_militar.Cod_Unidade = tb_u_e_o.Cod_Unidade
                  INNER JOIN tb_patente ON tb_militar.Cod_Patente = tb_patente.Cod_Patente                 
               
                  WHERE tb_faserealizacaoprova.id_Prova=:id_Prova  AND tb_u_e_o.Cod_Unidade=:Cod_Unidade AND tb_pessoa.Cod_Sexo=2 AND tb_triagem.Data_Triagem =:Data_Triagem GROUP BY tb_patente.Cod_Classe ASC", "Cod_Unidade={$ueo}&id_Prova={$prova}&Data_Triagem={$dataTriagem}");

             $this->Resultado["F"] = $estatisticaProvaRamo->getResultado();
        }
           
            return $this->getResultado();

      }

      public function historicoMedicoMilitar($nip){


            $historicoMedicoMilitar = new \App\adms\Models\helper\AdmsRead();
            $historicoMedicoMilitar->fullRead("SELECT tb_triagem.id,Observacao,Data_Triagem,Peso,Altura,Pulso,Diastolica,Sistolica,Cod_Motivo,tb_motivo.Designacao FROM tb_triagem

              INNER JOIN tb_motivo ON tb_triagem.Cod_Motivo = tb_motivo.id

              WHERE NIP=:NIP", "NIP={$nip}");
            
              return $historicoMedicoMilitar->getResultado();

      }




      public function buscarTriadosPorMotivo($fase,$motivo){

            $buscarTriadosPorMotivo = new \App\adms\Models\helper\AdmsRead();
            $buscarTriadosPorMotivo->fullRead("SELECT tb_triagem.id,Observacao,Data_Triagem,Peso,Altura,Pulso,Diastolica,Sistolica,Cod_Motivo FROM tb_triagem WHERE Cod_Motivo=:Cod_Motivo AND id_Fase=:id_Fase", "Cod_Motivo={$motivo}&id_Fase={$fase}");
            
            return $buscarTriadosPorMotivo->getResultado();

      }


    public function cadastrarTriagem(array $DadosTriagem){

      $this->Dados = $DadosTriagem;

        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_triagem', $this->Dados);
        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b>Erro:</b> Triagem não realizada"; 
          $this->Resultado = 0;           
        endif;

        else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os campos dos Dados da triagem"; 
          $this->Resultado = 0;
        endif;

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


    public function apagarTriagem($id){

      $this->idTriagem=(int) $id;
        $Apagar = new \App\adms\Models\helper\AdmsDelete();
        $Apagar->exeDelete("tb_triagem", "WHERE id=:id", "id={$this->idTriagem}");
        $this->Resultado = $Apagar->getResultado();
    }

public function alterarDadosTriagem(array $DadosTriagem){
         $this->Dados = $DadosTriagem;
         unset($this->Dados['Cod_Prova']);
        $this->ValidarDados();
        if ($this->Resultado):
           $alterarDadosProva = new \App\adms\Models\helper\AdmsUpdate;
           $alterarDadosProva->exeUpdate("tb_triagem", $this->Dados, "
         WHERE id = :id", "id={$this->Dados['id']}");

            $this->Resultado=$alterarDadosProva->getResultado();
            
            return $this->Resultado;

            
        endif;

    }

    
}
