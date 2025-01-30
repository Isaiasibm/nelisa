
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h2 class="display-4 titulo">Imprimir Escala de Serviço</h2>
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
        <br><br><br>
        <form name="processarEsalaServico" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="imprimirEscalaServico">
        <div class="form-row">


            <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Tipo de serviço</label>
                    <select class="form-control" name="tipoServico" required="">
                        <option value="">
                        Selecione</option>
                         <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_tiposervico');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $codTipoSer = $doc['id'];
                            $tipoSer = $doc['tipo_servico'];
                          ?>
                             <option value="<?php echo $codTipoSer.'-'.$tipoSer;?> "><?php echo $tipoSer;?></option>";
                        <?php
                        endforeach;
                        ?>
                    </select>
                </div> 
                  <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Selecione o ano</label>
                    <select class="form-control" name="ano" required="">
                        <option value="">Ano </option>
                        <?php
       for ($anoInicio = date('Y') +1 ; $anoInicio >= date('Y') -1; $anoInicio--)
       {
          echo '<option value="'.$anoInicio.'">'.$anoInicio.'</option>';
       }
    ?>
                       

                    </select>
                </div> 

                
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Escolha o mês</label>
                    <select name="mes" required="" class="form-control">

                        <option value="">Selecione o mês</option>
                        <option value="1-Janeiro">Janeiro</option>
                        <option value="2-Fevereiro">Fevereiro</option>
                        <option value="3-Março">Março</option>
                        <option value="4-Abril">Abril</option>
                        <option value="5-Maio">Maio</option>
                        <option value="6-Junho">Junho</option>
                        <option value="7-Julho">Julho</option>
                        <option value="8-Agosto">Agosto</option>
                        <option value="9-Setembro">Setembro</option>
                        <option value="10-Outubro">Outubro</option>
                        <option value="11-Novembro">Novembro</option>
                        <option value="12-Dezembro">Dezembro</option>
                                               
                    </select>
                </div>
              </div>
              
                      <div class="form-row">


                <div class="form-group col-md-3">
                  <br>
                  <span class="text-danger"> * </span> Campo obrigatório &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button
                  type="submit" class="btn btn-success" value="Guardar"
                  name="enviar"> Submeter Dados </button>
                    
                </div>
             
            </div>

            </form>

         </div>
</div>
