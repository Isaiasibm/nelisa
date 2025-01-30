<?php

namespace App\adms\Controllers;

if (!defined('URL')) {
    header("Location: /");
    exit(); 
}// date_default_timezone_set("Luanda/Africa");
/**
 * Description of 
 *
 * @copyright (c) year,  - DI
 */
class ControleRelatorio {

    private $Resultado;
    private $Dados;
   

    function getResultadoPg()
    {
        return $this->ResultadoPg;
    }

   function getResultado()
    {
        return $this->Resultado;
    }
    function fichaIndividual($idEspecialista){
      
      include 'app/adms/Controllers/dadosfichaindividual.php';
    }

    function gerarRelatorio($imprimir = null){

      include 'app/adms/Controllers/escalaServicoImprimir.php';
    
}

   public function imprimirEscala() {
    
       $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

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

include 'app/adms/Controllers/escalaServicoImprimir.php';
//header('location:'.URLADM.'App/Adms/Views/EscalaServico/pdfEscalaServico.php?tipoServico='.$tipoServico.'&data='.$data.'&mesExt='.$mesExt.'&ano='.$ano);

endif;
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/imprimirEscala", $this->Dados);
        $carregarView->renderizar();  
    }

}
