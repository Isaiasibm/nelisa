
<?php
setlocale(LC_TIME, 'pt_BR', 'pt_BR.utf-8', 'pt_BR.utf-8', 'portuguese');
date_default_timezone_set('Africa/Luanda');

$servidor = "localhost";
$usuario = "root";
$senha = "";
$dbname = "ginfra";
//Criar a conexão
$conn = mysqli_connect($servidor, $usuario, $senha, $dbname);


$nip = $_POST["nip"];

$resultado = mysqli_query($conn, "SELECT
        tab_infratores.id,
        tab_infratores.numero_bi,
         tab_infratores.nome_pai,
         tab_infratores.data_nascimento,
        tab_infratores.nome_infractor,
        tb_patente.patente,
        tab_infraccoes.designacao_infraccao,
        tb_processo.processo,
        tb_u_e_o.designacao_Unidade,
        tb_estado_processo.descricao_proc,
        tb_u_e_o.id ,
        tab_infratores.data_infracao,
        tab_infratores.nome_ofendido,
        tab_infratores.nome_instrutor,
        tab_infratores.nip,
        tab_infratores.created
        FROM
        tab_infratores
        INNER JOIN tb_patente ON tb_patente.id = tab_infratores.cod_patente
        INNER JOIN tab_infraccoes ON tab_infraccoes.id = tab_infratores.id_infraccoes
        INNER JOIN tb_processo ON tb_processo.id = tab_infratores.n_processo
        INNER JOIN tb_estado_processo ON tb_estado_processo.id = tb_processo.situacaoprocesso_id
        INNER JOIN tb_u_e_o ON tb_u_e_o.id = tab_infratores.cod_Unidade
        WHERE tab_infratores.nip = '$nip' ");
$linhas_cont = mysqli_num_rows($resultado);




//  $total_p = mysql_num_rows($total_pessoas);
?>
<html>
    <head>
        <title>GINFRA- Sistema de Gestão de Infractores</title>


        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
            .tg .tg-ltev{font-weight:bold;background-color:#d3d3d3;color:#000;border-color:inherit;text-align:center;vertical-align:top}
            .tg .tg-0lax{text-align:left; font-weight:bold; vertical-align:top}
            .tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
            .tg .tg-ltef{font-weight:bold;background-color:#ffffff;color:#ffffff;border-color:inherit;text-align:left;vertical-align:top}
        </style>
    </head>
    <body >

        <div class="container" >
            <div class="row" align="center" >
                <img  id="logo" src="logofaa.png" alt="Logo" class="img-responsive" style="width: 50px; height:50px; ">
            </div>
            <div class="row" align="center" >
                <span style="">FORÇAS ARMADAS ANGOLANAS</span><br>
                <span style="font-size: 14px;">ESTADO MAIOR GENERAL</span><br>
                <span style=""><b>CONSELHO SUPERIOR DE DISCIPLINA MILITAR</b></span><br><br><br><br>
                <span style=""><b></b></span><br><br>


            </div>
        </div>


        <?php
        while ($linhas_cont = mysqli_fetch_array($resultado)) {
            ?>


            <table class="tg" align="center" style="width: 800px;">

                <tr>
                    <th class="tg-ltev" colspan="2" style="width: 600px"><?php echo  $linhas_cont['nip']; ?> - <?php echo  $linhas_cont['nome_infractor']; ?></th>
                </tr>
                <tr>
                    <th class="tg-ltef" colspan="2" style="width: 600px"></th>
                </tr>

                <tr>
                    <td class="tg-0lax" style="width: 200px">Número do Bilhete </td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont['numero_bi']; ?></td>
                </tr>

                <tr>
                    <td class="tg-0lax" style="width: 200px">Data de Nascimento </td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont['data_nascimento']; ?></td>
                </tr>



                <tr>
                    <th class="tg-0pky" colspan="2" style="width: 600px"></th>
                </tr>


                <tr>
                    <td class="tg-0lax" style="width: 200px">Patente </td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont['patente']; ?></td>
                </tr>

                <tr>
                    <td class="tg-0lax" style="width: 200px">Unidade </td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont['designacao_Unidade']; ?></td>
                </tr>

              

                <tr>
                    <th class="tg-0pky" colspan="2" style="width: 600px"></th>
                </tr>

                               <tr>
                    <td class="tg-0lax" style="width: 200px">Número do Processo </td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont["processo"]; ?></td>
                </tr>
                
                <tr>
                    <td class="tg-0lax" style="width: 200px">Infracção </td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont["designacao_infraccao"]; ?></td>
                </tr>

                <tr>
                    <td class="tg-0lax" style="width: 200px">Data da Infracção </td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont["data_infracao"]; ?></td>
                </tr>

                <tr>
                    <td class="tg-0lax" style="width: 200px">Nome do Instrutor </td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont["nome_instrutor"]; ?></td>
                </tr>


                <tr>
                    <td class="tg-0lax" style="width: 200px">Nome do Ofendido </td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont["nome_ofendido"]; ?></td>
                </tr>

                <tr>
                    <td class="tg-0lax" style="width: 200px">Data e Hora do Registo</td>
                    <td class="tg-0pky" style="width: 400px"><?php echo $linhas_cont["created"]; ?></td>
                </tr>

            </table>
        <?php }
        ?>



        <div class="row" align="center" ><br><br>




            <span >LUANDA AOS <?php echo strtoupper(strftime('%d de %B de %Y', strtotime('today'))); ?> </span><br><br>

            <span ><b>O Responsável</b></span><br><br>
            <span ><b>_________________________________</b></span><br>
        </div>

    </body>
</html>














