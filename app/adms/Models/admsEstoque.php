<?php
namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
} 
/**
 * Descricao de ModelsMilitar
 *
 * @copyright (c) 2025, IBM*/
class admsEstoque {

    private $Resultado;
    
    private $Dados;
    private $msg;
    private $RowCount; 
    

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



 


 

 

    

    public function listarEstoqueGeral(){
      $listarPacienteUEO = new \App\adms\Models\helper\AdmsRead();
                  $listarPacienteUEO->fullRead("SELECT tb_produtos.id_produto,tb_produtos.nome_produto,tb_produtos.id_produto, tb_produtos.data_validade, tb_categorias_produto.id_categoria, tb_produtos.quantidade_estoque,tb_produtos.quantidade_pacote,tb_fornecedores.nome AS fornecedor,tb_fornecedores.telefone AS telefoneFornecedor, tb_tipo_produto.descrição AS tipoProduto,tb_produtos.preco_venda,tb_produtos.data_compra 
FROM tb_produtos
INNER JOIN tb_fornecedores ON tb_produtos.id_forncedor=tb_fornecedores.id_fornecedor
INNER JOIN tb_tipo_produto ON tb_produtos.id_tipo_produto=tb_tipo_produto.id
INNER JOIN tb_categorias_produto ON tb_produtos.id_categoria=tb_categorias_produto.id_categoria");
                  return $listarPacienteUEO->getResultado();
      }

        
      public function listarVendasRelatGeralData($data1,$data2){
        $listarPacienteUEO = new \App\adms\Models\helper\AdmsRead();
                    $listarPacienteUEO->fullRead("SELECT tb_produtos.id_produto, tb_produtos.nome_produto, 
                                                COUNT(tb_item_venda.id_produto) AS quant, 
                                                SUM(tb_item_venda.subtotal) AS subtotal, tb_produtos.preco_venda, 
                                                tb_tipo_produto.descrição AS tipoProduto, adms_usuarios.nome AS nome_user 
                                                FROM tb_item_venda 
                                                INNER JOIN tb_produtos ON tb_item_venda.id_produto=tb_produtos.id_produto 
                                                INNER JOIN venda ON tb_item_venda.id_venda=venda.id_venda 
                                                INNER JOIN tb_tipo_produto ON tb_produtos.id_tipo_produto=tb_tipo_produto.id 
                                                 INNER JOIN adms_usuarios ON tb_item_venda.id_usuario=adms_usuarios.id
                                                WHERE tb_item_venda.created BETWEEN :data1 AND :data2 
                                                GROUP BY tb_produtos.id_produto, adms_usuarios.nome;","data1={$data1}&data2={$data2}");
                    return $listarPacienteUEO->getResultado();
        }

        
          public function listarVendasRelatUserData($idUser,$data1,$data2){
            $listarPacienteUEO = new \App\adms\Models\helper\AdmsRead();
                        $listarPacienteUEO->fullRead("SELECT tb_produtos.id_produto, tb_produtos.nome_produto, 
                                                    COUNT(tb_item_venda.id_produto) AS quant, 
                                                    SUM(tb_item_venda.subtotal) AS subtotal, tb_produtos.preco_venda, 
                                                    tb_tipo_produto.descrição AS tipoProduto, adms_usuarios.nome AS nome_user 
                                                    FROM tb_item_venda 
                                                    INNER JOIN tb_produtos ON tb_item_venda.id_produto=tb_produtos.id_produto 
                                                    INNER JOIN venda ON tb_item_venda.id_venda=venda.id_venda 
                                                    INNER JOIN tb_tipo_produto ON tb_produtos.id_tipo_produto=tb_tipo_produto.id 
                                                    INNER JOIN adms_usuarios ON tb_item_venda.id_usuario=adms_usuarios.id
                                                    WHERE tb_item_venda.id_usuario=:idUser AND tb_item_venda.created BETWEEN :data1 AND :data2 
                                                    GROUP BY tb_produtos.id_produto;","idUser={$idUser}&data1={$data1}&data2={$data2}");
                        return $listarPacienteUEO->getResultado();
            }


         

        public function updateEstoque(array $DadosEstoque, $idProduto){
          $this->Dados = $DadosEstoque;

          $upload = new \App\adms\Models\helper\AdmsUpdate();
          $upload->exeUpdate("tb_produtos", $this->Dados, "WHERE id_produto =:id", "id=" . $idProduto);

          if ($upload->getResultado()) {
              $this->Resultado = true;
          } else {
              $this->Resultado = false;
          }
        }



}
