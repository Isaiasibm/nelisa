<?php
if (!defined('URL')) {
    header("Location: /");
    exit();
}
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">        
    <title> NELISA - Sistema de Gestão da Farmácia </title>
    <link rel="icon" href="<?php echo URLADM . 'imagens/nelisa_img.jpeg'; ?>">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<?php echo URLADM . 'assets/css/bootstrap.min.css'; ?>">

    <!-- FontAwesome -->
    <script defer src="<?php echo URLADM . 'assets/js/fontawesome-all.min.js'; ?>"></script>
    <link rel="stylesheet" href="<?php echo URLADM . 'assets/css/fontawesome.min.css'; ?>">

    <!-- Estilos do painel -->
    <link rel="stylesheet" href="<?php echo URLADM . 'assets/css/dashboard.css'; ?>">
     <link rel="stylesheet" href="<?php echo URLADM . 'assets/css/vendas.css'; ?>">

    <!-- DataTables -->
    <link rel="stylesheet" href="<?php echo URLADM . 'assets/css/dataTables.bootstrap4.min.css'; ?>">

   <link href="https://cdn.datatables.net/v/bs4/dt-2.3.7/r-3.0.8/datatables.min.css" rel="stylesheet" integrity="sha384-iIA1v+h7y5huqT/4gPPivkpvZenGQ4GPhS3rlIolp5LaKPRoVzNyMm+4ekOVBerF" crossorigin="anonymous">
 

    <!-- Select2 - Adicionando Importação Global -->

    <link rel="stylesheet" href="<?php echo URLADM . 'assets/css/select2.min.css'; ?>">

    
    <script>
        //Variável para ser usada no ajax da submissão da venda.
        window.BASE_URL = "<?php echo URLADM; ?>";
    </script>


</head>
<body> 
