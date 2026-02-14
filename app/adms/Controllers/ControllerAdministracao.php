<?php

namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (!defined('URL')) {
    header("Location: /");
    exit(); 
}
 
/**
 * Controller Produto
 *
 * @copyright (c) 2019, IBM - NELISA
 */
class ControllerAdministracao {

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

    public function registarFabricante() {


        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
      
        $cadFabricante = new \App\adms\Models\admsAdministracao();
      
      
        if (!empty($this->Dados['btnSubmitFabricante'])):
            unset($this->Dados['btnSubmitFabricante']);

            /*
            if (!empty($CadPessoa->verificaDocumento($this->Dados["documento"]))) {

                $_SESSION['msgcad'] = "<div class='alert alert-danger'>O número do documento que tentou registar, já existe!</div>";
              
          }else{        
          */  

        // ====================== Script Para Registar Dados do Produto ====================

                    #ARRAY DE DADOS PARA INSERIR NA TABELA PRODUTO
            $dadosFabricante = array('nome_fabricante'=>$this->Dados["fabricante"],'id_user'=> (int) $_SESSION['usuario_id'],'created'=>date('Y-m-d H:i:s'));
            
            

            $cadFabricante->cadastrarFabricante($dadosFabricante);

            if($cadFabricante->getResultado()>=1){

                                    $_SESSION['msgcad'] = "<div class='alert alert-success'>Fabricante registado com sucesso!
                                    </div>";
                                    unset($this->Dados);
                    }
                    else{

                        $_SESSION['msgcad'] = "<div class='alert alert-danger'>"."Não foi possível registar o fabricante"."</div>";
                    }
           
        //===================================== Fim Script regista Produto ==============================
            
        endif; 
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/administracao/registarFabricante", $this->Dados);
        $carregarView->renderizar();

        
    }

    public function registarFornecedor() {


        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
      
        $cadFornecedor = new \App\adms\Models\admsAdministracao();
      
      
        if (!empty($this->Dados['btnSubmitFornecedor'])):
            unset($this->Dados['btnSubmitFornecedor']);

            /*
            if (!empty($CadPessoa->verificaDocumento($this->Dados["documento"]))) {

                $_SESSION['msgcad'] = "<div class='alert alert-danger'>O número do documento que tentou registar, já existe!</div>";
              
          }else{        
          */  

        // ====================== Script Para Registar Dados do Produto ====================

                    #ARRAY DE DADOS PARA INSERIR NA TABELA PRODUTO
                    $dadosFornecedor = array('nome'=>$this->Dados["nome"],'nif'=>$this->Dados["nif"],'email'=>$this->Dados["email"],'endereco'=>$this->Dados["endereco"],'telefone'=>$this->Dados["telefone"],'id_user'=> (int) $_SESSION['usuario_id'],'created_at'=>date('Y-m-d H:i:s'));
            
            

            $cadFornecedor->cadastrarFornecedor($dadosFornecedor);

            if($cadFornecedor->getResultado()>=1){

                                    $_SESSION['msgcad'] = "<div class='alert alert-success'>Fornecedor registado com sucesso!
                                    </div>";
                                    unset($this->Dados);
                    }
                    else{

                        $_SESSION['msgcad'] = "<div class='alert alert-danger'>"."Não foi possível registar o fornecedor"."</div>";
                    }
           
        //===================================== Fim Script regista Produto ==============================
            
        endif; 
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/administracao/registarFornecedor", $this->Dados);
        $carregarView->renderizar();

        
    }
    

}
