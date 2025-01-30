<?php 
 include("mpdf60/mpdf.php");

 $html = "

 <h1>Recibo de Pagamento</h1>

 ";

 $mpdf=new mPDF(); 
 $mpdf->SetDisplayMode('fullpage');
 //$css = file_get_contents("css/estilo.css");
 //$mpdf->WriteHTML($css,1);
 $mpdf->WriteHTML($html);
 $mpdf->Output();

 exit;
?>