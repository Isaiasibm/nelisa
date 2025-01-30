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
 function SomenteNumero(e){
    var tecla=(window.event)?event.keyCode:e.which;   
    if((tecla>47 && tecla<58)) return true;
    else{
      if (tecla==8 || tecla==0) return true;
  else  return false;
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
                  <a href="<?php echo URLADM.'ControleMilitar/cadastrarMilitar'?>" class="btn btn-outline-info btn-sm">Registar Dados</a>
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
                       <br><br>
        <div class="form-row">
                <div class="input-group col-md-7">
                    <input name="inputPesquisa" type="text" class="form-control typeahead border-primary" id="inputPesquisa" placeholder="Pesquisar militar por NIP" value="" required="" data-provide="typeahead" autocomplete="off">
                    <div class="input-group-append">
                    <button class="btn btn-success" type="button" id="btnPesquisar"><i class="fas fa-search"></i></button> 
                </div>
                </div>
            </div>

            <form name="EditMilitar" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="EditMilitar">
            <br><br>
                                
            <div class="form-row" id="caixaDadosPessoais" >
                <div class="form-group col-md-12">
                     <b> DADOS PESSOAIS</b>
                    <hr style="border: 1px solid #8FBC8F ">
                </div>
                <div class="form-group col-md-3">
            <label><span class="text-danger">*</span> Nome:</label>
            <input name="nome" type="text" class="form-control" id="nome" placeholder="Escreva o Nome" value="<?php
            if (isset($this->Dados['nome'])): echo $this->Dados['nome'];
                    endif;
                    ?>" required="" >
                </div>
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span> Apelido:</label>
                    <input type="text"  class="form-control" name="apelido" placeholder="Escreva o Apelido" value="<?php
                    if (isset($this->Dados['apelido'])): echo $this->Dados['apelido'];
                    endif;
                    ?>" required="" id="apelido">
                </div>
      <!--        </div>

          
          <div class="form-row" id="caixaDadosPessoais1" > -->
               <div class="form-group col-md-1">
                    <label><span class="text-danger">*</span> Telefone:</label>
                    <input type="number"  class="form-control" name="Telefone" placeholder="Contacto telefónico" value="<?php
                    if (isset($this->Dados['Telefone'])): echo $this->Dados['Telefone'];
                    endif;
                    ?>" required="">
                </div> 
                <div class="form-group col-md-1">
                    <label><span class="text-danger">*</span>Sexo</label>
                    <select class="form-control" name="sexo" required="" id="sexo">
                       <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_sexo');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $codigo_sexo = $doc['Cod_Sexo'];
                            $designacao_sexo = $doc['Designacao_Sexo'];

                            if ($this->Dados['sexo'] == $codigo_sexo):
                                $selecionado = "selected";
                            else:

                                $selecionado = "";
                            endif;
                            echo "<option value='$codigo_sexo' $selecionado>$designacao_sexo</option>";
                        endforeach;
                        ?>
                    </select>
                </div> 

          </div>
            <br>
 
            <div class="form-row" id="caixaDadosMilitares" > 
                <div class="form-group col-md-12">
                     <p align="left" > <b>DADOS MILITARES</b> </p>
            <hr style="border: 1px solid #8FBC8F ">
                </div>
                <div class="form-group col-md-1">   
                    <label><span class="text-danger">*</span>NIP</label>
                    <input type="number" class="form-control" placeholder="Escreva o NIP" name="nip"  value="<?php
                    if (isset($this->Dados['nip'])): echo $this->Dados['nip'];
                    endif;
                    ?>" required="" id="nip">

                     
                </div>

                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Posto</label>
                    <select class="form-control" name="patente" required="" id="patente">
                        <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_patente');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $Cod_Patente = $doc['Cod_Patente'];
                            $designacao_patente = $doc['Patente'];

                            if ($this->Dados['patente'] == $Cod_Patente):
                                $selecionado = "selected";
                            else:

                                $selecionado = "";
                            endif;
                            echo "<option value='$Cod_Patente' $selecionado>$designacao_patente</option>";
                        endforeach;
                        ?>
                    </select>
                </div>         
     
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Disponibilidade</label>
                    <select class="form-control" name="disponibilidade" required="" id="disponibilidade">
                        <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_disponibilidade');
                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $id_disponibilidade = $doc['id_disponibilidade'];
                            $designacao_disponibilidade = $doc['designacao_disponibilidade'];

                            if ($this->Dados['disponibilidade'] == $id_disponibilidade):
                                $selecionado = "selected";
                            else:

                                $selecionado = "";
                            endif;
                            echo "<option value='$id_disponibilidade' $selecionado>$designacao_disponibilidade</option>";
                        endforeach;
                        ?>
                    </select>
                </div>
              <!--  </div>
                    
                <div class="form-row" id="caixaDadosMilitares2" >
                    -->

              <input type="hidden" name="cod_pessoa" id="cod_pessoa" value="<?php
                    if (isset($this->Dados['cod_pessoa'])): echo $this->Dados['cod_pessoa'];
                    endif;
                    ?>">
              <input type="hidden" name="cod_militar" id="cod_militar" value="<?php
                    if (isset($this->Dados['cod_militar'])): echo $this->Dados['cod_militar'];
                    endif;
                    ?>">
                <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Ramo</label>
                    <select class="form-control" name="ramo" required="" id="ramo">
                        <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_ramo');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $cod_ramo = $doc['Cod_Ramo'];
                            $designacao_ramo = utf8_encode($doc['Designacao_Ramo']) ;

                            if ($this->Dados['ramo'] == $cod_ramo):
                                $selecionado = "selected";
                            else:

                                $selecionado = "";
                            endif;
                            echo "<option value='$cod_ramo' $selecionado>$designacao_ramo</option>";
                        endforeach;
                        ?>
                    </select>
                </div>
                <input type="hidden" name="nipescondido" id="nipescondido" value="<?php
                    if (isset($this->Dados['nipescondido'])): echo $this->Dados['nipescondido'];
                    endif;
                    ?>">
                
                 <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span>Unidade</label>
                    <select class="form-control" name="unidade" required="" id="unidade">
                        <option value="">Selecione</option>
                         <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_u_e_o');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $cod_UEO = $doc['Cod_Unidade'];
                            $designacao_UEO = utf8_encode($doc['Designacao_Unidade']) ;

                            if ($this->Dados['unidade'] == $cod_UEO):
                                $selecionado = "selected";
                            else:

                                $selecionado = "";
                            endif;
                            echo "<option value='$cod_UEO' $selecionado>$designacao_UEO</option>";
                        endforeach;
                        ?>
                        
                    </select>
                </div> 
            </div>
         

<br>
            <span class="text-danger" >* </span>Campo obrigatório 
            <button type="submit" class="btn btn-success" value="Guardar"
name="SendEditMilitar" id="SendEditMilitar" >Guardar</button> </form> </div> </div>
