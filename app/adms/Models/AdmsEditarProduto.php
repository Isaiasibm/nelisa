<?php

namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

/**
 * Description of AdmsEditarPagina: 
 * Classe para editar as informações da página no banco de dados
 * @copyright (c) year, Cesar Szpak - Celke
 */
class AdmsEditarProduto
{

    private $Resultado;
    private $Dados;
    private $DadosId;

    /**
     * <b>Obter Resultado:</b> Retorna TRUE caso tenha editado com sucesso e FALSE quando não conseguiu editar
     * @return BOOL true ou false
     */
    function getResultado()
    {
        return $this->Resultado;
    }

    /**
     * <b>Ver Página:</b> Receber o id da página para buscar informações do registro no banco de dados
     * @param int $DadosId
     */
    public function verPagina($DadosId)
    {
        $this->DadosId = (int) $DadosId;
        $verPagina = new \App\adms\Models\helper\AdmsRead();
        $verPagina->fullRead("SELECT * FROM adms_paginas
                WHERE id =:id LIMIT :limit", "id=" . $this->DadosId . "&limit=1");
        $this->Resultado = $verPagina->getResultado();
        return $this->Resultado;
    }

    /**
     * <b>Editar Página:</b> Receber array de Dados com as informações da página
     * @param ARRAY $Dados
     */
    public function altProduto(array $Dados)
    {
        $this->Dados = $Dados;
        $this->VazioIcone = $this->Dados['icone'];
        unset($this->Dados['icone']);

        $valCampoVazio = new \App\adms\Models\helper\AdmsCampoVazio;
        $valCampoVazio->validarDados($this->Dados);

        if ($valCampoVazio->getResultado()) {
            $this->updateEditProduto();
        } else {
            $this->Resultado = false;
        }
    }

    /**
     * <b>Editar Página no Banco de Dados:</b> Instanciar a classe responsável em editar no banco de dados
     * Verificar o status da ação, true ou false
     */
    private function updateEditProduto()
    {
        $this->Dados['icone'] = $this->VazioIcone;
        $this->Dados['modified'] = date("Y-m-d H:i:s");
        $upAltPagina = new \App\adms\Models\helper\AdmsUpdate();
        $upAltPagina->exeUpdate("adms_paginas", $this->Dados, "WHERE id =:id", "id=" . $this->Dados['id']);
        if ($upAltPagina->getResultado()) {
            $_SESSION['msg'] = "<div class='alert alert-success'>Página atualizada com sucesso!</div>";
            $this->Resultado = true;
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: A página não foi atualizada!</div>";
            $this->Resultado = false;
        }
    }

    /**
     * <b>Listar registros para chave estrangeira:</b> Buscar informações nas tabelas "adms_grps_pgs, adms_tps_pgs, adms_sits_pgs" para utilizar como chave estrangeira
     */
    public function listarCadastrar($id_produto)
    {
        $this->DadosId=$id_produto;
        $listar = new \App\adms\Models\helper\AdmsRead();
        $listar->fullRead("SELECT 
    p.id_produto,
    p.bar_code, 
    p.nome_produto, 
    p.preco_venda,
    COALESCE(SUM(e.quantidade_disponivel), 0) AS quantidade_estoque, -- Soma todas as quantidades disponíveis
    MIN(e.data_validade) AS data_validade, -- Pega a data de validade mais próxima
    f.nome_fabricante, 
    tp.descrição AS tipoProduto,
    p.descricao_produto
FROM tb_produtos p
LEFT JOIN tb_fabricante f ON p.id_fabricante = f.id
LEFT JOIN tb_tipo_produto tp ON p.id_tipo_produto = tp.id
LEFT JOIN tb_estoque e ON p.id_produto = e.id_produto -- Novo join com a tabela de estoque
WHERE p.id_produto=:idProd
GROUP BY p.id_produto  LIMIT :limit
","id=" . $this->DadosId . "&limit=1");

return $listar->getResultado();
    }

}
