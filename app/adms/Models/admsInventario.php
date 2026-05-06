<?php
namespace App\adms\Models;

if (! defined('URL')) {
    header("Location: /");
    exit();
}

class admsInventario
{
    private $Resultado;
    private $msg;

    public function getResultado()
    {
        return $this->Resultado;
    }

    public function getMsg()
    {
        return $this->msg;
    }

    public function listarTiposInventario(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id, designacao
             FROM tb_inventario_tipo
             ORDER BY designacao ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function listarEstadosInventario(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id, designacao
             FROM tb_inventario_estado
             ORDER BY id ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function gerarCodigoInventario(): string
    {
        return 'INV-' . date('YmdHis');
    }

    public function listarInventariosEmAndamento(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT ic.id,
                    ic.codigo,
                    ic.descricao,
                    ic.data_inicio,
                    ie.designacao AS estado,
                    it.designacao AS tipo
             FROM tb_inventario_cabecalho ic
             INNER JOIN tb_inventario_estado ie ON ie.id = ic.id_estado
             INNER JOIN tb_inventario_tipo it ON it.id = ic.id_tipo
             WHERE ic.id_estado IN (1, 2)
             ORDER BY ic.id DESC"
        );

        return $read->getResultado() ?: [];
    }

    public function buscarInventario(int $idInventario): ?array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT ic.*, ie.designacao AS estado, it.designacao AS tipo
             FROM tb_inventario_cabecalho ic
             INNER JOIN tb_inventario_estado ie ON ie.id = ic.id_estado
             INNER JOIN tb_inventario_tipo it ON it.id = ic.id_tipo
             WHERE ic.id = :id
             LIMIT 1",
            "id={$idInventario}"
        );

        $resultado = $read->getResultado() ?: [];
        return ! empty($resultado) ? $resultado[0] : null;
    }

    public function listarItensInventario(int $idInventario): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT ii.id,
                    ii.id_inventario,
                    ii.id_produto,
                    ii.quantidade_sistema_abertura,
                    ii.quantidade_sistema_contagem,
                    ii.quantidade_fisica,
                    ii.diferenca,
                    ii.preco_compra_referencia,
                    ii.preco_venda_referencia,
                    ii.valor_diferenca_compra,
                    ii.valor_diferenca_venda,
                    ii.observacao,
                    iie.designacao AS estado_item,
                    p.bar_code,
                    p.nome_produto,
                    f.nome_fabricante,
                    tp.descrição AS tipo_produto
             FROM tb_inventario_item ii
             INNER JOIN tb_produtos p ON p.id_produto = ii.id_produto
             LEFT JOIN tb_fabricante f ON f.id = p.id_fabricante
             LEFT JOIN tb_tipo_produto tp ON tp.id = p.id_tipo_produto
             INNER JOIN tb_inventario_item_estado iie ON iie.id = ii.id_estado
             WHERE ii.id_inventario = :id_inventario
             ORDER BY p.nome_produto ASC",
            "id_inventario={$idInventario}"
        );

        return $read->getResultado() ?: [];
    }

    public function cadastrarInventario(array $dadosForm): bool
    {
        $this->Resultado = false;
        $this->msg = '';

        $codigo = trim((string) ($dadosForm['codigo'] ?? ''));
        if ($codigo === '') {
            $codigo = $this->gerarCodigoInventario();
        }

        $descricao = trim((string) ($dadosForm['descricao'] ?? ''));
        $idTipo = (int) ($dadosForm['id_tipo'] ?? 1);
        $dataInicio = trim((string) ($dadosForm['data_inicio'] ?? ''));
        $dataInicio = str_replace('T', ' ', $dataInicio);
        $permitirVenda = ! empty($dadosForm['permitir_venda_durante_inventario']) ? 1 : 0;
        $observacao = trim((string) ($dadosForm['observacao'] ?? ''));
        $idUsuario = (int) ($_SESSION['usuario_id'] ?? 0);

        if ($idUsuario <= 0) {
            $this->msg = "<div class='alert alert-danger'>Sessão inválida para abrir o inventário.</div>";
            return false;
        }

        if ($descricao === '') {
            $this->msg = "<div class='alert alert-danger'>Informe a descrição do inventário.</div>";
            return false;
        }

        if ($dataInicio === '') {
            $dataInicio = date('Y-m-d H:i:s');
        }

        $itensEstoque = $this->buscarItensAberturaEstoque();
        if (empty($itensEstoque)) {
            $this->msg = "<div class='alert alert-danger'>Não existem produtos em estoque para abrir o inventário.</div>";
            return false;
        }

        $pdo = (new \App\adms\Models\helper\AdmsConn())->getConn();

        try {
            $pdo->beginTransaction();

            $stmtCabecalho = $pdo->prepare(
                "INSERT INTO tb_inventario_cabecalho
                    (codigo, descricao, id_tipo, id_estado, data_inicio,
                     permitir_venda_durante_inventario, id_usuario_abertura, observacao, created_at)
                 VALUES
                    (:codigo, :descricao, :id_tipo, 1, :data_inicio,
                     :permitir_venda, :id_usuario_abertura, :observacao, NOW())"
            );

            $stmtCabecalho->execute([
                ':codigo' => $codigo,
                ':descricao' => $descricao,
                ':id_tipo' => $idTipo,
                ':data_inicio' => $dataInicio,
                ':permitir_venda' => $permitirVenda,
                ':id_usuario_abertura' => $idUsuario,
                ':observacao' => $observacao !== '' ? $observacao : null,
            ]);

            $idInventario = (int) $pdo->lastInsertId();

            $stmtItem = $pdo->prepare(
                "INSERT INTO tb_inventario_item
                    (id_inventario, id_produto, quantidade_sistema_abertura,
                     preco_compra_referencia, preco_venda_referencia,
                     id_estado, created_at)
                 VALUES
                    (:id_inventario, :id_produto, :quantidade_sistema_abertura,
                     :preco_compra_referencia, :preco_venda_referencia,
                     1, NOW())"
            );

            foreach ($itensEstoque as $itemEstoque) {
                $stmtItem->execute([
                    ':id_inventario' => $idInventario,
                    ':id_produto' => (int) $itemEstoque['id_produto'],
                    ':quantidade_sistema_abertura' => (int) $itemEstoque['quantidade_sistema_abertura'],
                    ':preco_compra_referencia' => (float) $itemEstoque['preco_compra_referencia'],
                    ':preco_venda_referencia' => (float) $itemEstoque['preco_venda_referencia'],
                ]);
            }

            $pdo->commit();
            $this->Resultado = $idInventario;
            $this->msg = "<div class='alert alert-success'>Inventário aberto com sucesso!</div>";
            return true;
        } catch (\Throwable $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }

            $this->msg = "<div class='alert alert-danger'>Não foi possível abrir o inventário.</div>";
            return false;
        }
    }

    public function atualizarContagemItem(int $idInventario, array $dadosContagem): bool
    {
        $this->Resultado = false;
        $this->msg = '';

        $idProduto = (int) ($dadosContagem['id_produto'] ?? 0);
        $nomeProduto = trim((string) ($dadosContagem['nome_produto'] ?? ''));
        $barCode = trim((string) ($dadosContagem['bar_code'] ?? ''));
        $precoCompra = (float) ($dadosContagem['preco_compra_referencia'] ?? 0);
        $precoVenda = (float) ($dadosContagem['preco_venda_referencia'] ?? 0);
        $quantidadeSistemaAbertura = (int) ($dadosContagem['quantidade_sistema_abertura'] ?? 0);
        $quantidadeSistemaContagem = $dadosContagem['quantidade_sistema_contagem'];
        $quantidadeFisica = (int) ($dadosContagem['quantidade_fisica'] ?? 0);
        $observacao = trim((string) ($dadosContagem['observacao'] ?? ''));

        if ($idProduto <= 0) {
            $this->msg = "<div class='alert alert-danger'>Produto inválido para contagem.</div>";
            return false;
        }

        if ($nomeProduto === '') {
            $this->msg = "<div class='alert alert-danger'>Informe o nome do produto.</div>";
            return false;
        }

        $inventario = $this->buscarInventario($idInventario);
        if (empty($inventario)) {
            $this->msg = "<div class='alert alert-danger'>Inventário não encontrado.</div>";
            return false;
        }

        if ((int) $inventario['id_estado'] >= 6 || (int) $inventario['id_estado'] === 7) {
            $this->msg = "<div class='alert alert-danger'>Este inventário não pode mais receber contagem.</div>";
            return false;
        }

        $idUsuario = (int) ($_SESSION['usuario_id'] ?? 0);
        if ($idUsuario <= 0) {
            $this->msg = "<div class='alert alert-danger'>Sessão inválida para registar a contagem.</div>";
            return false;
        }

        if ($quantidadeSistemaContagem === null || $quantidadeSistemaContagem === '') {
            $quantidadeSistemaContagem = $this->buscarSaldoAtualProduto($idProduto);
        } else {
            $quantidadeSistemaContagem = (int) $quantidadeSistemaContagem;
        }

        $diferenca = $quantidadeFisica - $quantidadeSistemaContagem;

        $pdo = (new \App\adms\Models\helper\AdmsConn())->getConn();

        try {
            $pdo->beginTransaction();

            $stmt = $pdo->prepare(
                "UPDATE tb_inventario_item
                 SET quantidade_sistema_abertura = :quantidade_sistema_abertura,
                     quantidade_sistema_contagem = :quantidade_sistema_contagem,
                     quantidade_fisica = :quantidade_fisica,
                     diferenca = :diferenca,
                     valor_diferenca_compra = :valor_diferenca_compra,
                     valor_diferenca_venda = :valor_diferenca_venda,
                     preco_compra_referencia = :preco_compra_referencia,
                     preco_venda_referencia = :preco_venda_referencia,
                     id_estado = 2,
                     motivo_diferenca = :motivo_diferenca,
                     observacao = :observacao,
                     id_usuario_contagem = :id_usuario_contagem,
                     data_contagem = NOW(),
                     updated_at = NOW()
                 WHERE id_inventario = :id_inventario
                   AND id_produto = :id_produto"
            );

            $stmt->execute([
                ':quantidade_sistema_abertura' => $quantidadeSistemaAbertura,
                ':quantidade_sistema_contagem' => $quantidadeSistemaContagem,
                ':quantidade_fisica' => $quantidadeFisica,
                ':diferenca' => $diferenca,
                ':valor_diferenca_compra' => $diferenca * $precoCompra,
                ':valor_diferenca_venda' => $diferenca * $precoVenda,
                ':preco_compra_referencia' => $precoCompra,
                ':preco_venda_referencia' => $precoVenda,
                ':motivo_diferenca' => $diferenca === 0 ? null : 'Diferença apurada na contagem do inventário',
                ':observacao' => $observacao !== '' ? $observacao : null,
                ':id_usuario_contagem' => $idUsuario,
                ':id_inventario' => $idInventario,
                ':id_produto' => $idProduto,
            ]);

            $stmtProduto = $pdo->prepare(
                "UPDATE tb_produtos
                 SET nome_produto = :nome_produto,
                     bar_code = :bar_code
                 WHERE id_produto = :id_produto"
            );
            $stmtProduto->execute([
                ':nome_produto' => $nomeProduto,
                ':bar_code' => $barCode,
                ':id_produto' => $idProduto,
            ]);

            if ((int) $inventario['id_estado'] === 1) {
                $stmtCabecalho = $pdo->prepare(
                    "UPDATE tb_inventario_cabecalho
                     SET id_estado = 2,
                         updated_at = NOW()
                     WHERE id = :id"
                );
                $stmtCabecalho->execute([':id' => $idInventario]);
            }

            $pdo->commit();
            $this->Resultado = true;
            $this->msg = "<div class='alert alert-success'>Contagem registada com sucesso.</div>";
            return true;
        } catch (\Throwable $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }

            $this->msg = "<div class='alert alert-danger'>Não foi possível registar a contagem.</div>";
            return false;
        }
    }

    public function finalizarInventario(int $idInventario): bool
    {
        $this->Resultado = false;
        $this->msg = '';

        $inventario = $this->buscarInventario($idInventario);
        if (empty($inventario)) {
            $this->msg = "<div class='alert alert-danger'>Inventário não encontrado.</div>";
            return false;
        }

        if ((int) $inventario['id_estado'] === 6) {
            $this->msg = "<div class='alert alert-info'>O inventário já foi finalizado.</div>";
            return false;
        }

        $itens = $this->listarItensInventario($idInventario);
        if (empty($itens)) {
            $this->msg = "<div class='alert alert-danger'>Este inventário não possui itens.</div>";
            return false;
        }

        $idUsuario = (int) ($_SESSION['usuario_id'] ?? 0);
        if ($idUsuario <= 0) {
            $this->msg = "<div class='alert alert-danger'>Sessão inválida para finalizar o inventário.</div>";
            return false;
        }

        $pdo = (new \App\adms\Models\helper\AdmsConn())->getConn();

        try {
            $pdo->beginTransaction();

            $stmtAjuste = $pdo->prepare(
                "INSERT INTO tb_inventario_ajuste
                    (id_inventario, id_item_inventario, id_produto, quantidade_sistema,
                     quantidade_fisica, diferenca, id_tipo_ajuste, valor_unitario_compra,
                     valor_unitario_venda, motivo, id_usuario_aplicacao, data_aplicacao, created_at)
                 VALUES
                    (:id_inventario, :id_item_inventario, :id_produto, :quantidade_sistema,
                     :quantidade_fisica, :diferenca, :id_tipo_ajuste, :valor_unitario_compra,
                     :valor_unitario_venda, :motivo, :id_usuario_aplicacao, NOW(), NOW())"
            );

            $stmtEstadoItem = $pdo->prepare(
                "UPDATE tb_inventario_item
                 SET id_estado = :id_estado,
                     id_usuario_aprovacao = :id_usuario_aprovacao,
                     data_aprovacao = NOW(),
                     updated_at = NOW()
                 WHERE id = :id"
            );

            foreach ($itens as $item) {
                $idProduto = (int) $item['id_produto'];
                $idItemInventario = (int) $item['id'];
                $saldoAtual = $this->buscarSaldoAtualProduto($idProduto, $pdo);
                $itemPendente = $item['quantidade_fisica'] === null || $item['quantidade_fisica'] === '';
                $quantidadeFisica = $itemPendente ? $saldoAtual : (int) $item['quantidade_fisica'];
                $diferenca = $quantidadeFisica - $saldoAtual;
                $precoCompra = (float) ($item['preco_compra_referencia'] ?? 0);
                $precoVenda = (float) ($item['preco_venda_referencia'] ?? 0);

                $stmtAtualizaItem = $pdo->prepare(
                    "UPDATE tb_inventario_item
                     SET quantidade_sistema_contagem = :quantidade_sistema_contagem,
                         quantidade_fisica = :quantidade_fisica,
                         diferenca = :diferenca,
                         valor_diferenca_compra = :valor_diferenca_compra,
                         valor_diferenca_venda = :valor_diferenca_venda,
                         motivo_diferenca = :motivo_diferenca,
                         updated_at = NOW()
                     WHERE id = :id"
                );

                $stmtAtualizaItem->execute([
                    ':quantidade_sistema_contagem' => $saldoAtual,
                    ':quantidade_fisica' => $quantidadeFisica,
                    ':diferenca' => $diferenca,
                    ':valor_diferenca_compra' => $diferenca * $precoCompra,
                    ':valor_diferenca_venda' => $diferenca * $precoVenda,
                    ':motivo_diferenca' => $itemPendente
                        ? 'Item não contado até o fecho; mantido saldo do sistema'
                        : ($diferenca === 0 ? null : 'Diferença consolidada no fecho do inventário'),
                    ':id' => $idItemInventario,
                ]);

                if ($diferenca > 0) {
                    $this->incrementarEstoqueMaisRecente($pdo, $idProduto, $diferenca);
                    $stmtAjuste->execute([
                        ':id_inventario' => $idInventario,
                        ':id_item_inventario' => $idItemInventario,
                        ':id_produto' => $idProduto,
                        ':quantidade_sistema' => $saldoAtual,
                        ':quantidade_fisica' => $quantidadeFisica,
                        ':diferenca' => $diferenca,
                        ':id_tipo_ajuste' => 1,
                        ':valor_unitario_compra' => $precoCompra,
                        ':valor_unitario_venda' => $precoVenda,
                        ':motivo' => 'Ajuste de entrada por fecho de inventário',
                        ':id_usuario_aplicacao' => $idUsuario,
                    ]);
                } elseif ($diferenca < 0) {
                    $this->decrementarEstoqueMaisAntigo($pdo, $idProduto, abs($diferenca));
                    $stmtAjuste->execute([
                        ':id_inventario' => $idInventario,
                        ':id_item_inventario' => $idItemInventario,
                        ':id_produto' => $idProduto,
                        ':quantidade_sistema' => $saldoAtual,
                        ':quantidade_fisica' => $quantidadeFisica,
                        ':diferenca' => $diferenca,
                        ':id_tipo_ajuste' => 2,
                        ':valor_unitario_compra' => $precoCompra,
                        ':valor_unitario_venda' => $precoVenda,
                        ':motivo' => 'Ajuste de saída por fecho de inventário',
                        ':id_usuario_aplicacao' => $idUsuario,
                    ]);
                }

                $stmtEstadoItem->execute([
                    ':id_estado' => $itemPendente ? 5 : ($diferenca === 0 ? 3 : 4),
                    ':id_usuario_aprovacao' => $idUsuario,
                    ':id' => $idItemInventario,
                ]);
            }

            $stmtCabecalho = $pdo->prepare(
                "UPDATE tb_inventario_cabecalho
                 SET id_estado = 6,
                     id_usuario_fecho = :id_usuario_fecho,
                     data_fim = NOW(),
                     updated_at = NOW()
                 WHERE id = :id"
            );
            $stmtCabecalho->execute([
                ':id_usuario_fecho' => $idUsuario,
                ':id' => $idInventario,
            ]);

            $pdo->commit();
            $this->Resultado = true;
            $this->msg = "<div class='alert alert-success'>Inventário finalizado e estoque ajustado com sucesso.</div>";
            return true;
        } catch (\Throwable $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }

            $this->msg = "<div class='alert alert-danger'>Não foi possível finalizar o inventário.</div>";
            return false;
        }
    }

    private function buscarItensAberturaEstoque(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT e.id_produto,
                    COALESCE(SUM(CASE
                        WHEN e.id_localizacao IN (1, 2)
                             OR e.id_localizacao IS NULL
                             OR e.id_localizacao = 0
                        THEN e.quantidade_disponivel
                        ELSE 0
                    END), 0) AS quantidade_sistema_abertura,
                    MAX(e.preco_compra) AS preco_compra_referencia,
                    MAX(e.preco_venda) AS preco_venda_referencia
             FROM tb_estoque e
             GROUP BY e.id_produto
             ORDER BY e.id_produto ASC"
        );

        return $read->getResultado() ?: [];
    }

    private function buscarItemInventario(int $idInventario, int $idProduto): ?array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT *
             FROM tb_inventario_item
             WHERE id_inventario = :id_inventario
               AND id_produto = :id_produto
             LIMIT 1",
            "id_inventario={$idInventario}&id_produto={$idProduto}"
        );

        $resultado = $read->getResultado() ?: [];
        return ! empty($resultado) ? $resultado[0] : null;
    }

    private function buscarSaldoAtualProduto(int $idProduto, $pdo = null): int
    {
        if ($pdo !== null) {
            $stmt = $pdo->prepare(
                "SELECT COALESCE(SUM(CASE
                    WHEN id_localizacao IN (1, 2)
                         OR id_localizacao IS NULL
                         OR id_localizacao = 0
                    THEN quantidade_disponivel
                    ELSE 0
                END), 0) AS total
                 FROM tb_estoque
                 WHERE id_produto = :id_produto"
            );
            $stmt->execute([':id_produto' => $idProduto]);
            $resultado = $stmt->fetch(\PDO::FETCH_ASSOC);
            return (int) ($resultado['total'] ?? 0);
        }

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT COALESCE(SUM(CASE
                    WHEN id_localizacao IN (1, 2)
                         OR id_localizacao IS NULL
                         OR id_localizacao = 0
                    THEN quantidade_disponivel
                    ELSE 0
                END), 0) AS total
             FROM tb_estoque
             WHERE id_produto = :id_produto",
            "id_produto={$idProduto}"
        );

        $resultado = $read->getResultado() ?: [];
        return ! empty($resultado) ? (int) $resultado[0]['total'] : 0;
    }

    private function incrementarEstoqueMaisRecente($pdo, int $idProduto, int $quantidade): void
    {
        if ($quantidade <= 0) {
            return;
        }

        $stmtBusca = $pdo->prepare(
            "SELECT id, quantidade_disponivel
             FROM tb_estoque
             WHERE id_produto = :id_produto
             ORDER BY created_at DESC, id DESC
             LIMIT 1"
        );
        $stmtBusca->execute([':id_produto' => $idProduto]);
        $estoque = $stmtBusca->fetch(\PDO::FETCH_ASSOC);

        if (empty($estoque)) {
            throw new \RuntimeException('Não foi encontrada entrada de estoque para incremento.');
        }

        $stmtUpdate = $pdo->prepare(
            "UPDATE tb_estoque
             SET quantidade_disponivel = :quantidade_disponivel
             WHERE id = :id"
        );
        $stmtUpdate->execute([
            ':quantidade_disponivel' => (int) $estoque['quantidade_disponivel'] + $quantidade,
            ':id' => (int) $estoque['id'],
        ]);
    }

    private function decrementarEstoqueMaisAntigo($pdo, int $idProduto, int $quantidade): void
    {
        if ($quantidade <= 0) {
            return;
        }

        $stmtBusca = $pdo->prepare(
            "SELECT id, quantidade_disponivel
             FROM tb_estoque
             WHERE id_produto = :id_produto
               AND quantidade_disponivel > 0
               AND (id_localizacao IN (1, 2) OR id_localizacao IS NULL OR id_localizacao = 0)
             ORDER BY created_at ASC, id ASC"
        );
        $stmtBusca->execute([':id_produto' => $idProduto]);
        $entradas = $stmtBusca->fetchAll(\PDO::FETCH_ASSOC);

        $restante = $quantidade;
        foreach ($entradas as $entrada) {
            if ($restante <= 0) {
                break;
            }

            $disponivel = (int) $entrada['quantidade_disponivel'];
            if ($disponivel <= 0) {
                continue;
            }

            $retirar = min($disponivel, $restante);
            $novoSaldo = $disponivel - $retirar;

            $stmtUpdate = $pdo->prepare(
                "UPDATE tb_estoque
                 SET quantidade_disponivel = :quantidade_disponivel
                 WHERE id = :id"
            );
            $stmtUpdate->execute([
                ':quantidade_disponivel' => $novoSaldo,
                ':id' => (int) $entrada['id'],
            ]);

            $restante -= $retirar;
        }

        if ($restante > 0) {
            throw new \RuntimeException('Estoque insuficiente para aplicar ajuste de saída.');
        }
    }
}
