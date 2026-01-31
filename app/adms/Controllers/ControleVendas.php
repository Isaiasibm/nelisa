<?php

namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (!defined('URL')) {
    header("Location: /");
    exit(); 
}
 
/**
 * Controller Vendas
 *
 * @copyright (c) 2025, Nelisa Farma
 */
class ControleVendas extends Controller {

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

    public function registarVenda()
    {
       
    
    
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $listProdutos = new \App\adms\Models\admsProduto();


        $this->Dados['menu'] = $listarMenu->itemMenu();
        $this->Dados['listProd'] = $listProdutos->listarProdutos();
       // var_dump($this->Dados['listProd']);

        //Há uma requisição ajax que realiza o processo via javascript
       
        $carregarView = new \Core\ConfigView("adms/Views/vendas/registarVenda", $this->Dados);
        $carregarView->renderizar();
    }

    
    public function registarVendaAntendente()
    {
       
    
    
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $listProdutos = new \App\adms\Models\admsProduto();


        $this->Dados['menu'] = $listarMenu->itemMenu();
        $this->Dados['listProd'] = $listProdutos->listarProdutos();
       // var_dump($this->Dados['listProd']);

        //Há uma requisição ajax que realiza o processo via javascript
       
        $carregarView = new \Core\ConfigView("adms/Views/vendas/registarVendaAtendente", $this->Dados);
        $carregarView->renderizar();
    }

    public function relatVendas()
    {
   
     $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $listVenda = new \App\adms\Models\admsVenda();

    
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

            $this->Dados['listVenda'] = $listVenda->listarVendasRelatGeral();
        //    var_dump($this->Dados['listVenda']);

            }

        

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();       
        $carregarView = new \Core\ConfigView("adms/Views/vendas/relatVenda", $this->Dados);
        $carregarView->renderizar();
    }




}
