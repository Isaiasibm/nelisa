<?php

$id = $_GET['id'];

 
 $GLOBALS['conexao'] = new PDO('mysql:host=localhost;dbname=sisg;charset=utf8', 'root', '',array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")); 

 $Resultado = array();

 

 function buscarDadosPecaIndividual($id) {       
        $dadosPeca= $GLOBALS['conexao']->prepare("SELECT tb_militar.NIP, tb_pessoa.Nome,tb_pessoa.Apelido,tb_patente.Patente,tb_u_e_o.Designacao_Unidade,tb_escala_servico.data_servico,tb_tiposervico.tipo_servico
                FROM tb_pessoa
                INNER JOIN tb_militar 
                ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
                                 INNER JOIN tb_escala_servico 
                ON tb_escala_servico.nip_militar=tb_militar.NIP
                INNER JOIN tb_patente 
                ON tb_escala_servico.Cod_Patente =tb_patente.Cod_Patente
                INNER JOIN tb_u_e_o 
                ON tb_escala_servico.Cod_u_e_o=tb_u_e_o.Cod_Unidade
                INNER JOIN tb_tiposervico 
                ON tb_escala_servico.id_tipo=tb_tiposervico.id
                WHERE tb_escala_servico.id=:id ");
        $dadosPeca->bindValue(":id",$id);
        $dadosPeca->execute();
       
        return  $dadosPeca->fetchAll(PDO::FETCH_ASSOC);

         //while($dados = $documentos->fetch(PDO::FETCH_ASSOC)){

           // extract($dados);
        
    }
    

           $dadosEncontrados = buscarDadosPecaIndividual($id);
         //  extract($dadosEncontrados);

          if (!empty($dadosEncontrados)) {
               $Resultado['dadosEncontrados'] = $dadosEncontrados;
           }else{ $Resultado['dadosEncontrados'] = NULL; }
     
?>

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
                <img align="center"  id="logo" src="../relatorios/logofaa.png" alt="Logo" class="img-responsive" style="width: 60px; height:70px; ">
            </div>
           
            <div class="row" align="center">

            	<table align="center">
            		<tr>
            			
            			<td style="text-align: center;">
            				<span>Estado Maior General</span><br>
                			<span ><b> Unidade de Apoio </b></span><br><br> 
                			
                			<?php  
                            // var_dump($dadosEncontrados); 
                            ?>
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
        <td align="justify"><?php 
echo $Resultado['dadosEncontrados'][0]['Designacao_Unidade']; ?></td>
    </tr>
<tr>
        <td style="width: 430px"></td>
        <td align="center"> <b>= Luanda = </b></td>
    </tr>
</table>
    <br> 
                    
                <span > Assunto: <strong>Notificação do serviço da guarda nº ________ /UAEMG/2021.  </strong></span><br><br>


                      <p align="justify"; font-size="18">  <span>No cumprimento da <strong>Nota Nº 01222/GAB.CEMGADJ.FAA/2020, </strong> p/Área Operacional e de Desenvolvimento de <b>07</b> de <b>Abril </b> sobre a <b>Nova Implementação do Sistema de Guarda no MINDEN/EMGFAA.</b> O comando da Unidade de Apoio/EMGFAA, leva ao conhecimento do Senhor: </span> </p>
                       <p align="justify"> <span> <?php echo $Resultado['dadosEncontrados'][0]['Patente']; ?>, <b><?php echo $Resultado['dadosEncontrados'][0]['Nome'].' '.$Resultado['dadosEncontrados'][0]['Apelido']; ?>, </b></span> que estará de serviço de <b><?php echo $Resultado['dadosEncontrados'][0]['tipo_servico']; ?> </b> no EMGFAA, no dia <b> <?php
                       $dataSer=$Resultado['dadosEncontrados'][0]['data_servico'];
                       $dataSeparada=explode('-', $dataSer);
                       $ano=$dataSeparada[0];
                       $mes=$dataSeparada[1];
                       $dia= $dataSeparada[2];

                        echo $dia.' /'.$mes.' /'.$ano; ?>.</b> </p>
                        <p align="justify">O militar <b>(Oficial ou Sargento) </b> da rendição deverá apresentar-se no distrito da guarda às <b>07H00</b> e às <b> 07H30</b> devem participar na <b>Formatura do Serviço da Guarda</b> ao EMGFAA.</p>
                        <p align="justify"> Em seguida realizar o recorrido às instalações do EMG devendo também registar no livro para o efeito.</p>

                        <p align="justify"><b>Nota Bem: </b> O não cumprimento do referido Serviço será punido nos termos do Capítulo <b>V,</b> do artigo <b>Nº 16º</b> ponto <b>1 e 2</b> das NRDM <b>(Normas Reguladoras da Disciplina Militar).</b> </p><br>
                        <p><b>Unidade de Apoio/EMGFAA em Luanda, aos <?php echo date('d/m/Y'); ?> </b></p> <br>

                        <p align="center"> O Comandante</p>
                        <p align="center">Coronel Dombel</p>
                        <p align="center">*Brigadeiro*</p>
                        
<p><b>Recebi: </b></p>
<p>Nome:____________________</p>
<p>Telefone:________________</p>
</div>
       



</body>
</html>