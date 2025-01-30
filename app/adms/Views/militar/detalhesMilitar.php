<?php
if (!defined('URL')) {
    header("Location: /");
    exit();
}

//var_dump($this->Dados['militarEscalado']);
if (!empty($this->Dados['militarEscalado'])) {
    foreach ($this->Dados['militarEscalado'] as $valor) {
        # code...

        extract($valor);
        //var_dump($valor);
?>
        <div class="content p-1">
            <div class="list-group-item">
                <div class="d-flex">

                    <div class="mr-auto p-2">
                        Voltar

                        <h2 class="display-4 titulo">Histórico do Militar</h2>
                    </div>

                    <div class="p-2">

                        <span class="d-none d-md-block">
                            <?php
                            $idNip = $id . "-" . $NIP . "-";
                            echo "<a href='" . URLADM . "controleEscalaServico/listarEscala' class='btn btn-outline-info btn-sm'>Listar</a> ";

                            echo "<a href='" . URLADM . "controleEscalaServico/confirmarPresenca/$idNip' class='btn btn-outline-warning btn-sm'>Confirmar Presença</a> ";

                            echo "<a href='" . URLADM . "controleEscalaServico/listarEscala' class='btn btn-outline-info btn-sm' onClick='history.go(-1)' >Voltar</a> ";
                            echo "<a href='<?php echo URLADM; ?>home/index' class='btn badge badge-danger btn-sm px-1' >Fechar</a> ";
                            ?>
                        </span>

                    </div>

                    <!--    <form> 
<input type="button" value="Voltar" onClick="history.go(-1)"> 
 <input type="button" value="Avançar" onClick="history.forward()"> 
<input type="button" value="Atualizar" onClick="history.go(0)">
</form> -->
                </div>
                <hr>



                <?php
                if (isset($_SESSION['msg'])) {
                    echo $_SESSION['msg'];
                    unset($_SESSION['msg']);
                }
                ?>
                <span class="d-none d-md-block">

                </span>

                <?php echo   "<a href='" . URLADM . "controleEscalaServico/imprimirNotificacao/$id' target='_blank' align='right'>
                <div class='p-2'>
                    <span class='btn btn-outline-success btn-sm'>
                         Gerar notificação individual
                    </span>
                </div>
            </a> "; ?>
                <?php  /*      <a href="<?php echo URLADM; ?>App/Adms/Views/EscalaServico/pdfnotificacaoIndividual.php?id=<?php echo $id; ?>" align="right">
                <div class="p-2">
                    <span class="btn btn-outline-success btn-sm">
                         Gerar notificação individual
                    </span>
                </div>
            </a>  */ ?>





                <dl class="row">

                    <dt class="col-sm-2">Nip:</dt>
                    <dd class="col-sm-9"><?php echo $NIP; ?></dd>

                    <dt class="col-sm-2">Nome Completo:</dt>
                    <dd class="col-sm-9"><?php echo $Nome . ' ' . $Apelido; ?></dd>

                    <dt class="col-sm-2">Posto:</dt>
                    <dd class="col-sm-9"><?php echo $Patente; ?></dd>

                    <dt class="col-sm-2">Data de serviço:</dt>
                    <dd class="col-sm-9"><?php echo $data_servico; ?></dd>

                    <dt class="col-sm-2">Unidade:</dt>
                    <dd class="col-sm-9"><?php echo $Designacao_Unidade; ?></dd>

                    <dt class="col-sm-2">Último serviço:</dt>

                    <dd class="col-sm-9"><?php

                                            if ($data_ultimo_servico == NULL) {
                                                $a = 'Novo';

                                                //$data_ultimo_servico=="Novo";
                                                # code...
                                            } else {
                                                $a = $data_ultimo_servico;
                                            }
                                            echo $a; ?></dd>

                    <dt class="col-sm-2">Designação do Serviço:</dt>
                    <dd class="col-sm-9"><?php echo $tipo_servico; ?></dd>

                    <dt class="col-sm-2">Estado do Serviço:</dt>
                    <dd class="col-sm-9"> <?php echo $estado_servico; ?></span></dd>

                </dl>



                <style type="text/css">
                    .tg {
                        border-collapse: collapse;
                        border-spacing: 0;
                        border-color: #93a1a1;
                    }

                    .tg td {
                        font-family: Arial, sans-serif;
                        font-size: 14px;
                        padding: 10px 5px;
                        border-style: solid;
                        border-width: 1px;
                        overflow: hidden;
                        word-break: normal;
                        border-color: #93a1a1;
                        color: #002b36;
                        background-color: #fdf6e3;
                    }

                    .tg th {
                        font-family: Arial, sans-serif;
                        font-size: 14px;
                        font-weight: normal;
                        padding: 10px 5px;
                        border-style: solid;
                        border-width: 1px;
                        overflow: hidden;
                        word-break: normal;
                        border-color: #93a1a1;
                        color: #fdf6e3;
                        background-color: #657b83;
                    }

                    .tg .tg-ycr8 {
                        background-color: #ffffff;
                        text-align: left;
                        vertical-align: top
                    }

                    .tg .tg-z4sk {
                        font-family: "Courier New", Courier, monospace !important;
                        ;
                        background-color: #343434;
                        color: #ffffff;
                        text-align: center;
                        vertical-align: top
                    }
                </style>

                <?php
                $ver_historico = new App\adms\Models\helper\AdmsRead();
                $ver_historico->fullRead("SELECT tb_pessoa.Nome, tb_pessoa.Apelido, tb_u_e_o.Designacao_Unidade,tb_patente.Patente, 
tb_militar.NIP, tb_escala_servico.data_servico,tb_tiposervico.tipo_servico,tb_escala_servico.observacao,tb_estado_servico.estado_servico
            FROM tb_escala_servico 
            INNER JOIN tb_militar ON tb_escala_servico.nip_militar=tb_militar.NIP 
            INNER JOIN tb_tiposervico ON tb_tiposervico.id=tb_escala_servico.id_tipo 
            INNER JOIN tb_estado_servico ON tb_estado_servico.id_estado_servico=tb_escala_servico.id_estado_servico
            INNER JOIN tb_pessoa ON tb_militar.Cod_Pessoa=tb_pessoa.Cod_Pessoa
            INNER JOIN tb_patente ON tb_escala_servico.Cod_Patente =tb_patente.Cod_Patente
            INNER JOIN tb_u_e_o ON tb_escala_servico.Cod_u_e_o=tb_u_e_o.Cod_Unidade
            WHERE tb_militar.NIP=$NIP");

                ?>

                <div class="form-row">
                    <div class="form-group col-md-1"> </div>
                    <div class="form-group col-md-10">
                        <div class="scroll">
                            <h4 align="center">Histórico do serviço de guarda afecto ao militar</h4>
                            <table class="tg" style="undefined;table-layout: fixed;" align="center">

                                <tr style="background-color: #ccc; text-align: center;">
                                    <th class="tg-0lax">Nº</th>
                                    <th class="tg-0lax">Nip</th>
                                    <th class="tg-0lax">Nome do Militar</th>
                                    <th class="tg-0lax">Patente</th>
                                    <th class="tg-0lax">Tipo de serviço</th>
                                    <th class="tg-0lax">Datas escaladas</th>
                                    <th class="tg-0lax">Unidade</th>
                                    <th class="tg-0lax">Estado do serviço</th>
                                    <th class="tg-0lax">Justificativa</th>
                                </tr>
                                <?php
                                $cont = 0;
                                foreach ($ver_historico->getResultado() as $historico) :
                                    extract($historico);
                                    $cont = $cont + 1;
                                ?>
                                    <tr>

                                        <td class="tg-0lax"><?php echo $cont; ?></td>
                                        <td class="tg-0lax"><?php echo $NIP; ?></td>
                                        <td class="tg-0lax"><?php echo $Nome . ' ' . $Apelido; ?></td>
                                        <td class="tg-0lax"><?php echo $Patente; ?></td>
                                        <td class="tg-0lax"><?php echo $tipo_servico; ?></td>
                                        <td class="tg-0lax"><?php echo $data_servico; ?></td>
                                        <td class="tg-0lax"><?php echo $Designacao_Unidade; ?></td>
                                        <td class="tg-0lax"><?php echo $estado_servico; ?></td>
                                        <td class="tg-0lax"><?php echo $observacao; ?></td>


                                    </tr>
                                <?php endforeach; ?>
                            </table>
                        </div>
                    </div>

                    <div class="form-group col-md-1"> </div>
                </div>

            </div>
        </div>
<?php
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: Militar não encontrado!</div>";
    $UrlDestino = URLADM . 'controleEscalaServico/listarEscala';
    header("Location: $UrlDestino");
}





?>