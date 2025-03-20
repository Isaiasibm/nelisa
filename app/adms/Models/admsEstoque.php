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
    private $ResultadoPg;
    private $Dados;
    private $msg;
    private $RowCount; 
    

    const Entity = 'tb_pessoa';

    function getResultado() {
        return $this->Resultado;
    }
    function getResultadoPg()
    {
        return $this->ResultadoPg;
    }

    function getMsg() {
        return $this->msg;
    }

    function getRowCount() {
        return $this->RowCount;
    }



 


 

 

    

    public function listarEstoqueGeral(){
      $listarPacienteUEO = new \App\adms\Models\helper\AdmsRead();
                  $listarPacienteUEO->fullRead("SELECT 
    p.id_produto,
    p.bar_code,
    p.nome_produto,
    SUM(e.quantidade) AS quantidade_total, -- Soma todas as quantidades de lotes diferentes do mesmo produto
    MIN(e.data_validade) AS data_validade_mais_proxima, -- Traz a data de validade mais próxima
    GROUP_CONCAT(DISTINCT e.lote ORDER BY e.data_validade ASC SEPARATOR ', ') AS lotes, -- Lista os códigos dos lotes ordenados pela validade
    c.id_categoria,
    c.nome AS categoria,
    f.nome AS fornecedor,
    f.telefone AS telefoneFornecedor,
    tp.descrição AS tipoProduto,
    pv.preco_venda,
    e.data_compra,
    e.data_validade
FROM tb_estoque e
INNER JOIN tb_produtos p ON e.id_produto = p.id_produto 
INNER JOIN tb_fornecedores f ON e.id_fornecedor = f.id_fornecedor
INNER JOIN tb_tipo_produto tp ON p.id_tipo_produto = tp.id
INNER JOIN tb_categorias_produto c ON p.id_categoria = c.id_categoria
LEFT JOIN tb_precos_venda pv ON p.id_produto = pv.id_produto 
    AND pv.data_fim IS NULL -- Pega o preço de venda mais recente
GROUP BY p.id_produto, p.bar_code, p.nome_produto, c.id_categoria, f.nome, f.telefone, tp.descrição, pv.preco_venda, e.data_compra
ORDER BY p.nome_produto;
");
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



            
    public function cadastrarEstoque(array $dadosEstoque) {
        $this->Dados = $dadosEstoque;
        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_estoque', $this->Dados);        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b>Erro:</b> Estoque não adicionado! tente novamente"; 
          $this->Resultado = 0;           
        endif;

        else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os campos dos dados do estoque"; 
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

// Pegar o estoque ------
 /*   public function buscarDadosEstoque($idProduto){
        $listarEstoque = new \App\adms\Models\helper\AdmsRead();
                    $listarEstoque->fullRead("SELECT * FROM tb_estoque 
                                                    WHERE tb_estoque.id_produto=:idProduto AND tb_estoque.quantidade_disponivel>0 
                                                    ORDER BY tb_estoque.data_validade ASC;","idProduto={$idProduto}");
                    return $listarEstoque->getResultado();
        }
        */

       
        




         

        public function updateEstoque(array $DadosEstoque, $idProduto){
          $this->Dados = $DadosEstoque;

          $upload = new \App\adms\Models\helper\AdmsUpdate();
          $upload->exeUpdate("tb_estoque", $this->Dados, "WHERE id_produto =:id", "id=" . $idProduto);

          if ($upload->getResultado()) {
              $this->Resultado = true;
          } else {
              $this->Resultado = false;
          }
        }



}
