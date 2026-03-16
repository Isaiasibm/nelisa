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
        $dataHoje = date('Y-m-d');
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
                        $idProduto = (int) ($produto['id_produto'] ?? 0);
                        $barCode = htmlspecialchars((string) ($produto['bar_code'] ?? ''), ENT_QUOTES, 'UTF-8');
                        $nomeProduto = htmlspecialchars((string) ($produto['nome_produto'] ?? ''), ENT_QUOTES, 'UTF-8');

                        echo "<option value='{$idProduto}'>{$idProduto} - ({$barCode}) {$nomeProduto}</option>";
                    }
                    ?>
                </select>
            </div>

            <!-- Quantidade e Informações da Compra -->
            <div class="form-row">

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Qtde de Pacotes</label>
                    <input name="qtdadeDePacotes" type="number" class="form-control" placeholder="Quantos pacotes" min="1">
                </div>
                

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Qtde Itens no Pacote </label>
                    <input type="number" id="qtNoPac" name="qtNoPac" class="form-control" id="qtNoPac" placeholder="Qtde itens no pacote">
                </div>

                <div class="form-group col-md-2"> 
                    <label><span class="text-danger">*</span> Custo do Pacote</label>
                    <input name="preco_custo" type="text" class="form-control" placeholder="Quanto custou o pacote" id="preco_custo_pacote">
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Custo do Item</label>
                    <input name="preco_custo" type="text" class="form-control" placeholder="Informe o preço de compra" id="preco_custo_item" required>
                </div>
                <div class="form-group col-md-1">
                    <label><span class="text-danger">*</span> % Ganho</label>
                    <input name="percentageem" type="text" class="form-control" placeholder="% a ganhar" id="percentual_ganho" >
                </div>
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Preço Venda do Item</label>
                    <input name="precoVenda" type="text" class="form-control" placeholder="Informe o preço de venda" id="preco_venda_item" required>
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Lote</label>
                    <input type="text" id="lote" name="lote" class="form-control" placeholder="Lote">
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Data Validade</label>
                    <input name="data_validade" id="data_validade" type="date" class="form-control" min="<?php echo $dataHoje; ?>">
                </div>
                

          
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Data Compra</label>
                    <input name="data_compra" id="data_compra" type="date" class="form-control" max="<?php echo $dataHoje; ?>" required>
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
                </div>


            <input type="submit" class="btn btn-success" name="btnSubmitEstoque" value="Registrar Entrada">
        </form>
    </div>
</div>

<!-- Scripts para inicializar o Select2 e automação do código de barras -->
<script>
    (function() {
        function inicializarSelectProduto() {
            if (!window.jQuery || !window.jQuery.fn || typeof window.jQuery.fn.select2 !== 'function') {
                return;
            }

            var $select = window.jQuery('#select-produto');
            if (!$select.length || $select.hasClass('select2-hidden-accessible')) {
                return;
            }

            $select.select2({
                placeholder: 'Digite, escaneie ou selecione um produto...',
                allowClear: true,
                width: '100%'
            });
        }

        function aplicarValidacaoDatas() {
            var inputValidade = document.getElementById('data_validade');
            var inputCompra = document.getElementById('data_compra');

            if (!inputValidade || !inputCompra) {
                return;
            }

            var hoje = new Date().toISOString().slice(0, 10);
            inputValidade.min = hoje;
            inputCompra.max = hoje;

            inputValidade.addEventListener('change', function() {
                if (inputValidade.value && inputValidade.value < hoje) {
                    inputValidade.setCustomValidity('A data de validade não pode ser anterior à data de registo.');
                } else {
                    inputValidade.setCustomValidity('');
                }
            });

            inputCompra.addEventListener('change', function() {
                if (inputCompra.value && inputCompra.value > hoje) {
                    inputCompra.setCustomValidity('A data de compra não pode ser superior à data atual.');
                } else {
                    inputCompra.setCustomValidity('');
                }
            });
        }

        function aplicarCalculoPrecos() {
            var inputItensPacote = document.getElementById('qtNoPac');
            var inputCustoPacote = document.getElementById('preco_custo_pacote');
            var inputCustoItem = document.getElementById('preco_custo_item');
            var inputPercentual = document.getElementById('percentual_ganho');
            var inputPrecoVenda = document.getElementById('preco_venda_item');

            if (!inputItensPacote || !inputCustoPacote || !inputCustoItem || !inputPercentual || !inputPrecoVenda) {
                return;
            }

            function parseNumero(valor) {
                if (!valor) {
                    return 0;
                }

                var normalizado = valor.toString().replace(/\s/g, '').replace(',', '.');
                var numero = parseFloat(normalizado);
                return isNaN(numero) ? 0 : numero;
            }

            function formatarNumero(valor) {
                return (Math.round(valor * 100) / 100).toFixed(2);
            }

            function calcularCampos() {
                var itensPacote = parseNumero(inputItensPacote.value);
                var custoPacote = parseNumero(inputCustoPacote.value);
                var percentual = parseNumero(inputPercentual.value);

                if (itensPacote > 0 && custoPacote > 0) {
                    var custoItem = custoPacote / itensPacote;
                    inputCustoItem.value = formatarNumero(custoItem);

                    var precoVenda = custoItem + (custoItem * (percentual / 100));
                    inputPrecoVenda.value = formatarNumero(precoVenda);
                    return;
                }

                if (parseNumero(inputCustoItem.value) > 0) {
                    var custoManual = parseNumero(inputCustoItem.value);
                    var precoVendaManual = custoManual + (custoManual * (percentual / 100));
                    inputPrecoVenda.value = formatarNumero(precoVendaManual);
                }
            }

            inputItensPacote.addEventListener('input', calcularCampos);
            inputCustoPacote.addEventListener('input', calcularCampos);
            inputCustoItem.addEventListener('input', calcularCampos);
            inputPercentual.addEventListener('input', calcularCampos);

            calcularCampos();
        }

        window.addEventListener('load', inicializarSelectProduto);
        window.addEventListener('load', aplicarValidacaoDatas);
        window.addEventListener('load', aplicarCalculoPrecos);
    })();
</script>
