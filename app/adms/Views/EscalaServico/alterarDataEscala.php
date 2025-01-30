<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h2 class="display-4 titulo">Alterar a data da escala do militar</h2>
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
                    <label><span class="text-danger">*</span> Data a Escalar</label>
                    <input name="dataNova" type="date" class="form-control" value="<?php echo("2021-09-06"); 
                    
                    ?>">
              </div> 
          
            <div class="form-group col-md-2">
            <label><span class="text-danger">*</span>Motivo da alteração</label><br>
            <textarea name="observacao"> </textarea>  
                </div>

                    <div class="form-group col-md-2">
                        <br><br>
                  <button
                  type="submit" class="btn btn-success" value="Guardar"
                  name="btnConfirmacao">Confirmar</button>
                 </div>

                
             </div>
           

            </form>

</div>
