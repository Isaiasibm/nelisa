<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h5 class="display-4 titulo">Estatísticas por Gráficos das Presenças</h5>
            </div>

                <div class="p-2">
                  <a href="<?php echo URLADM.'home/index/'?>" class="btn badge badge-danger btn-sm px-1" style="font-size: 10pt; border-radius:7px 7px;">
                      <i class="fas fa-home"></i>Fechar</a>
                </div>

        </div>

        <?php

        if (isset($_SESSION['msg'])):
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        endif;

        if (isset($_SESSION['msgcad'])):
            echo $_SESSION['msgcad'];
            unset($_SESSION['msgcad']);
        endif;         
        ?>
       
        <form name="listarEscala" action="" method="post" enctype="multipart/form-data"  id="listarEscala">

<div class="form-row">
            <div class="form-group col-md-2">
                <label><span class="text-danger">*</span>Selecione o tipo</label>
                <select class="form-control" name="tipografico" id="tipografico" required="">
                        <option value=""> Selecione </option>
                        <option value="1"> Por Unidade e Mês </option>
                        <option value="2"> Por Unidade e Intervalo Data </option>
                        <option value="3"> Por Tipo de Serviço e Mês </option>
                        <option value="4"> Por Tipo de Serviço e Intervalo de Data </option>
                         
                         
                    </select>
            </div>
</div>

        <div class="form-row">

           


                  <div class="form-group col-md-2" id="divAnoG" style="display: none;">
                    <label><span class="text-danger">*</span>Selecione o ano</label>
                    <select class="form-control" name="ano" id="ano">
                        <option value="">Ano </option>
                        <?php
       for ($anoInicio = date('Y') +1 ; $anoInicio >= date('Y') -1; $anoInicio--)
       {
          echo '<option value="'.$anoInicio.'">'.$anoInicio.'</option>';
       }
    ?>
                    </select>
                </div> 

                <div class="form-group col-md-2" id="divMesG" style="display: none;">
                    <label><span class="text-danger">*</span>Escolha o mês</label>
                    <select name="mes" id="mes" class="form-control">

                        <option value="">Selecione o mês</option>
                        <option value="01-Janeiro">Janeiro</option>
                        <option value="02-Fevereiro">Fevereiro</option>
                        <option value="03-Março">Março</option>
                        <option value="04-Abril">Abril</option>
                        <option value="05-Maio">Maio</option>
                        <option value="06-Junho">Junho</option>
                        <option value="07-Julho">Julho</option>
                        <option value="08-Agosto">Agosto</option>
                        <option value="09-Setembro">Setembro</option>
                        <option value="10-Outubro">Outubro</option>
                        <option value="11-Novembro">Novembro</option>
                        <option value="12-Dezembro">Dezembro</option>
                                               
                    </select>
                </div>

                   <div class="form-group col-md-2" id="dataIni" style="display: none;">
                    <label id="labelDataIni"><span class="text-danger">*</span>Data Inicial</label>
                    <input name="dataInicial" type="date" class="form-control" id="dataInicial" value="">
                </div>

                <div class="form-group col-md-2" id="dataFim" style="display: none;">
                    <label><span class="text-danger">*</span>Data Final</label>
    
                    <input name="dataFinal" type="date" class="form-control" id="dataFinal" value="">
                </div>

           


                <div class="form-group col-md-3">
                 <br>
                  <span class="text-danger">* </span>Campo obrigatório &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button
                  type="submit" class="btn btn-success" value="Guardar"
                  name="enviar">Listar</button>
                   
                </div>
             </div>

            </form>

    


 <br>

<?php 







if (isset($this->Dados["tipografico"]) ) {
    // code...

if ($this->Dados["tipografico"]==1 ) {


if (isset($this->Dados['presenteUnidadeGrafico'])) {
    // code...

$total = 0;
foreach($this->Dados['presenteUnidadeGrafico'] as $dado){
    $total = $total + $dado['quantidade'];

}
?>


<hr style="border: 3px solid #8FBC8F ">


        <div class="d-flex">
            <div class="mr-auto p-2">

            </div>          
        </div>
    <?php
    if (isset($_SESSION['msg'])):
        echo $_SESSION['msg'];
        unset($_SESSION['msg']);
    endif;
    if (isset($_SESSION['msgcad'])):
        echo $_SESSION['msgcad'];
        unset($_SESSION['msgcad']);
    endif;
    ?>
  
            
<style type="text/css">
 th{
        text-align: center;
        vertical-align: middle;
    }
    .highcharts-credits{
        display: none;
    }
  
.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #EBEBEB;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}


input[type="number"] {
    min-width: 50px;
}
</style>

    <script src="<?php echo URLADM . 'assets/js/highcharts.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/data.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/drilldown.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/exporting.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/export-data.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/acessibility.js'; ?>"></script>
    


    <div id="container"></div>
   
    </div>
       
    </div>
   

        </div>
    </div>


<script type="text/javascript">
// Create the chart
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Gráfico de Presenças por Unidades no mês de <?php echo $this->Dados["mesTexto"] ?> de <?php echo $this->Dados["ano"] ?>'
    },
    accessibility: {
        announceNewData: {
            enabled: true
        }
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: 'Total Percentual de Presenças por unidade'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.2f}%'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> de <?=$total ?><br/>'
    },

    series: [
        {
            name: "Unidade",
            colorByPoint: true,
            data: [

                <?php 
                    foreach($this->Dados['presenteUnidadeGrafico'] as $dado){
                        extract($dado);
                        echo "{name:'".$Designacao_Unidade."',y:".$percentagem.",drilldown:'".$quantidade."'},";
                    }

                ?>
            ]
        }
    ],
    drilldown: {
        series: [
            
        ]
    }
});
        </script>


        <?php 

}
}


elseif ($this->Dados["tipografico"]==2 ) {


if (isset($this->Dados['presenteUnidadeGraficoIntervalo'])) {
    // code...

$total = 0;
foreach($this->Dados['presenteUnidadeGraficoIntervalo'] as $dado){
    $total = $total + $dado['quantidade'];

}
?>


<hr style="border: 3px solid #8FBC8F ">


        <div class="d-flex">
            <div class="mr-auto p-2">

            </div>          
        </div>
    <?php
    if (isset($_SESSION['msg'])):
        echo $_SESSION['msg'];
        unset($_SESSION['msg']);
    endif;
    if (isset($_SESSION['msgcad'])):
        echo $_SESSION['msgcad'];
        unset($_SESSION['msgcad']);
    endif;
    ?>
  
            
<style type="text/css">
 th{
        text-align: center;
        vertical-align: middle;
    }
    .highcharts-credits{
        display: none;
    }
  
.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #EBEBEB;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}


input[type="number"] {
    min-width: 50px;
}
</style>

    <script src="<?php echo URLADM . 'assets/js/highcharts.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/data.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/drilldown.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/exporting.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/export-data.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/acessibility.js'; ?>"></script>
    


    <div id="container"></div>
   
    </div>
       
    </div>
   

        </div>
    </div>


<script type="text/javascript">
// Create the chart
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Gráfico de Presenças por Unidades no período de <?php echo $this->Dados["dataInicial"] ?> à <?php echo $this->Dados["dataFinal"] ?>'
    },
    accessibility: {
        announceNewData: {
            enabled: true
        }
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: 'Total Percentual de Presenças por unidade'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.2f}%'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> de <?=$total ?><br/>'
    },

    series: [
        {
            name: "Unidade",
            colorByPoint: true,
            data: [

                <?php 
                    foreach($this->Dados['presenteUnidadeGraficoIntervalo'] as $dado){
                        extract($dado);
                        echo "{name:'".$Designacao_Unidade."',y:".$percentagem.",drilldown:'".$quantidade."'},";
                    }

                ?>
            ]
        }
    ],
    drilldown: {
        series: [
            
        ]
    }
});
        </script>


        <?php 

}
}



elseif($this->Dados["tipografico"]==3){

    // code...



if (isset($this->Dados['presenteTipoServicoGrafico'])) {
    // code...

$total = 0;
foreach($this->Dados['presenteTipoServicoGrafico'] as $dado){
    $total = $total + $dado['quantidade'];

}
?>


<hr style="border: 3px solid #8FBC8F ">


        <div class="d-flex">
            <div class="mr-auto p-2">

            </div>          
        </div>
    <?php
    if (isset($_SESSION['msg'])):
        echo $_SESSION['msg'];
        unset($_SESSION['msg']);
    endif;
    if (isset($_SESSION['msgcad'])):
        echo $_SESSION['msgcad'];
        unset($_SESSION['msgcad']);
    endif;
    ?>
  
            
<style type="text/css">
 th{
        text-align: center;
        vertical-align: middle;
    }
    .highcharts-credits{
        display: none;
    }
  
.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #EBEBEB;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}


input[type="number"] {
    min-width: 50px;
}
</style>

    <script src="<?php echo URLADM . 'assets/js/highcharts.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/data.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/drilldown.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/exporting.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/export-data.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/acessibility.js'; ?>"></script>
    


    <div id="container"></div>
   
    </div>
       
    </div>
   

        </div>
    </div>


<script type="text/javascript">
// Create the chart
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Gráfico de Presenças por Tipo de serviço no mês de <?php echo $this->Dados["mesTexto"] ?> de <?php echo $this->Dados["ano"] ?>'
    },
    accessibility: {
        announceNewData: {
            enabled: true
        }
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: 'Percentual de Presenças por tipo de serviço'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.2f}%'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> de <?=$total ?><br/>'
    },

    series: [
        {
            name: "Unidade",
            colorByPoint: true,
            data: [

                <?php 
                    foreach($this->Dados['presenteTipoServicoGrafico'] as $dado){
                        extract($dado);
                        echo "{name:'".$tipo_servico."',y:".$percentagem.",drilldown:'".$quantidade."'},";
                    }

                ?>
            ]
        }
    ],
    drilldown: {
        series: [
            
        ]
    }
});
        </script>


        <?php 

}

}



elseif($this->Dados["tipografico"]==4){

    // code...



if (isset($this->Dados['presenteTipoServicoGraficoIntervalo'])) {
    // code...

$total = 0;
foreach($this->Dados['presenteTipoServicoGraficoIntervalo'] as $dado){
    $total = $total + $dado['quantidade'];

}
?>


<hr style="border: 3px solid #8FBC8F ">


        <div class="d-flex">
            <div class="mr-auto p-2">

            </div>          
        </div>
    <?php
    if (isset($_SESSION['msg'])):
        echo $_SESSION['msg'];
        unset($_SESSION['msg']);
    endif;
    if (isset($_SESSION['msgcad'])):
        echo $_SESSION['msgcad'];
        unset($_SESSION['msgcad']);
    endif;
    ?>
  
            
<style type="text/css">
 th{
        text-align: center;
        vertical-align: middle;
    }
    .highcharts-credits{
        display: none;
    }
  
.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #EBEBEB;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}


input[type="number"] {
    min-width: 50px;
}
</style>

    <script src="<?php echo URLADM . 'assets/js/highcharts.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/data.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/drilldown.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/exporting.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/export-data.js'; ?>"></script>
    <script src="<?php echo URLADM . 'assets/js/acessibility.js'; ?>"></script>
    


    <div id="container"></div>
   
    </div>
       
    </div>
   

        </div>
    </div>


<script type="text/javascript">
// Create the chart
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Gráfico de Presenças por Tipo de serviço no período de <?php echo $this->Dados["dataInicial"] ?> à <?php echo $this->Dados["dataFinal"] ?>'
    },
    accessibility: {
        announceNewData: {
            enabled: true
        }
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: 'Percentual de Presenças por tipo de serviço'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.2f}%'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> de <?=$total ?><br/>'
    },

    series: [
        {
            name: "Unidade",
            colorByPoint: true,
            data: [

                <?php 
                    foreach($this->Dados['presenteTipoServicoGraficoIntervalo'] as $dado){
                        extract($dado);
                        echo "{name:'".$tipo_servico."',y:".$percentagem.",drilldown:'".$quantidade."'},";
                    }

                ?>
            ]
        }
    ],
    drilldown: {
        series: [
            
        ]
    }
});
        </script>


        <?php 

}

}

}
    ?>