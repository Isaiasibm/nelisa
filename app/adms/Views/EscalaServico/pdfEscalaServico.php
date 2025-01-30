<?php


ob_start();
require_once'escalaServicoImprimir.php';
$html=ob_get_clean();


include("../relatorios/mpdf60/mpdf.php");
$mpdf=new mPDF('UTF-8',[180,250]);
$mpdf->AddPage('L');
//$mpdf->SetHeader('Document Title|Center Text|{PAGENO}');
//$mpdf->SetDisplayMode('fullpage');
$mpdf->WriteHTML($html);

$mpdf->Output();
exit;

?>