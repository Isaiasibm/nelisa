<?php
namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
} 
/**
 * Descricao de ModelsMilitar
 *
 * @copyright (c) 2025 IBM
 */
class admsProduto {

    private $Resultado;
    private $EspecialistaId;
    private $Dados;
    private $msg;
    private $RowCount; 
    private $ResultadoPaginacao;
    private $PageId;

    const Entity = 'tb_pessoa';

    function getResultado() {
        return $this->Resultado;
    }

    function getMsg() {
        return $this->msg;
    }

    function getRowCount() {
        return $this->RowCount;
    }



    public function cadastrarProduto(array $dadosProduto) {
        $this->Dados = $dadosProduto;
        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_produtos', $this->Dados);        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b>Erro:</b> Produtos não registados! tente novamente"; 
          $this->Resultado = 0;           
        endif;

        else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os campos dos dados do produto"; 
          $this->Resultado = 0;
        endif;
    }


    private function validarDados() {
        $this->Dados = array_map('strip_tags', $this->Dados);
        $this->Dados = array_map('trim', $this->Dados);
        if (in_array('', $this->Dados)):
            $this->Resultado = false;
        else:
    //  $this->Dados['password'] = md5($this->Dados['password']);
            $this->Resultado = true;
        endif;
    }


    public function listarProdutos(){
        $listProdutos = new \App\adms\Models\helper\AdmsRead();
                    $listProdutos->fullRead("SELECT tb_produtos.id_produto,tb_produtos.bar_code, tb_produtos.nome_produto, tb_produtos.preco_venda,tb_produtos.quantidade_estoque,
				tb_produtos.data_validade, tb_fabricante.nome_fabricante, tb_tipo_produto.descrição AS tipoProduto
				FROM tb_produtos LEFT JOIN tb_fabricante ON tb_produtos.id_fabricante=tb_fabricante.id
				LEFT JOIN tb_tipo_produto ON tb_produtos.id_tipo_produto=tb_tipo_produto.id
				WHERE tb_produtos.quantidade_estoque>0");
                    return $listProdutos->getResultado();
        }

        

     

      public function registarUsuario(array $DadosUser) {

        $this->Dados = $DadosUser;
        
        $this->ValidarDados();

        if ($this->Resultado):
         
            $Create = new \App\adms\Models\helper\AdmsCreate;
        $Create->exeCreate('adms_usuarios', $this->Dados);
        if ($Create->getResultado()):
            $this->Resultado = $Create->getResultado();
        else:
          $this->Resultado = 0;
          $this->msg = "<b>Erro:</b> Usuário não registado. Preencha de forma correta os campos!";
        endif;
        endif;
        
    }


}
