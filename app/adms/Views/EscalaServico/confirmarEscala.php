<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h2 class="display-4 titulo">Confirmar Presença no Serviço de Guarda</h2>
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
        <br><br>
      
<form name="listarEscala" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="listarEscala">
        <div class="form-row">


            <div class="form-group col-md-2">
              
                    <label><span class="text-danger">*</span>O militar realizou o serviço?</label> <br>
          <input type="radio" name="estadoServico" value="1" id="estadoServico" /> Realizou <br/>
          <input type="radio" name="estadoServico" value="2" id="estadoServico1" /> Não Realizou <br/>
                    <br>
                  <button
                  type="submit" class="btn btn-success" value="Guardar"
                  name="btnConfirmacao">Confirmar</button>
                 </div>
              
                <div class="form-group col-md-2" style="display: none;" id="data_trabalho">
                    <label><span class="text-danger">*</span> Data em que Trabalhou</label>
                    <input name="data_ultimo_servico" type="date" class="form-control" id="data_trab" value="<?php //echo date('d-m-y'); 
                    
                    ?>">
              </div> 
            <div class="form-group col-md-1">
            <label><span class="text-danger">*</span>Justificativa</label><br>
            <textarea name="observacao" cols="40" rows="3"> </textarea>  
                </div>

                
             </div>
           

            </form>

</div>
