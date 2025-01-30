<script type="text/javascript">
    function letras() {
        tecla = event.keyCode;
        if (tecla >= 48 && tecla <= 57) {
            return false;
        } else {
            return true;
        }
    }
</script>


<script language='JavaScript'>
    function SomenteNumero(e) {
        var tecla = (window.event) ? event.keyCode : e.which;
        if ((tecla > 47 && tecla < 58)) return true;
        else {
            if (tecla == 8 || tecla == 0) return true;
            else return false;
        }
    }
</script>


<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h2 class="display-4 titulo" align="center">Registo de Militar</h2>
            </div>

            <div class="p-2">
                <a href="<?php echo URLADM . 'ControleMilitar/editarDadosMilitar' ?>" class="btn btn-outline-warning btn-sm">Editar Dados</a>
            </div>

            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/' ?>" class="btn btn-outline-info btn-sm">Fechar</a>
            </div>


        </div>

        <?php

        if (isset($_SESSION['msg'])) :
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        endif;

        if (isset($_SESSION['msgcad'])) :
            echo $_SESSION['msgcad'];
            unset($_SESSION['msgcad']);
        endif;
        ?>
        <b> DADOS PESSOAIS</b>
        <hr style="border: 1px solid #8FBC8F ">
        <form name="CadMilitar" action="" method="post" enctype="multipart/form-data" autocomplete="off">

            <div class="form-row" hidden="">
                <div class="form-group col-md-9">

                </div>
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Foto:</label><br>
                    <?php
                    $imagem_antiga = URLADM . 'assets/imagens/usuario/preview_img.png';

                    $icone_uploada_foto = URLADM . 'assets/imagens/usuario/icone_uploada_foto.png';

                    ?>
                    <img src="<?php echo $imagem_antiga; ?>" alt="Imagem do Especialista" id="preview-user" class="img-thumbnail" style="width: 150px; height: 150px;"><br>
                    <input name="imagem_nova" type="file" onchange="previewImagem();" id="imagem_nova" style="display: none;" accept="image/*">
                    <a href="#" class="btnfoto"><img width="30" height="30" src="<?php echo $icone_uploada_foto; ?>"></a>
                </div>

            </div>

            <div class="form-row">
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Nome:</label>
                    <input name="nome" type="text" class="form-control" id="nome" placeholder="Escreva o Nome" value="" required="">
                </div>



                <div class="form-group col-md-2">
                    <label><span class="text-danger"></span> Telefone:</label>
                    <input type="number" class="form-control" name="telefone" placeholder="Contacto telefónico" value="">
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>NIP</label>
                    <input type="number" class="form-control" placeholder="Escreva o NIP" name="nip" value="" required="">
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Ramo</label>
                    <select class="form-control" id='SelectRamo' name="ramo" required="">
                        <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_ramo', 'WHERE Cod_Ramo <> 1');

                        foreach ($vis->getResultado() as $doc) :
                            extract($doc);
                            $Cod_Patente = $doc['Cod_Ramo'];
                            $designacao_ramo = $doc['Designacao_Ramo'];



                            if ($valorForm['Cod_Ramo'] != $id) :
                                $selecionado = "selected";
                            else :

                                $selecionado = "";
                            endif;
                            echo "<option value='$Cod_Patente' $selecionado>$designacao_ramo</option>";
                        endforeach;
                        ?>
                    </select>
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Posto</label>
                    <select class="form-control" id='SelectPatente' name="patente" required="">
                        <option value="">Selecione</option>
                       
                    </select>
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Disponibilidade</label>
                    <select class="form-control" name="disponidilidade" required="">
                        <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_disponibilidade');

                        foreach ($vis->getResultado() as $doc) :
                            extract($doc);
                            $id_disponibilidade = $doc['id_disponibilidade'];
                            $designacao_disponibilidade = $doc['designacao_disponibilidade'];

                            if ($valorForm['id_disponibilidade'] != $id) :
                                $selecionado = "selected";
                            else :

                                $selecionado = "";
                            endif;
                            echo "<option value='$id_disponibilidade' $selecionado>$designacao_disponibilidade</option>";
                        endforeach;
                        ?>
                    </select>
                </div>




                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Unidade</label>
                    <select class="form-control" name="unidade" required="" id="unidade" required="">
                        <option value="">Selecione</option>

                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_u_e_o');

                        foreach ($vis->getResultado() as $doc) :
                            extract($doc);
                            $cod_ramo = $doc['Cod_Unidade'];
                            $designacao_ramo = utf8_encode($doc['Designacao_Unidade']);

                            if ($valorForm['Cod_Unidade'] != $id) :
                                $selecionado = "selected";
                            else :

                                $selecionado = "";
                            endif;
                            echo "<option value='$Cod_Unidade' $selecionado>$Designacao_Unidade</option>";
                        endforeach;
                        ?>

                    </select>
                </div>


                <div class="form-group col-md-2">

                    <label><span class="text-danger"></span> Último Data de Serviço</label>
                    <input name="data_ultimo_servico" type="date" class="form-control" value="">

                </div>

                <div class="form-group col-md-12"><br>
                    <span class="text-danger">* </span>Campo obrigatório
                </div>

                <div class="form-group col-md-12">
                    <button type="submit" class="btn btn-success" value="Guardar" name="SendCadMilitar">Guardar</button>
                </div>

                
            </div>