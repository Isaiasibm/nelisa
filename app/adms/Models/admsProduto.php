<?php
namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
} 
/**
 * Descricao de admsProduto
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
                    $listProdutos->fullRead("SELECT 
    p.id_produto,
    p.bar_code, 
    p.nome_produto, 
    (
        SELECT e1.preco_venda 
        FROM tb_estoque e1 
        WHERE e1.id_produto = p.id_produto 
        ORDER BY e1.created_at DESC 
        LIMIT 1
    ) AS preco_venda,
    COALESCE(SUM(e.quantidade_disponivel), 0) AS quantidade_estoque,
    MIN(e.data_validade) AS data_validade,
    f.nome_fabricante, 
    tp.descrição AS tipoProduto
FROM tb_produtos p
LEFT JOIN tb_fabricante f ON p.id_fabricante = f.id
LEFT JOIN tb_tipo_produto tp ON p.id_tipo_produto = tp.id
LEFT JOIN tb_estoque e ON p.id_produto = e.id_produto
GROUP BY 
    p.id_produto, 
    p.bar_code, 
    p.nome_produto, 
    f.nome_fabricante, 
    tp.descrição
ORDER BY p.nome_produto ASC, data_validade ASC;
;
");
                    return $listProdutos->getResultado();
        }

        public function editarProduto(array $DadosProduto, $codProduto){
            $this->Dados = $DadosProduto;

            $upload = new \App\adms\Models\helper\AdmsUpdate();
            $upload->exeUpdate("tb_produtos", $this->Dados, "WHERE id_produto =:id_produto", "id_produto=" . $codProduto);

            if ($upload->getResultado()) {
                $this->Resultado = true;
            } else {
                $this->Resultado = false;
            }
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
