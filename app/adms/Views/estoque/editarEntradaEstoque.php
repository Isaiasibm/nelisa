<?php
    header('Content-type: text/html; charset=utf-8');

    $entrada = $this->Dados['entradaEstoque'] ?? [];
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h3 class="display-2 titulo">Editar Entrada de Estoque</h3>
            </div>
            <div class="p-2">
                <a href="<?php echo URLADM . 'controllerEstoque/detalhesEntradaEstoque/' . (int) ($entrada['id'] ?? 0); ?>" class="btn badge badge-secondary btn-sm px-2" style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
            </div>
        </div>
        <hr style="color: #8fdc8f ">

        <?php
            if (isset($_SESSION['msgcad'])) {
                echo $_SESSION['msgcad'];
                unset($_SESSION['msgcad']);
            }
        ?>

        <form method="post" action="">
            <input type="hidden" name="id_produto" value="<?php echo (int) ($entrada['id_produto'] ?? 0); ?>">
            <input type="hidden" name="id_fabricante" value="<?php echo (int) ($entrada['id_fabricante'] ?? 0); ?>">

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Produto</label>
                    <input type="text" class="form-control" value="<?php echo htmlspecialchars($entrada['nome_produto'] ?? ''); ?>" readonly>
                </div>
                <div class="form-group col-md-2">
                    <label>Lote</label>
                    <input type="text" name="lote" class="form-control" value="<?php echo htmlspecialchars($entrada['lote'] ?? ''); ?>" required>
                </div>
                <div class="form-group col-md-2">
                    <label>Quantidade</label>
                    <input type="number" name="quantidade" class="form-control" min="0" value="<?php echo (int) ($entrada['quantidade'] ?? 0); ?>" required>
                </div>
                <div class="form-group col-md-2">
                    <label>Qtd. disponível</label>
                    <input type="number" name="quantidade_disponivel" class="form-control" min="0" value="<?php echo (int) ($entrada['quantidade_disponivel'] ?? 0); ?>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-2">
                    <label>Preço compra</label>
                    <input type="text" name="preco_compra" class="form-control" value="<?php echo htmlspecialchars($entrada['preco_compra'] ?? ''); ?>" required>
                </div>
                <div class="form-group col-md-2">
                    <label>Preço venda</label>
                    <input type="text" name="preco_venda" class="form-control" value="<?php echo htmlspecialchars($entrada['preco_venda'] ?? ''); ?>" required>
                </div>
                <div class="form-group col-md-3">
                    <label>Fornecedor</label>
                    <select class="form-control" name="id_fornecedor" required>
                        <option value="">Selecione</option>
                        <?php
                            $vis = new \App\adms\Models\helper\AdmsRead();
                            $vis->ExeRead('tb_fornecedores');
                            foreach ($vis->getResultado() as $forn) {
                                $selected = ((int) ($entrada['id_fornecedor'] ?? 0) === (int) $forn['id_fornecedor']) ? 'selected' : '';
                                echo "<option value='{$forn['id_fornecedor']}' {$selected}>{$forn['nome']}</option>";
                            }
                        ?>
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <label>Estado</label>
                    <select class="form-control" name="id_estado" required>
                        <option value="">Selecione</option>
                        <?php
                            $vis = new \App\adms\Models\helper\AdmsRead();
                            $vis->ExeRead('tb_estado_estoque');
                            foreach ($vis->getResultado() as $estado) {
                                $selected = ((int) ($entrada['id_estado'] ?? 0) === (int) $estado['id']) ? 'selected' : '';
                                echo "<option value='{$estado['id']}' {$selected}>{$estado['designacao_estado_estoque']}</option>";
                            }
                        ?>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-3">
                    <label>Data compra</label>
                    <input type="date" name="data_compra" class="form-control" value="<?php echo ! empty($entrada['data_compra']) ? date('Y-m-d', strtotime($entrada['data_compra'])) : ''; ?>" required>
                </div>
                <div class="form-group col-md-3">
                    <label>Data validade</label>
                    <input type="date" name="data_validade" class="form-control" value="<?php echo ! empty($entrada['data_validade']) ? date('Y-m-d', strtotime($entrada['data_validade'])) : ''; ?>">
                </div>
            </div>

            <button type="submit" name="btnEditarEntradaEstoque" value="1" class="btn btn-success">
                Guardar alterações
            </button>
        </form>
    </div>
</div>
