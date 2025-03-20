<?php
namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
} 
/**
 * Descricao de 
 *
 * @copyright (c) 2025, IBM*/
class admsVenda {

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



    public function cadastrarVenda(array $dadosVenda) {
        $this->Dados = $dadosVenda;
        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;
        
           //$this->Dados['data_venda'] = date('Y-m-d H:m:s');

 $this->Dados['total'] = (double)  $this->Dados['total'];



        $Create->exeCreate('venda', $this->Dados);   
           
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


    public function cadastrarItemVenda(array $dadosItemDeVenda) {
        $this->Dados = $dadosItemDeVenda;
        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_item_venda', $this->Dados);        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b>Erro:</b> Venda não registada! tente novamente"; 
          $this->Resultado = 0;           
        endif;

        else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os dados da venda"; 
          $this->Resultado = 0;
        endif;
    }

    public function cadastrarPagamentoVenda(array $pagamentoVenda) {
        $this->Dados = $pagamentoVenda;
        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_pagamento_venda', $this->Dados);        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b>Erro:</b> Venda não registada! tente novamente"; 
          $this->Resultado = 0;           
        endif;

        else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os dados da venda"; 
          $this->Resultado = 0;
        endif;
    }
    public function cadastrarDetalhesPagamento(array $detalhePagamento) {
        $this->Dados = $detalhePagamento;
        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_detalhes_pagamento', $this->Dados);        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b>Erro:</b> Venda não registada! tente novamente"; 
          $this->Resultado = 0;           
        endif;

        else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os dados da venda"; 
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

    public function listarVendasRelatGeral(){
      $listarPacienteUEO = new \App\adms\Models\helper\AdmsRead();
                  $listarPacienteUEO->fullRead("SELECT tb_produtos.id_produto, tb_produtos.nome_produto, 
                                              tb_item_venda.quantidade AS quant, 
                                              tb_item_venda.subtotal AS subtotal, tb_produtos.preco_venda, 
                                              tb_tipo_produto.descrição AS tipoProduto, adms_usuarios.nome AS nome_user 
                                              FROM tb_item_venda 
                                              INNER JOIN tb_produtos ON tb_item_venda.id_produto=tb_produtos.id_produto 
                                              INNER JOIN venda ON tb_item_venda.id_venda=venda.id_venda 
                                              LEFT JOIN tb_tipo_produto ON tb_produtos.id_tipo_produto=tb_tipo_produto.id 
                                               INNER JOIN adms_usuarios ON tb_item_venda.id_usuario=adms_usuarios.id                                                
                                              ;");
                  return $listarPacienteUEO->getResultado();
      }

        
      public function listarVendasRelatGeralData($data1,$data2){
        $listarPacienteUEO = new \App\adms\Models\helper\AdmsRead();
                    $listarPacienteUEO->fullRead("SELECT tb_produtos.id_produto, tb_produtos.nome_produto, 
                                                tb_item_venda.quantidade AS quant, 
                                                tb_item_venda.subtotal AS subtotal, tb_produtos.preco_venda, 
                                                tb_tipo_produto.descrição AS tipoProduto, adms_usuarios.nome AS nome_user 
                                                FROM tb_item_venda 
                                                INNER JOIN tb_produtos ON tb_item_venda.id_produto=tb_produtos.id_produto 
                                                INNER JOIN venda ON tb_item_venda.id_venda=venda.id_venda 
                                                LEFT JOIN tb_tipo_produto ON tb_produtos.id_tipo_produto=tb_tipo_produto.id 
                                                 INNER JOIN adms_usuarios ON tb_item_venda.id_usuario=adms_usuarios.id
                                                WHERE tb_item_venda.created BETWEEN :data1 AND :data2 
                                                ;","data1={$data1}&data2={$data2}");
                    return $listarPacienteUEO->getResultado();
        }

        
          public function listarVendasRelatUserData($idUser,$data1,$data2){
            $listarPacienteUEO = new \App\adms\Models\helper\AdmsRead();
                        $listarPacienteUEO->fullRead("SELECT tb_produtos.id_produto, tb_produtos.nome_produto, 
                                                    tb_item_venda.quantidade AS quant, 
                                                    tb_item_venda.subtotal AS subtotal, tb_produtos.preco_venda, 
                                                    tb_tipo_produto.descrição AS tipoProduto, adms_usuarios.nome AS nome_user 
                                                    FROM tb_item_venda 
                                                    INNER JOIN tb_produtos ON tb_item_venda.id_produto=tb_produtos.id_produto 
                                                    INNER JOIN venda ON tb_item_venda.id_venda=venda.id_venda 
                                                    LEFT JOIN tb_tipo_produto ON tb_produtos.id_tipo_produto=tb_tipo_produto.id 
                                                    INNER JOIN adms_usuarios ON tb_item_venda.id_usuario=adms_usuarios.id
                                                    WHERE tb_item_venda.id_usuario=:idUser AND tb_item_venda.created BETWEEN :data1 AND :data2 
                                                    ;","idUser={$idUser}&data1={$data1}&data2={$data2}");
                        return $listarPacienteUEO->getResultado();
            }



            public function decrementarEstoque($idProduto, $quantidadeVendida) {
              $estoqueRestante = $quantidadeVendida;
          
              // Buscar todas as entradas disponíveis, ordenadas pela data de validade mais próxima
              $queryEstoque = new \App\adms\Models\helper\AdmsRead();
              $queryEstoque->exeRead(
                  "tb_estoque",
                  "WHERE id_produto = :id AND quantidade_disponivel > 0 ORDER BY data_validade ASC",
                  "id={$idProduto}"
              );
              
              $entradasEstoque = $queryEstoque->getResultado();
          
              foreach ($entradasEstoque as $entrada) {
                  if ($estoqueRestante <= 0) {
                      break; // Se já descontamos tudo, saímos do loop
                  }
          
                  $idEstoque = $entrada["id"];
                  $quantidadeDisponivel = $entrada["quantidade_disponivel"];
          
                  if ($quantidadeDisponivel >= $estoqueRestante) {
                      // Atualizar apenas subtraindo o necessário
                      $novaQuantidade = $quantidadeDisponivel - $estoqueRestante;
                      $estoqueRestante = 0; // Zeramos pois já descontamos tudo
                  } else {
                      // Se a entrada não cobre tudo, esgotamos essa e passamos para a próxima
                      $novaQuantidade = 0;
                      $estoqueRestante -= $quantidadeDisponivel;
                  }
          
                  // Atualizar a quantidade disponível no banco
                  $update = new \App\adms\Models\helper\AdmsUpdate();
                  $update->exeUpdate(
                      "tb_estoque",
                      ["quantidade_disponivel" => $novaQuantidade],
                      "WHERE id = :id",
                      "id={$idEstoque}"
                  );
              }
          
              return ($estoqueRestante == 0); // Retorna verdadeiro se foi possível atualizar todo o estoque
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
