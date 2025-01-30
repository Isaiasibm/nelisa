<?php
	


	            	$pagina='
            	<html>
            	<head>
            	
            	<div align="center">    
            		<img id="logos" src="'.URLADM.'imagens/logofaa.png"><br>
            		<span><b>Forças Armadas Angolanas</b></span><br>
                    <span><b>Estado Maior General</b></span><br><br><br>';
                $pagina .='</div>
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
                ';
                
                
                $pagina .='
<table align="center" style="width: 2001px;">
              <tr>
                <td style="text-align: left; width: 667px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; APROVADO<br> O COMANDANTE DA UNIDADE</td>
<td style="text-align: center; width: 667px;">
               <img  id="logo" src="assets/imagens/icone/logofaa.jpg"  class="img-responsive" style="width: 55px; height:70px; ">
</td>
<td style="text-align: right; width: 667px;"> </td>
                </tr>
          </table>



           <div class="row" align="center">

                <table align="center" style="width: 2001px;">
                    <tr>
                    <td style="width: 667px;">
                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CORONEL DOMBEL</span><br> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Brigadeiro*</span>

                </td>

                        <td style="text-align: center; width: 667px; font-size: 16px;">
                            <span style="text-align: center;"> ESTADO MAIOR GENERAL </span><br>
                            <span ><b> UNIDADE DE APOIO </b>

                             </span> ';
                        
                $pagina .='            
                        </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                </table>  
                
                </div><p align="center"> ESCALA DE SERVIÇO DE '.strtoupper($this->Dados["tipoServ"]).' REFERENTE AO MÊS DE '. strtoupper($mesExt).' DE '.$ano.' </p>


<table class="tg" align="center" style="width: 1700px; padding: 0px;">

 <tr>
                      <th class="tg-v2hy" style="width: 30px" rowspan="3">Nº</th>
                      <th class="tg-v2hy"  rowspan="3"> Patente</th>
                      <th class="tg-v2hy"  colspan="7">Calendário de Serviço de Guarda</th>
                      <th class="tg-v2hy" rowspan="3" style="width: 200px;">U/E/O</th>
</tr>
<tr>
  <th class="tg-v2hy" rowspan="2" >Oficiais Escalados <br> Nome Completo</th>
                      <th class="tg-v2hy" colspan="3">'. $mesExt.' de '.$ano.' </th>
                      
                      <th class="tg-v2hy" style="width: 100px" rowspan="2">Data Último Serviço</th>
                     
                      <th class="tg-v2hy" rowspan="2">Patente</th>
                      <th class="tg-v2hy" rowspan="2">Oficiais de Reservas <br> Nome Completo</th>
                      
</tr>
<tr>
    <th class="tg-v2hy" style="width: 40px">Dias</th>
                     
                      <th class="tg-v2hy" style="width: 90px;" >Semana</th>
                      <th class="tg-v2hy" style="width: 200px;"  >U/E/O</th>

</tr>

'.
   $num=1;
$diaSemana= array("Domingo","Segunda-feira","Terça-feira","Quarta-feira","Quinta-feira","Sexta-feira","Sábado");

       foreach($this->Dados['dadosEscalaPrinc'] as $escala):
        extract($escala);


  //$soma=$soma+1;

$this->Dados["dadosReserva"]=$imprima->buscaReservaImprimirEscala($idEsc);

foreach($this->Dados["dadosReserva"] as $res):
extract($res);



$pegaDia=explode("-", $data_servico);
$dia=$pegaDia[2];
$diaSemanaNumero=date("w",strtotime($data_servico));
                    $pagina.='.                           
                    <tr>
                       <td  class="tg-s268" align="center">'. $num++.' </td>
                        <td  class="tg-s268" >'. $Patente.' </td>
                        <td class="tg-s268" >'. $Nome.' '.$Apelido.' </td>
                        <td class="tg-s268"  align="center">'. $dia.' </td>
                         <td class="tg-s268" >'. $diaSemana[$diaSemanaNumero].' </td>

                        <td class="tg-s268" >'. $Designacao_Unidade.' </td>

                        <td class="tg-s268"  style="width: 100px"> ';
                         // $dataUltimo=$data_ultimo_servico;
                           
                    $dataUltimo=date("d-m-Y", strtotime($data_ultimo_servico));
                 
                          $pagina.=$dataUltimo.' </td>
                        <td class="tg-s268"  >'. $patente_reserva.' </td>
                       <td class="tg-s268"  >'. $nome_reserva.' '.$apelido_reserva.' </td>   
                        <td class="tg-s268" >'. $unidade_reserva.' </td>                    
               </tr>';
              
             endforeach;
              endforeach;

                    

                
          $pagina .="</table> 


<span>Luanda,". date('d/m/Y')." </span><br> 

         <div align='center'>   <label style='text-align: center; font-size: 1500px;'> O Chefe Sec. Operações </label><br><br>
            <span align='center'> Zacarias Catangoje </span> <br>
            <span> *** Coronel *** </span>

            </div>

          </div> </body></html>";
              
      	  $mpdf = new \Mpdf\Mpdf([
	        'mode' => 'utf-8',
			    'orientation' => 'L'
			    ]);
  				$mpdf->SetHTMLFooter('
  				<table width="100%">
  				    <tr>
  				        <td width="33%">{DATE j-m-Y}</td>
  				        <td width="33%" align="center">{PAGENO}/{nbpg}</td>
  				        <td width="33%" style="text-align: right;">SISG</td>
  				    </tr>
  				</table>');
				$mpdf->WriteHTML($pagina);

      $mpdf->Output("Relatorio".date("d-m-Y H:i:s"),"I"); 
      die();

    
 
?>