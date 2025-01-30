<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
           
            <div class="mr-auto p-2 resposta">
               <h2 class="display-4 titulo badge badge-default" style="color: black;">Registo de Produto</h2>
            </div>

                <div class="p-2">
                  <a href="<?php echo URLADM.'home/index/'?>" class="btn btn-outline-info btn-sm">Fechar</a>
                </div>


        </div>

        <?php

        if (isset($_SESSION['msg'])):
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        endif;

        if (isset($_SESSION['msgcad'])):
            echo $_SESSION['msgcad'];
            unset($_SESSION['msgcad']);
        endif;
         
        ?>

        <br>
        <b> DADOS DO PRODUTO</b>
        <hr style="border: 1px solid #8FBC8F ">


        <form action="" method="post" enctype="" name="" id="">
            <!--Seccao 1-->    
            <div class="form-row">
            <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Código de Barra:</label>
                    <input name="bar_code" type="text" class="form-control" id="bar_code" autocomplete="no" placeholder="Escreva o código de barra" required="">
                </div>
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Nome do Produto:</label>
                    <input name="nome_produto" type="text" class="form-control" id="nome_produto" autocomplete="no" placeholder="Escreva o Nome do Produto" required="">
                </div>
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Descrição do Produto:</label>
                    <input type="text"  class="form-control" name="descricao_produto" autocomplete="no" placeholder="Escreva uma descrição"  id="descricao_produto">
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
            <div class="form-group col-md-4">
                        <label><span class="text-danger">*</span>Tipo de Produto</label>
                        <select class="form-control" name="id_tipo_produto" required="" id="id_tipo_produto">
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
                      <div class="form-group col-md-2">
                          <label><span class="text-danger">*</span> Qtdade no Pacote:</label>
                          <input type="text"  class="form-control" name="quantPacote" autocomplete="no" placeholder="Escreva a quantidade"   required="" id="quantPacote">
                      </div>
                      <div class="form-group col-md-2">
                          <label><span class="text-danger">*</span> Preço de Compra:</label>
                          <input type="text"  class="form-control" name="preco_compra" autocomplete="no" placeholder="Escreva o Preço da compra"   required="" id="preco_compra">
                      </div>

                      <div class="form-group col-md-2">
                          <label><span class="text-danger">*</span> Preço de Venda:</label>
                          <input type="text"  class="form-control" name="preco_venda" autocomplete="no" placeholder="Escreva o Preço da venda"   required="" id="preco_venda">
                      </div>
                      <div class="form-group col-md-2">
                          <label><span class="text-danger">*</span> Qtdade de Ítens:</label>
                          <input type="text"  class="form-control" name="quantidade_estoque" autocomplete="no" placeholder="Escreva a quantidade de produtos"   required="" id="quantidade_estoque">
                      </div>
            
                      </div>

                      <div class="form-row">    

                  
            
               
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
                <div class="form-group col-md-3"  >
                    <label><span class="text-danger">*</span> Fornecedor </label>
                    <select class="form-control" name="id_forncedor" id="id_forncedor">
                        <option value=""> Selecione </option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_fornecedores');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $codFOrnecedor = $doc['id_fornecedor'];
                            $nomeFornecedor = $doc['nome'];

                            echo "<option value='$codFOrnecedor'>$nomeFornecedor</option>";
                        endforeach;
                        ?>
                    </select>
                </div>            
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Data de Fabrico </label>
                    <input type="date"  class="form-control" name="data_fabrico" id="data_fabrico"  value="">
                </div>

     
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Data de Validade </label>
                    <input type="date"  class="form-control" name="data_validade" id="data_validade"  value="<?php
                    if (isset($this->Dados['data_validade'])): echo $this->Dados['data_validade'];
                    endif;
                    ?>" required="">
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Data de Compra </label>
                    <input type="date"  class="form-control" name="data_compra" id="data_fabrico"  value="">
                </div>


                      
               
  </div>
            
          
  <div class="form-row">             
        
                <div class=" form-group col-md-2">  <br>
                <button type="submit" class="btn btn-success float-left" value="Guardar" name="btnSubmitProduto" style="border-radius:7px 7px;"><i class="fas fa-save fa-1x"></i>&nbsp;&nbsp;Guardar </button>
                       
                    
                </div>
  </div>

                      
        </form>
    </div>

</div>