<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h2 class="display-4 titulo badge badge-default" style="color: black;">Registar Saídas</h2>
            </div>
            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/' ?>" class="btn btn-outline-info btn-sm">Fechar</a>
            </div>
        </div>

        <?php
        if (isset($_SESSION['msgcad'])) {
            echo $_SESSION['msgcad'];
            unset($_SESSION['msgcad']);
        }
        ?>

        <br>
        <b> DADOS DA SAÍDA</b>
        <hr style="border: 1px solid #8FBCF ">

        <form action="" method="post">
            <div class="form-row">
       

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Tipo de Saída:</label>
                    <select name="id_tipo_saida" class="form-control" required>
                        <option value="">Selecione o Tipo</option>
                        <?php
                        $tipoSaida = new \App\adms\Models\helper\AdmsRead();
                        $tipoSaida->ExeRead('tb_tipo_saida');
                        foreach ($tipoSaida->getResultado() as $tipo_saida) {
                            echo "<option value='{$tipo_saida['id']}'>{$tipo_saida['descricao']}</option>";
                        }
                        ?>
                    </select>
                </div>

            <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Quanto Custou:</label>
                    <input type="text" name="valor_saida" class="form-control" required>
                </div>

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Data da saída:</label>
                    <input type="date" name="data_saida" class="form-control" required>
                </div>
                 

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Descrição da saída:</label>
                    <input type="text" name="descricao_saida" class="form-control" required>
                </div>
                </div>

<div class="form-row">

            
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Responsável pela saída:</label>
                    <select name="responsavel_saida" class="form-control">
                        <option value="">Selecione</option>
                        <?php
                        $localizacoes = new \App\adms\Models\helper\AdmsRead();
                        $localizacoes->ExeRead('tb_pessoa');
                        foreach ($localizacoes->getResultado() as $loc) {
                            echo "<option value='{$loc['Cod_Pessoa']}'>{$loc['Nome']}</option>";
                        } 
                        ?>
                    </select>
                </div>

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Pessoa que Autorizou a saída:</label>
                    <select name="quem_autorizou" class="form-control">
                        <option value="">Selecione</option>
                        <?php
                        $localizacoes = new \App\adms\Models\helper\AdmsRead();
                        $localizacoes->ExeRead('tb_pessoa');
                        foreach ($localizacoes->getResultado() as $loc) {
                            echo "<option value='{$loc['Cod_Pessoa']}'>{$loc['Nome']}</option>";
                        }
                        ?>
                    </select>
                </div>
 
            </div>

                     <div class="form-group">
                     <button type="submit" class="btn btn-success float-left" value="Guardar" name="btnSubmitSaida" style="border-radius:7px 7px;"><i class="fas fa-save fa-1x"></i>&nbsp;&nbsp;Guardar </button>
                     </div>
                     <br>
        </form>
    </div>
</div>


