<?php
    header('Content-type: text/html; charset=utf-8');

    $turnoEdicao = $this->Dados['turnoEdicao'] ?? null;
    $isEdicao    = ! empty($turnoEdicao);

    $valorInicio      = '';
    $valorFim         = '';
    $valorFuncionario = '';

    if ($isEdicao) {
    $valorInicio      = ! empty($turnoEdicao['inicio_previsto']) ? date('Y-m-d\TH:i', strtotime($turnoEdicao['inicio_previsto'])) : '';
    $valorFim         = ! empty($turnoEdicao['fim_previsto']) ? date('Y-m-d\TH:i', strtotime($turnoEdicao['fim_previsto'])) : '';
    $valorFuncionario = $turnoEdicao['id_usuario'] ?? '';
    }
?>

<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2 resposta">
                <h2 class="display-4 titulo badge badge-default" style="color: black;">Registar Turno</h2>
            </div>
            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/' ?>" class="btn btn-outline-info btn-sm">Fechar</a>
            </div>
        </div>

        <?php
            if (isset($_SESSION['msgcad'])) {
                echo $_SESSION['msgcad'];
                unset($_SESSION['msgcad']);
            }
        ?>

        <br>
        <b>DADOS DO TURNO</b>
        <hr style="border: 1px solid #8FBCF ">

        <form action="" method="post">
            <div class="form-row">

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Data início da turno:</label>
                    <input type="datetime-local" name="data_inicio_turno" class="form-control" value="<?php echo $valorInicio; ?>" required>
                </div>

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Data fim da turno:</label>
                    <input type="datetime-local" name="data_fim_turno" class="form-control" value="<?php echo $valorFim; ?>" required>
                </div>

                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Funcionário escalado:</label>
                    <select name="funcionario" class="form-control" required>
                        <option value="">Selecione</option>
                        <?php
                            $localizacoes = new \App\adms\Models\helper\AdmsRead();
                            // Se o teu helper for exeRead em minúsculo, troca aqui
                            $localizacoes->ExeRead('adms_usuarios');

                            $listaUsers = $localizacoes->getResultado();
                            if (! empty($listaUsers)) {
                                foreach ($listaUsers as $loc) {
                                    $selected = ((string) ($loc['id']) === (string) $valorFuncionario) ? 'selected' : '';
                                    echo "<option value='{$loc['id']}' {$selected}>{$loc['nome']}</option>";
                                }
                            }
                        ?>
                    </select>
                </div>


            <div class="form-group">
                <br>
                <?php if ($isEdicao): ?>
                    <input type="hidden" name="id_turno" value="<?php echo (int) ($turnoEdicao['id'] ?? 0); ?>">
                <?php endif; ?>
                <button type="submit"
                        class="btn btn-success float-left"
                        value="<?php echo $isEdicao ? 'Atualizar' : 'Guardar'; ?>"
                        name="<?php echo $isEdicao ? 'btnEditarTurno' : 'btnSubmitTurno'; ?>"
                        style="border-radius:7px 7px;">
                    <i class="fas fa-save fa-1x"></i>&nbsp;&nbsp;Guardar
                </button>
                <?php if ($isEdicao): ?>
                    <a href="<?php echo URLADM . 'turno/registar-turno'; ?>" class="btn btn-secondary ml-2">Cancelar edição</a>
                <?php endif; ?>
            </div>
</div>

        </form>

        <!-- =========================
             LISTA DE TURNOS
        ========================== -->
        <hr>
        <h5 class="mt-3">Turnos registados</h5>




        <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable w-100"
                   data-page-length="10"
                     data-priority="1,2"
                   data-low-priority="0,3,4,5,6">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Funcionário</th>
                        <th>Início</th>
                        <th>Fim</th>
                        <th>Status</th>
                        <th>Criado por</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                    if (! empty($this->Dados['listTurnos'])):
                        foreach ($this->Dados['listTurnos'] as $t):
                            $id          = $t['id'] ?? '';
                            $funcionario = $t['funcionario'] ?? '-';
                            $inicio      = ! empty($t['inicio_previsto']) ? date('d/m/Y H:i', strtotime($t['inicio_previsto'])) : '-';
                            $fim         = ! empty($t['fim_previsto']) ? date('d/m/Y H:i', strtotime($t['fim_previsto'])) : '-';
                            $status      = ((int) ($t['id_status'] ?? 0) === 1) ? 'Ativo' : 'Inativo';
                            $criadoPor   = $t['criado_por_nome'] ?? '-';

                            // Ajuste a rota se o teu controller usar outro caminho
                            $urlEditar = URLADM . 'turno/registar-turno/' . $id;
                ?>
                        <tr>
                            <td><?php echo $id; ?></td>
                            <td><?php echo $funcionario; ?></td>
                            <td><?php echo $inicio; ?></td>
                            <td><?php echo $fim; ?></td>
                            <td><?php echo $status; ?></td>
                            <td><?php echo $criadoPor; ?></td>
                            <td>
                                <a href="<?php echo $urlEditar; ?>" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> Editar
                                </a>
                            </td>
                        </tr>
                        <?php
                                    endforeach;
                            else:
                        ?>
                    <tr>
                        <td colspan="7">Nenhum turno registado.</td>
                    </tr>
                    <?php
                        endif;
                    ?>
                </tbody>
            </table>
        </div>




    </div>
</div>