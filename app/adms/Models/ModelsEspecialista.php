<?php
namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
} 
/**
 * Descricao de ModelsUsuario
 *
 * @copyright (c) year, Cesar Szpak - Celke
 */
class ModelsEspecialista {

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




private function calculaTempoServico_idade($data){

                        $dataActual=explode('-', date('Y-m-d'));
                        $anoActual=$dataActual[0];
                        $mesActual=$dataActual[1];
                        $diaActual=$dataActual[2];

                        $tempo=null;

                        $data = explode('-', $data);
                        $anocmp=$data[0];
                        $mescmp=$data[1];
                        $diacmp=$data[2];

                        if ($mesActual<$mescmp) {

                            $tempo = $anoActual-$anocmp-1;
                        }elseif ($mesActual>$mescmp) {

                            $tempo = $anoActual-$anocmp;
                        }else{

                            if ($diaActual>=$diacmp) {
                                $tempo = $anoActual-$anocmp;
                            }else{
                                $tempo = $anoActual-$anocmp-1;
                            }

                        }

                        return $tempo;
                    }


   private function verificaNumeroDocumentoCivilDiferente($numerDoc,$cod_documento_civil,$cod_tipo_documento){
        $verificarNumeroDOc = new \App\adms\Models\helper\AdmsRead();
        $verificarNumeroDOc->exeRead("tb_documento_civil", "WHERE numero_documento_civil=:numero_documento_civil AND cod_documento_civil <> :cod_documento_civil AND cod_tipo_documento =:cod_tipo_documento", "numero_documento_civil={$numerDoc}&cod_documento_civil={$cod_documento_civil}&cod_tipo_documento={$cod_tipo_documento}");
        return $verificarNumeroDOc->getResultado();

    }

    public function buscarMilitaresEmTempo($u_e_o,$patente){

        $T_COR = 0;
        $MAJ = 0;
        $CAP = 0;
        $TTE = 0;
        $Sub_TTE = 0;
        $ASP = 0;

        $this->Resultado = $this->buscaMilitaresUeo($u_e_o,$patente);

       $saida = array();

        if (!empty($this->getResultado())) {
            foreach ($this->getResultado() as $militar) {
               extract($militar);

               $data=$this->buscarUltimaPromocao($cod_militar);
               $tempo = $this->calculaTempoServico_idade($data[0]['dataPromocao']);

               
               if ($abreviatura_patente == "T COR" && $tempo>=4) {
                $saida['codmilitar'][] = $militar['cod_militar'];
                $saida['Tenente-Coronel'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']).'&nbsp;<button type="button" class="btn btn-primary">
  tempo: <span class="badge badge-light">'.$tempo.' ano(s)</span>
</button>';
                   $T_COR +=1;
               }elseif($abreviatura_patente == "MAJ" && $tempo>=4) {
                $saida['codmilitar'][] = $militar['cod_militar'];
                 $saida['Major'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']).'&nbsp;<button type="button" class="btn btn-primary">
  tempo: <span class="badge badge-light">'.$tempo.' ano(s)</span>
</button>';
                    $MAJ +=1;
               }elseif ($abreviatura_patente == "CAP" && $tempo>=6) {
                $saida['codmilitar'][] = $militar['cod_militar'];
                $saida['Capitão'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']).'&nbsp;<button type="button" class="btn btn-primary">
  tempo: <span class="badge badge-light">'.$tempo.' ano(s)</span>
</button>';
                   $CAP +=1;
               }elseif ($abreviatura_patente == "TTE" && $tempo>=4) {
                $saida['codmilitar'][] = $militar['cod_militar'];
               $saida['Tenente'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']).'&nbsp;<button type="button" class="btn btn-primary">
  tempo: <span class="badge badge-light">'.$tempo.' ano(s)</span>
</button>';
                   $TTE +=1;
               }elseif ($abreviatura_patente == "Sub TTE" && $tempo>=1) {
                $saida['codmilitar'][] = $militar['cod_militar'];
                $saida['Sub-Tenente'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']).'&nbsp;<button type="button" class="btn btn-primary">
  tempo: <span class="badge badge-light">'.$tempo.' ano(s)</span>
</button>';
                   $Sub_TTE +=1;
               }elseif ($abreviatura_patente == "ASP" && $tempo>=1) {
                $saida['codmilitar'][] = $militar['cod_militar'];
                $saida['Aspirante'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']).'&nbsp;<button type="button" class="btn btn-primary">
  tempo: <span class="badge badge-light">'.$tempo.' ano(s)</span>
</button>';
                   $ASP +=1;
               }
              
            }

             if ($T_COR>=1) {

                $saida['grau'][]="Tenente-Coronel";
                $saida['qtd'][]=$T_COR;
                   
               }if($MAJ>=1){

                    $saida['grau'][]="Major";
                    $saida['qtd'][]=$MAJ;
                    
               }if ($CAP>=1) {
                    $saida['grau'][]="Capitão";
                    $saida['qtd'][]=$CAP;
                  
               }if ($TTE>=1) {
                   $saida['grau'][]="Tenente";
                    $saida['qtd'][]=$TTE;
               }if ($Sub_TTE>=1) {
                  $saida['grau'][]="Sub-Tenente";
                    $saida['qtd'][]=$Sub_TTE;
               }if ($ASP>=1) {
                    $saida['grau'][]="Aspirante";
                    $saida['qtd'][]=$ASP;                  
               }



               if (!empty($saida['grau'])) {

                 $saida['resultado'] = "<b>Busca:</b> Militares que estão em tempo";
               }else{

                  $saida['resultado'] = "<b>Busca:</b> Militares que estão em tempo<br>Não existem militares  em tempo na unidade selecionada";
                if (!empty($patente)) {
                  $saida['resultado'] = "<b>Busca:</b> Militares que estão em tempo<br>Não existem militares  em tempo na unidade e na Patente selecionada";
                }else{
                  $saida['resultado'] = "<b>Busca:</b> Militares que estão em tempo<br>Não existem militares  em tempo na unidade selecionada";

                }
                
               }

               return $saida;
        }

    }


    public function buscarMilitaresComCertaIdade($u_e_o ,$idade,$patente){



        $T_COR = 0;
        $MAJ = 0;
        $CAP = 0;
        $TTE = 0;
        $Sub_TTE = 0;
        $ASP = 0;

        $this->Resultado = $this->buscaMilitaresUeoIdade($u_e_o,$patente);

       $saida = array();

        if (!empty($this->getResultado())) {
            foreach ($this->getResultado() as $militar) {
               extract($militar);

              // var_dump($militar);

               $idadeDb = $this->calculaTempoServico_idade($militar['data_nascimento']);

               
               if ($abreviatura_patente == "T COR" && $idadeDb == $idade) {
                 $saida['Tenente-Coronel'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $T_COR +=1;
               }elseif($abreviatura_patente == "MAJ" && $idadeDb == $idade){
                  $saida['Major'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                    $MAJ +=1;
               }elseif ($abreviatura_patente == "CAP" && $idadeDb == $idade) {
                 $saida['Capitão'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $CAP +=1;
               }elseif ($abreviatura_patente == "TTE" && $idadeDb == $idade) {
                $saida['Tenente'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $TTE +=1;
               }elseif ($abreviatura_patente == "Sub TTE" && $idadeDb == $idade) {
                $saida['Sub-Tenente'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $Sub_TTE +=1;
               }elseif ($abreviatura_patente == "ASP" && $idadeDb == $idade) {
                $saida['Aspirante'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $ASP +=1;
               }
              
            }

             if ($T_COR>=1) {

                $saida['grau'][]="Tenente-Coronel";
                $saida['qtd'][]=$T_COR;
                   
               }
               if($MAJ>=1){

                    $saida['grau'][]="Major";
                    $saida['qtd'][]=$MAJ;
                    
               }
               if ($CAP>=1) {
                    $saida['grau'][]="Capitão";
                    $saida['qtd'][]=$CAP;
                  
               }
               if ($TTE>=1) {
                   $saida['grau'][]="Tenente";
                    $saida['qtd'][]=$TTE;
               }
               if ($Sub_TTE>=1) {
                  $saida['grau'][]="Sub-Tenente";
                    $saida['qtd'][]=$Sub_TTE;
               }if ($ASP>=1) {
                    $saida['grau'][]="Aspirante";
                    $saida['qtd'][]=$ASP;                  
               }

               if (!empty($saida['grau'])) {
                 $saida['resultado'] = "<b>Busca:</b> Militares com ".$idade." anos";
               }else{

                if (!empty($patente)) {
                  $saida['resultado'] = "<b>Busca:</b> Militares com ".$idade." anos <br>Não existem militares  com esta idade na unidade e na Patente selecionada";
                }else{

                  $saida['resultado'] = "<b>Busca:</b> Militares com ".$idade." anos <br>Não existem militares  com esta idade na unidade selecionada";

                }
                
               }
               return $saida;
        }

    }


    public function buscarMilitaresComCertoTempoServico($u_e_o ,$tempo,$patente){



        $T_COR = 0;
        $MAJ = 0;
        $CAP = 0;
        $TTE = 0;
        $Sub_TTE = 0;
        $ASP = 0;

        $this->Resultado = $this->buscaMilitaresUeoIdade($u_e_o,$patente);

       $saida = array();

        if (!empty($this->getResultado())) {
            foreach ($this->getResultado() as $militar) {
               extract($militar);

               $tempoDb = $this->calculaTempoServico_idade($militar['data_incorporacao']);

               
               if ($abreviatura_patente == "T COR" && $tempoDb == $tempo) {
                    $saida['Tenente-Coronel'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $T_COR +=1;
               }elseif($abreviatura_patente == "MAJ" && $tempoDb == $tempo){
                    $saida['Major'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                    $MAJ +=1;
               }elseif ($abreviatura_patente == "CAP" && $tempoDb == $tempo) {
                $saida['Capitão'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $CAP +=1;
               }elseif ($abreviatura_patente == "TTE" && $tempoDb == $tempo) {
                $saida['Tenente'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $TTE +=1;
               }elseif ($abreviatura_patente == "Sub TTE" && $tempoDb == $tempo) {
                $saida['Sub-Tenente'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $Sub_TTE +=1;
               }elseif ($abreviatura_patente == "ASP" && $tempoDb == $tempo) {
                $saida['Aspirante'][]=$militar['nip'].'-'.utf8_encode($militar['nome'].' '.$militar['apelido']);
                   $ASP +=1;
               }
              
            }

             if ($T_COR>=1) {

                $saida['grau'][]="Tenente-Coronel";
                $saida['qtd'][]=$T_COR;
                   
               }if($MAJ>=1){

                    $saida['grau'][]="Major";
                    $saida['qtd'][]=$MAJ;
                    
               }if ($CAP>=1) {
                    $saida['grau'][]="Capitão";
                    $saida['qtd'][]=$CAP;
                  
               }if ($TTE>=1) {
                   $saida['grau'][]="Tenente";
                    $saida['qtd'][]=$TTE;
               }if ($Sub_TTE>=1) {
                  $saida['grau'][]="Sub-Tenente";
                    $saida['qtd'][]=$Sub_TTE;
               }if ($ASP>=1) {
                    $saida['grau'][]="Aspirante";
                    $saida['qtd'][]=$ASP;                  
               }

               if (!empty($saida['grau'])) {
                 $saida['resultado'] = "<b>Busca:</b> Militares com ".$tempo." anos de serviço";
               }else{

                if (!empty($patente)) {
                  $saida['resultado'] = "<b>Busca:</b> Militares com ".$tempo." anos de serviço<br>Não existem militares  com este tempo de serviço na unidade e na Patente selecionada";
                }else{

                  $saida['resultado'] = "<b>Busca:</b> Militares com ".$tempo." anos <br>Não existem militares  com este tempo de serviço na unidade selecionada";

                }
                
               }
               return $saida;
        }

    }

    public function buscarMilitaresCompetencia($ueo,$patente,$grauAcademico,$certificado,$cursoMilitar){

      
           $this->Resultado = $this->buscaMilitaresUeoIdade($ueo,$patente);

      if (!empty($this->getResultado())) {
               
        $militaresCompetencia = array();

        if (!empty($grauAcademico) && !empty($certificado) && !empty($cursoMilitar)) {

          foreach ($this->getResultado() as $militar) {

               extract($militar);



              $buscarCursoPromocao = $this->buscarCursoPromocao($cod_militar,$cursoMilitar);
              $certificadoMilitar = $this->buscarCertificado($cod_militar,$certificado);

             if(!empty($buscarCursoPromocao) && !empty($certificadoMilitar) && $grauAcademico == $cod_habilitacao_literaria){
              $militaresCompetencia['militar'][] = array(
                                                    'nip' =>$nip,
                                                    'patente' => $abreviatura_patente,
                                                    'nome' => utf8_encode($nome.' '.$apelido),
                                                     'grauAcademico' => utf8_encode($designacao_habilitacao_literaria),
                                                     'certificado' => utf8_encode($certificadoMilitar[0]['designacao_certificado']),
                                                    'curso_promocao' => utf8_encode($buscarCursoPromocao[0]['designacao_curso_promocao'])
                                                   );

              
             }
          }

        }else if(!empty($grauAcademico)){

          foreach ($this->getResultado() as $militar) {

               extract($militar);
                
               if ($grauAcademico == $cod_habilitacao_literaria) {
                
                        $militaresCompetencia['militar'][] = array(
                                                    'nip' =>$nip,
                                                    'patente' => $abreviatura_patente,
                                                    'nome' => utf8_encode($nome.' '.$apelido),
                                                    'grauAcademico' => utf8_encode($designacao_habilitacao_literaria)
                                                   );
               }
               
          }

        }else if(!empty($certificado)){

          foreach ($this->getResultado() as $militar) {

               extract($militar);



              $certificadoMilitar = $this->buscarCertificado($cod_militar,$certificado);

             if(!empty($certificadoMilitar)){
              $militaresCompetencia['militar'][] = array(
                                                    'nip' =>$nip,
                                                    'patente' => $abreviatura_patente,
                                                    'nome' => utf8_encode($nome.' '.$apelido),
                                                    'certificado' => utf8_encode($certificadoMilitar[0]['designacao_certificado'])
                                                   );
              
             }
          }

        }else{

         foreach ($this->getResultado() as $militar) {

               extract($militar);



              $buscarCursoPromocao = $this->buscarCursoPromocao($cod_militar,$cursoMilitar);

             if(!empty($buscarCursoPromocao)){
              $militaresCompetencia['militar'][] = array(
                                                    'nip' =>$nip,
                                                    'patente' => $abreviatura_patente,
                                                    'nome' => utf8_encode($nome.' '.$apelido),
                                                    'curso_promocao' => utf8_encode($buscarCursoPromocao[0]['designacao_curso_promocao'])
                                                   );

              
             }
          }




        }
      
     return $militaresCompetencia;

      }
      else{

      }


    }

    //private buscarMilitarGra


        private function buscaMilitaresUeo($u_e_o,$patente){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            if (!empty($patente)) {
              
              $listarMilitarUeo->fullRead("SELECT
              tb_militar.cod_militar,abreviatura_patente,tb_militar.nip,tb_pessoa.nome,tb_pessoa.apelido
              FROM tb_militar 
              INNER JOIN tb_pessoa ON tb_militar.cod_pessoa = tb_pessoa.cod_pessoa
              INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
              WHERE tb_militar.cod_patente =:cod_patente AND cod_u_e_o = :cod_u_e_o 
              AND  cod_militar IN (SELECT cod_militar FROM tb_promocao GROUP BY cod_militar)
              ORDER BY tb_pessoa.nome ASC", "cod_u_e_o={$u_e_o}&cod_patente={$patente}");

            }else{

                $listarMilitarUeo->fullRead("SELECT
              tb_militar.cod_militar,abreviatura_patente,tb_militar.nip,tb_pessoa.nome,tb_pessoa.apelido
              FROM tb_militar 
              INNER JOIN tb_pessoa ON tb_militar.cod_pessoa = tb_pessoa.cod_pessoa
              INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
              WHERE  cod_u_e_o = :cod_u_e_o 
              AND  cod_militar IN (SELECT cod_militar FROM tb_promocao GROUP BY cod_militar)
              ORDER BY tb_militar.cod_patente ASC", "cod_u_e_o={$u_e_o}");
//tb_militar.cod_patente BETWEEN 6 AND 22 AND
            }
            
            
            return $listarMilitarUeo->getResultado();

        }

        private function buscaMilitaresUeoIdade($u_e_o,$patente){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            if (!empty($patente) && !empty($u_e_o)) {
              
            $listarMilitarUeo->fullRead("SELECT
            tb_militar.cod_militar,abreviatura_patente,tb_militar.data_incorporacao,tb_pessoa.data_nascimento,tb_militar.nip,tb_pessoa.nome,tb_pessoa.apelido,tb_habilitacao_literaria.designacao_habilitacao_literaria,tb_habilitacao_literaria.cod_habilitacao_literaria
            FROM tb_militar 
            INNER JOIN tb_pessoa ON tb_militar.cod_pessoa = tb_pessoa.cod_pessoa
            INNER JOIN tb_habilitacao_literaria ON tb_pessoa.cod_habilitacao_literaria = tb_habilitacao_literaria.cod_habilitacao_literaria
            INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
            WHERE tb_militar.cod_patente =:cod_patente  AND cod_u_e_o = :cod_u_e_o
            ORDER BY tb_pessoa.nome ASC", "cod_u_e_o={$u_e_o}&cod_patente={$patente}");
            }else if(!empty($patente)){

              $listarMilitarUeo->fullRead("SELECT
            tb_militar.cod_militar,abreviatura_patente,tb_militar.data_incorporacao,tb_pessoa.data_nascimento,tb_militar.nip,tb_pessoa.nome,tb_pessoa.apelido,tb_habilitacao_literaria.designacao_habilitacao_literaria,tb_habilitacao_literaria.cod_habilitacao_literaria
            FROM tb_militar 
            INNER JOIN tb_pessoa ON tb_militar.cod_pessoa = tb_pessoa.cod_pessoa
            INNER JOIN tb_habilitacao_literaria ON tb_pessoa.cod_habilitacao_literaria = tb_habilitacao_literaria.cod_habilitacao_literaria
            INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
            WHERE tb_militar.cod_patente =:cod_patente
            ORDER BY tb_pessoa.nome ASC", "cod_patente={$patente}");

            }else if(!empty($u_e_o)){

            $listarMilitarUeo->fullRead("SELECT
            tb_militar.cod_militar,abreviatura_patente,tb_militar.data_incorporacao,tb_pessoa.data_nascimento,tb_militar.nip,tb_pessoa.nome,tb_pessoa.apelido,tb_habilitacao_literaria.designacao_habilitacao_literaria,tb_habilitacao_literaria.cod_habilitacao_literaria
            FROM tb_militar 
            INNER JOIN tb_pessoa ON tb_militar.cod_pessoa = tb_pessoa.cod_pessoa
            INNER JOIN tb_habilitacao_literaria ON tb_pessoa.cod_habilitacao_literaria = tb_habilitacao_literaria.cod_habilitacao_literaria
            INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
            WHERE cod_u_e_o = :cod_u_e_o
            ORDER BY tb_militar.cod_patente ASC", "cod_u_e_o={$u_e_o}");

            // tb_militar.cod_patente BETWEEN 6 AND 22 AND 
            }else{

              $listarMilitarUeo->fullRead("SELECT
            tb_militar.cod_militar,abreviatura_patente,tb_militar.data_incorporacao,tb_pessoa.data_nascimento,tb_militar.nip,tb_pessoa.nome,tb_pessoa.apelido,tb_habilitacao_literaria.designacao_habilitacao_literaria,tb_habilitacao_literaria.cod_habilitacao_literaria
            FROM tb_militar 
            INNER JOIN tb_pessoa ON tb_militar.cod_pessoa = tb_pessoa.cod_pessoa
            INNER JOIN tb_habilitacao_literaria ON tb_pessoa.cod_habilitacao_literaria = tb_habilitacao_literaria.cod_habilitacao_literaria
            INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
            ORDER BY tb_militar.cod_patente ASC");

            }
            
            return $listarMilitarUeo->getResultado();

        }

        private function buscarCertificado($militar,$certificado){

          $buscarcertificado = new \App\adms\Models\helper\AdmsRead();
          $buscarcertificado->fullRead("SELECT
          tb_certificado.designacao_certificado
          FROM
          tb_historico_certificacao
          INNER JOIN tb_certificado ON tb_historico_certificacao.cod_certificado = tb_certificado.cod_certificado
          WHERE 
          tb_historico_certificacao.cod_certificado = :cod_certificado AND tb_historico_certificacao.cod_militar = :cod_militar", "cod_certificado={$certificado}&cod_militar={$militar}");
          return $buscarcertificado->getResultado();
        }

        private function buscarUltimaPromocao($codMilitar){

            $listarUltimaPromocao = new \App\adms\Models\helper\AdmsRead();
            $listarUltimaPromocao->fullRead("SELECT MAX(tb_ordem.data_ordem) AS dataPromocao
            FROM tb_promocao
            INNER JOIN tb_ordem ON tb_promocao.cod_ordem = tb_ordem.cod_ordem
            WHERE cod_militar=:cod_militar", "cod_militar={$codMilitar}");
            
            return $listarUltimaPromocao->getResultado();

        }

        private function buscarCursoPromocao($militar,$curso){

          $buscarCursoPromocao = new \App\adms\Models\helper\AdmsRead();
          $buscarCursoPromocao->fullRead("SELECT
          tb_curso_promocao.designacao_curso_promocao
          FROM
          tb_historico_curso_promocao
          INNER JOIN tb_curso_promocao ON tb_historico_curso_promocao.cod_curso_promocao = tb_curso_promocao.cod_curso_promocao
          WHERE 
          tb_historico_curso_promocao.cod_militar = :cod_militar
          AND 
          tb_historico_curso_promocao.cod_curso_promocao = :cod_curso_promocao", "cod_curso_promocao={$curso}&cod_militar={$militar}");
          return $buscarCursoPromocao->getResultado();
        }

  public function editarFoto($EspecialistaId, array $Dados) {
        $this->EspecialistaId = (int) $EspecialistaId;
        $this->Dados = $Dados;
        
       $this->validarDados();
        if ($this->Resultado):
           $Update = new \App\adms\Models\helper\AdmsUpdate();
           $Update->exeUpdate("tb_pessoa", $this->Dados, "
         WHERE cod_pessoa = :cod_pessoa", "cod_pessoa={$this->EspecialistaId}");
            $this->Resultado = $Update->getResultado();

        endif;
        

    }   




public function pesquisarEspecialistaNIP($nip){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT cod_militar,nome,apelido,nip,abreviatura_patente,abreviatura_ramo,designacao_u_e_o,designacao_cargo
                FROM tb_pessoa
                INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
                INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
                INNER JOIN tb_u_e_o ON tb_militar.cod_u_e_o=tb_u_e_o.cod_u_e_o
                INNER JOIN tb_regiao ON tb_u_e_o.cod_regiao = tb_regiao.cod_regiao 
                INNER JOIN tb_ramo ON tb_regiao.cod_ramo=tb_ramo.cod_ramo
                INNER JOIN tb_cargo ON tb_militar.cod_cargo=tb_cargo.cod_cargo 
                WHERE nip = '$nip'
                ORDER BY tb_patente.cod_patente ASC");
            
            return $listarMilitarUeo->getResultado();

        }


public function pesquisarEspecialistaUEO($u_e_o){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT cod_militar,nome,apelido,nip,abreviatura_patente,abreviatura_ramo,designacao_u_e_o,designacao_cargo
                FROM tb_pessoa
                INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
                INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
                INNER JOIN tb_u_e_o ON tb_militar.cod_u_e_o=tb_u_e_o.cod_u_e_o
                INNER JOIN tb_regiao ON tb_u_e_o.cod_regiao = tb_regiao.cod_regiao 
                INNER JOIN tb_ramo ON tb_regiao.cod_ramo=tb_ramo.cod_ramo
                INNER JOIN tb_cargo ON tb_militar.cod_cargo=tb_cargo.cod_cargo 
                WHERE tb_u_e_o.cod_u_e_o = '$u_e_o'
                ORDER BY tb_patente.cod_patente ASC");
            
            return $listarMilitarUeo->getResultado();

        }

public function pesquisarEspecialistaPATENTE($patente){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT cod_militar,nome,apelido,nip,abreviatura_patente,abreviatura_ramo,designacao_u_e_o,designacao_cargo
                FROM tb_pessoa
                INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
                INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
                INNER JOIN tb_u_e_o ON tb_militar.cod_u_e_o=tb_u_e_o.cod_u_e_o
                INNER JOIN tb_regiao ON tb_u_e_o.cod_regiao = tb_regiao.cod_regiao 
                INNER JOIN tb_ramo ON tb_regiao.cod_ramo=tb_ramo.cod_ramo
                INNER JOIN tb_cargo ON tb_militar.cod_cargo=tb_cargo.cod_cargo 
                WHERE tb_patente.cod_patente = '$patente'
                ORDER BY tb_patente.cod_patente ASC");
            
            return $listarMilitarUeo->getResultado();

        }

public function pesquisarEspecialistaUEO_PATENTE($u_e_o, $patente){

            $listarMilitarUeo = new \App\adms\Models\helper\AdmsRead();
            $listarMilitarUeo->fullRead("SELECT cod_militar,nome,apelido,nip,abreviatura_patente,abreviatura_ramo,designacao_u_e_o,designacao_cargo
                FROM tb_pessoa
                INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
                INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
                INNER JOIN tb_u_e_o ON tb_militar.cod_u_e_o=tb_u_e_o.cod_u_e_o
                INNER JOIN tb_regiao ON tb_u_e_o.cod_regiao = tb_regiao.cod_regiao 
                INNER JOIN tb_ramo ON tb_regiao.cod_ramo=tb_ramo.cod_ramo
                INNER JOIN tb_cargo ON tb_militar.cod_cargo=tb_cargo.cod_cargo 
                WHERE tb_u_e_o.cod_u_e_o = '$u_e_o' AND tb_patente.cod_patente = '$patente'
                ORDER BY tb_patente.cod_patente ASC");
            
            return $listarMilitarUeo->getResultado();

        }

    private function visualizarPromocao($EspecialistaId) {

        
        $visualizarPromocao = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarPromocao->fullRead("SELECT tb_militar.cod_militar,
        tb_patente.designacao_patente,
        tb_ordem.numero_ordem,
        tb_ordem.data_ordem,
        tb_ordem.entidade,
        tb_curso_especializacao_militar.designacao_curso_especializacao_militar,
        tb_especialidade_militar.cod_especialidade_militar,
        tb_promocao.justificacao,
        tb_promocao.cod_promocao
        FROM tb_promocao
        INNER JOIN tb_ordem ON tb_promocao.cod_ordem=tb_ordem.cod_ordem
        INNER JOIN tb_militar ON tb_promocao.cod_militar = tb_militar.cod_militar
        INNER JOIN tb_patente ON tb_promocao.cod_patente = tb_patente.cod_patente
        INNER JOIN tb_especialidade_militar ON tb_militar.cod_especialidade_militar = tb_especialidade_militar.cod_especialidade_militar
        INNER JOIN tb_curso_especializacao_militar ON tb_especialidade_militar.cod_curso_especializacao_militar = tb_curso_especializacao_militar.cod_curso_especializacao_militar WHERE tb_militar.cod_militar = :id ORDER BY tb_patente.cod_patente ASC ", "id={$EspecialistaId}  ");
       
        return  $visualizarPromocao->getResultado();
         //var_dump($visualizarPromocao->getResultado());
        
    } 


    public function visualizarNomeacao($EspecialistaId) {

        $visualizarNomeacao = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarNomeacao->fullRead("SELECT 
        tb_ordem.data_ordem,
        tb_ordem.entidade,
        tb_ordem.numero_ordem,
        tb_cargo.designacao_cargo,
        tb_u_e_o.designacao_u_e_o,
        tb_nomeacao.cod_nomeacao,
        tb_militar.cod_militar
        FROM tb_nomeacao
        INNER JOIN tb_militar ON tb_nomeacao.cod_militar = tb_militar.cod_militar
        INNER JOIN tb_ordem ON tb_nomeacao.cod_ordem=tb_ordem.cod_ordem 
        INNER JOIN tb_cargo ON tb_nomeacao.cod_cargo = tb_cargo.cod_cargo
        INNER JOIN tb_u_e_o ON tb_nomeacao.cod_u_e_o = tb_u_e_o.cod_u_e_o WHERE tb_militar.cod_militar=:id ", "id={$EspecialistaId}");
        
        return $visualizarNomeacao->getResultado();
         
    } 


    public function visualizarDeslocacao($EspecialistaId) {

        $visualizarDeslocacao = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarDeslocacao->fullRead("SELECT 
        tb_ordem.data_ordem,
        tb_ordem.entidade,
        tb_ordem.numero_ordem,
        tb_pais.designacao_pais,
        tb_provincia.designacao_provincia,
        tb_municipio.designacao_municipio,
        tb_deslocacao.cod_deslocacao,
        tb_deslocacao.missao,
        tb_deslocacao.duracao,
        tb_militar.cod_militar
        FROM tb_deslocacao
        INNER JOIN tb_militar ON tb_deslocacao.cod_militar = tb_militar.cod_militar
        INNER JOIN tb_ordem ON tb_deslocacao.cod_ordem = tb_ordem.cod_ordem
        INNER JOIN tb_municipio ON tb_deslocacao.cod_municipio = tb_municipio.cod_municipio
        INNER JOIN tb_provincia ON tb_municipio.cod_provincia = tb_provincia.cod_provincia
        INNER JOIN tb_pais ON tb_provincia.cod_pais = tb_pais.cod_pais WHERE tb_militar.cod_militar=:id ", "id={$EspecialistaId}");
        
        return $visualizarDeslocacao->getResultado();
         
    } 


    public function visualizarFormacaoMilitar($EspecialistaId) {

        
        $visualizarFormacaoMilitar = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarFormacaoMilitar->fullRead("SELECT tb_especialidade_militar.designacao_especialidade_militar,
        tb_curso_especializacao_militar.designacao_curso_especializacao_militar,
        tb_centro_ensino.designacao_centro_ensino,
        tb_historico_especializacao_militar.data_inicio,
        tb_historico_especializacao_militar.data_fim,
        tb_historico_especializacao_militar.classificacao,
        tb_militar.cod_militar
        FROM tb_historico_especializacao_militar
        INNER JOIN tb_militar ON tb_historico_especializacao_militar.cod_militar = tb_militar.cod_militar
        INNER JOIN tb_especialidade_militar ON tb_historico_especializacao_militar.cod_especialidade_militar = tb_especialidade_militar.cod_especialidade_militar
        INNER JOIN tb_curso_especializacao_militar ON tb_especialidade_militar.cod_curso_especializacao_militar = tb_curso_especializacao_militar.cod_curso_especializacao_militar
        INNER JOIN tb_centro_ensino ON tb_historico_especializacao_militar.cod_centro_ensino = tb_centro_ensino.cod_centro_ensino WHERE tb_militar.cod_militar =:id ", "id={$EspecialistaId}");
        
        return $visualizarFormacaoMilitar->getResultado();
         
    } 

     public function visualizarFormacaoAcademica($EspecialistaId) {

        
        $visualizarFormacaoAcademica = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarFormacaoAcademica->fullRead("SELECT tb_militar.cod_militar,
        tb_pessoa.cod_pessoa,
        tb_historico_academico.cod_historico_academico,
        tb_curso_academico.designacao_curso_academico,
        tb_nivel_academico.designacao_nivel_academico,
        tb_instituicao.designacao_instituicao,
        tb_instituicao.abreviatura,
        tb_historico_academico.data_fim,
        tb_historico_academico.data_inicio,
        tb_historico_academico.carga_horaria,
        tb_historico_academico.classificacao
        FROM tb_historico_academico
        INNER JOIN tb_pessoa ON tb_historico_academico.cod_pessoa = tb_pessoa.cod_pessoa
        INNER JOIN tb_curso_academico ON tb_historico_academico.cod_curso_academico = tb_curso_academico.cod_curso_academico
        INNER JOIN tb_nivel_academico ON tb_curso_academico.cod_nivel_academico = tb_nivel_academico.cod_nivel_academico
        INNER JOIN tb_instituicao ON tb_historico_academico.cod_instituicao = tb_instituicao.cod_instituicao
        INNER JOIN tb_militar ON tb_pessoa.cod_pessoa = tb_militar.cod_pessoa WHERE tb_militar.cod_militar =:id ", "id={$EspecialistaId}");
        
        return $visualizarFormacaoAcademica->getResultado();
         
    } 


    public function visualizarFormacaoProfissional($EspecialistaId) {

        
        $visualizarFormacaoProfissional = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarFormacaoProfissional->fullRead("SELECT tb_militar.cod_militar,
        tb_pessoa.cod_pessoa,
        tb_historico_curso_profissional.cod_historico_curso_profissional,
        tb_curso_profissional.designacao_curso_profissional,
        tb_instituicao.designacao_instituicao,
        tb_instituicao.abreviatura,
        tb_historico_curso_profissional.data_fim,
        tb_historico_curso_profissional.data_inicio,
        tb_historico_curso_profissional.carga_horaria,
        tb_historico_curso_profissional.classificacao
        FROM tb_historico_curso_profissional
        INNER JOIN tb_pessoa ON tb_historico_curso_profissional.cod_pessoa = tb_pessoa.cod_pessoa
        INNER JOIN tb_curso_profissional ON tb_historico_curso_profissional.cod_curso_profissional = tb_curso_profissional.cod_curso_profissional
        INNER JOIN tb_instituicao ON tb_historico_curso_profissional.cod_instituicao = tb_instituicao.cod_instituicao
        INNER JOIN tb_militar ON tb_pessoa.cod_pessoa = tb_militar.cod_pessoa WHERE tb_militar.cod_militar =:id ", "id={$EspecialistaId}");
        
        return $visualizarFormacaoProfissional->getResultado();
         
    } 

    public function visualizarLouvores($EspecialistaId) {

        $visualizarLouvores = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarLouvores->fullRead("SELECT tb_militar.cod_militar,
        tb_louvor.numero_ordem,
        tb_louvor.data,
        tb_louvor.entidade,
        tb_louvor.ocorrencia,
        tb_louvor.duracao
        FROM tb_louvor
        INNER JOIN tb_militar ON tb_louvor.cod_militar = tb_militar.cod_militar WHERE tb_militar.cod_militar =:id ", "id={$EspecialistaId}");
        
        return $visualizarLouvores->getResultado();
         
    } 

    public function visualizarPunicoes($EspecialistaId) {

     
        $visualizarPunicoes = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarPunicoes->fullRead("SELECT tb_militar.cod_militar,
        tb_ordem.numero_ordem,
        tb_ordem.data_ordem,
        tb_ordem.entidade,
        tb_punicao.ocorrencia,
        tb_punicao.duracao
        FROM tb_punicao
        INNER JOIN tb_ordem ON tb_punicao.cod_ordem = tb_ordem.cod_ordem
        INNER JOIN tb_militar ON tb_punicao.cod_militar = tb_militar.cod_militar WHERE tb_militar.cod_militar =:id ", "id={$EspecialistaId}");
                
        return $visualizarPunicoes->getResultado();
    } 

   
    public function visualizarAverbamento($EspecialistaId) {

        $this->EspecialistaId = (int) $EspecialistaId;
        $visualizarAverbamento = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarAverbamento->fullRead("SELECT tb_militar.cod_militar,
        tb_averbamento.designacao_averbamento
        FROM tb_averbamento
        INNER JOIN tb_militar ON tb_averbamento.cod_militar = tb_militar.cod_militar WHERE tb_militar.cod_militar =:id ", "id={$this->EspecialistaId}");
                        
        return $visualizarAverbamento->getResultado();
         
    } 

    public function visualizarAgregado($EspecialistaId) {

        $this->EspecialistaId = (int) $EspecialistaId;
        $visualizarAgregado = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarAgregado->fullRead("SELECT 
        tb_agregado.cod_agregado,
        tb_militar.cod_militar,
        tb_agregado.nome_agregado,
        tb_grau_parentesco.designacao_grau_parentesco,
        tb_agregado.data_nascimento,
        tb_sexo.designacao_sexo
        FROM tb_agregado
        INNER JOIN tb_militar ON tb_agregado.cod_militar = tb_militar.cod_militar
        INNER JOIN tb_grau_parentesco ON tb_agregado.cod_grau_parentesco = tb_grau_parentesco.cod_grau_parentesco
        INNER JOIN tb_sexo ON tb_agregado.cod_sexo = tb_sexo.cod_sexo WHERE tb_militar.cod_militar =:id ", "id={$this->EspecialistaId}");
        
        return $visualizarAgregado->getResultado();
         
    }   


    public function visualizarCertificacao($EspecialistaId) {

        $this->EspecialistaId = (int) $EspecialistaId;
        $visualizarCertificacao = new \App\adms\Models\helper\AdmsRead(); 

        $visualizarCertificacao->fullRead("SELECT tb_militar.cod_militar,
tb_area_certificacao.designacao_area_certificacao,
tb_certificado.designacao_certificado,
tb_nivel_certificacao.designacao_nivel_certificacao,
tb_corporacao.designacao_corporacao,
tb_instituicao.designacao_instituicao,
tb_historico_certificacao.data_inicio,
tb_historico_certificacao.data_fim,
tb_historico_certificacao.carga_horaria,
tb_historico_certificacao.classificacao
FROM tb_historico_certificacao
INNER JOIN tb_militar ON tb_historico_certificacao.cod_militar = tb_militar.cod_militar
INNER JOIN tb_certificado ON tb_historico_certificacao.cod_certificado = tb_certificado.cod_certificado
INNER JOIN tb_area_certificacao ON tb_certificado.cod_area_certificacao = tb_area_certificacao.cod_area_certificacao
INNER JOIN tb_corporacao ON tb_certificado.cod_corporacao = tb_corporacao.cod_corporacao
INNER JOIN tb_instituicao ON tb_historico_certificacao.cod_instituicao = tb_instituicao.cod_instituicao
INNER JOIN tb_nivel_certificacao ON tb_certificado.cod_nivel_certificacao = tb_nivel_certificacao.cod_nivel_certificacao WHERE tb_militar.cod_militar =:id ", "id={$this->EspecialistaId}");
        
        return $visualizarCertificacao->getResultado();
         
    }


    public function visualizar($EspecialistaId) {

        $this->EspecialistaId = (int) $EspecialistaId;
        $Visualizar = new \App\adms\Models\helper\AdmsRead();

        $Visualizar->fullRead("SELECT 
        tb_militar.cod_militar, tb_militar.nip, 
        tb_patente.designacao_patente,
        tb_pessoa.nome, tb_pessoa.apelido,
        tb_pessoa.foto,
        tb_pessoa.data_nascimento,
        tb_ramo.designacao_ramo,
        tb_u_e_o.designacao_u_e_o,
        tb_cargo.designacao_cargo, 
        tb_militar.data_incorporacao,
        tb_habilitacao_literaria.designacao_habilitacao_literaria,
        tb_especialidade_militar.designacao_especialidade_militar,
                tb_curso_especializacao_militar.designacao_curso_especializacao_militar
        FROM tb_militar
        INNER JOIN tb_pessoa on tb_militar.cod_pessoa = tb_pessoa.cod_pessoa
        INNER JOIN tb_habilitacao_literaria ON tb_pessoa.cod_habilitacao_literaria = tb_habilitacao_literaria.cod_habilitacao_literaria
        INNER JOIN tb_patente ON tb_militar.cod_patente = tb_patente.cod_patente
        INNER JOIN tb_u_e_o ON tb_militar.cod_u_e_o = tb_u_e_o.cod_u_e_o
        INNER JOIN tb_regiao ON tb_u_e_o.cod_regiao = tb_regiao.cod_regiao 
        INNER JOIN tb_ramo ON tb_regiao.cod_ramo=tb_ramo.cod_ramo
        INNER JOIN tb_especialidade_militar ON tb_especialidade_militar.cod_especialidade_militar=tb_militar.cod_especialidade_militar
                INNER JOIN tb_curso_especializacao_militar ON tb_curso_especializacao_militar.cod_curso_especializacao_militar = tb_especialidade_militar.cod_curso_especializacao_militar
        INNER JOIN tb_cargo ON tb_militar.cod_cargo = tb_cargo.cod_cargo WHERE tb_militar.cod_militar =:id ", "id={$this->EspecialistaId}");

        if (!empty($Visualizar)) {
            
               $this->Resultado[] = $Visualizar->getResultado();
               //var_dump($this->Resultado);
           }else{ $this->Resultado[] = NULL; }

        

        $Promocao = $this->visualizarPromocao($this->EspecialistaId);
          if (!empty($Promocao)) {
               $this->Resultado[] = $Promocao;
           }else{ $this->Resultado[] = NULL; }

         $Nomeacao = $this->visualizarNomeacao($this->EspecialistaId);
          if (!empty($Nomeacao)) {
            
               $this->Resultado[] = $Nomeacao;
           }else{ $this->Resultado[] = NULL; }

           $Averbamento = $this->visualizarAverbamento($this->EspecialistaId);
          if (!empty($Averbamento)) {
            
               $this->Resultado[] = $Averbamento;
           }else{ $this->Resultado[] = NULL; }

           $FormacaoMilitar = $this->visualizarFormacaoMilitar($this->EspecialistaId);
          if (!empty($FormacaoMilitar)) {
            
               $this->Resultado[] = $FormacaoMilitar;
           }else{ $this->Resultado[] = NULL; }

           $FormacaoAcademica = $this->visualizarFormacaoAcademica($this->EspecialistaId);
          if (!empty($FormacaoAcademica)) {
            
               $this->Resultado[] = $FormacaoAcademica;
           }else{ $this->Resultado[] = NULL; }

           $Louvores = $this->visualizarLouvores($this->EspecialistaId);
          if (!empty($Louvores)) {
            
               $this->Resultado[] = $Louvores;
           }else{ $this->Resultado[] = NULL; }

           $Punicoes = $this->visualizarPunicoes($this->EspecialistaId);
          if (!empty($Punicoes)) {
            
               $this->Resultado[] = $Punicoes;
           }else{ $this->Resultado[] = NULL; }

           $Agregado = $this->visualizarAgregado($this->EspecialistaId);
          if (!empty($Agregado)) {
            
               $this->Resultado[] = $Agregado;
           }else{ $this->Resultado[] = NULL; }

           $Deslocacao = $this->visualizarDeslocacao($this->EspecialistaId);
          if (!empty($Deslocacao)) {
            
               $this->Resultado[] = $Deslocacao;
           }else{ $this->Resultado[] = NULL; }

           $Certificacao = $this->visualizarCertificacao($this->EspecialistaId);
          if (!empty($Certificacao)) {
            
               $this->Resultado[] = $Certificacao;
           }else{ $this->Resultado[] = NULL; }

           $FormacaoProfissional = $this->visualizarFormacaoProfissional($this->EspecialistaId);
          if (!empty($FormacaoProfissional)) {
            
               $this->Resultado[] = $FormacaoProfissional;
           }else{ $this->Resultado[] = NULL; }

                return $this->Resultado;
    }

    public function cadastrar(array $Dados) {
        $this->Dados = $Dados;
        $this->ValidarDados();
        if ($this->Resultado):
            $this->inserir();
        endif;
    }

    function verificaNumeroDocumentoCivil($numerDoc,$tipoDoc){
        $verificarNumeroDOc = new \App\adms\Models\helper\AdmsRead();
        $verificarNumeroDOc->exeRead("tb_documento_civil", "WHERE numero_documento_civil=:numero_documento_civil AND cod_tipo_documento = :cod_tipo_documento", "numero_documento_civil={$numerDoc}&cod_tipo_documento={$tipoDoc}");
        return $verificarNumeroDOc->getResultado();

    }

    function verificaNumeroDocumentoMilitar($numerDoc){
        $verificarNumeroDOc = new \App\adms\Models\helper\AdmsRead();
        $verificarNumeroDOc->exeRead("tb_documento_militar", "WHERE numero_documento_militar=:numero_documento_militar", "numero_documento_militar={$numerDoc}");
        return $verificarNumeroDOc->getResultado();

    }
function verificaNIP($NIP){
        $verificarNIP = new \App\adms\Models\helper\AdmsRead();
        $verificarNIP->exeRead("tb_militar", "WHERE nip=:nip", "nip={$NIP}");
        return $verificarNIP->getResultado();

    }
 
    public function cadastrarPessoa(array $DadosPessoa) {
        $this->Dados = $DadosPessoa;
        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_pessoa', $this->Dados);
        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b>Erro:</b> Dados Pessoais nao registados! Tente novamente"; 
          $this->Resultado = 0;           
        endif;

        else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os campos dos Dados Pessoais"; 
          $this->Resultado = 0;
        endif;
    }
    public function cadastrarMilitar(array $DadosMilitar) {

        $this->Dados = $DadosMilitar;

        if(empty($this->verificaNIP($this->Dados['nip']))){
        
        $this->ValidarDados();

        if ($this->Resultado):
         
            $Create = new \App\adms\Models\helper\AdmsCreate;
        $Create->exeCreate('tb_militar', $this->Dados);
        if ($Create->getResultado()):
            $this->Resultado = $Create->getResultado();
        else:
          $this->Resultado = 0;
          $this->msg = "<b>Erro:</b> Militar nao registado.Preencha de forma correta os campos!";
        endif;
        endif;
        }else{

            $this->msg = "<b>Erro:</b> NIP Inserido ja Existe!";
            $this->Resultado = 0;
        }
    }


  public function apagarDocCivil($codDoc){

        $Apagar = new \App\adms\Models\helper\AdmsDelete();
        $Apagar->exeDelete("tb_documento_civil", "WHERE cod_documento_civil=:cod_documento_civil", "cod_documento_civil={$codDoc}");
        $this->Resultado = $Apagar->getResultado();
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

    public function cadastrarDocCivil($DadosDocCivil,$Doc) {

        $QtdocRegistado=0;

        //foreach ($DadosDocCivil as $documento) {
              

        $this->Dados = $DadosDocCivil;
        
        $this->ValidarDados();
        

            if(empty($this->verificaNumeroDocumentoCivil($this->Dados['numero_documento_civil'],$this->Dados['cod_tipo_documento']))){
                if ($this->Resultado):
              
                    $Create = new \App\adms\Models\helper\AdmsCreate;
                    $Create->exeCreate('tb_documento_civil', $this->Dados);
                    if ($Create->getResultado()>0):

                        $this->Resultado = $Create->getResultado();
                    else:

                        $this->msg ='<b>Erro:</b> Nao foi possivel registar o '.$Doc.' algum erro ocorreu!';
                        $this->Resultado = 0;

                    endif;
                endif;
            }else{

              $this->msg ='<b>Erro:</b> Nao foi possivel registar o '.$Doc.' ja existe!';
              $this->Resultado = 0;
            }
        // }

         

        
    }
    public function cadastrarDocMilitar($DadosDocMilitar) {

        $this->Dados = $DadosDocMilitar;
        $this->ValidarDados();
        if(empty($this->verificaNumeroDocumentoMilitar($this->Dados['numero_documento_militar']))){
        if ($this->Resultado>0):
           $Create = new \App\adms\Models\helper\AdmsCreate;
            $Create->exeCreate('tb_documento_militar', $this->Dados);
            if ($Create->getResultado()>=1):

            $this->Resultado = $Create->getResultado();
            
            else:
              $this->msg ='<b>Erro:</b>Documento militar nao registado. Algum erro ocorreu!';
              $this->Resultado = 0; 
            endif;

          else:
            $this->msg ='<b>Erro:</b>Documento militar nao registado. falha na validacao!';
            $this->Resultado = 0; 
        endif;

        }else{

            $this->msg ='<b>Erro:</b> Nao foi possivel registar o documento militar ja existe!';
            $this->Resultado = 0; 
        }
    }
    



    public function listarCadastrar() {
        $Listar = new \App\adms\Models\helper\AdmsRead();
        $Listar->ExeRead('tab_Especialistaccoes');
        $Especialistaccoes = $Listar->getResultado();
        //var_dump($NivelAcesso);

        $Listar->ExeRead('tb_patente');
        $patente = $Listar->getResultado();

        $Listar->ExeRead('tb_u_e_o');
        $Unidades = $Listar->getResultado();


        $Listar->ExeRead('tb_processo');
        $Processos = $Listar->getResultado();

        $this->Resultado = array($Especialistaccoes, $patente, $Unidades, $Processos);
        //var_dump($this->Resultado);
        return $this->Resultado;
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

    private function inserir() {
        $Create = new \App\adms\Models\helper\AdmsCreate();
        $Create->exeCreate(self::Entity, $this->Dados);
        if ($Create->getResultado()):
            $this->Resultado = $Create->getResultado();
        endif;
    }

    public function editar($EspecialistaId, array $Dados) {
        $this->EspecialistaId = (int) $EspecialistaId;
        $this->Dados = $Dados;

        $this->validarDados();
        if ($this->Resultado):
            $this->alterar();
        endif;
    }

    private function alterar() {
        $Update = new \App\adms\Models\helper\AdmsUpdate();
        $Update->ExeUpdate(self::Entity, $this->Dados, "WHERE id = :id", "id={$this->EspecialistaId }");
        if ($Update->getResultado()):
            $_SESSION['msg'] = "<div class='alert alert-success'><b>Sucesso: </b>O Dado do Especialista {$this->Dados['nome_especialista']} foi editado no sistema!</div>";
            $this->Resultado = true;
        else:
            $_SESSION['msg'] = "<div class='alert alert-danger'><b>Erro: </b> O Dado do Especialista  {$this->Dados['nome_especialista']} não foi editado no sistema!</div>";
            $this->Resultado = false;
        endif;
    }

    public function apagar($EspecialistaId) {
        $this->Dados = $this->visualizar($EspecialistaId);
        //   var_dump($this->Dados);
        if ($this->getRowCount() > 0):
            echo "O usuario existe: {$this->getRowCount()}<br>";
            $ApagarUsuario = new \App\adms\Models\helper\AdmsDelete();
            $ApagarUsuario->ExeDelete('user\s', 'WHERE id = :id', "id=$UserId");
            $this->Resultado = $ApagarUsuario->getResultado();
            $_SESSION['msg'] = "<div class='alert alert-success'>Usuário apagado com sucesso.</div>";
        else:
            $_SESSION['msg'] = "<div class='alert alert-danger'>Não foi encontrado o usuário.</div>";
        endif;
    }

    public function buscarDadosEspecialista($codMilitar){


        $this->EspecialistaId = (int) $codMilitar;
        $pegarDados = new \App\adms\Models\helper\AdmsRead();

        $pegarDados->fullRead("SELECT 
            tb_pessoa.cod_estado_civil,
tb_militar.cod_pessoa,
tb_militar.cod_militar, 
tb_militar.nip, 
tb_patente.designacao_patente,
tb_pessoa.nome, 
tb_pessoa.apelido,
tb_pessoa.nome_pai,
 tb_pessoa.nome_mae,
tb_provincia.designacao_provincia,
tb_pais.designacao_pais, tb_pais.cod_pais,
tb_estado_civil.designacao_estado_civil,
tb_municipio.designacao_municipio,
tb_pessoa.residencia,
 tb_pessoa.data_nascimento,
tb_sexo.designacao_sexo,
 tb_grupo_sanguineo.designacao_grupo_sanguineo,
tb_pessoa.altura, 
tb_habilitacao_literaria.designacao_habilitacao_literaria,
tb_nivel_academico.designacao_nivel_academico,
tb_pessoa.data_nascimento, 
tb_pessoa.telefone_principal,
tb_regiao.designacao_regiao,
tb_pessoa.telefone_alternativo, 
tb_pessoa.e_mail,
tb_pessoa.foto,
tb_cargo.designacao_cargo,  
tb_ramo.designacao_ramo,
tb_u_e_o.designacao_u_e_o,
tb_situacao_legal.designacao_situacao_legal,
tb_forma_prestacao_servico.designacao_forma_prestacao_servico,
tb_asec.designacao_asec,
tb_militar.data_recenseamento,
tb_militar.data_ingresso_forca_origem,
tb_militar.data_incorporacao,
tb_militar.data_ingresso_QP,
tb_militar.data_incorporacao,
tb_patente.cod_patente,
tb_u_e_o.cod_u_e_o,
tb_regiao.cod_regiao,
tb_ramo.cod_ramo,
tb_cargo.cod_cargo,
tb_municipio.cod_municipio,
tb_provincia.cod_provincia,
tb_grupo_sanguineo.cod_grupo_sanguineo,
tb_nivel_academico.cod_nivel_academico,
tb_habilitacao_literaria.cod_habilitacao_literaria,
tb_forma_prestacao_servico.cod_forma_prestacao_servico,
tb_asec.cod_asec,
tb_situacao_legal.cod_situacao_legal,
tb_pessoa.cod_sexo,
tb_especialidade_militar.cod_especialidade_militar,
tb_especialidade_militar.designacao_especialidade_militar,
tb_curso_especializacao_militar.designacao_curso_especializacao_militar,
tb_curso_especializacao_militar.cod_curso_especializacao_militar
FROM tb_militar
INNER JOIN tb_pessoa on tb_militar.cod_pessoa = tb_pessoa.cod_pessoa
INNER JOIN tb_sexo ON tb_pessoa.cod_sexo = tb_sexo.cod_sexo
INNER JOIN tb_estado_civil ON tb_pessoa.cod_estado_civil = tb_estado_civil.cod_estado_civil
INNER JOIN tb_patente ON tb_militar.cod_patente = tb_patente.cod_patente
INNER JOIN tb_u_e_o ON tb_militar.cod_u_e_o = tb_u_e_o.cod_u_e_o
INNER JOIN tb_regiao on tb_u_e_o.cod_regiao = tb_regiao.cod_regiao
INNER JOIN tb_ramo ON tb_regiao.cod_ramo = tb_ramo.cod_ramo
INNER JOIN tb_cargo ON tb_militar.cod_cargo = tb_cargo.cod_cargo
INNER JOIN tb_municipio ON tb_pessoa.cod_municipio = tb_municipio.cod_municipio
INNER JOIN tb_provincia ON tb_municipio.cod_provincia = tb_provincia.cod_provincia
INNER JOIN tb_pais ON tb_provincia.cod_pais = tb_pais.cod_pais
INNER JOIN tb_grupo_sanguineo ON tb_pessoa.cod_grupo_sanguineo = tb_grupo_sanguineo.cod_grupo_sanguineo

INNER JOIN tb_especialidade_militar ON tb_militar.cod_especialidade_militar=tb_especialidade_militar.cod_especialidade_militar
INNER JOIN tb_curso_especializacao_militar ON tb_especialidade_militar.cod_curso_especializacao_militar=tb_curso_especializacao_militar.cod_curso_especializacao_militar


INNER JOIN  tb_habilitacao_literaria ON tb_pessoa.cod_habilitacao_literaria = tb_habilitacao_literaria.cod_habilitacao_literaria
INNER JOIN tb_nivel_academico ON tb_habilitacao_literaria.cod_nivel_academico=tb_nivel_academico.cod_nivel_academico
INNER JOIN tb_forma_prestacao_servico ON tb_militar.cod_forma_prestacao_servico = tb_forma_prestacao_servico.cod_forma_prestacao_servico
INNER JOIN tb_asec ON tb_militar.cod_asec = tb_asec.cod_asec
INNER JOIN tb_situacao_legal ON tb_militar.cod_situacao_legal = tb_situacao_legal.cod_situacao_legal
        WHERE tb_militar.cod_militar=:id", "id={$this->EspecialistaId}");


           if (!empty($pegarDados->getResultado())) {
            
               $this->Resultado[] = $pegarDados->getResultado();
           }

            /*PEGAR DOCUMENTOS CIVIS DO MILITAR*/
           $pegarDados->fullRead("SELECT

            tb_documento_civil.numero_documento_civil,
            tb_documento_civil.cod_documento_civil,
            tb_documento_civil.data_emissao,
            tb_documento_civil.data_validade,
            tb_documento_civil.cod_provincia,   
            tb_provincia.designacao_provincia     
          FROM 

        tb_documento_civil

        INNER JOIN tb_pessoa ON tb_documento_civil.cod_pessoa = tb_pessoa.cod_pessoa
        INNER JOIN tb_militar ON tb_militar.cod_pessoa = tb_pessoa.cod_pessoa
        INNER JOIN tb_provincia ON tb_documento_civil.cod_provincia = tb_provincia.cod_provincia
        WHERE tb_militar.cod_militar=:id", "id={$this->EspecialistaId}");
           if (!empty($pegarDados->getResultado())) {
            
               $this->Resultado[] = $pegarDados->getResultado();
           }
        /*PEGAR DOCUMENTOS CIVIS DO MILITAR*/

        /*PEGAR DOCUMENTOS MILITARES DO MILITAR*/

           $pegarDados->fullRead("SELECT
            tb_documento_militar.cod_documento_militar,
            tb_documento_militar.numero_documento_militar,
            tb_documento_militar.data_emissao,
            tb_documento_militar.data_validade,
            tb_documento_militar.cod_provincia ,
            tb_provincia.designacao_provincia,
            tb_tipo_documento_militar.cod_tipo_documento,
            tb_tipo_documento_militar.designacao_tipo_documento        
          FROM 

        tb_documento_militar
        INNER JOIN tb_provincia ON tb_documento_militar.cod_provincia = tb_provincia.cod_provincia
        INNER JOIN tb_tipo_documento_militar ON tb_documento_militar.cod_tipo_documento=tb_tipo_documento_militar.cod_tipo_documento
        WHERE cod_militar=:id", "id={$this->EspecialistaId}");
           if (!empty($pegarDados->getResultado())) {
            
               $this->Resultado[] = $pegarDados->getResultado();
           }
           /*PEGAR DOCUMENTOS MILITARES DO MILITAR*/
           

        return $this->Resultado;
    }


    public function pesquisarEspecialista($PageId = null, $Dados = null) {

        $this->PageId = $PageId;
        $this->Dados = $Dados;

        $this->PageId = strip_tags($this->PageId);
        $this->PageId = trim($this->PageId);

        $this->Dados['name'] = strip_tags($this->Dados['name']);
        $this->Dados['name'] = trim($this->Dados['name']);

        if (!empty($this->Dados['name'])):
            $this->pesquisarEspecialistaComp();
        elseif (!empty($this->Dados['name'])):
            $this->pesquisarEspecialistaUnidade();

        endif;

        return $this->Resultado;
    }

            private function pesquisarEspecialistaComp() {
                $Paginacao = new \App\adms\Models\helper\ModelsPaginacao(URLADM . 'consulta-unidade/pesquisar-unidade/', 'name=' . $this->Dados['name']);
                $Paginacao->condicao($this->PageId, 1);
                $this->ResultadoPaginacao = $Paginacao->paginacaoFullRead("SELECT
        tab_infratores.nome_Especialista,
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
        tab_infratores.nome_Especialista,
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

            public function CarregarProvincias($pais)
            {
                    $vis = new \App\adms\Models\helper\AdmsRead();
                    $vis->fullRead("SELECT 
                    tb_provincia.designacao_provincia, 
                    tb_provincia.cod_provincia
                    FROM tb_provincia
                    WHERE tb_provincia.cod_pais = :pais","pais=$pais");  

                        return $vis->getResultado();
            }

            private function pesquisarEspecialistaUnidade() {
                $Paginacao = new \App\adms\Models\helper\ModelsPaginacao(URLADM . 'consulta-unidade/pesquisar-unidade/', 'name=' . $this->Dados['name']);
                $Paginacao->condicao($this->PageId, 1);
                $this->ResultadoPaginacao = $Paginacao->paginacaoFullRead("SELECT
                tab_infratores.nome_Especialista,
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
        tab_infratores.nome_Especialista,
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

/*Acrescentado Recentemente*/
    public function alterarDadosPessoa(array $DadosPessoa){
         $this->Dados = $DadosPessoa;
        $this->ValidarDados();
        if ($this->Resultado):
           $alterarDadosPessoa = new \App\adms\Models\helper\AdmsUpdate;
           $alterarDadosPessoa->exeUpdate("tb_pessoa", $this->Dados, "
         WHERE cod_pessoa = :cod_pessoa", "cod_pessoa={$this->Dados['cod_pessoa']}");

            $this->Resultado=$alterarDadosPessoa->getResultado();
            
            return $this->Resultado;

            
        endif;

    } 

    public function alterarDadosMilitar(array $DadosMilitar){

        $this->Dados = $DadosMilitar;

       $this->ValidarDados();

        if ($this->Resultado):
           $alterarDadosMilitar = new \App\adms\Models\helper\AdmsUpdate;
        $alterarDadosMilitar->exeUpdate("tb_militar", $this->Dados, "
         WHERE cod_militar = :cod_militar", "cod_militar={$this->Dados['cod_militar']}");

            $this->Resultado=$alterarDadosMilitar->getResultado();
            
            return $this->Resultado;


            
        endif;
    }
    

    public function alterarDadosDocumentoCivil(array $DadosDocumento){

        $this->Dados = $DadosDocumento;
        $this->ValidarDados();
        if ($this->Resultado):

            if (empty($this->verificaNumeroDocumentoCivilDiferente($this->Dados['numero_documento_civil'],$this->Dados['cod_documento_civil'],$this->Dados['cod_tipo_documento']))) :
           $alterarDocumentoCivil = new \App\adms\Models\helper\AdmsUpdate;
        $alterarDocumentoCivil->exeUpdate("tb_documento_civil", $this->Dados, "
         WHERE cod_documento_civil = :cod_documento_civil", "cod_documento_civil={$this->Dados['cod_documento_civil']}");

            $this->Resultado=$alterarDocumentoCivil->getResultado();
        else:
                $this->Resultado = false;
        endif;
            
            return $this->Resultado;

            
        endif;

    }

        public function alterarDadosDocumentoMilitar(array $DadosDocumento){

        $this->Dados = $DadosDocumento;
        $this->ValidarDados();
        if ($this->Resultado):
           $alterarDadosDocumentoMilitar = new \App\adms\Models\helper\AdmsUpdate;
        $alterarDadosDocumentoMilitar->exeUpdate("tb_documento_militar", $this->Dados, "
         WHERE cod_documento_militar = :cod_documento_militar", "cod_documento_militar={$this->Dados['cod_documento_militar']}");

            $this->Resultado=$alterarDadosDocumentoMilitar->getResultado();
            
            return $this->Resultado;

            
        endif;

    }
 


}
