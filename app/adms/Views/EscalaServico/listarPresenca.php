<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h5 class="display-4 titulo">Selecione os parâmetros de consulta de presenças</h5>
            </div>

                <div class="p-2">
                  <a href="<?php echo URLADM.'home/index/'?>" class="btn badge badge-danger btn-sm px-1" style="font-size: 10pt; border-radius:7px 7px;">
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
        ?>
       
        <form name="listarEscala" action="" method="post" id="listarAusente">

<div class="form-row">
            <div class="form-group col-md-3">
                <label><span class="text-danger">*</span>Tipo de consulta</label>
                <select class="form-control" name="tipoLista" id="tipoAusente" required="">
                        <option value=""> Selecione </option>
                        <option value="9"> Geral </option>
                        <option value="1">Por Tipo de Serviço e mês </option>
                        <option value="2">Por Tipo de Serviço e Intervalo de Data </option>
                        <option value="3"> Por Intervalo de Data </option>
                         <option value="4">Por Unidade </option>
                         <option value="5">Por Unidade e Intervalo de Data </option>
                         
                    </select>
            </div>
</div>

        <div class="form-row">

            <div class="form-group col-md-3" id="TServico" style="display: none;">
                    <label><span class="text-danger">*</span>Tipo de serviço</label>
                <select class="form-control" name="tipoServico" id="tipoServico">
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

                   <div class="form-group col-md-3" style="display: none;" id="ueo">
                    <label><span class="text-danger">*</span>Selecione a Unidade</label>
                    <select class="form-control" name="unidade" id="unidade">
                       <option value="">
                        Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('tb_u_e_o');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $Cod_Unidade = $doc['Cod_Unidade'];
                            $Designacao_Unidade = $doc['Designacao_Unidade'];
                          ?>
                             <option value="<?php echo $Cod_Unidade.'aa2aa'.$Designacao_Unidade;?> "><?php echo $Designacao_Unidade;?></option>";
                        <?php
                        endforeach;
                        ?>
                    </select>
            </div>

                  <div class="form-group col-md-2" id="divAno" style="display: none;">
                    <label><span class="text-danger">*</span>Selecione o ano</label>
                    <select class="form-control" name="ano" id="ano">
                        <option value="">Ano </option>
                        <?php
       for ($anoInicio = date('Y') +1 ; $anoInicio >= date('Y') -1; $anoInicio--)
       {
          echo '<option value="'.$anoInicio.'">'.$anoInicio.'</option>';
       }
    ?>
                    </select>
                </div> 

                <div class="form-group col-md-2" id="divMes" style="display: none;">
                    <label><span class="text-danger">*</span>Escolha o mês</label>
                    <select name="mes" id="mes" class="form-control">

                        <option value="">Selecione o mês</option>
                        <option value="01-Janeiro">Janeiro</option>
                        <option value="02-Fevereiro">Fevereiro</option>
                        <option value="03-Março">Março</option>
                        <option value="04-Abril">Abril</option>
                        <option value="05-Maio">Maio</option>
                        <option value="06-Junho">Junho</option>
                        <option value="07-Julho">Julho</option>
                        <option value="08-Agosto">Agosto</option>
                        <option value="09-Setembro">Setembro</option>
                        <option value="10-Outubro">Outubro</option>
                        <option value="11-Novembro">Novembro</option>
                        <option value="12-Dezembro">Dezembro</option>
                                               
                    </select>
                </div>

              

                <div class="form-group col-md-3" id="dataIni" style="display: none;">
                    <label id="labelDataIni"><span class="text-danger">*</span>Data Inicial</label>
                   

                    <input name="dataInicial" type="date" class="form-control" id="dataInicial" value="">
                </div>

                <div class="form-group col-md-3" id="dataFim" style="display: none;">
                    <label><span class="text-danger">*</span>Data Final</label>
    
                    <input name="dataFinal" type="date" class="form-control" id="dataFinal" value="">
                </div>

                <div class="form-group col-md-3">
                 <br>
                  <span class="text-danger">* </span>Campo obrigatório &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button
                  type="submit" class="btn btn-success" value="Guardar"
                  name="enviar">Listar</button>
                   
                </div>
             </div>

            </form>

    

<?php 
//Apresentar a Lista

if (isset($this->Dados['dadosPresente'])) {

    //var_dump($this->Dados['dadosPresente']);
  # code...
 ?>
 <br>
<hr style="border: 3px solid #8FBC8F ">


        <div class="d-flex">
            <div class="mr-auto p-2">

               <?php
if ($this->Dados['tipoLista']==9) {
    # code...

 ?> 
                <h2 class="display-4 titulo badge badge-default">Militares com Presença no Serviço de Guarda
                </h2>
<?php 
}
elseif ($this->Dados['tipoLista']==1) {  ?>
<h2 class="display-4 titulo badge badge-default">Presenças registadas no Serviço de <?php echo $this->Dados["tipoServ"]; ?> no mês de <?php echo $this->Dados["mesTexto"]; ?> de <?php echo $this->Dados["ano"]; ?>  

                </h2>
 <?php       # code...
    }
        elseif ($this->Dados['tipoLista']==2) { ?>
            <h2 class="display-4 titulo badge badge-default">Presenças registada no Serviço de <?php echo $this->Dados["tipoServ"]; ?> no período de <?php echo $this->Dados["dataInicial"]; ?> à <?php echo $this->Dados["dataFinal"]; 
            ?>
                </h2>
                <?php
    } elseif ($this->Dados['tipoLista']==3) { ?>

     <h2 class="display-4 titulo badge badge-default">Presenças registadas no período de <?php echo $this->Dados["dataInicial"]; ?> à <?php echo $this->Dados["dataFinal"]; ?> 
                </h2>
                <?php   
}

elseif ($this->Dados['tipoLista']==4) { ?>

     <h2 class="display-4 titulo badge badge-default"> Presenças registadas da(o) <?php echo $this->Dados['desigUeo']; ?> nos diferentes serviços
                </h2>
                <?php   
}
elseif ($this->Dados['tipoLista']==5) { ?>

     <h2 class="display-4 titulo badge badge-default">Presenças registadas da(o) <?php echo $this->Dados['desigUeo']; ?> no período de <?php echo $this->Dados["dataInicial"]; ?> à <?php echo $this->Dados["dataFinal"]; ?>
                </h2>
                <?php   
}



?>

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
    <?php

    if (!empty($this->Dados['dadosPresente'])):
        ?>
         <div class="table-responsive">
        <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable">

<style type="text/css">
    th{
        text-align: center;
        vertical-align: middle;
    }
</style>
            <thead align="center">
                <tr>
                    <th>#</th>
                    <th>Patente</th>
                    <th>Nome Completo</th>
                    <th>Tipo Serviço</th>                  
                    <th>Data Serviço</th>
                    <th>U/E/O</th>
                   
                    <th> Ações </th>

                </tr>
            </thead>
            <tbody>
                <?php $Cont = 1;

$diaSemana= array('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sábado');
$res = new \App\adms\Models\admsEscalaServico();
                foreach ($this->Dados['dadosPresente'] as $escala) {

                    extract($escala);
                    
                    ?>               
                    <tr>

                        <td><?php echo $Cont; ?></td>
                        <td><?php echo $Patente; ?></td>
                        <td><?php echo $Nome.' '.$Apelido; ?></td>
                        <td><?php echo $tipo_servico; ?></td>
                         <td><?php echo $data_servico; ?></td>
                        <td><?php echo $Designacao_Unidade; ?></td>
                        

                          <td class="text-center">
                            <div class="dropdown show">
                              <a class="btn btn-success dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Acções
                              </a>
                              <?php 
                              $idNip=$id."-".$NIP;

                              ?>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="<?php echo URLADM.'controleEscalaServico/visualizar/'.$id; ?>">Histórico</a>
                             
                              
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

else:

    echo "Não existem dados para os parâmetros escolhidos";
    endif;


}
 
    ?>

        </div>
    </div>
