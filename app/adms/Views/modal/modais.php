<!-- Modal parfa Eliminar Prova -->
<div class="modal" id="modalEliminarProva">
  <div class="modal-dialog">
    <div class="modal-content">
<form name="eliminarProva" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="eliminarProva">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Deseja eliminar a prova?</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input type="hidden" name="Cod_Prova" id="cod_Prova">
        <b id="descricaoProva"></b>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger"name="SendEliminarProva" value="sim">Sim</button><button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
      </div>
</form>
    </div>
  </div>
</div>

<!--Modal para editar Prova-->
<div class="modal" id="modalEditarProva">
  <div class="modal-dialog">
    <div class="modal-content">
<form name="eliminarProva" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="eliminarProva">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Alterar dados da prova</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class='alert alert-danger msg' style="display: none;"></div>
                        <div class="form-group col-md-8">

                            <label><span class="text-danger">*</span> Titulo da prova:</label>
                            <input type="text" name="Designacao_Prova" id="tituloEditar" class="form-control" style="width: 100%;">

                            
                        </div>
                        <div class="form-group col-md-8">
                            <label><span class="text-danger">*</span>Data de Ínicio (ano/mês/dia)</label>
                            <input type="text"  class="form-control datapickerinicioprovaeditar" name="Data_Comeco" id="dataInicioProvaEditar"  value="<?php
                            if (isset($this->Dados['data_nascimento'])): echo $this->Dados['data_nascimento'];
                            endif;
                            ?>" required="">
                      </div>
                      <div class="form-group col-md-8">
                       <input type="hidden" name="cod_Prova" id="cod_ProvaEditar">
                            <label><span class="text-danger">*</span>Data de Fim (ano/mês/dia)</label>
                            <input type="text"  class="form-control datapickerfimprovaeditar" name="Data_Termino" id="dataFimProvaEditar"  value="<?php
                            if (isset($this->Dados['data_nascimento'])): echo $this->Dados['data_nascimento'];
                            endif;
                            ?>" required="">
                      </div>
                    
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger" name="SendEditarProva" value="sim">Guardar alteração</button><button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>
      </div>
</form>
    </div>
  </div>
</div>


<!-------------------------------------------Fases-------------------------------------------------------->

<!-- Modal parfa Eliminar Fase -->
<div class="modal" id="modalEliminarFase">
  <div class="modal-dialog">
    <div class="modal-content">
<form name="eliminarFase" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="eliminarProva">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Deseja eliminar a avaliação?</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input type="hidden" name="id_Fase" id="id_Faseeliminar">
        <b id="descricaoFase"></b>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger"name="SendEliminarFase" value="sim">Sim</button><button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
      </div>
</form>
    </div>
  </div>
</div>

<!--Modal para editar Prova-->
<div class="modal" id="modalEditarFase">
  <div class="modal-dialog">
    <div class="modal-content">
<form name="editarFase" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="editarFase">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Alterar dados da avaliação</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" align="center">
      	<input type="hidden" name="id_Fase" id="id_Faseeditar">
      	<input type="hidden" name="tipoprova" id="tipoprovaeditar">
      	<input type="hidden" name="id_Prova" id="Cod_ProvaFase">
        <div class="form-group col-md-10" style="text-align: left;">
                            <label><span class="text-danger">*</span>Tipo de prova</label>
                    <select class="form-control" name="id_tipoprova" required="" id="id_tipoprovaeditar" style="width: 100%">
                       <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_tipoprova');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $idTipoProva = $doc['idTipoProva'];
                            $tipoProva = $doc['Designacao'];

                            if ($this->Dados['id_tipoprova'] == $idTipoProva):
                                $selecionado = "selected";
                            else:

                                $selecionado = "";
                            endif;
                            echo "<option value='$idTipoProva' $selecionado>$tipoProva</option>";
                        endforeach;
                        ?>
                    </select>
                        </div>

                        <div class="form-group col-md-10" style="text-align: left;">
                            <label><span class="text-danger">*</span>Provincia</label>
                    <select class="form-control" name="id_Provincia" required="" id="id_Provinciaeditar" style="width: 100%">
                       <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_provincia');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $Cod_Provincia = $doc['Cod_Provincia'];
                            $Designacao_Provincia = $doc['Designacao_Provincia'];

                            if ($this->Dados['id_Provincia'] == $Cod_Provincia):
                                $selecionado = "selected";
                            else:

                                $selecionado = "";
                            endif;
                            echo "<option value='$Cod_Provincia' $selecionado>$Designacao_Provincia</option>";
                        endforeach;
                        ?>
                    </select>
                        </div>
                        <div class="form-group col-md-10" style="text-align: left;">
                            <label><span class="text-danger">*</span>Data de Ínicio (ano/mês/dia)</label>
                            <input type="text"  class="form-control datapickeriniciofaseeditar" name="Datainicio" id="Datainiciofaseeditar"  value="<?php
                            if (isset($this->Dados['Datainicio'])): echo $this->Dados['Datainicio'];
                            endif;
                            ?>" required="">
                      </div>
                      <div class="form-group col-md-10" style="text-align: left;">
                       
                            <label><span class="text-danger">*</span>Data de Fim (ano/mês/dia)</label>
                            <input type="text"  class="form-control datapickerfimfaseeditar" name="Datafim" id="Datafimfaseeditar"  value="<?php
                            if (isset($this->Dados['Datafim'])): echo $this->Dados['Datafim'];
                            endif;
                            ?>" required="">
                      </div>
                    
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger" name="SendEditarFase" value="sim">Guardar alteração</button><button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>
      </div>
</form>
    </div>
  </div>
</div>
