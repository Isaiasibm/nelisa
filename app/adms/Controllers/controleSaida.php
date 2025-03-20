<?php

namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (!defined('URL')) {
    header("Location: /");
    exit(); 
}
 
/**
 * Controller saida
 *
 * @copyright (c) 2019, IBM - NELISA
 */
class controleSaida {

    private $Resultado;
    private $Dados;
    private $UserId;
    private $PageId;
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

    public function registarSaida() {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $cadSaida = new \App\adms\Models\admsSaida();
 
        if (!empty($this->Dados['btnSubmitSaida'])){
            unset($this->Dados['btnSubmitSaida']);
         
         var_dump($this->Dados);

        // ====================== Script Para Registar Dados da Saída ====================

                    #ARRAY DE DADOS PARA INSERIR NA TABELA SAÍDA
            $dadosSaida = array('id_tipo_saida'=>$this->Dados["id_tipo_saida"],
            'valor'=>$this->Dados["valor_saida"],'data_saida'=>$this->Dados["data_saida"], 
            'descricao'=>$this->Dados["descricao_saida"],
            'id_destinatario'=>$this->Dados["destinatario_saida"],
            'id_responsavel_saida'=>$this->Dados["responsavel_saida"],
            'id_autorizou'=>$this->Dados["quem_autorizou"],
            'id_user'=> (int) $_SESSION['usuario_id'],
            'created_at'=>date('Y-m-d H:i:s'));
 
   //     destinatarioOutro
  
            $cadSaida->cadastrarSaida($dadosSaida);
            if($cadSaida->getResultado()>=1){

                $_SESSION['msgcad'] = "<div class='alert alert-success'>Saída registada com sucesso!</div>";
                    unset($this->Dados);
                    }
                    else{

                        $_SESSION['msgcad'] = "<div class='alert alert-danger'>"."Não foi possível registar a saída"."</div>";
                    }
           
        //===================================== Fim Script regista Produto ==============================
                              }
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/saidas/registarSaida", $this->Dados);
        $carregarView->renderizar();        
    }

    public function listarSaida()
    {
   
     $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $listEstoque = new \App\adms\Models\admsSaida();

    
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

            $this->Dados['listSaida'] = $listEstoque->lisatarSaidas();
           // var_dump($this->Dados['listSaida']);

            }

        

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();       
        $carregarView = new \Core\ConfigView("adms/Views/saidas/listarSaida", $this->Dados);
        $carregarView->renderizar();
    }



  
    

}
