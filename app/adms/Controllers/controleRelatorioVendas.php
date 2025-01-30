<?php

namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (!defined('URL')) {
    header("Location: /");
    exit(); 
}
 
/**
 * Controler Relatorio Vendas
 *
 * @copyright (c) 2025, Nelisa Moisés, Lda
 */
class controleRelatorioVendas {

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

public function relatorioVenda() {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $listPac = new \App\adms\Models\admsRelatorio();

  /*  if (!empty($this->Dados['btnRelatorioVendas'])):
        unset($this->Dados['btnRelatorioVendas']);
        $tipoLista= $this->Dados["tipoRelatorioVenda"];
*/
      //  var_dump($this->Dados);

       // $usuario= explode(';', $this->Dados["userId"]);
$usuario="101";
$data="2025-01-05";

        
        //$this->Dados["dadosRelatorio"]= $listPac->listarProdutos();
       $this->Dados["dadosRelatorio"]= $listPac->buscarDadosRelatorioUser($usuario,$data);
       var_dump($this->Dados["dadosRelatorio"]);

       // var_dump($this->Dados["dadosRelatorio"]);
     //   endif;
    //$this->Dados["dadosConsulta"]=$listPac->buscarDadosConsulta();
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/relatorios/relatorio_vendas", $this->Dados);
            $carregarView->renderizar();   
}
 

}
