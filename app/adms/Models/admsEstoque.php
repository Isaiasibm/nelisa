<?php
namespace App\adms\Models;

if (! defined('URL')) {
    header("Location: /");
    exit();
}
/**
 * Descricao de ModelsMilitar
 *
 * @copyright (c) 2025, IBM*/
class admsEstoque
{

    private $Resultado;
    private $ResultadoPg;
    private $Dados;
    private $msg;
    private $RowCount;

    const Entity = 'tb_pessoa';

    public function getResultado()
    {
        return $this->Resultado;
    }
    public function getResultadoPg()
    {
        return $this->ResultadoPg;
    }

    public function getMsg()
    {
        return $this->msg;
    }

    public function getRowCount()
    {
        return $this->RowCount;
    }

    public function listarEstoqueGeral()
    {
        return $this->listarEstoqueComFiltros([]);
    }

    public function listarEstoqueComFiltros(array $filtros = []): array
    {
        $where  = [];
        $params = [];

        if (! empty($filtros['id_fornecedor'])) {
            $where[]                 = 'e.id_fornecedor = :id_fornecedor';
            $params['id_fornecedor'] = (int) $filtros['id_fornecedor'];
        }

        if (! empty($filtros['id_user'])) {
            $where[]           = 'e.id_user = :id_user';
            $params['id_user'] = (int) $filtros['id_user'];
        }

        if (! empty($filtros['id_categoria'])) {
            $where[]                = 'p.id_categoria = :id_categoria';
            $params['id_categoria'] = (int) $filtros['id_categoria'];
        }

        if (! empty($filtros['id_tipo_produto'])) {
            $where[]                   = 'p.id_tipo_produto = :id_tipo_produto';
            $params['id_tipo_produto'] = (int) $filtros['id_tipo_produto'];
        }

        if (! empty($filtros['id_estado'])) {
            $where[]             = 'e.id_estado = :id_estado';
            $params['id_estado'] = (int) $filtros['id_estado'];
        }

        if (! empty($filtros['lote'])) {
            $where[]        = 'e.lote LIKE :lote';
            $params['lote'] = '%' . trim((string) $filtros['lote']) . '%';
        }

        if (! empty($filtros['texto_busca'])) {
            $where[]               = '(p.nome_produto LIKE :texto_busca OR p.bar_code LIKE :texto_busca)';
            $params['texto_busca'] = '%' . trim((string) $filtros['texto_busca']) . '%';
        }

        if (! empty($filtros['data_compra_ini'])) {
            $where[]                   = 'DATE(e.data_compra) >= :data_compra_ini';
            $params['data_compra_ini'] = (string) $filtros['data_compra_ini'];
        }

        if (! empty($filtros['data_compra_fim'])) {
            $where[]                   = 'DATE(e.data_compra) <= :data_compra_fim';
            $params['data_compra_fim'] = (string) $filtros['data_compra_fim'];
        }

        if (! empty($filtros['data_registo_ini'])) {
            $where[]                    = 'DATE(e.created_at) >= :data_registo_ini';
            $params['data_registo_ini'] = (string) $filtros['data_registo_ini'];
        }

        if (! empty($filtros['data_registo_fim'])) {
            $where[]                    = 'DATE(e.created_at) <= :data_registo_fim';
            $params['data_registo_fim'] = (string) $filtros['data_registo_fim'];
        }

        if (! empty($filtros['validade_ate'])) {
            $where[]                = 'DATE(e.data_validade) <= :validade_ate';
            $params['validade_ate'] = (string) $filtros['validade_ate'];
        }

        if (! empty($filtros['somente_disponivel'])) {
            $where[] = 'e.quantidade_disponivel > 0';
        }

        if (! empty($filtros['somente_vencidos'])) {
            $where[] = 'DATE(e.data_validade) < CURDATE()';
        }

        $sqlWhere = '';
        if (! empty($where)) {
            $sqlWhere = ' WHERE ' . implode(' AND ', $where);
        }

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                p.id_produto,
                p.bar_code,
                p.nome_produto,
                SUM(e.quantidade) AS quantidade_total,
                COALESCE(SUM(e.quantidade_disponivel), 0) AS quantidade_disponivel_total,
                MIN(e.data_validade) AS data_validade_mais_proxima,
                MIN(e.data_compra) AS data_compra,
                GROUP_CONCAT(DISTINCT e.lote ORDER BY e.data_validade ASC SEPARATOR ', ') AS lotes,
                c.id_categoria,
                c.nome AS categoria,
                GROUP_CONCAT(DISTINCT f.nome ORDER BY f.nome ASC SEPARATOR ', ') AS fornecedor,
                tp.descrição AS tipoProduto,
                MAX(e.preco_compra) AS preco_compra,
                MAX(e.preco_venda) AS preco_venda,
                MAX(e.created_at) AS data_registo,
                GROUP_CONCAT(DISTINCT u.nome ORDER BY u.nome ASC SEPARATOR ', ') AS registado_por
             FROM tb_estoque e
             INNER JOIN tb_produtos p ON e.id_produto = p.id_produto
             LEFT JOIN tb_fornecedores f ON e.id_fornecedor = f.id_fornecedor
             LEFT JOIN tb_tipo_produto tp ON p.id_tipo_produto = tp.id
             LEFT JOIN tb_categorias_produto c ON p.id_categoria = c.id_categoria
             LEFT JOIN adms_usuarios u ON u.id = e.id_user
             {$sqlWhere}
             GROUP BY p.id_produto, p.bar_code, p.nome_produto, c.id_categoria, c.nome, tp.id, tp.descrição
             ORDER BY data_registo DESC, p.nome_produto ASC",
            http_build_query($params)
        );

        return $read->getResultado() ?: [];
    }

    public function listarFornecedoresFiltroEstoque(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id_fornecedor, nome
             FROM tb_fornecedores
             ORDER BY nome ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function listarUsuariosFiltroEstoque(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT DISTINCT u.id, u.nome
             FROM tb_estoque e
             INNER JOIN adms_usuarios u ON u.id = e.id_user
             ORDER BY u.nome ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function listarCategoriasFiltroEstoque(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id_categoria, nome
             FROM tb_categorias_produto
             ORDER BY nome ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function listarTiposFiltroEstoque(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id, descrição
             FROM tb_tipo_produto
             ORDER BY descrição ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function listarEstadosFiltroEstoque(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id, designacao_estado_estoque
             FROM tb_estado_estoque
             ORDER BY designacao_estado_estoque ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function buscarResumoProdutoEstoque(int $idProduto): ?array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                p.id_produto,
                p.bar_code,
                p.nome_produto,
                p.descricao_produto,
                c.nome AS categoria,
                tp.descrição AS tipoProduto,
                MAX(e.preco_venda) AS preco_venda,
                COALESCE(SUM(e.quantidade), 0) AS quantidade_total,
                COALESCE(SUM(e.quantidade_disponivel), 0) AS quantidade_disponivel_total,
                MIN(e.data_validade) AS data_validade_mais_proxima,
                MIN(e.data_compra) AS primeira_data_compra,
                MAX(e.created_at) AS ultima_entrada,
                GROUP_CONCAT(DISTINCT e.lote ORDER BY e.data_validade ASC SEPARATOR ', ') AS lotes,
                GROUP_CONCAT(DISTINCT f.nome ORDER BY f.nome ASC SEPARATOR ', ') AS fornecedores
             FROM tb_produtos p
             LEFT JOIN tb_estoque e ON e.id_produto = p.id_produto
             LEFT JOIN tb_categorias_produto c ON c.id_categoria = p.id_categoria
             LEFT JOIN tb_tipo_produto tp ON tp.id = p.id_tipo_produto
             LEFT JOIN tb_fornecedores f ON f.id_fornecedor = e.id_fornecedor
             WHERE p.id_produto = :id
             GROUP BY p.id_produto, p.bar_code, p.nome_produto, p.descricao_produto, c.nome, tp.descrição
             LIMIT 1",
            "id={$idProduto}"
        );

        $res = $read->getResultado();
        return ! empty($res) ? $res[0] : null;
    }

    public function listarEntradasProduto(int $idProduto): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                e.id,
                e.id_produto,
                e.lote,
                e.id_fornecedor,
                e.id_fabricante,
                e.quantidade,
                e.quantidade_disponivel,
                e.preco_compra,
                e.preco_venda,
                e.data_compra,
                e.data_validade,
                e.id_estado,
                e.created_at AS data_registo,
                e.updated_at,
                f.nome AS fornecedor,
                fab.nome_fabricante AS fabricante,
                es.designacao_estado_estoque AS estado_estoque,
                u.nome AS registado_por
             FROM tb_estoque e
             LEFT JOIN tb_fornecedores f ON f.id_fornecedor = e.id_fornecedor
             LEFT JOIN tb_fabricante fab ON fab.id = e.id_fabricante
             LEFT JOIN tb_estado_estoque es ON es.id = e.id_estado
             LEFT JOIN adms_usuarios u ON u.id = e.id_user
             WHERE e.id_produto = :id
             ORDER BY data_registo DESC, e.id DESC",
            "id={$idProduto}"
        );

        return $read->getResultado() ?: [];
    }

    public function buscarEntradaEstoquePorId(int $idEntrada): ?array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                e.*,
                p.bar_code,
                p.nome_produto,
                p.descricao_produto,
                f.nome AS fornecedor,
                fab.nome_fabricante AS fabricante,
                es.designacao_estado_estoque AS estado_estoque,
                u.nome AS registado_por
             FROM tb_estoque e
             INNER JOIN tb_produtos p ON p.id_produto = e.id_produto
             LEFT JOIN tb_fornecedores f ON f.id_fornecedor = e.id_fornecedor
             LEFT JOIN tb_fabricante fab ON fab.id = e.id_fabricante
             LEFT JOIN tb_estado_estoque es ON es.id = e.id_estado
             LEFT JOIN adms_usuarios u ON u.id = e.id_user
             WHERE e.id = :id
             LIMIT 1",
            "id={$idEntrada}"
        );

        $res = $read->getResultado();
        return ! empty($res) ? $res[0] : null;
    }

    public function editarEntradaEstoque(int $idEntrada, array $dadosEstoque): void
    {
        $this->Dados = $dadosEstoque;

        foreach ($this->Dados as $chave => $valor) {
            if (is_string($valor)) {
                $this->Dados[$chave] = trim(strip_tags($valor));
            }
        }

        $camposObrigatorios = [
            'id_produto',
            'id_fornecedor',
            'lote',
            'quantidade',
            'quantidade_disponivel',
            'preco_compra',
            'preco_venda',
            'data_compra',
            'id_estado',
            'id_user',
        ];

        foreach ($camposObrigatorios as $campo) {
            if (! isset($this->Dados[$campo]) || $this->Dados[$campo] === '' || $this->Dados[$campo] === null) {
                $this->msg       = "<b>Erro:</b> Preencha de forma correta os campos obrigatórios da entrada do estoque";
                $this->Resultado = 0;
                return;
            }
        }

        if ((int) $this->Dados['quantidade'] < 0 || (int) $this->Dados['quantidade_disponivel'] < 0) {
            $this->msg       = "<b>Erro:</b> Quantidades inválidas para a entrada de estoque";
            $this->Resultado = 0;
            return;
        }

        if ((int) $this->Dados['id_fornecedor'] < 1 || (int) $this->Dados['id_estado'] < 1 || (int) $this->Dados['id_produto'] < 1) {
            $this->msg       = "<b>Erro:</b> Selecione fornecedor, estado e produto válidos";
            $this->Resultado = 0;
            return;
        }

        if ($this->Dados['id_fabricante'] === '' || $this->Dados['id_fabricante'] === 0 || $this->Dados['id_fabricante'] === '0') {
            $this->Dados['id_fabricante'] = null;
        }

        if (! isset($this->Dados['data_validade']) || $this->Dados['data_validade'] === '') {
            $this->Dados['data_validade'] = null;
        }

        $this->Dados['updated_at'] = date('Y-m-d H:i:s');

        $update = new \App\adms\Models\helper\AdmsUpdate();
        $update->exeUpdate('tb_estoque', $this->Dados, 'WHERE id = :id', "id={$idEntrada}");

        if ($update->getResultado()) {
            $this->Resultado = $idEntrada;
        } else {
            $this->msg       = "<b>Erro:</b> Não foi possível atualizar a entrada de estoque";
            $this->Resultado = 0;
        }
    }

    public function listarVendasRelatGeralData($data1, $data2)
    {
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
                                                GROUP BY tb_produtos.id_produto, adms_usuarios.nome;", "data1={$data1}&data2={$data2}");
        return $listarPacienteUEO->getResultado();
    }

    public function listarVendasRelatUserData($idUser, $data1, $data2)
    {
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
                                                    GROUP BY tb_produtos.id_produto;", "idUser={$idUser}&data1={$data1}&data2={$data2}");
        return $listarPacienteUEO->getResultado();
    }

    public function cadastrarEstoque(array $dadosEstoque)
    {
        $this->Dados = $dadosEstoque;
        $this->ValidarDados();
        if ($this->Resultado):
            $Create = new \App\adms\Models\helper\AdmsCreate;

            $Create->exeCreate('tb_estoque', $this->Dados);
            if ($Create->getResultado() >= 1):

                $this->Resultado = $Create->getResultado();
            else:
                $this->msg       = "<b>Erro:</b> Estoque não adicionado! tente novamente";
                $this->Resultado = 0;
            endif;

        else:
            $this->msg       = "<b>Erro:</b> Preencha de forma correta os campos dos dados do estoque";
            $this->Resultado = 0;
        endif;
    }

    private function validarDados()
    {
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

    public function updateEstoque(array $DadosEstoque, $idProduto)
    {
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
