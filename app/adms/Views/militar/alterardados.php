<?php
if (!empty($this->Dados['Militar'])) :

    extract($this->Dados['Militar'][0]);

?>

    <!-- Dados do Formulario-->
    <?php

    if (isset($this->Dados['Militar'])) {
        $valorForm = $this->Dados['Militar'];
    }
    if (isset($this->Dados['Militar'][0])) {
        $valorForm = $this->Dados['Militar'][0];
    }
    ?>

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
                    <h2 class="display-4 titulo">Alterar dados do Militar</h2>
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


            <form name="EditMilitar" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="EditMilitar">
                <br><br>

                <div class="form-row" id="caixaDadosPessoais">

                    <div class="form-group col-md-4">
                        <label><span class="text-danger">*</span> Nome:</label>
                        <input name="nome" type="text" class="form-control" id="nome" placeholder="Escreva o Nome" value="<?php
                                                                                                                            if (isset($Nome)) : echo $Nome;
                                                                                                                            endif;
                                                                                                                            ?>" required="">
                    </div>

                    <div class="form-group col-md-2">
                        <label><span class="text-danger">*</span> Telefone:</label>
                        <input type="number" class="form-control" name="telefone" placeholder="Contacto telefónico" value="<?php
                                                                                                                            if (isset($Telefone)) : echo $Telefone;
                                                                                                                            endif;
                                                                                                                            ?>" required="">
                    </div>

                    <div class="form-group col-md-2">
                        <label><span class="text-danger">*</span>NIP</label>
                        <input type="number" class="form-control" placeholder="Escreva o NIP" name="nip" value="<?php
                                                                                                                if (isset($NIP)) : echo $NIP;
                                                                                                                endif;
                                                                                                                ?>" required="" id="nip">

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

                                if ($cod_ramo == $doc['Cod_Ramo']) :
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
                        <select class="form-control" id='SelectPatente' name="patente" required="" id="patente">
                            <option value="">Selecione</option>
                            <?php
                            $buscar = new \App\adms\Models\helper\AdmsRead();
                            $buscar->ExeRead('tb_patente');

                            foreach ($buscar->getResultado() as $posto) : ?>
                                <?php if ($valorForm['cod_ramo'] == 4) : ?>
                                    <option <?php echo $valorForm['Cod_Patente'] === $posto['Cod_Patente'] ? "selected='selected'" : ""; ?> value="<?= $posto['Cod_Patente'] ?>">
                                        <?= $posto['Patente_EMGA'] ?>
                                    </option>
                                <?php else : ?>
                                    <option <?php echo $valorForm['Cod_Patente'] === $posto['Cod_Patente'] ? "selected='selected'" : ""; ?> value="<?= $posto['Cod_Patente'] ?>">
                                        <?= $posto['Patente'] ?>
                                    </option>
                                <?php endif; ?>

                            <?php endforeach; ?>

                        </select>
                    </div>


                    <div class="form-group col-md-2">
                        <label><span class="text-danger">*</span>Disponibilidade</label>
                        <select class="form-control" name="disponidilidade" required="">
                            <option value="">Selecione</option>
                            <?php
                            $buscar = new \App\adms\Models\helper\AdmsRead();
                            $buscar->ExeRead('tb_disponibilidade');

                            foreach ($buscar->getResultado() as $militar) :
                                extract($militar);
                            ?>
                                <option <?php echo $valorForm['id_disponibilidade'] === $id_disponibilidade ? "selected='selected'" : ""; ?> value="<?= $id_disponibilidade ?>">
                                <?= $designacao_disponibilidade ?>
                            </option>
                            <?php endforeach; ?>

                        </select>
                    </div>




                    <div class="form-group col-md-2">
                        <label><span class="text-danger">*</span>Unidade</label>
                        <select class="form-control" name="unidade" required="" id="unidade" required="">
                            <option value="">Selecione</option>

                            <?php
                            $buscar = new \App\adms\Models\helper\AdmsRead();
                            $buscar->ExeRead('tb_u_e_o');

                            foreach ($buscar->getResultado() as $militar) :
                                extract($militar);
                            ?>
                                <option <?php echo $valorForm['Cod_Unidade'] === $Cod_Unidade ? "selected='selected'" : ""; ?> value="<?= $Cod_Unidade ?>">
                                <?= $Designacao_Unidade ?>
                            </option>
                            <?php endforeach; ?>

                        </select>
                    </div>


                    <div class="form-group col-md-2">

                        <label><span class="text-danger"></span> Último Data de Serviço</label>
                        <input name="data_ultimo_servico" type="date" class="form-control" value="">

                    </div>





                    <input type="hidden" name="cod_pessoa" id="cod_pessoa" value="<?php
                                                                                    if (isset($Cod_Pessoa)) : echo $Cod_Pessoa;
                                                                                    endif;
                                                                                    ?>">
                    <input type="hidden" name="cod_militar" id="cod_militar" value="<?php
                                                                                    if (isset($Cod_Militar)) : echo $Cod_Militar;
                                                                                    endif;
                                                                                    ?>">

                    <input type="hidden" name="nipescondido" id="nipescondido" value="<?php
                                                                                        if (isset($NIP)) : echo $NIP;
                                                                                        endif;
                                                                                        ?>">

                    <div class="form-group col-md-12"><br>
                        <span class="text-danger">* </span>Campo obrigatório
                    </div>


                    <div class="form-group col-md-12">

                        <button type="submit" class="btn btn-success" value="Guardar" name="SendEditMilitar" id="SendEditMilitar">Alterar</button>
                    </div>
            </form>
        </div>
    </div>


<?php endif; ?>