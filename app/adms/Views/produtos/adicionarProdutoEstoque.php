<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h2 class="display-4 titulo badge badge-default" style="color: black;">Adicionar Produto ao Estoque</h2>
            </div>
            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/' ?>" class="btn btn-outline-info btn-sm">Fechar</a>
            </div>
        </div>

        <?php
        if (isset($_SESSION['msg'])) {
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        }
        ?>

        <br>
        <b> DADOS DO PRODUTO</b>
        <hr style="border: 1px solid #8FBCF ">

        <form action="" method="post">
            <div class="form-row">
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

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Código de Barras:</label>
                    <input type="text" class="form-control" id="bar_code" readonly>
                </div>

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Fornecedor:</label>
                    <select name="id_fornecedor" class="form-control" required>
                        <option value="">Selecione o fornecedor</option>
                        <?php
                        $fornecedores = new \App\adms\Models\helper\AdmsRead();
                        $fornecedores->ExeRead('tb_fornecedores');
                        foreach ($fornecedores->getResultado() as $fornecedor) {
                            echo "<option value='{$fornecedor['id_fornecedor']}'>{$fornecedor['nome']}</option>";
                        }
                        ?>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Quantidade de Pacotes Comprados:</label>
                    <input type="number" name="quant_pacotes" class="form-control" min="1" required>
                </div>

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Itens por Pacote:</label>
                    <input type="number" name="itens_por_pacote" class="form-control" min="1" required>
                </div>

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Preço de Compra do Pacote:</label>
                    <input type="text" name="preco_pacote" class="form-control" required>
                </div>

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Data de Validade:</label>
                    <input type="date" name="data_validade" class="form-control" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label><span class="text-danger">*</span> Localização no Estoque:</label>
                    <select name="id_localizacao" class="form-control">
                        <option value="">Selecione</option>
                        <?php
                        $localizacoes = new \App\adms\Models\helper\AdmsRead();
                        $localizacoes->ExeRead('tb_localizacoes_estoque');
                        foreach ($localizacoes->getResultado() as $loc) {
                            echo "<option value='{$loc['id_localizacao']}'>{$loc['nome_localizacao']}</option>";
                        }
                        ?>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Guardar</button>
            </div>
        </form>
    </div>
</div>


