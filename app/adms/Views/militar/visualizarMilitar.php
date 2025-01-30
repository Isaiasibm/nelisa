 <!-- Dados do Formulario-->
 <?php
    if (isset($this->Dados['Militar'])) {
        $valorForm = $this->Dados['Militar'];
    }
    if (isset($this->Dados['Militar'][0])) {
        $valorForm = $this->Dados['Militar'][0];
    }

    $idNip = $valorForm['NIP'];
?>


 <div class="content p-1">
     <div class="list-group-item">
         <div class="d-flex">

             <div class="mr-auto p-2">
                 <h2 class="display-4 titulo">Detalhes do Militar</h2>
             </div>

             <div class="p-2">

                 <span class="d-none d-md-block">
                     <?php
                        echo "<a href='" . URLADM . "controleEscalaServico/listarMilitDisponiveis' class='btn btn-outline-info btn-sm'>Listar</a> ";

                        echo "<a href='" . URLADM . "ControleMilitar/editarDadosMilitar/$idNip' class='btn btn-outline-warning btn-sm'>Editar</a> ";

                        ?>
                 </span>

             </div>
         </div>
         <hr>

         <dl class="row">

             <dt class="col-sm-2">Nip:</dt>
             <dd class="col-sm-9"><?php echo $valorForm['NIP']; ?></dd>

             <dt class="col-sm-2">Nome Completo:</dt>
             <dd class="col-sm-9"><?php echo $valorForm['Nome']; ?></dd>

             <dt class="col-sm-2">Posto:</dt>
             <dd class="col-sm-9">
                 <?php if ($valorForm['cod_ramo'] == 4) : ?>
                     <?php echo $valorForm['Patente_EMGA']; ?>
                 <?php else : ?>
                     <?php echo $valorForm['Patente']; ?>
                 <?php endif; ?>
             </dd>

             <dt class="col-sm-2">Unidade:</dt>
             <dd class="col-sm-9"><?php echo $valorForm['Designacao_Unidade']; ?></dd>

             <dt class="col-sm-2">Último serviço:</dt>

             <dd class="col-sm-9">
                 <?php
                    if ($valorForm['data_ultimo_servico'] == NULL) {
                        $a = 'Novo';
                    } else {
                        $a = $valorForm['data_ultimo_servico'];
                    }
                    echo $a; ?>
             </dd>

         </dl>

         <hr>


         <div class="scroll">
             <h4 align="center">Escala de Serviço</h4>

             <?php if (!empty($this->Dados['Escala']) and count($this->Dados['Escala']) != 0) : ?>

                 <table class="table table-secondary table-sm " align="center">
                     <tr>
                     <th class="tg-0lax">Nº</th>
                         <th class="tg-0lax">Data Último Serviço</th>
                         <th class="tg-0lax">Data do Proximo Serviço</th>
                         <th class="tg-0lax">Tipo de Serviço</th>
                         <th class="tg-0lax">Estado do Serviço</th>
                     </tr>
                     <?php
                        $cont = 0;
                        foreach ($this->Dados['Escala'] as $escala) :
                            extract($escala);
                            $cont = $cont + 1;
                        ?>
                         <tr>

                             <td class="tg-0lax"><?php echo $cont; ?></td>
                             <td class="tg-0lax">
                                <?php
                                $data = '0000-00-00';
                                if(strtotime($data_ultimo_servico) == strtotime($data)){
                                    echo "Novo"; 
                                }else{
                                    echo $data_ultimo_servico; 
                                }
                             ?>
                             </td>
                             <td class="tg-0lax"><?php echo $data_servico; ?></td>
                             <td class="tg-0lax"><?php echo $tipo_servico; ?></td>
                             <td class="tg-0lax"><?php echo $estado_servico; ?></td>


                         </tr>
                     <?php endforeach; ?>
                 </table>

             <?php else :  ?>
                 <div class='alert alert-danger'>Não exite escala de serviço para o Militar</div>
             <?php endif; ?>



         </div>

     </div>
 </div>