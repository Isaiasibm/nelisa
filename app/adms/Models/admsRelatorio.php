<?php
namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
} 
/**
 * Descricao de ModelsMilitar
 *
 * @copyright (c) 2019, Jose Reis - DI
 */
class admsRelatorio {

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

    public function listarProdutos(){
        $listProdutos = new \App\adms\Models\helper\AdmsRead();
                    $listProdutos->fullRead("SELECT * FROM tb_produtos");
                    return $listProdutos->getResultado();
        }

     
 

     
  public function buscarIdPaciente($codPessoa){

            $listarPacienteUEO = new \App\adms\Models\helper\AdmsRead();
            $listarPacienteUEO->fullRead("SELECT tb_paciente.id_paciente FROM tb_paciente INNER JOIN tb_pessoa ON tb_paciente.cod_pessoa=tb_pessoa.Cod_Pessoa WHERE tb_pessoa.Cod_Pessoa=:codPessoa","codPessoa={$codPessoa}");
            return $listarPacienteUEO->getResultado();
        }

public function buscarDadosRelatorioUser($idUser,$data1){
$listarPacienteUEO = new \App\adms\Models\helper\AdmsRead();
            $listarPacienteUEO->fullRead("SELECT tb_produtos.id_produto, tb_produtos.nome_produto, COUNT(tb_item_venda.id_produto) AS quant, SUM(tb_item_venda.subtotal) AS subtotal, tb_produtos.preco_venda, tb_tipo_produto.descrição AS tipoProduto 
                                        FROM tb_item_venda INNER JOIN tb_produtos ON tb_item_venda.id_produto=tb_produtos.id_produto 
                                        INNER JOIN venda ON tb_item_venda.id_venda=venda.id_venda 
                                        INNER JOIN tb_tipo_produto ON tb_produtos.id_tipo_produto=tb_tipo_produto.id 
                                        WHERE tb_item_venda.id_usuario=:idUser AND tb_item_venda.created LIKE :data1 
                                        GROUP BY tb_produtos.id_produto;","idUser={$idUser}&data1={$data1}%");
            return $listarPacienteUEO->getResultado();
}


}
