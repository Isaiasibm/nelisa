<?php



 $Resultado = array();

 
         
         //  extract($dadosEncontrados);

          if (!empty($dadosEsc)) {
               $Resultado['dadosEncontrados'] = $dadosEsc;
           }else{ $Resultado['dadosEncontrados'] = NULL; }
     

$pagina='

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title></title>
	<style type="text/css">
		*{
			font-family: Arial, Helvetica, sans-serif;
		}

		<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-xldj{border-color:inherit;text-align:left}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
</style>
	</style>
	
</head>
<body>
 
	<div class="container" >
	
            <div class="row" align="center">

               <img  id="logo" src="assets/imagens/icone/logofaa.jpg"  class="img-responsive" style="width: 55px; height:70px; ">
            </div>
           
            <div class="row" align="center">

            	<table align="center">
            		<tr>
            			
            			<td style="text-align: center;">
            				<span>Estado Maior General</span><br>
                			<span ><b> Unidade de Apoio </b></span><br><br> 
                			
                			
                		</td>
            		</tr>
            	</table>  
          

                </div>
<br>
<table>
    <tr>
        <td style="width: 430px"></td>
        <td>À(o)</td>
    </tr>
    <tr>
        <td style="width: 430px"></td>
        <td align="justify">'.$Designacao_Unidade.'


</td>
    </tr>
<tr>
        <td style="width: 430px"></td>
        <td align="center"> <b>= Luanda = </b></td>
    </tr>
</table>
    <br> 
                    
                <span > Assunto: <strong>NOTIFICAÇÃO DO SERVIÇO DE GUARDA Nº ________ /UAEMG/2021.  </strong></span><br><br>


                      <p align="justify"; font-size="18">  <span>No cumprimento da <strong>Nota Nº 01222/GAB.CEMGADJ.FAA/2020, </strong> p/Área Operacional e de Desenvolvimento de <b>07</b> de <b>Abril </b> sobre a <b>Nova Implementação do Sistema de Guarda no MINDEN/EMGFAA.</b> O comando da Unidade de Apoio/EMGFAA, leva ao conhecimento do Senhor: </span> </p>
                       <p align="justify"> <span>'. $Patente.', <b>'. $Nome.' '.$Apelido.', </b></span> que estará de serviço de <b>'.$tipo_servico.' </b> no EMGFAA, no dia <b> '.$dia.' /'.$mes.' /'.$ano.'</b> </p>
                        <p align="justify">O Militar <b>(Oficial ou Sargento) </b> da rendição deverá apresentar-se no distrito da guarda às <b>07H00</b> e às <b> 07H30</b> devem participar na <b>Formatura do Serviço da Guarda</b> ao EMGFAA.</p>
                        <p align="justify"> Em seguida deve realizar o recorrido às instalações do EMG devendo também registar no livro para o efeito.</p>

                        <p align="justify"><b>Nota Bem: </b> O não cumprimento do referido Serviço será punido nos termos do Capítulo <b>V,</b> do artigo <b>Nº 16º</b> ponto <b>1 e 2</b> das NRDM <b>(Normas Reguladoras da Disciplina Militar).</b> </p><br>
                        <p><b>Unidade de Apoio/EMGFAA em Luanda, aos '. date('d/m/Y').' </b></p> <br>

                        <p align="center"> O Comandante</p>
                        <p align="center">Coronel Dombel</p>
                        <p align="center">*Brigadeiro*</p>
                        
<p><b>Recebi: </b></p>
<p>Nome:____________________</p>
<p>Telefone:________________</p>
</div>
       



</body>
</html> ';

  $mpdf = new \Mpdf\Mpdf([
            'mode' => 'utf-8',
                'orientation' => 'p'
                ]);
                $mpdf->SetHTMLFooter('
                <table width="100%">
                    <tr>
                        <td width="33%" style="font-size: 6pt;">Serviço da guarda ao EMGFAA {DATE j-m-Y}</td>
                        <td width="33%" align="center" style="font-size: 6pt;">{PAGENO}/{nbpg}</td>
                        <td width="33%" style="text-align: right; font-size: 6pt;">Page 1</td>
                    </tr>
                </table>');
                $mpdf->WriteHTML($pagina);

      $mpdf->Output("Relatorio".date("d-m-Y H:i:s"),"I"); 
      die();

    
 
?>