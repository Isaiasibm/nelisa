<?php
    header('Content-type: text/html; charset=utf-8');
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">

                <h3 class="display-2 titulo">Listar Saídas</h3>
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
                        <option value="1"> Geral </option>
                        <option value="2"> Saídas por Funcionário</option>
                        <option value="3"> Por data de compra </option>
                        <option value="4"> Por data de registo </option>


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
<?php
    header('Content-type: text/html; charset=utf-8');
?>

        <hr style="color: #8fdc8f ">
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
                    <th>#</th>                    
                    <th > Tipo de Saída </th>
                    <th > Valor Kz</th>
                    <th >Data</th>
                    <th>Descrição</th>
                    <th >Destinatário</th>
                    <th >Responsável</th>
                    <th >Quem Autorizou</th>
                    <th >Estado da Saída</th>
                    <th>Acções</th>
                </tr>
            </thead>
            <tbody>
        <?php
        
            if(!empty($this->Dados['listSaida'])):
                $i=1;
                //  var_dump($this->Dados['listEstoque']);
                // $relatorio  = new \App\adms\Models\ModelsPaciente();  
                foreach ($this->Dados['listSaida'] as $r)
                {        
                        extract($r);                                       
                                                    
                    echo "<tr>
                   




                        <td class='tg-lboi'>$i</td>


                            <td class='tg-lboi'>$id_tipo_saida</td>
                            
                            <td class='tg-lboi'>$valor Kz</td>
                            <td class='tg-lboi'>$data_saida </td>
                            <td class='tg-lboi'>$descricao</td>
                            <td class='tg-lboi'>$nome_destinatario</td>
                             <td class='tg-lboi'>$nome_responsavel_saida</td>
                              <td class='tg-lboi'>$nome_autorizou</td>
                            <td class='tg-lboi'>$id_estado_saida</td>
                   
     
                     
                           
                            
                               <td class='text-center'>
                                        <div class='dropdown show'>
                                            <a class='btn btn-success dropdown-toggle' href='#' role='button' id='dropdownMenuLink' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                                                Acções
                                            </a>
                                         

                                            <div class='dropdown-menu' aria-labelledby='dropdownMenuLink'>
                                                <a class='dropdown-item' href='<?php echo URLADM . 'ControleMilitar/visualizarMilitar/' . $id;'>Mais detalhes</a>
                                                <a class='dropdown-item' href=' URLADM . 'controleEscalaServico/alterData/' . $id;'>Adicionar Estoque</a>
                                               
                                               

                                            </div>


                                        </div>
                                    </td>




                         </tr>";

                         
                    $i++;
                }
            else :  
                echo '<tr><td class="tg-lboi" colspan="15">Não existem produtos em estoque! </td></tr>';  
            endif; 
                    ?>
            </tbody>
        </table>

    </div>
</div> 




</div>
</div>