<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h5 class="display-4 titulo">Selecione os parâmetros de consulta</h5>
            </div>

            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/' ?>" class="btn badge badge-danger btn-sm px-1" style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-home"></i>Fechar</a>
            </div>

        </div>

        <form name="listarEscala" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="listarEscala">

            <div class="form-row">
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Tipo de lista</label>
                    <select class="form-control" name="tipoListaMilitar" id="tipoListaMilitar" required="">
                        <option value=""> Selecione </option>
                        <option value="1"> Lista Geral </option>
                        <option value="2">Por Unidade </option>
                        <option value="3"> Por Disponibilidade </option>
                        <option value="4"> Por Unidade e Disponibilidade </option>

                    </select>
                </div>

                <div class="form-group col-md-2" style="display: none;" id="ueo">
                    <label><span class="text-danger">*</span>Tipo de lista</label>
                    <select class="form-control" name="Unidade" id="unidade">
                        <option value=""> Selecione </option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_u_e_o');

                        foreach ($vis->getResultado() as $doc) :
                            extract($doc);
                            $Cod_Unidade = $doc['Cod_Unidade'];
                            $Designacao_Unidade = $doc['Designacao_Unidade'];
                        ?>
                            <option value="<?php echo $Cod_Unidade; ?> "><?php echo $Designacao_Unidade; ?></option>
                        <?php
                        endforeach;
                        ?>

                    </select>
                </div>

                

                <div class="form-group col-md-2" style="display: none;" id="disponib">
                    <label><span class="text-danger">*</span>Selecione a Disponibilidade</label>
                    <select class="form-control" name="disponibilidade" id="disponibilidade">
                        <option value="">
                            Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_disponibilidade');

                        foreach ($vis->getResultado() as $doc) :
                            extract($doc);
                            $id_disponibilidade = $doc['id_disponibilidade'];
                            $designacao_disponibilidade = $doc['designacao_disponibilidade'];
                        ?>
                            <option value="<?php echo $id_disponibilidade; ?> "><?php echo $designacao_disponibilidade; ?></option>";
                        <?php
                        endforeach;
                        ?>
                    </select>
                </div>

                <div class="form-group col-md-3">
                    <br>
                    <button type="submit" class="btn btn-success" value="Guardar" name="enviar">Listar</button>

                </div>


        </form>



        <?php
        //Apresentar a Lista

        if (isset($this->Dados['dadosMilitares'])) {
            # code...
        ?>
            <br>
            <hr style="border: 3px solid #8FBC8F ">


            <div class="d-flex">
                <div class="mr-auto p-2">

                    <?php
                    if (isset($this->Dados['tipoListaMilitar'])) {
                        // code...

                        if (($this->Dados['tipoListaMilitar'] == 1)) {
                            # code...

                    ?>
                            <h2 class="display-4 titulo badge badge-default">Relação nominal dos militares do EMG/FAA para o serviço de guarda
                            </h2>
                        <?php
                        }

                        elseif (($this->Dados['tipoListaMilitar'] == 2)) {
                            # code...

                    ?>
                            <h2 class="display-4 titulo badge badge-default">Relação nominal dos militares do EMG/FAA para o serviço de guarda por Unidade
                            </h2>
                        <?php
                        }

                        if (($this->Dados['tipoListaMilitar'] == 3)) {
                            # code...

                    ?>
                            <h2 class="display-4 titulo badge badge-default">Relação nominal dos militares do EMG/FAA para o serviço de guarda por Disponibilidade
                            </h2>
                        <?php
                        }

                        if (($this->Dados['tipoListaMilitar'] == 4)) {
                            # code...

                    ?>
                            <h2 class="display-4 titulo badge badge-default">Relação nominal dos militares do EMG/FAA para o serviço de guarda por Unidade e Disponibilidade
                            </h2>
                        <?php
                        }

                    } else {
                        ?>
                        <h2 class="display-4 titulo badge badge-default">Relação nominal dos militares do EMG/FAA para o serviço de guarda
                        </h2>
                    <?php
                    }
                    ?>
                </div>
            </div>


            <div class="mt-2 mb-2">
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
            </div>


            <?php

            if (!empty($this->Dados['dadosMilitares'])) :
            ?>
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable">

                        <style type="text/css">
                            th {
                                text-align: center;
                                vertical-align: middle;
                            }
                        </style>
                        <thead align="center">
                            <tr>
                                <th>#</th>
                                <th>Nip</th>
                                <th>Patente</th>
                                <th> Nome Completo</th>
                                <th>U/E/O</th>
                                <th>Último Data de Serviço</th>
                                <th>Disponibilidade</th>
                                <th> Ações </th>

                            </tr>

                        </thead>
                        <tbody>
                            <?php $Cont = 1;



                            foreach ($this->Dados['dadosMilitares'] as $escala) {

                                extract($escala);
                                if ($data_ultimo_servico == Null) {
                                    # code...
                                    $data_ultimo_servico = "Novo";
                                }

                            ?>
                                <tr>

                                    <td><?php echo $Cont; ?></td>
                                    <td><?php echo $NIP; ?></td>
                                    <td>
                                        <?php if ($cod_ramo == 4) : ?>
                                            <?php echo $Patente_EMGA; ?>
                                        <?php else : ?>
                                            <?php echo $Patente; ?>
                                        <?php endif; ?>

                                    </td>
                                    <td><?php echo $Nome; ?></td>
                                    <td><?php echo $Designacao_Unidade; ?></td>
                                    <td><?php echo $data_ultimo_servico; ?></td>
                                    <td><?php echo $designacao_disponibilidade; ?></td>


                                    <td class="text-center">
                                        <div class="dropdown show">
                                            <a class="btn btn-success dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Acções
                                            </a>
                                            <?php
                                            $idNip = $NIP;
                                            ?>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                <a class="dropdown-item" href="<?php echo URLADM . 'ControleMilitar/visualizarMilitar/' . $idNip; ?>">Mais detalhes</a>
                                                <!--<a class="dropdown-item" href="<?php echo URLADM . 'controleEscalaServico/alterData/' . $idNip; ?>">Alterar Disponibilidade</a>
                                                <a class="dropdown-item" href="<?php echo URLADM . 'controleEscalaServico/confirmarPresenca/' . $idNip; ?>">Estado da Escala de Serviço</a>-->
                                                <a class="dropdown-item" href="<?php echo URLADM . 'ControleMilitar/editarDadosMilitar/' . $idNip; ?>">Alterar Dados</a>


                                            </div>


                                        </div>
                                    </td>
                                </tr>

                            <?php $Cont++;
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
        <?php

            else :

                echo "Não existem dados para os parâmetros escolhidos";
            endif;
        }

        ?>

    </div>
</div>