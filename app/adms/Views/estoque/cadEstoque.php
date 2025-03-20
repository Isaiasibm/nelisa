<!-- Estilos do Select2 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />

<!-- jQuery (necessário para o Select2) -->


<!-- Script do Select2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h2 class="display-4 titulo">Adicionar Produtos ao Estoque</h2>
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

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Qtdade de Pacotes</label>
                    <input name="qtdadeDePacotes" type="number" class="form-control" placeholder="Informe a quantidade" min="1">
                </div>
                

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Qtdade Itens no Pacote </label>
                    <input type="number" id="qtNoPac" name="qtNoPac" class="form-control" id="qtNoPac">
                </div>

                <div class="form-group col-md-3"> 
                    <label><span class="text-danger">*</span> Preço Compra do Pacote</label>
                    <input name="preco_custo" type="text" class="form-control" placeholder="Informe o preço de compra" id="preco_custo_pacote">
                </div>

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Preço Compra do Item</label>
                    <input name="preco_custo" type="text" class="form-control" placeholder="Informe o preço de compra" id="preco_custo_item" required>
                </div>
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Percentagem Ganho</label>
                    <input name="percentageem" type="text" class="form-control" placeholder="Informe o preço de compra" id="percentual_ganho" >
                </div>
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Preço Venda do Item</label>
                    <input name="precoVenda" type="text" class="form-control" placeholder="Informe o preço de compra" id="preco_venda_item" required>
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Data de Validade</label>
                    <input name="data_validade" type="date" class="form-control">
                </div>
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Data de Compra</label>
                    <input name="data_compra" type="date" class="form-control" required>
                </div>

                <div class="form-group col-md-2">
                <label><span class="text-danger">*</span> Fornecedor</label>
                <select class="form-control" name="fornecedor" id="fornecedor" required>
                    <option value="">Selecione o fornecedor</option>
                    <?php
                     $vis = new \App\adms\Models\helper\AdmsRead();
                     $vis->ExeRead('tb_fornecedores');
                    foreach ($vis->getResultado() as $produto) {
                        extract($produto);
                        echo "<option value='{$id_fornecedor}'> {$nome}</option>";
                    }
                    ?>
                </select>
            </div>

           

            <div class="form-group col-md-2">
                <label><span class="text-danger">*</span> Estado do Estoque</label>
                <select class="form-control" name="estado" id="estado" required>
                    <option value="">Selecione o Estado</option>
                    <?php
                     $vis = new \App\adms\Models\helper\AdmsRead();
                     $vis->ExeRead('tb_estado_estoque');
                    foreach ($vis->getResultado() as $produto) {
                        extract($produto);
                        echo "<option value='{$id}'> {$designacao_estado_estoque}</option>";
                    }
                    ?>
                </select>
            </div>

            <div class="form-group col-md-1">
                    <label><span class="text-danger">*</span> Lote</label>
                    <input type="text" id="lote" name="lote" class="form-control">
                </div>
            </div>

            <input type="submit" class="btn btn-success" name="btnSubmitEstoque" value="Registrar Entrada">
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
