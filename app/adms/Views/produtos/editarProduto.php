<?php
if (isset($this->Dados['form'])) {
    $valorForm = $this->Dados['form'];
}
if (isset($this->Dados['form'][0])) {
    $valorForm = $this->Dados['form'][0];
}
//var_dump($this->Dados['select']);
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h2 class="display-4 titulo">Editar Página</h2>
            </div>

            <?php
            if ($this->Dados['botao']['vis_pagina']) {
                ?>
                <div class="p-2">
                    <a href="<?php echo URLADM . 'ver-pagina/ver-pagina/' . $valorForm['id']; ?>" class="btn btn-outline-primary btn-sm">Visualizar</a>
                </div>
                <?php
            }
            ?>

        </div><hr>
        <?php
        if (isset($_SESSION['msg'])) {
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        }
        ?>
        <form method="POST" action="" enctype="multipart/form-data"> 
            <input name="id_produto" type="hidden" value="<?php
            if (isset($valorForm['id_produto'])) {
                echo $valorForm['id_produto'];
            }
            ?>">


<div class="form-row">
            <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Código de Barra:</label>
                    <input name="bar_code" type="text" class="form-control" id="bar_code" autocomplete="no" placeholder="Escreva o código de barra" required="" value="<?php
                    if (isset($valorForm['bar_code'])) {
                        echo $valorForm['bar_code'];
                    }
                    ?>">
                </div>
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Nome do Produto:</label>
                    <input name="nome_produto" type="text" class="form-control" id="nome_produto" autocomplete="no" placeholder="Escreva o Nome do Produto" required=""value="<?php
                    if (isset($valorForm['nome_produto'])) {
                        echo $valorForm['nome_produto'];
                    }
                    ?>">
                </div>
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Descrição do Produto:</label>
                    <input type="text"  class="form-control" name="descricao_produto" autocomplete="no" placeholder="Escreva uma descrição"  id="descricao_produto"value="<?php
                    if (isset($valorForm['descricao_produto'])) {
                        echo $valorForm['descricao_produto'];
                    }
                    ?>">
                </div>
                <div class="form-group col-md-3">
                        <label><span class="text-danger">*</span>Categoria do Produto</label>
                        <select class="form-control" name="id_categoria" required="" id="id_categoria">
                            <option value="">Selecione a Categoria</option>
                            <?php
                            $vis = new \App\adms\Models\helper\AdmsRead();
                            $vis->ExeRead('tb_categorias_produto');

                            foreach ($vis->getResultado() as $doc):
                                extract($doc);
                                $codCateg = $doc['id_categoria'];
                                $descCategoria = $doc['nome'];
                                echo "<option value='$codCateg'>$descCategoria</option>";
                            endforeach;
                            ?>
                        </select>
                </div> 

                
              </div>
            <div class="form-row">
            <div class="form-group col-md-3">
                        <label><span class="text-danger">*</span>Tipo de Produto</label>
                        <select class="form-control" name="id_tipo_produto" required="" id="id_tipo_produto"value="<?php
                    if (isset($valorForm['nome_pagina'])) {
                        echo $valorForm['nome_pagina'];
                    }
                    ?>">
                            <option value="">Selecione o tipo</option>
                            <?php
                            $vis = new \App\adms\Models\helper\AdmsRead();
                            $vis->ExeRead('tb_tipo_produto');

                            foreach ($vis->getResultado() as $doc):
                                extract($doc);
                                $idTipo = $doc['id'];
                                $descricaoTipo = $doc['descrição'];
                                echo "<option value='$idTipo'>$descricaoTipo</option>";
                            endforeach;
                            ?>
                        </select>
                </div> 
                    
                    

                  
            
               
            <div class="form-group col-md-3">
                        <label><span class="text-danger">*</span>Fabricante</label>
                        <select class="form-control" name="id_fabricante" required="" id="id_fabricante">
                            <option value="">Selecione o tipo</option>
                            <?php
                            $vis = new \App\adms\Models\helper\AdmsRead();
                            $vis->ExeRead('tb_fabricante');

                            foreach ($vis->getResultado() as $doc):
                                extract($doc);
                                $idTipo = $doc['id'];
                                $descricaoTipo = $doc['nome_fabricante'];
                                echo "<option value='$idTipo'>$descricaoTipo</option>";
                            endforeach;
                            ?>
                        </select>
                </div>  


                

<div class="form-group col-md-3">
    <label><span class="text-danger">*</span> Qtdade de Itens </label>
    <input type="number" id="qtNoPac" name="quantidade_total" class="form-control" value="<?php
                    if (isset($valorForm['quantidade_total'])) {
                        echo $valorForm['quantidade_total'];
                    }
                    ?>">
</div>

<div class="form-group col-md-3"> 
    <label><span class="text-danger">*</span> Preço Compra do Pacote</label>
    <input name="preco_custo" type="text" class="form-control" placeholder="Informe o preço de compra" id="preco_custo_pacote" value="<?php
                    if (isset($valorForm['nome_pagina'])) {
                        echo $valorForm['nome_pagina'];
                    }
                    ?>">
</div>

<div class="form-group col-md-3">
    <label><span class="text-danger">*</span> Preço Compra do Item</label>
    <input name="preco_custo" type="text" class="form-control" placeholder="Informe o preço de compra" id="preco_custo_item" required value="<?php
                    if (isset($valorForm['nome_pagina'])) {
                        echo $valorForm['nome_pagina'];
                    }
                    ?>">
</div>

<div class="form-group col-md-3">
    <label><span class="text-danger">*</span> Preço Venda do Item</label>
    <input name="preco_venda" type="text" class="form-control" placeholder="Informe o preço de compra" id="preco_venda_item" required value="<?php
                    if (isset($valorForm['nome_pagina'])) {
                        echo $valorForm['nome_pagina'];
                    }
                    ?>">
</div>

<div class="form-group col-md-2">
<label><span class="text-danger">*</span> Fornecedor</label>
<select class="form-control" name="fornecedor" id="fornecedor" required value="<?php
                    if (isset($valorForm['tipoProduto'])) {
                        echo $valorForm['tipoProduto'];
                    }
                    ?>">
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
<select class="form-control" name="estado" id="estado" required value="<?php
                    if (isset($valorForm['nome_pagina'])) {
                        echo $valorForm['nome_pagina'];
                    }
                    ?>">
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
    <input type="text" id="lote" name="lote" class="form-control" value="<?php
                    if (isset($valorForm['nome_pagina'])) {
                        echo $valorForm['nome_pagina'];
                    }
                    ?>">
</div>
</div>

<input type="submit" class="btn btn-success" name="btnSubmitEstoque" value="Registrar Entrada">
</form>
</div>
</div>
               
  </div>










                <div class="form-group col-md-6">
                    <label><span class="text-danger">*</span> Situação da Página</label>
                    <select name="adms_sit_id" id="adms_sit_id" class="form-control">
                        <option value="">Selecione</option>
                        <?php
                        foreach ($this->Dados['select']['sit'] as $sit) {
                            extract($sit);
                            if ($valorForm['adms_sit_id'] == $id_sit) {
                                echo "<option value='$id_sit' selected>$nome_sit</option>";
                            } else {
                                echo "<option value='$id_sit'>$nome_sit</option>";
                            }
                        }
                        ?>
                    </select>
                    </select>
                </div>
         


            <p>
                <span class="text-danger">* </span>Campo obrigatório
            </p>
            <input name="EditProduto" type="submit" class="btn btn-warning" value="Salvar">
        </form>
    </div>
</div>
