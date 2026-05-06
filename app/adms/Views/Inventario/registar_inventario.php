<?php
if (! defined('URL')) {
    header('Location: /');
    exit();
}

$tiposInventario = $this->Dados['tiposInventario'] ?? [];
$estadosInventario = $this->Dados['estadosInventario'] ?? [];
$codigoInventario = $this->Dados['codigoInventario'] ?? ('INV-' . date('YmdHis'));
$descricaoInventario = $this->Dados['descricao'] ?? '';
$idTipoSelecionado = (int) ($this->Dados['id_tipo'] ?? 1);
$dataInicioInventario = $this->Dados['data_inicio'] ?? date('Y-m-d\TH:i');
$permitirVenda = isset($this->Dados['permitir_venda_durante_inventario'])
    ? (int) $this->Dados['permitir_venda_durante_inventario']
    : 1;
$observacaoInventario = $this->Dados['observacao'] ?? '';

$estadoAberto = 'Aberto';
foreach ($estadosInventario as $estadoInventario) {
    if ((int) ($estadoInventario['id'] ?? 0) === 1) {
        $estadoAberto = $estadoInventario['designacao'];
        break;
    }
}
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h2 class="display-4 titulo">Registar Inventário</h2>
                <p class="text-muted mb-0">Ao abrir o inventário, os itens serão carregados automaticamente a partir do estoque atual.</p>
            </div>
            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/'; ?>" class="btn btn-outline-info btn-sm">Fechar</a>
            </div>
        </div>
        <hr>
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

        <form method="POST" action="" autocomplete="off" id="formRegistarInventario">
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Código</label>
                    <input type="text" name="codigo" class="form-control" value="<?php echo htmlspecialchars($codigoInventario); ?>" readonly>
                </div>
                <div class="form-group col-md-5">
                    <label><span class="text-danger">*</span> Descrição</label>
                    <input type="text" name="descricao" class="form-control" maxlength="255" required value="<?php echo htmlspecialchars($descricaoInventario); ?>" placeholder="Ex.: Inventário geral do armazém principal">
                </div>
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Tipo</label>
                    <select class="form-control" name="id_tipo" required>
                        <?php foreach ($tiposInventario as $tipoInventario): ?>
                            <option value="<?php echo (int) $tipoInventario['id']; ?>" <?php echo $idTipoSelecionado === (int) $tipoInventario['id'] ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($tipoInventario['designacao']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="form-group col-md-2">
                    <label>Estado inicial</label>
                    <input type="text" class="form-control" value="<?php echo htmlspecialchars($estadoAberto); ?>" readonly>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Data de início</label>
                    <input type="datetime-local" name="data_inicio" class="form-control" required value="<?php echo htmlspecialchars($dataInicioInventario); ?>">
                </div>
                <div class="form-group col-md-3">
                    <label>Venda durante inventário</label>
                    <div class="form-control d-flex align-items-center">
                        <div class="form-check mb-0">
                            <input class="form-check-input" type="checkbox" id="permitir_venda_durante_inventario" name="permitir_venda_durante_inventario" value="1" <?php echo $permitirVenda === 1 ? 'checked' : ''; ?>>
                            <label class="form-check-label" for="permitir_venda_durante_inventario">Permitir vendas enquanto o inventário estiver aberto</label>
                        </div>
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label>Observação geral</label>
                    <textarea name="observacao" class="form-control" rows="2" placeholder="Notas operacionais, turno responsável ou área inventariada"><?php echo htmlspecialchars($observacaoInventario); ?></textarea>
                </div>
            </div>
            <div class="alert alert-info mb-3" role="alert">
                O sistema irá somar as quantidades disponíveis de cada produto em tb_estoque e gravar automaticamente esses valores em tb_inventario_item como quantidade_sistema_abertura.
            </div>

            <button type="submit" class="btn btn-success" name="btnSubmitInventario" value="1">
                <i class="fas fa-save"></i> Abrir inventário
            </button>
        </form>
    </div>
</div>
