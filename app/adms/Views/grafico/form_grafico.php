
<?php

require('conecta.php');

?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FAN</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />

    <link href="css.css" rel="stylesheet">

    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

<script src="code/highcharts.js"></script>
<script src="code/modules/exporting.js"></script>
  <script type="text/javascript" src="w3.js"></script>

</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="">SGB</a>
            </div>

            <div class="header-right">

                <a href="" class="btn btn-info" title="New Message"><b>0 </b><i class="fa fa-envelope-o fa-2x"></i></a>
                <a href="" class="btn btn-primary" title="New Task"><b>0 </b><i class="fa fa-bars fa-2x"></i></a>
                <a href="../login_biblioteca" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x"></i></a>

            </div>
        </nav>
        <!-- /. NAV TOP  -->
      <?php include 'menu.php';?>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12" >
                        <h3 class="page-head-line">  <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src='imagens/FAA.png' style='border-radius:20px;width:50px; height:50px;'>SISTEMA DE GESTÃO BIBLIOTECÁRIO (SGB) </h3><b>GRAFICO</b>
               

                    </div>
                </div>



   
 <h3 class="page-head-line"></h3>
<div class="tab-content">


  <div class="tab-pane active in" id="first-tab">
<br>

<div class="row">
  
<div class="col-md-6">
  <div id="grafico">



<script type="text/javascript">

Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
    return {
        radialGradient: {
            cx: 0.5,
            cy: 0.3,
            r: 0.7
        },
        stops: [
            [0, color],
            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
        ]
    };
});

// Build the chart
Highcharts.chart('grafico', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'bar'
    },
    title: {
        text: ''
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        bar: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'Blue'
                },
                connectorColor: 'silver'
            }
        }
    },
    series: [{
        name: 'Brands',
        data: [
            { name: 'EMPRESTIMO EXTERNO', y:  <?php $qt=0;
             $Usuario=$pdo->prepare("SELECT * from tb_emprestimo_externo");
                    if($Usuario->execute()){
                    if($Usuario->rowCount()>0)
                      {
                       while($linha=$Usuario->fetch(PDO::FETCH_ASSOC)){
                    $qt++;

                   }
                   echo $qt;
                    }
else{echo $qt;}
                  }
          ?> },

   


               { name: 'REQUISIÇÃO (EMPRESTIMO INTERNO)', y:  <?php $qt=0;
             $Usuario=$pdo->prepare("SELECT * from tb_emprestimo_interno ");
                    if($Usuario->execute()){
                    if($Usuario->rowCount()>0)
                      {
                       while($linha=$Usuario->fetch(PDO::FETCH_ASSOC)){
                    $qt++;

                   }
                   echo $qt;
                    }
else{echo $qt;}
                  }
          ?> }


          
        ]
    }]
});



</script>



</div>

</div>
<div class="col-md-6">
  <br>
<table class="table table-striped" id="tabela">
    <thead>
    <tr>
      <th class="th-sm">Titulo
      </th>

       <th class="th-sm">ISBN
      </th>
      <th class="th-sm">Quantidade
      </th>
    
       <th class="th-sm">Accao
      </th>
    </tr>
  </thead>
</table>
<br>
<table class="table table-striped" id="tabela">
    <thead>
    <tr>
      <th class="th-sm">Titulo
      </th>

       <th class="th-sm">ISBN
      </th>
      <th class="th-sm">Quantidade
      </th>
    
       <th class="th-sm">Accao
      </th>
    </tr>
  </thead>
</table>

</div>

</div>
 

   
  </div>

 




  </div>
</div>





          </div>

        </div>
        <!-- /. PAGE WRAPPER  -->


    
    </div>
    <!-- /. WRAPPER  -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 <div class="modal-dialog">
 <div class="modal-content">
 <div class="modal-header" style="background:;">
 <button type="button" class="close" data-dismiss="modal"
 aria-hidden="true">
 </button>
 <h4 class="modal-title" id="myModalLabel">
 <img src="imagens/FAA.png" style="width:40px;height:40px;">
 </h4>
 <label for="bi"><h3 style="margin-left:">CADASTRAMENTOS DE TIPO DE EQUIPAMENTO</h3></label><br>
 </div>


<form action="cadastrar_tipo_equipamento.php" method="POST" id="formregistardados">
 <div class="modal-body" style="overflow:auto;height:px;">

    <div class="form-group">
<label for="nivelacesso">FAMILIA<b style="color: red;">*</b></label>
<select class="form-control" name="familia" required="required" id="familia"style="background-color:#e5e4e4;"  >
  <option value="">~Escolhe a Opcao~</option>

  <?php
   $Províncias=$pdo->prepare("SELECT Desig_Familia ,Cod_familia FROM tb_familia ");
   $Províncias->execute();
$Província = $Províncias->fetchAll(PDO::FETCH_OBJ);
  foreach ($Província as $P) {
     ?>    
    <option value="<?php echo $P->Cod_familia;?>"><?php echo $P->Desig_Familia;?></option>
<?php }?>
  
</select>
</div>


<div class="form-group">
<label for="bi">TIPO DE EQUIPAMENTO<b style="color: red;">*</b></label>
<input type="text" class="form-control" required="required" name="equipamento" placeholder="" value=""style="background-color:#e5e4e4;" >
</div>

<div class="form-group">
<label for="bi">CODIGO DE EQUIPAMENTO<b style="color: red;">*</b></label>
<input type="text" class="form-control" required="required" name="codigo" placeholder="" value=""style="background-color:#e5e4e4;" >
</div>

     <button class="btn btn-primary" type="submit">ADICIONAR TIPO DE EQUIPAMENTO</button>

 


</form>

 </div>
 <div class="modal-footer" style="background:">
 <button type="button" class="btn btn-default"
 data-dismiss="modal">Close
 </button>

 </div>
 </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<div class="modal fade" id="marca" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 <div class="modal-dialog">
 <div class="modal-content">
 <div class="modal-header" style="background:;">
 <button type="button" class="close" data-dismiss="modal"
 aria-hidden="true">
 </button>
 <h4 class="modal-title" id="myModalLabel">
 <img src="imagens/FAA.png" style="width:40px;height:40px;">
 </h4>
 <label for="bi"><h3 style="margin-left:">CADASTRAMENTOS DE MARCA</h3></label><br>
 </div>


<form action="cadastrar_marca.php" method="POST" id="formregistardados">
 <div class="modal-body" style="overflow:auto;height:px;">
    <div class="form-group">
<label for="nivelacesso">FAMILIA<b style="color: red;">*</b></label>
<select class="form-control" name="familia" required="required" id="familia12"style="background-color:#e5e4e4;"  >
  <option value="">~Escolhe a Opcao~</option>

  <?php
   $Províncias=$pdo->prepare("SELECT Desig_Familia ,Cod_familia FROM tb_familia ");
   $Províncias->execute();
$Província = $Províncias->fetchAll(PDO::FETCH_OBJ);
  foreach ($Província as $P) {
     ?>    
    <option value="<?php echo $P->Cod_familia;?>"><?php echo $P->Desig_Familia;?></option>
<?php }?>
  
</select>
</div>

<script type="text/javascript">

  /*Script Que carrega os municipios de determinada provincia escolhida pelo usuario*/

  $('#familia12').on('change', function(){
      $.getJSON('carregaequipamento.php?search=',{cod_provincia: $(this).val(), ajax: 'true'}, function(j){
        var options = '<option value="">~Escolha o Equipamento~</option>'; 
        for (var i = 0; i < j.length; i++) {
          options += '<option value="' + j[i].cod_municipio + '">' + j[i].nome + '</option>';
        } 
        $('#equipamento123').html(options);
      });

  });

  /*Fim do Script Que carrega os municipios de determinada provincia escolhida pelo usuario*/ 
</script>

 <div class="form-group">
<label for="nivelacesso">TIPO DE EQUIPAMENTO<b style="color: red;">*</b></label>
<select class="form-control" name="equipamento" required="required" id="equipamento123"style="background-color:#e5e4e4;"  >
  <option value="">~Escolhe a Opcao~</option>
</select>
</div>

<div class="form-group">
<label for="bi">MARCA<b style="color: red;">*</b></label>
<input type="text" class="form-control" required="required" name="marca" placeholder="" value=""style="background-color:#e5e4e4;" >
</div>

     <button class="btn btn-primary" type="submit">ADICIONAR MARCA</button>


</form>

 </div>
 <div class="modal-footer" style="background:">
 <button type="button" class="btn btn-default"
 data-dismiss="modal">Close
 </button>

 </div>
 </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade" id="modelo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 <div class="modal-dialog">
 <div class="modal-content">
 <div class="modal-header" style="background:;">
 <button type="button" class="close" data-dismiss="modal"
 aria-hidden="true">
 </button>
 <h4 class="modal-title" id="myModalLabel">
 <img src="imagens/FAA.png" style="width:40px;height:40px;">
 </h4>
 <label for="bi"><h3 style="margin-left:">CADASTRAMENTOS DE MODELO</h3></label><br>
 </div>


<form action="cadastrar_modelo.php" method="POST" id="formregistardados">
 <div class="modal-body" style="overflow:auto;height:px;">

<div class="form-group">
<label for="nivelacesso">FAMILIA<b style="color: red;">*</b></label>
<select class="form-control" name="familia" required="required" id="familia1234"style="background-color:#e5e4e4;"  >
  <option value="">~Escolhe a Opcao~</option>

  <?php
   $Províncias=$pdo->prepare("SELECT Desig_Familia ,Cod_familia FROM tb_familia ");
   $Províncias->execute();
$Província = $Províncias->fetchAll(PDO::FETCH_OBJ);
  foreach ($Província as $P) {
     ?>    
    <option value="<?php echo $P->Cod_familia;?>"><?php echo $P->Desig_Familia;?></option>
<?php }?>
  
</select>
</div>

<script type="text/javascript">

  /*Script Que carrega os municipios de determinada provincia escolhida pelo usuario*/

  $('#familia1234').on('change', function(){
      $.getJSON('carregaequipamento.php?search=',{cod_provincia: $(this).val(), ajax: 'true'}, function(j){
        var options = '<option value="">~Escolha o Equipamento~</option>'; 
        for (var i = 0; i < j.length; i++) {
          options += '<option value="' + j[i].cod_municipio + '">' + j[i].nome + '</option>';
        } 
        $('#equipamento12344').html(options);
      });

  });

  /*Fim do Script Que carrega os municipios de determinada provincia escolhida pelo usuario*/ 
</script>

 <div class="form-group">
<label for="nivelacesso">TIPO DE EQUIPAMENTO<b style="color: red;">*</b></label>
<select class="form-control" name="equipamento" required="required" id="equipamento12344"style="background-color:#e5e4e4;"  >
  <option value="">~Escolhe a Opcao~</option>
</select>
</div>

<script type="text/javascript">

  /*Script Que carrega os municipios de determinada provincia escolhida pelo usuario*/

  $('#equipamento12344').on('change', function(){
      $.getJSON('carregamarca.php?search=',{cod_provincia: $(this).val(), ajax: 'true'}, function(j){
        var options = '<option value="">~Escolha a Marca~</option>'; 
        for (var i = 0; i < j.length; i++) {
          options += '<option value="' + j[i].cod_municipio + '">' + j[i].nome + '</option>';
        } 
        $('#marca124').html(options);
      });

  });

  /*Fim do Script Que carrega os municipios de determinada provincia escolhida pelo usuario*/ 
</script>


 <div class="form-group">
<label for="nivelacesso">MARCA<b style="color: red;">*</b></label>
<select class="form-control" name="marca" required="required" id="marca124"style="background-color:#e5e4e4;"  >
  <option value="">~Escolhe a Opcao~</option>
</select>
</div>







<div class="form-group">
<label for="bi">MODELO<b style="color: red;">*</b></label>
<input type="text" class="form-control" required="required" name="Modelo" id="modelo" placeholder="" value=""style="background-color:#e5e4e4;" >
</div>

     <button class="btn btn-primary" type="submit">ADICIONAR MODELO</button>







</form>

 </div>
 <div class="modal-footer" style="background:">
 <button type="button" class="btn btn-default"
 data-dismiss="modal">Close
 </button>

 </div>
 </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade" id="fornecedor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 <div class="modal-dialog">
 <div class="modal-content">
 <div class="modal-header" style="background:;">
 <button type="button" class="close" data-dismiss="modal"
 aria-hidden="true">
 </button>
 <h4 class="modal-title" id="myModalLabel">
 <img src="imagens/FAA.png" style="width:40px;height:40px;">
 </h4>
 <label for="bi"><h3 style="margin-left:">CADASTRAMENTOS DE FORNECEDOR</h3></label><br>
 </div>


<form action="" method="POST" id="formregistardados12345">
 <div class="modal-body" style="overflow:auto;height:px;">

<div class="form-group">
<label for="bi">Fornecedor<b style="color: red;">*</b></label>
<input type="text" class="form-control" required="required" name="fornecedor" id="modelo" placeholder="" value=""style="background-color:#e5e4e4;" >
</div>

<div class="form-group">
<label for="bi">Contacto<b style="color: red;">*</b></label>
<input type="text" class="form-control" required="required" name="contacto" id="contacto" placeholder="" value=""style="background-color:#e5e4e4;" >
</div>
<br>

<button type="button" id="btnfornecedor" class="btn btn-primary">Cadastrar Fornecedor</button>

 </div>

 </form>


 <script type="text/javascript">
$('#btnfornecedor').click(function(){
/*Envio do Formulario Dados Pessoais*/  
var form = new FormData($('#formregistardados12345')[0]);
$.ajax({
url:'cadastrar_fornecedor.php',
type: 'post',
dataType:'text',
cache:false,
processData:false,
contentType:false,
data:form,
timeout:8000,
success:function(resultado){
  alert(resultado);
location.reload();
 // $("#formregistardados")[0].reset(); 
}
});/*Fim do envio do formulario Dados Pessoais*/

});
</script>
 <div class="modal-footer" style="background:">
 <button type="button" class="btn btn-default"
 data-dismiss="modal">Close
 </button>

 </div>
 </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
</div><!-- /.modal -->





<div class="modal fade" id="unidade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 <div class="modal-dialog">
 <div class="modal-content">
 <div class="modal-header" style="background:;">
 <button type="button" class="close" data-dismiss="modal"
 aria-hidden="true">
 </button>
 <h4 class="modal-title" id="myModalLabel">
 <img src="imagens/FAA.png" style="width:40px;height:40px;">
 </h4>
 <label for="bi"><h3 style="margin-left:">CADASTRAMENTOS DE UNIDADE</h3></label><br>
 </div>


<form action="" method="POST" id="formregistardadosbtn">
 <div class="modal-body" style="overflow:auto;height:px;">


      <div class="form-group">
<label for="nivelacesso">REGIAO<b style="color: red;">*</b></label>
<select class="form-control" name="regiao" required="required" id="regiao_123" style="background-color:#e5e4e4;"  >
  <option value="">~Escolhe a Opcao~</option>

      <?php
   $Províncias=$pdo->prepare("SELECT Desig_Regiao ,cod_regiao FROM tb_regiao ");
   $Províncias->execute();
$Província = $Províncias->fetchAll(PDO::FETCH_OBJ);
  foreach ($Província as $P) {
     ?>    
    <option value="<?php echo $P->cod_regiao;?>"><?php echo $P->Desig_Regiao;?></option>
<?php }?>
  
</select>
</div>



<div class="form-group">
<label for="bi">UNIDADE/ESTABELECIMENTO/ORGÃO<b style="color: red;">*</b></label>
<input type="text" class="form-control" required="required" name="unidade" id="modelo" placeholder="" value=""style="background-color:#e5e4e4;" >
</div>




<br>

<button type="button" id="btnunidade" class="btn btn-primary">Cadastrar Unidade</button>

 </div>

 </form>


 <script type="text/javascript">
$('#btnunidade').click(function(){
/*Envio do Formulario Dados Pessoais*/  
var form = new FormData($('#formregistardadosbtn')[0]);
$.ajax({
url:'cadastrar_unidade.php',
type: 'post',
dataType:'text',
cache:false,
processData:false,
contentType:false,
data:form,
timeout:8000,
success:function(resultado){
  alert(resultado);
location.reload();
 // $("#formregistardados")[0].reset(); 
}
});/*Fim do envio do formulario Dados Pessoais*/

});
</script>
 <div class="modal-footer" style="background:">
 <button type="button" class="btn btn-default"
 data-dismiss="modal">Close
 </button>

 </div>
 </div><!-- /.modal-content -->
 </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


    <div id="footer-sec">
        &copy; 2020 Direcção de Informatica | Design By : <a href="http://www.binarytheme.com/" target="_blank">DI</a>
    </div>
    <!-- /. FOOTER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->

    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
       <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    


</body>
</html>
