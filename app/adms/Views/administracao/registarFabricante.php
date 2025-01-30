<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
           
            <div class="mr-auto p-2 resposta">
               <h2 class="display-4 titulo badge badge-default" style="color: black;">Registo de Fabricante</h2>
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
        <b> DADOS DO Fabricante</b>
        <hr style="border: 1px solid #8FBC8F ">


        <form action="" method="post" enctype="" name="" id="">
            <!--Seccao 1-->    
            <div class="form-row">
            <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Nome do fabricante:</label>
                    <input name="fabricante" type="text" class="form-control" id="fabricante" autocomplete="no" placeholder="Escreva o nome do fabricante" required="">
                </div>
               
                  
               
  </div>
            
          
  <div class="form-row">             
        
                <div class=" form-group col-md-2">  <br>
                <button type="submit" class="btn btn-success float-left" value="Guardar" name="btnSubmitFabricante" style="border-radius:7px 7px;"><i class="fas fa-save fa-1x"></i>&nbsp;&nbsp;Guardar </button>
                       
                    
                </div>
  </div>

                      
        </form>
    </div>

</div>