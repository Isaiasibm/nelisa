<?php

    header('Content-type: text/html; charset=utf-8');

    $idVenda  = (int) ($this->Dados['idVenda'] ?? 0);
    $itens    = $this->Dados['itens'] ?? [];
    $urlLista = URLADM . 'vendas/listar';
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h3 class="display-2 titulo">
                    Itens da Venda <span class="badge badge-secondary">#<?php echo $idVenda; ?></span>
                </h3>
            </div>
            <div class="p-2">
                <a href="<?php echo $urlLista; ?>" class="btn badge badge-secondary btn-sm px-2"
                    style="font-size:10pt; border-radius:7px;">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
                &nbsp;
                <a href="<?php echo URLADM . 'home/index/'; ?>" class="btn badge badge-danger btn-sm px-1"
                    style="font-size:10pt; border-radius:7px;">
                    <i class="fas fa-home"></i> Fechar
                </a>
            </div>
        </div>
        <hr style="color:#8fdc8f">

        <?php
            if (! empty($_SESSION['msgcad'])) {
                echo $_SESSION['msgcad'];
                unset($_SESSION['msgcad']);
            }
        ?>

        <div class="table-responsive">
            <table
                class="table table-bordered table-hover tabelaPersonalizadaDataTable"
                id="tabelaItens"
                data-page-length="20"
                data-priority="0,1,2"
                data-low-priority="4,5">
                <thead class="thead-light">
                    <tr>
                        <th>Produto</th>
                        <th class="text-center">Qtd vendida</th>
                        <th class="text-center">Já devolvida</th>
                        <th class="text-center">Saldo</th>
                        <th class="text-right">Preço unit. (Kz)</th>
                        <th class="text-right">Subtotal (Kz)</th>
                        <th class="text-center">Acção</th>
                    </tr>
                </thead>
                <tbody>
                <?php foreach ($itens as $item):
                        $idItem       = (int) $item['id_item'];
                        $idProduto    = (int) $item['id_produto'];
                        $nomeProduto  = htmlspecialchars($item['nome_produto'] ?? '');
                        $qtdVendida   = (int) $item['quantidade'];
                        $qtdDevolvida = (int) ($item['qtd_ja_devolvida'] ?? 0);
                        $saldo        = $qtdVendida - $qtdDevolvida;
                        $precoUnit    = (float) ($item['preco_unitario'] ?? 0);
                        $subtotal     = (float) ($item['subtotal'] ?? 0);
                ?>
                <tr>
                    <td><?php echo $nomeProduto; ?></td>
                    <td class="text-center"><?php echo $qtdVendida; ?></td>
                    <td class="text-center">
                        <?php if ($qtdDevolvida > 0): ?>
                            <span class="badge badge-warning"><?php echo $qtdDevolvida; ?></span>
                        <?php else: ?>
                            <span class="text-muted">0</span>
                        <?php endif; ?>
                    </td>
                    <td class="text-center">
                        <?php if ($saldo > 0): ?>
                            <span class="badge badge-success"><?php echo $saldo; ?></span>
                        <?php else: ?>
                            <span class="badge badge-secondary">0</span>
                        <?php endif; ?>
                    </td>
                    <td class="text-right"><?php echo number_format($precoUnit, 2, ',', '.'); ?></td>
                    <td class="text-right"><?php echo number_format($subtotal, 2, ',', '.'); ?></td>
                    <td class="text-center">
                        <?php if ($saldo > 0): ?>
                            <button type="button"
                                class="btn btn-sm btn-warning btnDevolverItem"
                                data-id-item="<?php echo $idItem; ?>"
                                data-id-produto="<?php echo $idProduto; ?>"
                                data-nome="<?php echo $nomeProduto; ?>"
                                data-saldo="<?php echo $saldo; ?>"
                                data-preco="<?php echo $precoUnit; ?>"
                                title="Devolver este item">
                                <i class="fas fa-undo"></i> Devolver
                            </button>
                        <?php else: ?>
                            <span class="text-muted small">Totalmente devolvido</span>
                        <?php endif; ?>
                    </td>
                </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div><!-- /.table-responsive -->
    </div><!-- /.list-group-item -->
</div><!-- /.content -->

<!-- Modal: devolver item -->
<div class="modal fade" id="modalDevolverItem" tabindex="-1" role="dialog"
     aria-labelledby="modalDevolverItemLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form method="POST" action="<?php echo URLADM . 'Vendas/devolverItem'; ?>">
            <!-- campos ocultos -->
            <input type="hidden" name="id_venda"      value="<?php echo $idVenda; ?>">
            <input type="hidden" name="id_item_venda" id="modalIdItemVenda" value="">
            <input type="hidden" name="id_produto"    id="modalIdProduto"   value="">
            <input type="hidden" name="preco_unitario" id="modalPrecoUnit"  value="">

            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h5 class="modal-title" id="modalDevolverItemLabel">
                        <i class="fas fa-undo"></i> Devolver item
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        <strong>Produto:</strong>
                        <span id="modalNomeProduto" class="text-primary"></span>
                    </p>
                    <p class="text-muted small mb-2">
                        Saldo disponível para devolução: <strong id="modalSaldo"></strong>
                    </p>

                    <div class="form-group">
                        <label for="modalQuantidade">
                            Quantidade a devolver <span class="text-danger">*</span>
                        </label>
                        <input type="number" class="form-control" id="modalQuantidade"
                            name="quantidade" min="1" value="1" required>
                    </div>

                    <div class="form-group">
                        <label for="modalMotivo">
                            Motivo <small class="text-muted">(opcional)</small>
                        </label>
                        <textarea class="form-control" id="modalMotivo"
                            name="motivo" rows="2"
                            placeholder="Descreva o motivo..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        Cancelar
                    </button>
                    <button type="submit" class="btn btn-warning">
                        <i class="fas fa-undo"></i> Confirmar
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    $(document).on('click', '.btnDevolverItem', function () {
        var idItem  = $(this).data('id-item');
        var idProd  = $(this).data('id-produto');
        var nome    = $(this).data('nome');
        var saldo   = $(this).data('saldo');
        var preco   = $(this).data('preco');

        $('#modalIdItemVenda').val(idItem);
        $('#modalIdProduto').val(idProd);
        $('#modalPrecoUnit').val(preco);
        $('#modalNomeProduto').text(nome);
        $('#modalSaldo').text(saldo);
        $('#modalQuantidade').val(1).attr('max', saldo);
        $('#modalMotivo').val('');

        $('#modalDevolverItem').modal('show');
    });
});
</script>
