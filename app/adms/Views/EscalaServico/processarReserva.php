<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h2 class="display-4 titulo">Processar Escala de Reservas</h2>
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
        <form name="processarEsalaServico" action="" method="post" enctype="multipart/form-data" autocomplete="off" id="processarEsalaServico">
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
                            $cod_tipo_servico = $doc['id'];
                            $tipoServico = $doc['tipo_servico'];

                        ?>
                          <option value="<?php echo $cod_tipo_servico.'-'.$tipoServico; ?> "><?php echo $tipoServico ?></option>";
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
       for ($anoInicio = date('Y') +1 ; $anoInicio >= date('Y'); $anoInicio--)
       {
          echo '<option value="'.$anoInicio.'">'.$anoInicio.'</option>';
       }
    ?>
                       
                    </select>
                </div> 

                  <div class="form-group col-md-2">
                    <label><span class="text-danger">*</span>Selecione o mês</label>
                    <select class="form-control" name="mes" required="">
                        <option value="">Mês </option>
                        <?php
                        
$mes[1]='Janeiro';
$mes[2]='Fevereiro';
$mes[3]='Março';
$mes[4]='Abril';
$mes[5]='Maio';
$mes[6]='Junho';
$mes[7]='Julho';
$mes[8]='Agosto';
$mes[9]='Setembro';
$mes[10]='Outubro';
$mes[11]='Novembro';
$mes[12]='Dezembro';

//decrementa-se devido ao vector que começa na posição zero
$mesAct=date('m')+0;
//$mesAct=12;
 /*if ($mesAct>=11) {
    # code...
//echo $meses[date('m')];
 
       for ($i = $mesAct; $i <= count($mes); $i++)
       {
          echo '<option value="'.$i.'-'.$mes[$i].'">'.$mes[$i].'</option>';
       }
       echo '<option value="'.'1'.'">'.'Janeiro'.'</option>';
       echo '<option value="'.'2'.'">'.'Fevereiro'.'</option>';
   }
   else{
    for ($i = $mesAct; $i <= count($mes); $i++)
       {
          echo '<option value="'.$i.'-'.$mes[$i].'">'.$mes[$i].'</option>';
       }
   }
    */
    for ($i = 1; $i <= count($mes); $i++)
       {
          echo '<option value="'.$i.'-'.$mes[$i].'">'.$mes[$i].'</option>';
       }
     



   ?>
                        </select>
                </div> 
    
              </div>
              
                      <div class="form-row">

                <div class="form-group col-md-3">
                  <br>
                  <span class="text-danger">* </span>Campo obrigatório &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button
                  type="submit" class="btn btn-success" value="Guardar"
                  name="enviar">Processar</button>
                    
                </div>
             
            </div>

            </form>
         </div>

   <?php 
if(count($this->Dados["MilitaresEscaladosReserva"])>0){

   if (isset($this->Dados['tipoServ'])) {
     # code...
    ?>           
    
<div class="mr-auto p-2">
                <h2 class="display-4 titulo badge badge-default">Militares reservas escalados para o serviço de <?php echo strtoupper($this->Dados['tipoServ']); ?> no mês de <?php echo $this->Dados['mesTexto']; ?> do ano de <?php echo $this->Dados['ano']; ?> </h2>
            </div>

       
<div class="table-responsive">
        <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable">

            <thead align="center">
                <tr>
                    <th>#</th>
                    <th>Patente</th>
                    <th>NIP</th>
                    <th>NOME COMPLETO</th>                    
                    <th class="hidden-xs">DATA</th>
                    <th class="hidden-xs">U/E/O</th>
                    
                    <th>Ações</th>
                </tr>
            </thead><tbody>
         
 <?php
  $dadosEscalads = new \App\adms\Models\admsEscalaServico();
  $cont=0;
            
                foreach ($this->Dados["MilitaresEscaladosReserva"] as $MilitaresEscalados) {
                 
                    $cont++;
               
 extract($MilitaresEscalados);
           
      $idNip=$id."-".$NIP;
?>   
                    <tr>

                        <td><?php echo $cont; ?></td>
                        <td><?php echo $Patente; ?></td>
                        <td><?php echo $NIP; ?></td>
                        <td><?php echo $Nome.' '.$Apelido; ?></td>
                         <td><?php echo $data_serv; ?></td>
                        <td><?php echo $Designacao_Unidade; ?></td>
                       
                          <td class="text-center">
                            <div class="dropdown show">
                              <a class="btn btn-success dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Acções
                              </a>

                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="<?php echo URLADM.'controleEscalaServico/visualizar/'.$idNip; ?>">Mais Detalhes</a>
                                <a class="dropdown-item" href="<?php echo URLADM.'controleEscalaServico/alterData/'.$idNip; ?>">Alterar data</a>
                                <a class="dropdown-item" href="<?php echo URLADM.'controleEscalaServico/confirmarPresenca/'.$idNip; ?>">Confirmar Presença</a>
                              
                              </div>
                            </div>
                        </td>
                    </tr>

                    <?php 
                }}
                }  
              
                
               ?>
            </tbody>
        </table>




<?php 
//Apresentar a Lista

if (isset($this->Dados['dadosEscala'])) {
  # code...

 ?>
 <br>
<hr style="border: 3px solid #8FBC8F ">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h2 class="display-4 titulo badge badge-default">Escala de Serviço de <?php echo $this->Dados["tipoServ"]; ?> Referente ao Mês de <?php echo $this->Dados["mesTexto"]; ?> de <?php echo $this->Dados["ano"];; ?>

                </h2>
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

    if (!empty($this->Dados['dadosEscala'])):
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
                    <th rowspan="2">#</th>
                    <th rowspan="2">Patente</th>
                    <th rowspan="2">Nome Completo</th>   
                      <th rowspan="2">Semana</th>                
                    <th rowspan="2">Data</th>
                    <th rowspan="2">U/E/O</th>
                    <th rowspan="2">Data Último Serviço</th>
                    <th colspan="3">Oficiais Reservas</th>
                    <th rowspan="2">Ações</th>

                </tr>
                <tr>
                    <th>Patente</th>
                    <th>Nome Completo</th>
                    <th>U/E/O</th>
                </tr>
            </thead>
            <tbody>
                <?php $Cont = 1;

 /*               
$diasemana = array('Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sabado');
$data = date('Y-m-d');
$diasemana_numero = date('w', time());
*/
 //$diasemana_numero = date('w', strtotime($data));  
 //var_dump($diasemana[$diasemana_numero]);

$diaSemana= array('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sábado');
$res = new \App\adms\Models\admsEscalaServico();
                foreach ($this->Dados['dadosEscala'] as $escala) {

                    extract($escala);
                    if ($data_ultimo_servico==Null) {
                                  # code...
                      $data_ultimo_servico="Novo";
                                }            
                 $diaSemanaNumero=date('w',strtotime($data_servico));
                    ?>               
                    <tr>

                        <td><?php echo $Cont; ?></td>
                        <td><?php echo $Patente; ?></td>
                        <td><?php echo $Nome.' '.$Apelido; ?></td>
                        <td><?php echo $diaSemana[$diaSemanaNumero]; ?></td>
                         <td><?php echo $data_servico; ?></td>
                        <td><?php echo $Designacao_Unidade; ?></td>
                        <td><?php echo $data_ultimo_servico; ?></td>
<?php                        
$reservas=$res->lisReserva($id);     
        foreach ($reservas as $reserva) {
            extract($reserva);
 ?>                     <td><?php echo $patente_reserva; ?></td>
                        <td><?php echo $nome_reserva.' '.$apelido_reserva; ?></td>
                        <td><?php echo $unidade_reserva; ?></td>
                 <?php   
                   }           


?>






                          <td class="text-center">
                            <div class="dropdown show">
                              <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Acções
                              </a>
                              <?php 
                              $idNip=$id."-".$NIP;

                              ?>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="<?php echo URLADM.'controleEscalaServico/visualizar/'.$id; ?>">Histórico</a>
                                 <a class="dropdown-item" href="<?php echo URLADM; ?>App/Adms/Views/EscalaServico/pdfnotificacaoIndividual.php?id=<?php echo $id; ?>">Imprimir Notificação</a>
                                <a class="dropdown-item" href="<?php echo URLADM.'controleEscalaServico/alterData/'.$idNip; ?>">Alterar data</a>
                                <a class="dropdown-item" href="<?php echo URLADM.'controleEscalaServico/confirmarPresenca/'.$idNip; ?>">Confirmar Presença</a>
                               
                                
                              
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

    endif;

}
 
    ?>





        
    </div>

</div>
