<?php
    header('Content-type: text/html; charset=utf-8');

    $entrada = $this->Dados['entradaEstoque'] ?? [];
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h3 class="display-2 titulo">Detalhes da Entrada de Estoque</h3>
            </div>
            <div class="p-2">
                <a href="<?php echo URLADM . 'controllerEstoque/detalhesProdutoEstoque/' . (int) ($entrada['id_produto'] ?? 0); ?>" class="btn badge badge-secondary btn-sm px-2" style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-arrow-left"></i> Voltar ao produto
                </a>
                <a href="<?php echo URLADM . 'home/index/'; ?>" class="btn badge badge-danger btn-sm px-1" style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-home"></i> Fechar
                </a>
            </div>
        </div>
        <hr style="color: #8fdc8f ">

        <?php
            if (isset($_SESSION['msg'])):
                echo $_SESSION['msg'];
                unset($_SESSION['msg']);
            endif;
            if (isset($_SESSION['msgcad'])):
                echo $_SESSION['msgcad'];
                unset($_SESSION['msgcad']);
            endif;
        ?>

        <div class="card border-info">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4"><strong>ID Entrada:</strong> <?php echo (int) ($entrada['id'] ?? 0); ?></div>
                    <div class="col-md-4"><strong>ID Produto:</strong> <?php echo (int) ($entrada['id_produto'] ?? 0); ?></div>
                    <div class="col-md-4"><strong>Produto:</strong> <?php echo htmlspecialchars($entrada['nome_produto'] ?? ''); ?></div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4"><strong>Código de barras:</strong> <?php echo htmlspecialchars($entrada['bar_code'] ?? ''); ?></div>
                    <div class="col-md-4"><strong>Fornecedor:</strong> <?php echo htmlspecialchars($entrada['fornecedor'] ?? ''); ?></div>
                    <div class="col-md-4"><strong>Fabricante:</strong> <?php echo htmlspecialchars($entrada['fabricante'] ?? ''); ?></div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-3"><strong>Lote:</strong> <?php echo htmlspecialchars($entrada['lote'] ?? ''); ?></div>
                    <div class="col-md-3"><strong>Quantidade:</strong> <?php echo (int) ($entrada['quantidade'] ?? 0); ?></div>
                    <div class="col-md-3"><strong>Qtd. disponível:</strong> <?php echo (int) ($entrada['quantidade_disponivel'] ?? 0); ?></div>
                    <div class="col-md-3"><strong>Estado:</strong> <?php echo htmlspecialchars($entrada['estado_estoque'] ?? ''); ?></div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-3"><strong>Preço compra:</strong> <?php echo number_format((float) ($entrada['preco_compra'] ?? 0), 2, ',', '.'); ?></div>
                    <div class="col-md-3"><strong>Preço venda:</strong> <?php echo number_format((float) ($entrada['preco_venda'] ?? 0), 2, ',', '.'); ?></div>
                    <div class="col-md-3"><strong>Data compra:</strong> <?php echo ! empty($entrada['data_compra']) ? date('d/m/Y', strtotime($entrada['data_compra'])) : '—'; ?></div>
                    <div class="col-md-3"><strong>Data validade:</strong> <?php echo ! empty($entrada['data_validade']) ? date('d/m/Y', strtotime($entrada['data_validade'])) : '—'; ?></div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4"><strong>Registado por:</strong> <?php echo htmlspecialchars($entrada['registado_por'] ?? ''); ?></div>
                    <div class="col-md-4"><strong>Criado em:</strong> <?php echo ! empty($entrada['created_at']) ? date('d/m/Y H:i', strtotime($entrada['created_at'])) : '—'; ?></div>
                    <div class="col-md-4"><strong>Atualizado em:</strong> <?php echo ! empty($entrada['updated_at']) ? date('d/m/Y H:i', strtotime($entrada['updated_at'])) : '—'; ?></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12">
                        <strong>Descrição do produto:</strong>
                        <div><?php echo htmlspecialchars($entrada['descricao_produto'] ?? ''); ?></div>
                    </div>
                </div>
                <div class="mt-3">
                    <a class="btn btn-success" href="<?php echo URLADM . 'controllerEstoque/editarEntradaEstoque/' . (int) ($entrada['id'] ?? 0); ?>">
                        Editar esta entrada
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
