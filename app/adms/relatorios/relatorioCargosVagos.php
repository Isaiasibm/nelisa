<?php
	

	            	$pagina .='
            	<html>
            	<head>
            	</head>
            	<body>
            	<div align="center">    
            		<img id="logo" src="'.URLADM.'/assets/imagens/logo_login/logofaa.png" style="width:50px;height:50px;"><br>
            		<span><b>Forças Armadas Angolanas</b></span><br>
                    <span><b>Estado Maior General</b></span><br><br><br>';
                $pagina .='</div>
            	<style type="text/css">
            	.tg  {border-collapse:collapse;border-spacing:0;}
				.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
				  overflow:hidden;padding:10px 5px;word-break:normal;}
				.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
				  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
				.tg .tg-vphl{font-family:"Times New Roman", Times, serif !important;;font-size:12px;text-align:left;vertical-align:top}
				.tg .tg-i7u6{background-color:#c0c0c0;font-family:"Times New Roman", Times, serif !important;;font-size:12px;font-weight:bold;
				  text-align:center;vertical-align:top}
				.tg .tg-w43s{font-family:"Times New Roman", Times, serif !important;;font-size:12px;font-weight:bold;text-align:left;
				  vertical-align:top}
				</style>';
            	  
                
                $pagina .="<h4>".$teor_relatorio."</h4>";

                $pagina .="<table class='tg' width='100%'><tr><td>bgbhhbnh</td></tr>";
                    

                
          $pagina .="</table></body></html>";
              
      	  $mpdf = new \Mpdf\Mpdf([
	        'mode' => 'utf-8',
			    'orientation' => 'P'
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