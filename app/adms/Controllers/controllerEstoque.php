<?php

namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (!defined('URL')) {
    header("Location: /");
    exit(); 
}
 
/**
 * Controller VeEstoquendas
 *
 * @copyright (c) 2025, Nelisa Farma
 */
class controllerEstoque {

    private $Resultado;
    private $Dados;
    private $UserId;
    private $PageId; 
    private $ResultadoPg;


    function getResultadoPg()
    {
        return $this->ResultadoPg;
    }

   function getResultado()
    {
        return $this->Resultado;
    }



    public function listarEstoque()
    {
   
     $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $listEstoque = new \App\adms\Models\admsEstoque();

    
       if (!empty($this->Dados['btnListarVenda'])){
            unset($this->Dados['btnListarVenda']);
            
            $dataIni= date("Y/m/d", strtotime($this->Dados["dataInicial"])). " 00:00:00";
            $dataFim= date("Y/m/d", strtotime($this->Dados["dataFinal"])). " 23:59:59";

           // var_dump($dataIni. " - ".$dataFim);

         //Lista gerar por data
            if($this->Dados['tipoLista']==1 || $this->Dados['tipoLista']==2 ){
                if ($this->Dados['tipoLista']==1) {
                    $dataFim= date("Y/m/d", strtotime($this->Dados["dataInicial"])). " 23:59:59";

                } 
                $this->Dados['listVenda'] = $listVenda->listarVendasRelatGeralData($dataIni,$dataFim);
            }
        
            elseif($this->Dados['tipoLista']==3 || $this->Dados['tipoLista']==4){
                if ($this->Dados['tipoLista']==3) {
                    $dataFim= date("Y/m/d", strtotime($this->Dados["dataInicial"])). " 23:59:59";
                } 
           $usuario= explode(';', $this->Dados["usuario"]); 
            $this->Dados['listVenda'] = $listVenda->listarVendasRelatUserData($usuario[0],$dataIni,$dataFim);

           // var_dump($dataIni. " - ".$dataFim);
           // var_dump($this->Dados['listVenda']);
            }
        }
                 
            else{                  

            $this->Dados['listEstoque'] = $listEstoque->listarEstoqueGeral();
        //    var_dump($this->Dados['listVenda']);

            }

        

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();       
        $carregarView = new \Core\ConfigView("adms/Views/estoque/listarEstoque", $this->Dados);
        $carregarView->renderizar();
    }




}