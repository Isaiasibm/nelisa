<script type="text/javascript">

function letras(){
  tecla = event.keyCode;
  if (tecla >= 48 && tecla <= 57){
      return false;
  }else{
     return true;
  }
}

</script>


  <script language='JavaScript'>
 function SomenteNumero(e)
 {
    var tecla=(window.event)?event.keyCode:e.which;   
    if((tecla>47 && tecla<58)) return true;
    else{
      if (tecla==8 || tecla==0) return true;
  else  return false;
   }
}

</script>
<style type="text/css">
    .selectpersonalizada{

        width: 100%;
    }
</style>


<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
               <h2 class="display-4 titulo badge badge-default" style="color: black;">Registo de Fornecedor</h2>
            </div>


                <div class="p-2">
                    <a href="<?php echo URLADM.'home/index/'?>" class="btn badge badge-danger btn-sm px-1"
                  style="font-size: 10pt; border-radius:7px 7px;">
                      <i class="fas fa-home"></i>Fechar</a>
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
        ?><br><br>
        <b> DADOS DO FORNECEDOR</b>
        <hr style="border: 1px solid #8FBC8F ">
        <!--hr style="color: #8fdc8f "-->

        <form action="" method="post" enctype="" name="" id="">
            <!--Seccao 1-->    
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Nome:</label>
                    <input name="nome" type="text" class="form-control" id="nome" autocomplete="no" placeholder="Escreva o Nome" required="" id="nome">
                </div>
                

                <div class="form-group col-md-2"  >
                    <label><span class="text-danger">*</span>NIF: </label>
                    <input type="text"   class="form-control" id="nif"  name="nif" placeholder="Insira o NIF">
                </div> 
                               
                

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Endereço completo:</label>
                    <input name="endereco" type="text" class="form-control" id="endereco" autocomplete="no" placeholder="Escreva o endereço" required="">
                </div> 
            
                <div class="form-group col-md-2"  >
                    <label><span class="text-danger">*</span> Telefone </label>
                    <input type="text"  pattern="[0-9]{9}" class="form-control" id="telefone" name="telefone" placeholder="Insira o telefone" maxlength="9">
                </div> 
               
                <div class="form-group col-md-3"  >
                    <label><span class="text-danger">*</span> E-mail </label>
                    <input type="email" class="form-control" id="email"  name="email" placeholder="Insira o e-mail">
                </div> 
               
        
                <div class=" form-group col-md-2">  <br>
                <button type="submit" class="btn btn-success float-left" value="Guardar" name="btnSubmitFornecedor" style="border-radius:7px 7px;"><i class="fas fa-save fa-1x"></i>&nbsp;&nbsp;Guardar </button>
                       
                    
                </div>
           </div>
            


          
            
        </form>
    </div>
</div>
</div>
