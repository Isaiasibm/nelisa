<?php
    if (! defined('URL')) {
    header("Location: /");
    exit();
    }
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">

 <?php
     $id_Nivel = $_SESSION['adms_niveis_acesso_id'];
     $vis      = new \App\adms\Models\helper\AdmsRead();
     $vis->ExeRead('adms_niveis_acessos WHERE id= 1');

     foreach ($vis->getResultado() as $doc):
         extract($doc);
         $codTipoSer = $doc['id'];
         $tipoSer    = $doc['nome'];
 ?>


            <div class="mr-auto p-2">
                <h1 class="display-4 titulo"> <b> Quadro Informativo para o <?php echo $tipoSer; ?> </b> </h1> <br>
            </div>
            <?php

                endforeach;
            ?>

        </div>
        <div class="row mb-3 justify-content-center">
            <div class="col-12 col-sm-6 col-lg-3 mb-3 mb-lg-0">
                <div class="card bg-success text-white">
                    <div class="card-body">
                        <i class="fas fa-users fa-3x"></i>
                        <h6 class="card-title">Usuários</h6>
                        <h2 class="lead">10</h2>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3 mb-3 mb-lg-0">
                <div class="card bg-danger text-white">
                    <div class="card-body">
                        <i class="fas fa-file fa-3x"></i>
                        <h6 class="card-title">Medicamentos</h6>
                        <h2 class="lead">63</h2>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3 mb-3 mb-lg-0">
                <div class="card bg-warning text-white">
                    <div class="card-body">
                        <i class="fas fa-eye fa-3x"></i>
                        <h6 class="card-title">Xaropes</h6>
                        <h2 class="lead">648</h2>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3 mb-3 mb-lg-0">
                <div class="card bg-info text-white">
                    <div class="card-body">
                        <i class="fas fa-comments fa-3x"></i>
                        <h6 class="card-title">Estatísticas</h6>
                        <h2 class="lead">17</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>