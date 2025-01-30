<html>

    <script src="<?php echo URLADM . 'assets/js/slim.min.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/popper.min.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/bootstrap.min.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/dashboard.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/jquery-3.2.1.min.js'; ?>"></script>


    <div class="content p-1">
        <div class="list-group-item">
            <div class="d-flex">
                <div class="mr-auto p-2">
                    <h2 class="display-4 titulo">Relatórios</h2>
                </div>

                <a href="<?php echo URL; ?>controle-home/index">
                    <div class="p-2">
                        <button class="btn btn-outline-danger btn-sm">
                            Fechar
                        </button>
                    </div>
                </a>


            </div>
            <?php
            ?>
            <hr>

            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Tipos de Relatórios</a>
                </li>




                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"> Descritivos</a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Estatisticos</a>
                </li>
            </ul>

            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">Angola</div>



                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                    <div class="mr-auto p-2">
                        <h2 class="display-4 titulo">Relatórios de Infractores Por Parametros</h2>
                    </div>



                    <form name="CadProcesso" action="<?php echo URL; ?>relatorios/reporInfracNip.php/" method="post" enctype="multipart/form-data" >
                        
            
                     
                        <div class="form-row">
                            <div class="form-group col-md-3">

                                <select class="form-control" name="infra_param" id="infra_param">
                                    <option value="">Selecione</option>
                                    <option value="1">Nip</option>
                                    <option value="2">Patente</option>

                                </select> 
                            </div>

                        </div>

                        <div class="form-row"  id="nip" style="display: none;">
                            <div class="form-group col-md-2"  >
                                <label><span class="text-danger">*</span> Nip</label>
                                <input type="text"  class="form-control" name="$nip"  maxlength="9"     placeholder="Digite o Nip" value="">
                            </div>

                        </div>



                        <input type="hidden" name="created" value="<?php echo date("Y-m-d H:i:s"); ?>" >

                        <p>
                            <span class="text-danger">* </span>Campo obrigatório
                        </p>
                        <button type="submit" class="btn btn-success" value="Guardar" name="SendCadProcesso">Guardar</button>


                        <input type="text" id="angola" hidden >
                 

                    </form>


                </div>
                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">LUBANGO</div>
            </div>



        </div>
    </div>

            <script type="text/javascript">

                            $('#infra_param').change(function () {
                                var valor = $(this).val();
                               
                                if (valor == 1) {
 //alert(valor);
                                 $('#nip').show();
                                } else {
                                 $('#nip').hide();
                                }

                            });

                        </script>

</html>
