<?php
if (! defined('URL')) {
    header('Location: /');
    exit();
}

$inventariosEmAndamento = $this->Dados['inventariosEmAndamento'] ?? [];
$inventarioAtual = $this->Dados['inventarioAtual'] ?? null;
$itensInventarioAtual = $this->Dados['itensInventarioAtual'] ?? [];
$idInventarioAtual = (int) ($this->Dados['idInventarioAtual'] ?? 0);

$totalItens = count($itensInventarioAtual);
$itensPendentes = 0;
$itensContados = 0;
$itensComDiferenca = 0;
foreach ($itensInventarioAtual as $itemInventario) {
    if ($itemInventario['quantidade_fisica'] === null || $itemInventario['quantidade_fisica'] === '') {
        $itensPendentes++;
    } else {
        $itensContados++;
        if ((int) ($itemInventario['diferenca'] ?? 0) !== 0) {
            $itensComDiferenca++;
        }
    }
}

$dadosItensJson = [];
foreach ($itensInventarioAtual as $itemInventario) {
    $dadosItensJson[] = [
        'id_produto' => (int) ($itemInventario['id_produto'] ?? 0),
        'nome_produto' => (string) ($itemInventario['nome_produto'] ?? ''),
        'bar_code' => (string) ($itemInventario['bar_code'] ?? ''),
        'nome_fabricante' => (string) ($itemInventario['nome_fabricante'] ?? ''),
        'tipo_produto' => (string) ($itemInventario['tipo_produto'] ?? ''),
        'quantidade_sistema_abertura' => (int) ($itemInventario['quantidade_sistema_abertura'] ?? 0),
        'quantidade_sistema_contagem' => $itemInventario['quantidade_sistema_contagem'] === null ? '' : (int) $itemInventario['quantidade_sistema_contagem'],
        'quantidade_fisica' => $itemInventario['quantidade_fisica'] === null ? '' : (int) $itemInventario['quantidade_fisica'],
        'preco_compra_referencia' => (float) ($itemInventario['preco_compra_referencia'] ?? 0),
        'preco_venda_referencia' => (float) ($itemInventario['preco_venda_referencia'] ?? 0),
        'observacao' => (string) ($itemInventario['observacao'] ?? ''),
    ];
}
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h2 class="display-4 titulo">Contagem de Inventário</h2>
                <p class="text-muted mb-0">Pesquise o produto, registe a quantidade física e finalize o inventário quando não houver mais pendências.</p>
            </div>
            <div class="p-2">
                <a href="<?php echo URLADM . 'ControllerInventario/registarInventario'; ?>" class="btn btn-outline-primary btn-sm">Novo inventário</a>
                <a href="<?php echo URLADM . 'home/index/'; ?>" class="btn btn-outline-info btn-sm">Fechar</a>
            </div>
        </div>

        <?php
        if (isset($_SESSION['msg'])) {
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        }

        if (isset($_SESSION['msgcad'])) {
            echo $_SESSION['msgcad'];
            unset($_SESSION['msgcad']);
        }
        ?>

        <hr>

        <div class="form-row align-items-end">
            <div class="form-group col-md-6">
                <label>Inventário em andamento</label>
                <select class="form-control" id="selecionarInventarioContagem">
                    <option value="">Selecione o inventário...</option>
                    <?php foreach ($inventariosEmAndamento as $inventario): ?>
                        <option value="<?php echo (int) $inventario['id']; ?>" <?php echo $idInventarioAtual === (int) $inventario['id'] ? 'selected' : ''; ?>>
                            <?php echo htmlspecialchars($inventario['codigo'] . ' - ' . $inventario['descricao'] . ' (' . $inventario['estado'] . ')'); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group col-md-1">
                <span class="badge badge-light p-2 w-100 text-left"><?php echo $totalItens; ?> item(ns)</span>
            </div>
            <div class="form-group col-md-1">
                <span class="badge badge-warning p-2 w-100 text-left"><?php echo $itensPendentes; ?> pendente(s)</span>
            </div>
            <div class="form-group col-md-2">
                <span class="badge badge-success p-2 w-100 text-left"><?php echo $itensContados; ?> contado(s)</span>
            </div>
            <div class="form-group col-md-2">
                <span class="badge badge-danger p-2 w-100 text-left"><?php echo $itensComDiferenca; ?> com diferença</span>
            </div>
        </div>

        <?php if (! empty($inventarioAtual)): ?>
            <div class="border rounded p-3 mb-3" style="background:#fafafa;">
                <div class="form-row">
                    <div class="col-md-3"><strong>Código:</strong> <?php echo htmlspecialchars($inventarioAtual['codigo']); ?></div>
                    <div class="col-md-4"><strong>Descrição:</strong> <?php echo htmlspecialchars($inventarioAtual['descricao']); ?></div>
                    <div class="col-md-2"><strong>Tipo:</strong> <?php echo htmlspecialchars($inventarioAtual['tipo']); ?></div>
                    <div class="col-md-2"><strong>Estado:</strong> <?php echo htmlspecialchars($inventarioAtual['estado']); ?></div>
                    <div class="col-md-1"><strong>ID:</strong> <?php echo (int) $inventarioAtual['id']; ?></div>
                </div>
            </div>

            <form method="POST" action="" class="border rounded p-3 mb-3" id="formContagemInventario" style="background:#fdfdfd;">
                <input type="hidden" name="id_inventario" value="<?php echo $idInventarioAtual; ?>">

                <div class="form-row align-items-end">
                    <div class="form-group col-md-8">
                        <label><span class="text-danger">*</span> Produto para contagem</label>
                        <select class="form-control select2" id="seletorProdutoContagem">
                            <option value="">Busque por ID, código de barra ou nome...</option>
                            <?php foreach ($itensInventarioAtual as $itemInventario): ?>
                                <option value="<?php echo (int) $itemInventario['id_produto']; ?>">
                                    <?php
                                    echo htmlspecialchars(
                                        (int) $itemInventario['id_produto']
                                        . ' | ' . ($itemInventario['bar_code'] ?: 'SEM-CODIGO')
                                        . ' | ' . ($itemInventario['nome_produto'] ?? '')
                                    );
                                    ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                        <small class="text-muted">Leitura por scanner funciona se o cursor estiver nesse campo.</small>
                    </div>
                    <div class="form-group col-md-4">
                        <button type="button" class="btn btn-secondary btn-block" id="btnLimparCamposContagem">Limpar campos</button>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label>ID Produto</label>
                        <input type="number" class="form-control" name="id_produto" id="id_produto" required min="1">
                    </div>
                    <div class="form-group col-md-4">
                        <label>Nome do Produto</label>
                        <input type="text" class="form-control" name="nome_produto" id="nome_produto" maxlength="255" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Código de Barra</label>
                        <input type="text" class="form-control" name="bar_code" id="bar_code" maxlength="120">
                    </div>
                    <div class="form-group col-md-3">
                        <label>Fabricante / Tipo</label>
                        <input type="text" class="form-control" id="fabricante_tipo" readonly>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label>Qtd. sistema abertura</label>
                        <input type="number" class="form-control" name="quantidade_sistema_abertura" id="quantidade_sistema_abertura" min="0" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label>Qtd. sistema atual</label>
                        <input type="number" class="form-control" name="quantidade_sistema_contagem" id="quantidade_sistema_contagem" min="0" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label>Qtd. física</label>
                        <input type="number" class="form-control" name="quantidade_fisica" id="quantidade_fisica" min="0" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label>Diferença</label>
                        <input type="text" class="form-control" id="diferenca_preview" readonly>
                    </div>
                    <div class="form-group col-md-2">
                        <label>Preço compra</label>
                        <input type="number" class="form-control" name="preco_compra_referencia" id="preco_compra_referencia" min="0" step="0.01" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label>Preço venda</label>
                        <input type="number" class="form-control" name="preco_venda_referencia" id="preco_venda_referencia" min="0" step="0.01" required>
                    </div>
                </div>

                <div class="form-row align-items-end">
                    <div class="form-group col-md-8">
                        <label>Observação da contagem</label>
                        <input type="text" class="form-control" name="observacao_item" id="observacao_item" maxlength="255" placeholder="Ex.: caixa danificada, reconferido no balcão, etc.">
                    </div>
                    <div class="form-group col-md-4">
                        <button type="submit" class="btn btn-success btn-block" name="btnGuardarContagem" value="1">Guardar contagem do produto</button>
                    </div>
                </div>
            </form>

            <div class="table-responsive">
                <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable" data-page-length="15">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Produto</th>
                            <th>Código</th>
                            <th>Fabricante / Tipo</th>
                            <th class="text-center">Sistema abertura</th>
                            <th class="text-center">Sistema contagem</th>
                            <th class="text-center">Qtd. física</th>
                            <th class="text-center">Diferença</th>
                            <th class="text-right">Preço compra</th>
                            <th class="text-right">Preço venda</th>
                            <th>Estado</th>
                            <th>Observação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($itensInventarioAtual as $itemInventario): ?>
                            <tr>
                                <td><?php echo (int) $itemInventario['id_produto']; ?></td>
                                <td><?php echo htmlspecialchars($itemInventario['nome_produto'] ?? ''); ?></td>
                                <td><?php echo htmlspecialchars($itemInventario['bar_code'] ?? ''); ?></td>
                                <td>
                                    <div><?php echo htmlspecialchars($itemInventario['nome_fabricante'] ?? 'Sem fabricante'); ?></div>
                                    <small class="text-muted"><?php echo htmlspecialchars($itemInventario['tipo_produto'] ?? 'Sem tipo'); ?></small>
                                </td>
                                <td class="text-center"><?php echo (int) ($itemInventario['quantidade_sistema_abertura'] ?? 0); ?></td>
                                <td class="text-center"><?php echo $itemInventario['quantidade_sistema_contagem'] !== null ? (int) $itemInventario['quantidade_sistema_contagem'] : '-'; ?></td>
                                <td class="text-center"><?php echo $itemInventario['quantidade_fisica'] !== null ? (int) $itemInventario['quantidade_fisica'] : '-'; ?></td>
                                <td class="text-center">
                                    <?php if ($itemInventario['diferenca'] === null): ?>
                                        <span class="badge badge-warning">Pendente</span>
                                    <?php elseif ((int) $itemInventario['diferenca'] === 0): ?>
                                        <span class="badge badge-success">0</span>
                                    <?php elseif ((int) $itemInventario['diferenca'] > 0): ?>
                                        <span class="badge badge-danger">+<?php echo (int) $itemInventario['diferenca']; ?></span>
                                    <?php else: ?>
                                        <span class="badge badge-danger"><?php echo (int) $itemInventario['diferenca']; ?></span>
                                    <?php endif; ?>
                                </td>
                                <td class="text-right"><?php echo number_format((float) ($itemInventario['preco_compra_referencia'] ?? 0), 2, ',', '.'); ?></td>
                                <td class="text-right"><?php echo number_format((float) ($itemInventario['preco_venda_referencia'] ?? 0), 2, ',', '.'); ?></td>
                                <td><?php echo htmlspecialchars($itemInventario['estado_item'] ?? ''); ?></td>
                                <td><?php echo htmlspecialchars($itemInventario['observacao'] ?? ''); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

            <form method="POST" action="" class="mt-3">
                <input type="hidden" name="id_inventario" value="<?php echo $idInventarioAtual; ?>">
                <button type="submit" class="btn btn-danger" name="btnFinalizarInventario" value="1">
                    Finalizar inventário e ajustar estoque
                </button>
                <small class="text-muted ml-2">Itens pendentes serão fechados como ignorados e sem ajuste no estoque.</small>
            </form>
        <?php else: ?>
            <div class="alert alert-info mb-0" role="alert">
                Selecione um inventário em andamento para começar a contagem.
            </div>
        <?php endif; ?>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    var mapaItens = <?php echo json_encode($dadosItensJson, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP); ?>;
    var itensPorProduto = {};
    mapaItens.forEach(function (item) {
        itensPorProduto[String(item.id_produto)] = item;
    });

    var seletor = document.getElementById('selecionarInventarioContagem');
    var seletorProdutoContagem = $('#seletorProdutoContagem');
    var campoIdProduto = document.getElementById('id_produto');
    var campoNomeProduto = document.getElementById('nome_produto');
    var campoBarCode = document.getElementById('bar_code');
    var campoFabricanteTipo = document.getElementById('fabricante_tipo');
    var campoQtdAbertura = document.getElementById('quantidade_sistema_abertura');
    var campoQtdSistema = document.getElementById('quantidade_sistema_contagem');
    var campoQtdFisica = document.getElementById('quantidade_fisica');
    var campoDifPreview = document.getElementById('diferenca_preview');
    var campoPrecoCompra = document.getElementById('preco_compra_referencia');
    var campoPrecoVenda = document.getElementById('preco_venda_referencia');
    var campoObservacao = document.getElementById('observacao_item');
    var btnLimpar = document.getElementById('btnLimparCamposContagem');

    function atualizarPreviewDiferenca() {
        var qtdSistema = parseInt(campoQtdSistema.value || '0', 10);
        var qtdFisica = parseInt(campoQtdFisica.value || '0', 10);
        campoDifPreview.value = (qtdFisica - qtdSistema).toString();
    }

    function preencherCampos(item) {
        if (!item) {
            return;
        }

        campoIdProduto.value = item.id_produto || '';
        campoNomeProduto.value = item.nome_produto || '';
        campoBarCode.value = item.bar_code || '';
        campoFabricanteTipo.value = (item.nome_fabricante || 'Sem fabricante') + ' / ' + (item.tipo_produto || 'Sem tipo');
        campoQtdAbertura.value = item.quantidade_sistema_abertura || 0;
        campoQtdSistema.value = item.quantidade_sistema_contagem === '' ? (item.quantidade_sistema_abertura || 0) : item.quantidade_sistema_contagem;
        campoQtdFisica.value = item.quantidade_fisica === '' ? '' : item.quantidade_fisica;
        campoPrecoCompra.value = Number(item.preco_compra_referencia || 0).toFixed(2);
        campoPrecoVenda.value = Number(item.preco_venda_referencia || 0).toFixed(2);
        campoObservacao.value = item.observacao || '';
        atualizarPreviewDiferenca();
    }

    function limparCampos() {
        campoIdProduto.value = '';
        campoNomeProduto.value = '';
        campoBarCode.value = '';
        campoFabricanteTipo.value = '';
        campoQtdAbertura.value = '';
        campoQtdSistema.value = '';
        campoQtdFisica.value = '';
        campoDifPreview.value = '';
        campoPrecoCompra.value = '';
        campoPrecoVenda.value = '';
        campoObservacao.value = '';
        if (seletorProdutoContagem.length) {
            seletorProdutoContagem.val(null).trigger('change');
        }
    }

    if (!seletor) {
        return;
    }

    seletor.addEventListener('change', function () {
        if (!this.value) {
            return;
        }

        window.location.href = '<?php echo URLADM . 'ControllerInventario/contagemInventario/'; ?>' + this.value;
    });

    if (seletorProdutoContagem.length && $.fn.select2) {
        seletorProdutoContagem.select2({
            placeholder: 'Busque por ID, código de barra ou nome...',
            allowClear: true,
            width: '100%'
        });

        seletorProdutoContagem.on('change', function () {
            var idProduto = String($(this).val() || '');
            if (!idProduto || !itensPorProduto[idProduto]) {
                return;
            }

            preencherCampos(itensPorProduto[idProduto]);
        });
    }

    campoIdProduto.addEventListener('change', function () {
        var idProduto = String(this.value || '');
        if (itensPorProduto[idProduto]) {
            preencherCampos(itensPorProduto[idProduto]);
            if (seletorProdutoContagem.length) {
                seletorProdutoContagem.val(idProduto).trigger('change.select2');
            }
        }
    });

    campoQtdSistema.addEventListener('input', atualizarPreviewDiferenca);
    campoQtdFisica.addEventListener('input', atualizarPreviewDiferenca);
    btnLimpar.addEventListener('click', limparCampos);
});
</script>