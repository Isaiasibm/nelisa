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
class controleProduto {

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

    public function registarProduto() {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
      
        $cadProduto = new \App\adms\Models\admsProduto();
     
        if (!empty($this->Dados['btnSubmitProduto'])):
            unset($this->Dados['btnSubmitProduto']);

            /*
            if (!empty($CadPessoa->verificaDocumento($this->Dados["documento"]))) {

                $_SESSION['msgcad'] = "<div class='alert alert-danger'>O número do documento que tentou registar, já existe!</div>";
              
          }else{        
          */  

        // ====================== Script Para Registar Dados do Produto ====================

                    #ARRAY DE DADOS PARA INSERIR NA TABELA PRODUTO
            $dadosProduto = array('bar_code'=>$this->Dados["bar_code"],'nome_produto'=>$this->Dados["nome_produto"], 'descricao_produto'=>$this->Dados["descricao_produto"], 
            'id_categoria'=>$this->Dados["id_categoria"],
            'id_fabricante'=>$this->Dados["id_fabricante"],
        'id_tipo_produto'=>$this->Dados["id_tipo_produto"],
        'estoque_min'=>$this->Dados["estoque_minimo"],
        'id_user'=> (int) $_SESSION['usuario_id'], 
        'created_at'=>date('Y-m-d H:i:s'));
          
            $cadProduto->cadastrarProduto($dadosProduto);

            if($cadProduto->getResultado()>=1){

                                    $_SESSION['msgcad'] = "<div class='alert alert-success'>Produto registado com sucesso!
                                    </div>";
                                    unset($this->Dados);
                    }
                    else{

                        $_SESSION['msgcad'] = "<div class='alert alert-danger'>"."Não foi possível registar o produto"."</div>";
                    }
           
        //===================================== Fim Script regista Produto ==============================
            
        endif; 
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/produtos/registarProduto", $this->Dados);
        $carregarView->renderizar();

        
    }


    public function adicionarProdutoEstoque() {


        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
      
        $cadProduto = new \App\adms\Models\admsProduto();
      
      
        if (!empty($this->Dados['btnSubmitProduto'])):
            unset($this->Dados['btnSubmitProduto']);

            /*
            if (!empty($CadPessoa->verificaDocumento($this->Dados["documento"]))) {

                $_SESSION['msgcad'] = "<div class='alert alert-danger'>O número do documento que tentou registar, já existe!</div>";
              
          }else{        
          */  

        // ====================== Script Para Registar Dados do Produto ====================

                    #ARRAY DE DADOS PARA INSERIR NA TABELA PRODUTO
            $dadosProduto = array('bar_code'=>$this->Dados["bar_code"],'nome_produto'=>$this->Dados["nome_produto"], 'descricao_produto'=>$this->Dados["descricao_produto"], 
            'id_categoria'=>$this->Dados["id_categoria"],'preco_compra'=>$this->Dados["preco_compra"],'preco_venda'=>$this->Dados["preco_venda"],
            'quantidade_estoque'=>$this->Dados["quantidade_estoque"],'id_fabricante'=>$this->Dados["id_fabricante"],'id_forncedor'=>$this->Dados["id_forncedor"],'data_fabrico'=>$this->Dados["data_fabrico"],
            'data_validade'=>$this->Dados["data_validade"],'data_compra'=>$this->Dados["data_compra"],'id_tipo_produto'=>$this->Dados["id_tipo_produto"],'quantidade_pacote'=>$this->Dados["quantPacote"],'id_user'=> (int) $_SESSION['usuario_id'],'created_at'=>date('Y-m-d H:i:s'));
            
            
            
            $cadProduto->cadastrarProduto($dadosProduto);

            if($cadProduto->getResultado()>=1){

                                    $_SESSION['msgcad'] = "<div class='alert alert-success'>Produto registado com sucesso!
                                    </div>";
                                    unset($this->Dados);
                    }
                    else{

                        $_SESSION['msgcad'] = "<div class='alert alert-danger'>"."Não foi possível registar o produto"."</div>";
                    }
           
        //===================================== Fim Script regista Produto ==============================
            
        endif; 
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/produtos/adicionarProdutoEstoque", $this->Dados);
        $carregarView->renderizar();

        
    }


    public function listarProduto($PageId = null)
    {
        $this->PageId = (int) $PageId ? $PageId : 1;

        $botao = ['cad_pagina' => ['menu_controller' => 'cadastrar-pagina', 'menu_metodo' => 'cad-pagina'],
            'vis_pagina' => ['menu_controller' => 'ver-pagina', 'menu_metodo' => 'ver-pagina'],
            'edit_pagina' => ['menu_controller' => 'editar-pagina', 'menu_metodo' => 'edit-pagina'],
            'del_pagina' => ['menu_controller' => 'apagar-pagina', 'menu_metodo' => 'apagar-pagina']];
        $listarBotao = new \App\adms\Models\AdmsBotao();
        $this->Dados['botao'] = $listarBotao->valBotao($botao);

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();

        $listarProduto = new \App\adms\Models\AdmsListarProduto();
        $this->Dados['listPagina'] = $listarProduto->listarProduto($this->PageId);
        $this->Dados['paginacao'] = $listarProduto->getResultadoPg();

        $carregarView = new \Core\ConfigView("adms/Views/produtos/listarProduto", $this->Dados);
        $carregarView->renderizar();
    }
  
    

}
