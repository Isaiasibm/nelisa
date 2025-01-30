<?php

namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (!defined('URL')) {
    header("Location: /");
    exit(); 
}
 
/**
 * Controler Militar para gerir o avaliando militar
 *
 * @copyright (c) 2019, Jose Reis - DI
 */
class controleEscalaServico {

    private $Resultado;
    private $Dados;
    private $UserId;
    private $PageId;
    private $MilitarId;    
    private $LimiteResultado = 40;
    private $ResultadoPg;




    function getResultadoPg()
    {
        return $this->ResultadoPg;
    }

   function getResultado()
    {
        return $this->Resultado;
    }


   public function processarEscala() {
    
       $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
       $Processa = new \App\adms\Models\admsEscalaServico();
       $militaresSelecionadosPEscala = array();
       $dadosDoMilitaresSelecionadosPEscala = array();

       if (!empty($this->Dados['enviar'])):
            unset($this->Dados['enviar']);

        $parametroListar=$this->Dados['mes'];
            $dividir= explode('-', $parametroListar);
            $this->Dados["numMes"]=$dividir[0];
            $this->Dados["mesTexto"]=$dividir[1];
          
        $parametroListar1=$this->Dados['tipoServico'];
            $dividir= explode('-', $parametroListar1);
            $this->Dados["idTipoServ"]=$dividir[0];
            $this->Dados["tipoServ"]=$dividir[1];

            $tipoServico=$this->Dados['idTipoServ'];

            $mes=$this->Dados['numMes'];
            $ano=$this->Dados['ano'];
            $dia=1; 
              if ($mes<=9) {
              $mes='0'.$mes;
                           }           
           $anoMes=$ano.'-'.$mes;

        //Quantidade de dias do mês
            $limiteEscalaMes = cal_days_in_month(CAL_GREGORIAN, $mes, $ano);

            //Verificar se a escala já foi processada
            $quantidadeProcessados = $Processa->verificarDataEscala($anoMes,$tipoServico);
      
//Se a quantidade processada for maior que 1
            if (count($quantidadeProcessados)>=1)  {
  // A Quantidade de dias do mês será decrementada             
              $limiteEscalaMes -= count($quantidadeProcessados); 

            }
// Se ainda restar dias no mês
            if ($limiteEscalaMes>0) {
                # code...
            
            //Buscar Militares que nunca trabalharam
            $militaresNovosDisponiveis = $Processa->CarregarMilitaresNovosDisponiveis($tipoServico,$limiteEscalaMes);
//var_dump($militaresNovosDisponiveis[0]);
          //Se atingirem o limite necessario
          if(count($militaresNovosDisponiveis) == $limiteEscalaMes){

                foreach ($militaresNovosDisponiveis as $m) {
                    extract($m);
                                if ($dia<=9) {
                                $dia='0'.$dia;
                                }
                     $data=$ano.'-'.$mes.'-'.$dia;
    

                    $DadosEscala = array('nip_militar'=>$NIP,'Cod_Patente'=>$Cod_Patente,'Cod_u_e_o'=>$Cod_Unidade,'id_tipo'=>$tipoServico, 'data_servico'=>date($data), 'cod_usuario'=> (int) $_SESSION['usuario_id'],'created'=>date('Y-m-d H:i:s'));
                //var_dump($DadosEscala);
                    $Processa->processaEscala($DadosEscala);

    /*Se o militar foi escalado adiciona no array de militares escalados e incrementa o dia*/
                    if ($Processa->getResultado()>0) {

                        array_push($militaresSelecionadosPEscala, $m);

                        $dia++;
                    }
                }
                 $_SESSION['msgcad'] = "<div class='alert alert-success'>Escala processada com sucesso! </div>";
          }else if(count($militaresNovosDisponiveis) < $limiteEscalaMes){

            //Escalar militares novos se existirem e nao completarem o limite exigido
            if(count($militaresNovosDisponiveis)!=0){

               foreach ($militaresNovosDisponiveis as $m) {
                    extract($m);
                     if ($dia<=9) {
                                $dia='0'.$dia;
                                }
                     $data=$ano.'-'.$mes.'-'.$dia;

                     $DadosEscala = array('nip_militar'=>$NIP,'Cod_Patente'=>$Cod_Patente,'Cod_u_e_o'=>$Cod_Unidade,'id_tipo'=>$tipoServico, 'data_servico'=>date($data), 'cod_usuario'=> (int) $_SESSION['usuario_id'],'created'=>date('Y-m-d H:i:s'));

                    $Processa->processaEscala($DadosEscala);

    /*Se o militar foi escalado adiciona no array de militares escalados e incrementa o dia*/
                    if ($Processa->getResultado()>0) {

                        array_push($militaresSelecionadosPEscala, $m);
                        
                        $dia++;
                    } 
                    
                }

                //Criar a diferenca dos militares novos para establecer o novo limite dos militares antigos
                $limiteEscalaMes -= count($militaresNovosDisponiveis);
            }
           
            /*Buscar Militares antigos a serem escalados*/
            $militaresAntigosDisponiveis = $Processa->CarregarMilitaresAntigosDisponiveis($tipoServico,$limiteEscalaMes);

            //Escalar se existirem
            if(count($militaresAntigosDisponiveis)!=0){

                foreach ($militaresAntigosDisponiveis as $m) {

                    extract($m);
                    if ($dia<=9) {
                                $dia='0'.$dia;
                                }
                               
                     $data=$ano.'-'.$mes.'-'.$dia;

                     $DadosEscala = array('nip_militar'=>$NIP,'Cod_Patente'=>$Cod_Patente,'Cod_u_e_o'=>$Cod_Unidade,'id_tipo'=>$tipoServico, 'data_servico'=>date($data), 'cod_usuario'=> (int) $_SESSION['usuario_id'],'created'=>date('Y-m-d H:i:s'));

                    $Processa->processaEscala($DadosEscala);

                    /*Se o militar foi escalado adiciona no array de militares 
                    escalados e incrementa o dia*/
                    if ($Processa->getResultado()>0) {
                $this->Dados["dadosMilitar"]= $Processa->lisEscalaProcessadaAgora($NIP);

                        array_push($militaresSelecionadosPEscala, $m);
                        
                        $dia++;
                    }
                    
                    
                }
          }

           $_SESSION['msgcad'] = "<div class='alert alert-success'>Escala processada com sucesso! </div>";

        }

    }
    else{
        $_SESSION['msgcad'] = "<div class='alert alert-danger'>A escala que tentou processar, já existe!</div>";
    }

       endif;

        $this->Dados["MilitaresEscalados"] = $militaresSelecionadosPEscala;

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/processarEscala", $this->Dados);
        $carregarView->renderizar();
    
    }

   public function listarEscala() {
    
       $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $lista = new \App\adms\Models\admsEscalaServico();

 if (!empty($this->Dados['enviar'])):
            unset($this->Dados['enviar']);

 $parametroListar=$this->Dados['mes'];
            $dividir= explode('-', $parametroListar);
            $this->Dados["numMes"]=$dividir[0];
            $this->Dados["mesTexto"]=$dividir[1];
          
        $parametroListar1=$this->Dados['tipoServico'];
            $dividir= explode('-', $parametroListar1);
            $this->Dados["idTipoServ"]=$dividir[0];
            $this->Dados["tipoServ"]=$dividir[1];

            $tipoServico=$this->Dados['idTipoServ'];


$mes=$this->Dados['numMes'];

$ano=$this->Dados['ano'];
$anoMes=$ano.'-'.$mes;

$this->Dados['dadosEscala']=$lista->lisEscala($tipoServico,$anoMes);
 $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
//var_dump($this->Dados['dadosEscala']);
 $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarEscala", $this->Dados);
  $carregarView->renderizar();

else:
    $listarMenu = new \App\adms\Models\AdmsMenu();
    $this->Dados['menu'] = $listarMenu->itemMenu();
    $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarEscala", $this->Dados);
        $carregarView->renderizar();
    endif;
    }

    public function visualizar($DadosId = null) {
        $this->DadosId = (int) $DadosId;

       // var_dump($this->DadosId);
        if (!empty($this->DadosId)) {

  $verEscalado = new \App\adms\Models\admsEscalaServico();
     
        $this->Dados['militarEscalado'] = $verEscalado->buscarDadosMilitarEscalado($this->DadosId );

        //var_dump($this->Dados['militarEscalado']);
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu']    = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/militar/detalhesMilitar", $this->Dados);
        $carregarView->renderizar();
       //  var_dump($this->Dados['militarEscalado']);
          
        }

        else {

            $_SESSION['msg'] = "<div class='alert alert-danger'> Erro:Detalhes do militar não encontrados!!! </div>";
            $UrlDestino = URLADM . 'controleEscalaServico/listarEscala';
            header("Location: $UrlDestino");

        }
    }


public function alterData($DadosId = null) {
    
       $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $this->DadosId = (string) $DadosId;

   if (!empty($this->Dados['btnConfirmacao'])) {
            unset($this->Dados['btnConfirmacao']);

            $parametroListar=$this->DadosId;
            $dividir= explode('-', $parametroListar);
           
            $this->Dados["idEscala"]=$dividir[0];
            $this->Dados["nipEscalado"]=$dividir[1];

         //var_dump($this->Dados["nipEscalado"]." ".$this->Dados["idEscala"]);
       
            $altData = new \App\adms\Models\admsEscalaServico();
            $altData->alterarData($this->Dados);

    }
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/alterarDataEscala", $this->Dados);
            $carregarView->renderizar();
    }
     
public function verMilitarEscalado($DadosId)
    {

        $this->DadosId = (int) $DadosId;
        if (!empty($this->DadosId)) {
            $verPeca = new \App\adms\Models\admsEscalaServico();
            $this->Dados['militarEscalado'] = $verPeca->buscarDadosMilitarEscalado($this->DadosId);

            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/militar/detalhesMilitar", $this->Dados);
            $carregarView->renderizar();
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro:Dados não encontrados!</div>";
            $UrlDestino = URLADM . 'controleEscalaServico/listarEscala';
            header("Location: $UrlDestino");
        }
    } 
 
   public function imprimirEscala() {
    
       $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
      
        $Processa = new \App\adms\Models\ModelsMilitar();

 if (!empty($this->Dados['enviar'])):
            unset($this->Dados['enviar']);

$parametroListar=$this->Dados['mes'];
            $dividir= explode('-', $parametroListar);
            $this->Dados["numMes"]=$dividir[0];
            $this->Dados["mesTexto"]=$dividir[1];
          
        $parametroListar1=$this->Dados['tipoServico'];
            $dividir= explode('-', $parametroListar1);
            $this->Dados["idTipoServ"]=$dividir[0];
            $this->Dados["tipoServ"]=$dividir[1];

            $tipoServico=$this->Dados['idTipoServ'];

$tipoServico=$this->Dados['tipoServico'];

$mesExt=$this->Dados['mesTexto'];
$mes=$this->Dados['numMes'];
$ano=$this->Dados['ano'];
if ($mes<=9) {
$mes='0'.$mes;
   }
$data=$ano.'-'.$mes;
//var_dump($data);
header('location:'.URLADM.'App/Adms/Views/EscalaServico/pdfEscalaServico.php?tipoServico='.$tipoServico.'&data='.$data.'&mesExt='.$mesExt.'&ano='.$ano);

endif;
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/imprimirEscala", $this->Dados);
        $carregarView->renderizar();
    
    }
      
  public function carregarProvincias(){
    $saida=null;
   $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
    
    $listarProvincias = new \App\adms\Models\ModelsEspecialista();
    $provincias = $listarProvincias->CarregarProvincias($this->Dados['parametro']);
    foreach ($provincias as $provincia) {
        extract($provincia);
       $saida.='<option value="'.$cod_provincia.'">'.utf8_encode($designacao_provincia).'</option>';

    }

   echo $saida;
}


        public function confirmarPresenca($DadosId = null)
    {
        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $this->DadosId = (string) $DadosId;
  
       if (!empty($this->Dados['btnConfirmacao'])) {
            unset($this->Dados['btnConfirmacao']);

            $parametroListar=$this->DadosId;
            $dividir= explode('-', $parametroListar);
           
            $this->Dados["idEscala"]=$dividir[0];
            $this->Dados["nipEscalado"]=$dividir[1];

         //var_dump($this->Dados["nipEscalado"]." ".$this->Dados["idEscala"]);
       
            $confirmPres = new \App\adms\Models\admsEscalaServico();
            $confirmPres->confirmePresenca($this->Dados);

    }
       $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
           $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/confirmarEscala", $this->Dados);
            $carregarView->renderizar();
    }

   
    }
