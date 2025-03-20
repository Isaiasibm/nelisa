<?php
if (!defined('URL')) {
    header("Location: /");
    exit();
}
?>
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

    <!-- DataTables -->
    <link rel="stylesheet" href="<?php echo URLADM . 'assets/css/dataTables.bootstrap4.min.css'; ?>">

    <!-- Select2 - Adicionando Importação Global -->

    <link rel="stylesheet" href="<?php echo URLADM . 'assets/css/select2.min.css'; ?>">

</head>
<body> 
