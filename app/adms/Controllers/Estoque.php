<?php

namespace App\adms\Controllers;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

class Estoque
{

    private $Dados;
    private $PageId;

    public function listEstoque($PageId = null)
    {
        $this->PageId = (int) $PageId ? $PageId : 1;

        $botao = ['cad_Estoque' => ['menu_controller' => 'cadastrar-pagina', 'menu_metodo' => 'cad-pagina'],
            'vis_pagina' => ['menu_controller' => 'ver-pagina', 'menu_metodo' => 'ver-pagina'],
            'edit_pagina' => ['menu_controller' => 'editar-pagina', 'menu_metodo' => 'edit-pagina'],
            'del_pagina' => ['menu_controller' => 'apagar-pagina', 'menu_metodo' => 'apagar-pagina']];
        $listarBotao = new \App\adms\Models\AdmsBotao();
        $this->Dados['botao'] = $listarBotao->valBotao($botao);

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();

       $listarEstoque = new \App\adms\Models\admsEstoque();
        
        $this->Dados['listEstoque'] = $listarEstoque->ListarEstoque($this->PageId);
        $this->Dados['paginacao'] = $listarEstoque->getResultadoPg();

        $carregarView = new \Core\ConfigView("adms/Views/Estoque/listarEstoque", $this->Dados);
        $carregarView->renderizar();
    }


    public function adicionarEstoque($PageId = null)
    {
        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
      
        $cadEstoque = new \App\adms\Models\admsEstoque();

      
        if (!empty($this->Dados['btnSubmitEstoque'])){
            unset($this->Dados['btnSubmitEstoque']);
          $qtdade= $this->Dados["qtNoPac"]*$this->Dados["qtdadeDePacotes"];  
     // ====================== Script Para Registar Dados do Produto ====================

                    #ARRAY DE DADOS PARA INSERIR NA TABELA PRODUTO
            $dadosEstoque = array('id_produto'=>$this->Dados["id_produto"],'lote'=>$this->Dados["lote"],'quantidade'=>$qtdade,'preco_compra'=>$this->Dados["preco_custo"],'preco_venda'=>$this->Dados["precoVenda"],'id_fornecedor'=>$this->Dados["fornecedor"],'data_validade'=>$this->Dados["data_validade"],'data_compra'=>$this->Dados["data_compra"],'id_estado'=>$this->Dados["estado"],'quantidade_disponivel'=>$qtdade,'id_user'=> (int) $_SESSION['usuario_id'],'created_at'=>date('Y-m-d H:i:s'));
            
            $cadEstoque->cadastrarEstoque($dadosEstoque);
            if($cadEstoque->getResultado()>=1){
             $_SESSION['msgcad'] = "<div class='alert alert-success'>Estoque adicionado com sucesso!
                                    </div>";
                                    unset($this->Dados);
                    }
                    else{
                        $_SESSION['msgcad'] = "<div class='alert alert-danger'>"."Não foi possível adicionar ao estoque"."</div>";
                    }
           
            //===================================== Fim Script regista Estoque ==============================
                }  
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/estoque/cadEstoque", $this->Dados);
        $carregarView->renderizar();
                
    }

}
