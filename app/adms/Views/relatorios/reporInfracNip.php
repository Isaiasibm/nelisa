<?php

require __DIR__.'/vendor/autoload.php';
//require URL.'view/relatorios/vendor/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;
//$nome=$_POST['nome'];
ob_start();
require_once'test_pdf.php';
$html=ob_get_clean(); 

$html2pdf = new Html2Pdf('H','A4','Pt','true','UTF-8');
$html2pdf->writeHTML($html);
$html2pdf->output('Listagem de Infractores Por Nip.pdf');

?>