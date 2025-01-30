<?php


ob_start();
require_once'notificacaoIndivitualimprimir.php';
$html=ob_get_clean();


include("../relatorios/mpdf60/mpdf.php");
$mpdf=new mPDF('UTF-8','A4');
$mpdf->AddPage('P');
//$mpdf->SetHeader('Document Title|Center Text|{PAGENO}');
//$mpdf->SetDisplayMode('fullpage');
$mpdf->WriteHTML($html);

$mpdf->Output();
exit;

?>