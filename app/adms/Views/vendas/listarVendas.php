<?php
    header('Content-type: text/html; charset=utf-8');
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h3 class="display-2 titulo">Vendas realizadas</h3>
            </div>
            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/'; ?>" class="btn badge badge-danger btn-sm px-1"
                    style="font-size:10pt; border-radius:7px;">
                    <i class="fas fa-home"></i> Fechar</a>
            </div>
        </div>
        <hr style="color:#8fdc8f">

        <?php
            if (! empty($_SESSION['msgcad'])) {
                echo $_SESSION['msgcad'];
                unset($_SESSION['msgcad']);
            }

            $filtros    = $this->Dados['filtrosVenda'] ?? [];
            $tipoFiltro = (int) ($filtros['tipoFiltro'] ?? 0);
            $usuarios   = $this->Dados['usuariosVenda'] ?? [];
            $turnos     = $this->Dados['turnosVenda'] ?? [];
        ?>

        <form method="POST" action="" class="mb-3" id="formFiltroDevolucoes" autocomplete="off">
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Critério de filtro</label>
                    <select class="form-control" name="tipoFiltro" id="tipoFiltroDevolucao" required>
                        <option value="">Selecione</option>
                        <option value="1" <?php echo $tipoFiltro === 1 ? 'selected' : ''; ?>>Vendas do usuário</option>
                        <option value="2" <?php echo $tipoFiltro === 2 ? 'selected' : ''; ?>>Vendas do usuário no mês</option>
                        <option value="3" <?php echo $tipoFiltro === 3 ? 'selected' : ''; ?>>Do usuário por turno</option>
                        <option value="4" <?php echo $tipoFiltro === 4 ? 'selected' : ''; ?>>Usuário por intervalo de data</option>
                        <option value="5" <?php echo $tipoFiltro === 5 ? 'selected' : ''; ?>>Vendas gerais por data</option>
                        <option value="6" <?php echo $tipoFiltro === 6 ? 'selected' : ''; ?>>Vendas gerais por intervalo de datas</option>
                    </select>
                </div>

                <div class="form-group col-md-2" id="filtroUsuarioDiv" style="display:none;">
                    <label>Usuário</label>
                    <select class="form-control" name="id_usuario" id="filtroUsuario">
                        <option value="">Selecione</option>
                        <?php foreach ($usuarios as $u): ?>
                            <option value="<?php echo (int) $u['id']; ?>"
                                <?php echo((int) ($filtros['id_usuario'] ?? 0) === (int) $u['id']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($u['nome']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group col-md-2" id="filtroMesDiv" style="display:none;">
                    <label>Mês</label>
                    <input type="month" class="form-control" name="mes_ref" id="filtroMes"
                        value="<?php echo htmlspecialchars($filtros['mes_ref'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="filtroTurnoDiv" style="display:none;">
                    <label>Turno</label>
                    <select class="form-control" name="id_turno" id="filtroTurno">
                        <option value="">Selecione</option>
                        <?php foreach ($turnos as $t): ?>
                            <option value="<?php echo (int) $t['id']; ?>"
                                data-usuario="<?php echo (int) ($t['id_usuario'] ?? 0); ?>"
                                <?php echo((int) ($filtros['id_turno'] ?? 0) === (int) $t['id']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($t['turno']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group col-md-2" id="filtroDataRefDiv" style="display:none;">
                    <label>Data</label>
                    <input type="date" class="form-control" name="data_ref" id="filtroDataRef"
                        value="<?php echo htmlspecialchars($filtros['data_ref'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="filtroDataInicialDiv" style="display:none;">
                    <label>Data inicial</label>
                    <input type="date" class="form-control" name="data_inicial" id="filtroDataInicial"
                        value="<?php echo htmlspecialchars($filtros['data_inicial'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="filtroDataFinalDiv" style="display:none;">
                    <label>Data final</label>
                    <input type="date" class="form-control" name="data_final" id="filtroDataFinal"
                        value="<?php echo htmlspecialchars($filtros['data_final'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2">
                    <label>&nbsp;</label>
                    <div>
                        <button type="submit" name="btnFiltrarVendas" value="1" class="btn btn-success btn-sm">
                            <i class="fas fa-search"></i> Filtrar
                        </button>
                        <a href="<?php echo URLADM . ''; ?>" class="btn btn-secondary btn-sm">
                            Limpar
                        </a>
                    </div>
                </div>
            </div>
        </form>

        <div class="table-responsive">
            <table
                class="table table-bordered table-hover tabelaPersonalizadaDataTable"
                id="tabelaVendas"
                data-page-length="15"
                data-priority="0,1,2"
                data-low-priority="5,6">
                <thead class="thead-light">
                    <tr>
                        <th>#</th>
                        <th>Data</th>
                        <th>Vendedor</th>
                        <th class="text-right">Total (Kz)</th>
                        <th class="text-center">Itens</th>
                        <th class="text-center">Já devolvidos</th>
                        <th class="text-center">Acções</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                    $vendas = $this->Dados['listVendas'] ?? [];
                    foreach ($vendas as $v):
                        $id         = (int) $v['id_venda'];
                        $dataVenda  = htmlspecialchars($v['data_venda'] ?? '');
                        $vendedor   = htmlspecialchars($v['vendedor'] ?? '—');
                        $total      = number_format((float) ($v['total'] ?? 0), 2, ',', '.');
                        $qtdItens   = (int) ($v['qtd_itens'] ?? 0);
                        $qtdDevol   = (int) ($v['qtd_devolvida'] ?? 0);
                        $labelDevol = $qtdDevol > 0
                            ? "<span class='badge badge-warning'>{$qtdDevol}</span>"
                            : "<span class='text-muted'>0</span>";

                        $urlItens = URLADM . "Vendas/itensDaVenda/{$id}";
                ?>
                <tr>
                    <td><?php echo $id; ?></td>
                    <td><?php echo $dataVenda; ?></td>
                    <td><?php echo $vendedor; ?></td>
                    <td class="text-right"><?php echo $total; ?></td>
                    <td class="text-center"><?php echo $qtdItens; ?></td>
                    <td class="text-center"><?php echo $labelDevol; ?></td>
                    <td class="text-center" style="white-space:nowrap;">
                        <div class="dropdown d-inline-block">
                            <button class="btn btn-sm btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Ações
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a href="<?php echo $urlItens; ?>" class="dropdown-item" title="Ver itens desta venda">
                                    <i class="fas fa-list"></i> Devolver Itens
                                </a>
                                <button type="button" class="dropdown-item btnDevolverTudo" data-id="<?php echo $id; ?>" title="Devolver venda completa">
                                    <i class="fas fa-undo"></i> Devolver Venda Completa
                                </button>
                                <a href="#" class="dropdown-item" title="Reimprimir fatura">
                                    <i class="fas fa-print"></i> Reimprimir fatura
                                </a>
                            </div>
                        </div>
                    </td>
                </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div><!-- /.table-responsive -->
    </div><!-- /.list-group-item -->
</div><!-- /.content -->

<!-- Modal: motivo devolução completa -->
<div class="modal fade" id="modalDevolverTudo" tabindex="-1" role="dialog"
     aria-labelledby="modalDevolverTudoLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form method="POST" id="formDevolverTudo" action="">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="modalDevolverTudoLabel">
                        <i class="fas fa-undo"></i> Devolver venda completa
                    </h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="text-muted">
                        Todos os itens ainda não devolvidos desta venda serão restituídos ao estoque.
                    </p>
                    <div class="form-group">
                        <label for="motivoDevolucaoCompleta">
                            Motivo <small class="text-muted">(opcional)</small>
                        </label>
                        <textarea class="form-control" id="motivoDevolucaoCompleta"
                            name="motivo" rows="3"
                            placeholder="Descreva o motivo da devolução..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        Cancelar
                    </button>
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-undo"></i> Confirmar devolução
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    function filtrarTurnosPorUsuario() {
        var idUsuario = ($('#filtroUsuario').val() || '').toString();
        var $turno = $('#filtroTurno');

        $turno.find('option').each(function () {
            var $opt = $(this);
            var valor = ($opt.val() || '').toString();
            if (valor === '') {
                $opt.prop('disabled', false).show();
                return;
            }

            var usuarioTurno = ($opt.data('usuario') || '').toString();
            var permitido = idUsuario !== '' && usuarioTurno === idUsuario;

            $opt.prop('disabled', !permitido);
            if (!permitido && $opt.is(':selected')) {
                $turno.val('');
            }
        });
    }

    function aplicarFiltrosDevolucao() {
        var tipo = $('#tipoFiltroDevolucao').val();

        $('#filtroUsuarioDiv, #filtroMesDiv, #filtroTurnoDiv, #filtroDataRefDiv, #filtroDataInicialDiv, #filtroDataFinalDiv').hide();

        if (tipo === '1') {
            $('#filtroUsuarioDiv').show();
        } else if (tipo === '2') {
            $('#filtroUsuarioDiv, #filtroMesDiv').show();
        } else if (tipo === '3') {
            $('#filtroUsuarioDiv, #filtroTurnoDiv').show();
        } else if (tipo === '4') {
            $('#filtroUsuarioDiv, #filtroDataInicialDiv, #filtroDataFinalDiv').show();
        } else if (tipo === '5') {
            $('#filtroDataRefDiv').show();
        } else if (tipo === '6') {
            $('#filtroDataInicialDiv, #filtroDataFinalDiv').show();
        }

        filtrarTurnosPorUsuario();
    }

    $(document).on('change', '#tipoFiltroDevolucao', aplicarFiltrosDevolucao);
    $(document).on('change', '#filtroUsuario', filtrarTurnosPorUsuario);
    aplicarFiltrosDevolucao();
    filtrarTurnosPorUsuario();

    // Ao clicar em "Devolver tudo", configura o action do form e abre o modal
    $(document).on('click', '.btnDevolverTudo', function () {
        var idVenda = $(this).data('id');
        var url = '<?php echo URLADM; ?>Vendas/devolverVendaCompleta/' + idVenda;
        $('#formDevolverTudo').attr('action', url);
        $('#motivoDevolucaoCompleta').val('');
        $('#modalDevolverTudo').modal('show');
    });
});
</script>
