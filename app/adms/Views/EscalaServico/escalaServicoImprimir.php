<?php

$tipoServico = $_GET['tipoServico'];
$anoMes = $_GET['data'];
$mesExt = $_GET['mesExt'];
$ano = $_GET['ano'];

 
 $GLOBALS['conexao'] = new PDO('mysql:host=localhost;dbname=sisg;charset=utf8', 'root', '',array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")); 

 $Resultado = array();

 ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title></title>


 <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:15px;padding:1px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
            .tg th{font-family:Arial, sans-serif;font-size:16px;font-weight:normal;padding:1px 0px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;text-align: center; vertical-align: middle; }
            .tg .tg-v2hy{font-weight:bold;background-color:#ccc;color:#000000;text-align:center;vertical-align: middle;}
            .tg .tg-fuer{font-weight:bold;background-color:#34696d;color:#ffffff;text-align:center;;vertical-align:top}
            .tg .tg-s268{text-align:left}
            .tg .tg-0lax{text-align:left;vertical-align:top}
        </style>

		
	
</head>
<body>

	<div class="container" >
	
            <table align="center" style="width: 2001px;">
              <tr>
                <td style="text-align: left; width: 667px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; APROVADO<br> O COMANDANTE DA UNIDADE</td>
<td style="text-align: center; width: 667px;">
                <img align="center"  id="logo" src="../relatorios/logofaa.png" alt="Logo" class="img-responsive" style="width: 70px; height:80px; ">
</td>
<td style="text-align: right; width: 667px;"></td>
                </tr>
          </table>
       
            <div class="row" align="center">

          

            	<table align="center" style="width: 2001px;">
            		<tr>
            		<td style="width: 667px;">
                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CORONEL DOMBEL</span><br> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Brigadeiro*</span>

                </td>

            			<td style="text-align: center; width: 667px; font-size: 16px;">
            				<span style="text-align: center;">ESTADO MAIOR GENERAL</span><br>
                			<span ><b>UNIDADE DE APOIO </b> </span>
                		
                			
                		</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            		</tr>
            	</table>  
          

                </div>

<p align="center" style="padding: 0px;"><b>ESCALA DE SEVIÇO DE <?php 
$pesquisar = $GLOBALS['conexao']->prepare("SELECT tb_tiposervico.tipo_servico 
FROM tb_tiposervico 
WHERE tb_tiposervico.id=$tipoServico LIMIT 1");

 $dia=0;    
$pesquisar->execute();
while ($meio=$pesquisar->fetch(PDO::FETCH_OBJ)) {

$tipoServicoMaiusculo=strtoupper($meio->tipo_servico);
echo $tipoServicoMaiusculo;  

} ?> REFERENTE AO MÊS DE <?php $mesmaiusculo=strtoupper($mesExt); echo $mesmaiusculo;  ?> DO ANO <?php echo $ano; ?><b> </p>
<table class="tg" align="center" style="width: 1700px; padding: 0px;">

 <tr>
                   
                      <th class="tg-v2hy" style="width: 30px" rowspan="3">Nº</th>
                      <th class="tg-v2hy"  rowspan="3"> Patente</th>
                      <th class="tg-v2hy"  colspan="7">Calendário de Serviço de Guarda</th>
                      <th class="tg-v2hy" rowspan="3">U/E/O</th>
</tr>
<tr>
  <th class="tg-v2hy" rowspan="2" >Oficiais Escalados <br> Nome Completo</th>
                      <th class="tg-v2hy" colspan="3"><?php echo $mesExt." de ".$ano; ?></th>
                      
                      <th class="tg-v2hy" style="width: 100px" rowspan="2">Data Último Serviço</th>
                     
                      <th class="tg-v2hy" rowspan="2">Patente</th>
                      <th class="tg-v2hy" rowspan="2">Oficiais de Reservas <br> Nome Completo</th>
                      
</tr>
<tr>
    <th class="tg-v2hy" style="width: 40px">Dias</th>
                     
                      <th class="tg-v2hy" style="width: 90px;" >Semana</th>
                      <th class="tg-v2hy" style="width: 200px;"  >U/E/O</th>

</tr>



<?php
   $num=1;
$diaSemana= array('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sábado');

       $pesquisar = $GLOBALS['conexao']->prepare("SELECT tb_escala_servico.id,tb_patente.Patente,tb_pessoa.Nome,tb_pessoa.Apelido, tb_escala_servico.data_servico,tb_u_e_o.Designacao_Unidade,tb_militar.NIP,tb_militar.data_ultimo_servico
from tb_militar INNER JOIN tb_pessoa ON tb_pessoa.Cod_Pessoa=tb_militar.Cod_Pessoa 
INNER JOIN tb_escala_servico ON tb_escala_servico.nip_militar=tb_militar.NIP 
INNER JOIN tb_u_e_o ON tb_u_e_o.Cod_Unidade=tb_escala_servico.Cod_u_e_o 
INNER JOIN tb_tiposervico ON tb_escala_servico.id_tipo=tb_tiposervico.id 
INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente=tb_patente.Cod_Patente
WHERE tb_tiposervico.id=$tipoServico AND tb_escala_servico.data_servico LIKE '$anoMes%' order by tb_escala_servico.data_servico asc ");

    
$pesquisar->execute();
while ($esc=$pesquisar->fetch(PDO::FETCH_OBJ)) {
  $soma=$soma+1;

 $reserva = $GLOBALS['conexao']->prepare("SELECT tb_pessoa.Nome as nome_reserva, tb_pessoa.Apelido as apelido_reserva, tb_reserva.nip_Militar_reserva,tb_reserva.id_unidade_reserva,tb_patente.Patente as patente_reserva,tb_u_e_o.Designacao_Unidade as unidade_reserva
FROM tb_reserva INNER JOIN tb_militar ON tb_reserva.nip_Militar_reserva=tb_militar.NIP 
INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa
INNER JOIN tb_u_e_o ON tb_reserva.id_unidade_reserva=tb_u_e_o.Cod_Unidade
INNER JOIN tb_patente ON tb_reserva.id_patente_reserva=tb_patente.Cod_Patente
WHERE tb_reserva.id_escala_servico= $esc->id");
$reserva->execute();
while ($res=$reserva->fetch(PDO::FETCH_OBJ)) {




$pegaDia=explode('-', $esc->data_servico);
$dia=$pegaDia[2];
$diaSemanaNumero=date('w',strtotime($esc->data_servico));
                    ?>                            
                    <tr>
                       <td  class="tg-s268" align="center"><?php echo $num++; ?></td>
                        <td  class="tg-s268" ><?php echo $esc->Patente; ?></td>
                        <td class="tg-s268" ><?php echo $esc->Nome.' '.$esc->Apelido; ?></td>
                        <td class="tg-s268"  align="center"><?php echo $dia; ?></td>
                         <td class="tg-s268" ><?php echo $diaSemana[$diaSemanaNumero]; ?></td>

                        <td class="tg-s268" ><?php echo $esc->Designacao_Unidade; ?></td>

                        <td class="tg-s268"  style="width: 100px"><?php
                         // $dataUltimo=$esc->data_ultimo_servico;
                           if ($esc->data_ultimo_servico==NULL) {
                    $dataUltimo='Novo';
                 }
                 else{
                    $dataUltimo=date('d-m-Y', strtotime($esc->data_ultimo_servico));
                 } 
                         echo $dataUltimo; ?></td>
                        <td class="tg-s268"  ><?php echo $res->patente_reserva; ?></td>
                       <td class="tg-s268"  ><?php echo $res->nome_reserva.' '.$res->apelido_reserva; ?></td>   
                        <td class="tg-s268" ><?php echo $res->unidade_reserva; ?></td>                    
               </tr>
              
                   <?php                                  
                                }
                              }
                     
   ?>
                 
                
               
</table>

  </div>
    


    <span>Luanda, <?php echo date('d/m/Y'); ?></span><br> 

         <div align="center">   <label style="text-align: center; font-size: 1500px;"> O Chefe Sec. Operações </label><br><br>
            <span align="center"> Zacarias Catangoje </span> <br>
            <span> *** Coronel *** </span>

            </div>
     </div>   

</body>
</html>