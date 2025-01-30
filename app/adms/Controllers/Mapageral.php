<?php

namespace App\adms\Controllers;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

/**
 * Description of Mapageral
 *
 * @copyright (c) year, Fábio Calixto (FAMASOFT)
 */
class Mapageral {

    //Codigo da Class
    private $Dados;

    public function mapaGeral() {


        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();


        echo "   
	          <META HTTP-EQUIV=REFRESH CONTENT = '0;URL=
	          http://localhost:88/ginfra_faa/adm/app/relatorios/MapaInfractores.php'>
	    

	   "; /*
          $CarregarView = new \Core\ConfigView("index", $this->Dados);
          $CarregarView->renderizar();
         */
    }

    public function reportNip() {
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/relatorios/fichaRelatorios", $this->Dados);
        $carregarView->renderizar();
        
        
    }

}
