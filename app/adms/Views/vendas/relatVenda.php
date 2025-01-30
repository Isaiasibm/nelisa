<?php
    header('Content-type: text/html; charset=utf-8');
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">

                <h3 class="display-2 titulo">Relatório das Vendas</h3>
            </div>

            <div class="p-2">
                <a href="<?php echo URLADM.'home/index/'?>" class="btn badge badge-danger btn-sm px-1"
                    style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-home"></i>Fechar</a>
            </div>
        </div>
        <hr style="color: #8fdc8f ">

        <form name="listarMeios" action="" method="post" enctype="multipart/form-data" autocomplete="off"
            id="listarEscala">
            <div class="form-row">

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span>Escolha o tipo de lista</label>
                    <select class="form-control" name="tipoLista" id="tipoLista" required="">
                        <option value=""> Selecione </option>
                        <option value="1"> Geral por data </option>
                        <option value="2"> Geral por intervalo de data </option>
                        <option value="3"> Por Usuário e data </option>
                        <option value="4"> Por Usuário e intervalo de data </option>


                    </select>
                </div>

                <div class="form-group col-md-3" style="display: none;" id="userDiv">
                    <label><span class="text-danger">*</span> Funcionário </label>
                    <select class="form-control" name="usuario" id="usuario">
                        <option>Selecione o Funcionário</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->exeRead('adms_usuarios');
                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $idNomeUser = $doc['id'].';'.$doc['nome'];
                            $NomeUser = $doc['nome'];
                            echo "<option value='$idNomeUser'>$NomeUser</option>";
                        endforeach;
                        ?>
                    </select>
                </div>

                <div class="form-group col-md-2" style="display: none;" id="dataInicialDiv">
                    <label><span class="text-danger">*</span> Data inicial </label>
                    <input type="date" class="form-control" name="dataInicial" id="dataInicial" value="">
                </div>
                <div class="form-group col-md-2" style="display: none;" id="dataFinalDiv">
                    <label><span class="text-danger">*</span> Data final </label>
                    <input type="date" class="form-control" name="dataFinal" id="dataFinal" value="">
                </div>



                <div class="form-group col-md-1">
                    <br>
                    <button type="submit" class="btn btn-success" value="btnListarVenda"
                        name="btnListarVenda">Listar</button>

                </div>

            </div>
        </form>

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

        <div class="form-row">

            <div class="form-group col-md-12">

                <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable">
                    <thead>
                        <tr>
                            <th>Nº</th>
                            <th>Nome do Produto</th>
                            <th>Tipo Produto</th>
                            <th>Preço Unit</th>
                            <th>Qtdade</th>
                            <th>Subtotal</th>
                            <th class="text-center">Ações</th>
                        </tr>

                    </thead>
                    <tbody>
                        <?php
        $totalVenda=0;
                        if(!empty($this->Dados['listVenda'])){
                           // var_dump($this->Dados['listVenda']);
                            $i=1;
                            foreach ($this->Dados['listVenda'] as $r)
                            {        
                                    extract($r);                                       
                                                                 
                                echo "<tr>
                                    
                                            <td class='tg-lboi'>$i </td>
                                            <td class='tg-lboi'>$nome_produto</td>
                                            <td class='tg-lboi'>$tipoProduto</td>
                                            <td class='tg-lboi'>$preco_venda</td>
                                            <td class='tg-lboi'>$quant</td>
                                            <td class='tg-lboi'>$subtotal Kz</td>
                                            <td class='tg-lboi'>Mais detalhes</td>   
                                    </tr>";
                                $i++;
                                $totalVenda += $subtotal;
                            }
                            ?>
                            <tr>
                   <td></td><th >Total vendido</th><td></td><td></td><td></td> 
                   <th style="text-align: right"><?php echo $totalVenda; ?> Kz </th>    <td></td> 
                    </tr>
                            <?php
                        }                        else {
                            echo "<tr><td class='tg-lboi' colspan='7'>O funcionário selecionado não realizou vendas no período selecionado! </td></tr>";  
                             }
                    ?>
                     
                    </tbody>
                </table>

            </div>

            <button class="btn btn-success btn-print">Relatório de vendas</button>
        </div>
        <div class="imprimir d-none">

            <div class="text-center"><img class="rounded-circle" src="<?php echo URLADM; ?>imagens/nelisa_img.jpeg"
                    width="70" height="100" style="text-align: center;"></div>
            <h4 style="text-align: center; padding: 0px; height: 15px;">Nelisa Farma</h4>


            <br>
            <h3 class="text-center mb-5 mt-5"> <b>Relatório das vendas realizadas por <?php echo $nome_user; ?> no dia <?php echo date("d/m/Y", strtotime($this->Dados["dataInicial"])); ?> </b>
            </h3>

            <table class="table table-striped table-hover table-bordered m-auto"
                style="box-shadow: 0px 0px 25px 0px rgba(0, 0, 0, 0.2); width: 900px; ">
                <thead>
                    <tr>
                        <th>Nº</th>
                        <th>Nome do Produto</th>
                        <th>Tipo Produto</th>
                        <th>Preço Unit</th>
                        <th>Qtdade</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
        
                        if(!empty($this->Dados['listVenda']) and count($this->Dados['listVenda']) > 0):
                            $i=1;
                            foreach ($this->Dados['listVenda'] as $r)
                            {        
                                    extract($r);                                       
                                                                
                                echo "<tr>
                                    
                                            <td class='tg-lboi'>$i </td>
                                            <td class='tg-lboi'>$nome_produto</td>
                                            <td class='tg-lboi'>$tipoProduto</td>
                                            <td class='tg-lboi'>$preco_venda</td>
                                            <td class='tg-lboi'>$quant</td>
                                            <td class='tg-lboi'>$subtotal</td>
      
                                    </tr>";

                                $i++;
                            }
                            ?>
                            <tr>
                   <td></td><th >Total vendido</th><td></td><td></td><td></td> 
                   <th style="text-align: right"><?php echo $totalVenda; ?> Kz </th>    
                    </tr>

                            <?php
                        else :  
                            echo "<tr> <td class='tg-lboi' colspan='6'>O funcionário selecionado não realizou vendas no período selecionado! </td></tr>";  
                        endif; 
                    ?>
                   
                </tbody>
            </table>

<br><br>

            <p class="text-center mt-4"> Luanda, aos <?php echo date("d/m/Y"); ?> </p>

  
    <p class="text-center mt-5"> O Responsável
                    </p>
    <p class="text-center">___________________________________
                    </p>

        </div>




    </div>





</div>
</div>