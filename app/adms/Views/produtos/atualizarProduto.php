<!-- Estilos do Select2 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />

<!-- jQuery (necessário para o Select2) -->


<!-- Script do Select2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h2 class="display-4 titulo">Atualizar dados do Produtos</h2>
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
        <form method="POST" action="" enctype="multipart/form-data"> 

            <!-- Campo Único para Código de Barras ou Nome do Produto -->
            <div class="form-group">
                <label><span class="text-danger">*</span> Selecione ou Escaneie o Produto</label>
                <select class="form-control select2" name="id_produto" id="select-produto" required>
                    <option value="">Digite, escaneie ou selecione um produto...</option>
                    <?php
                     $vis = new \App\adms\Models\helper\AdmsRead();
                     $vis->ExeRead('tb_produtos');
                    foreach ($vis->getResultado() as $produto) {
                        extract($produto);
                        echo "<option value='{$id_produto}'>({$bar_code}) {$nome_produto}</option>";
                    }
                    ?>
                </select>
            </div>

            <!-- Quantidade e Informações da Compra -->
            <div class="form-row">

            <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Código de Barra</label>
                    <input type="text" id="bar_code" name="bar_code" class="form-control" autofocus>
                </div>
            </div>

            <input type="submit" class="btn btn-success" name="btnSubmitProduto" value="Atualizar">
        </form>
    </div>
</div>

<!-- Scripts para inicializar o Select2 e automação do código de barras -->
<script>
    $(document).ready(function() {
        // Inicializa o Select2
        $('#select-produto').select2({
            placeholder: "Digite, escaneie ou selecione um produto...",
            allowClear: true
        });

        // Preenche automaticamente o campo de código de barras ao selecionar um produto
        $('#select-produto').on('change', function() {
            var selectedOption = $(this).find('option:selected');
            var barcode = selectedOption.text().match(/\((.*?)\)/); // Captura o código de barras dentro dos parênteses
            if (barcode) {
                $('#barcode').val(barcode[1]); // Preenche o campo de código de barras automaticamente
            }
        });

        // Seleciona automaticamente o produto ao escanear um código de barras
        $('#barcode').on('change', function() {
            var barcodeValue = $(this).val().trim();
            if (barcodeValue !== "") {
                $("#select-produto option").each(function() {
                    if ($(this).text().includes(barcodeValue)) {
                        $('#select-produto').val($(this).val()).trigger('change');
                    }
                });
            }
        });
    });
</script>
