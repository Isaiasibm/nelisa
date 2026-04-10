<?php
    header('Content-type: text/html; charset=utf-8');

    $filtros             = $this->Dados['filtrosRelatorio'] ?? [];
    $tipoFiltro          = (int) ($filtros['tipoFiltro'] ?? 0);
    $usuarios            = $this->Dados['usuariosVenda'] ?? [];
    $turnos              = $this->Dados['turnosVenda'] ?? [];
    $listVenda           = $this->Dados['listVenda'] ?? [];
    $descricaoListaAtual = $this->Dados['descricaoListaAtual'] ?? 'Relatório geral de vendas líquidas (vendas - devoluções).';
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h3 class="display-2 titulo">Relatório das Vendas</h3>
            </div>

            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/'; ?>" class="btn badge badge-danger btn-sm px-1"
                    style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-home"></i>Fechar</a>
            </div>
        </div>
        <hr style="color: #8fdc8f ">

        <form method="post" action="" autocomplete="off" id="formRelatorioVendas">
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Critério de filtro</label>
                    <select class="form-control" name="tipoFiltro" id="tipoFiltroRelatorio" required>
                        <option value="">Selecione</option>
                        <option value="1" <?php echo $tipoFiltro === 1 ? 'selected' : ''; ?>>Vendas do usuário</option>
                        <option value="2" <?php echo $tipoFiltro === 2 ? 'selected' : ''; ?>>Vendas do usuário no mês</option>
                        <option value="3" <?php echo $tipoFiltro === 3 ? 'selected' : ''; ?>>Do usuário por turno</option>
                        <option value="4" <?php echo $tipoFiltro === 4 ? 'selected' : ''; ?>>Usuário por intervalo de data</option>
                        <option value="5" <?php echo $tipoFiltro === 5 ? 'selected' : ''; ?>>Vendas gerais por data</option>
                        <option value="6" <?php echo $tipoFiltro === 6 ? 'selected' : ''; ?>>Vendas gerais por intervalo de datas</option>
                    </select>
                </div>

                <div class="form-group col-md-2" id="filtroRelUsuarioDiv" style="display:none;">
                    <label>Usuário</label>
                    <select class="form-control" name="id_usuario" id="filtroRelUsuario">
                        <option value="">Selecione</option>
                        <?php foreach ($usuarios as $u): ?>
                        <option value="<?php echo (int) $u['id']; ?>"
                            <?php echo((int) ($filtros['id_usuario'] ?? 0) === (int) $u['id']) ? 'selected' : ''; ?>>
                            <?php echo htmlspecialchars($u['nome']); ?>
                        </option>
                        <?php endforeach; ?>
                    </select>
                    <input type="hidden" name="nome_usuario" id="nomeUsuarioSelecionado"
                        value="<?php echo htmlspecialchars($filtros['nome_usuario'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="filtroRelMesDiv" style="display:none;">
                    <label>Mês</label>
                    <input type="month" class="form-control" name="mes_ref" id="filtroRelMes"
                        value="<?php echo htmlspecialchars($filtros['mes_ref'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="filtroRelTurnoDiv" style="display:none;">
                    <label>Turno</label>
                    <select class="form-control" name="id_turno" id="filtroRelTurno">
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

                <div class="form-group col-md-2" id="filtroRelDataRefDiv" style="display:none;">
                    <label>Data</label>
                    <input type="date" class="form-control" name="data_ref" id="filtroRelDataRef"
                        value="<?php echo htmlspecialchars($filtros['data_ref'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="filtroRelDataInicialDiv" style="display:none;">
                    <label>Data inicial</label>
                    <input type="date" class="form-control" name="data_inicial" id="filtroRelDataInicial"
                        value="<?php echo htmlspecialchars($filtros['data_inicial'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="filtroRelDataFinalDiv" style="display:none;">
                    <label>Data final</label>
                    <input type="date" class="form-control" name="data_final" id="filtroRelDataFinal"
                        value="<?php echo htmlspecialchars($filtros['data_final'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2">
                    <label>&nbsp;</label>
                    <div>
                        <button type="submit" class="btn btn-success btn-sm" name="btnFiltrarRelatorio" value="1">
                            <i class="fas fa-search"></i> Listar
                        </button>
                        <a href="<?php echo URLADM . 'Vendas/relatVendas'; ?>" class="btn btn-secondary btn-sm">Limpar</a>
                    </div>
                </div>
            </div>
        </form>

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

        <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable" data-page-length="10" data-priority="0,1,4">
                    <thead>
                        <tr>
                            <th>Nº</th>
                            <th>Nome do Produto</th>
                            <th>Tipo Produto</th>
                            <th>Preço Unit</th>
                            <th>Qtdade</th>
                            <th>Subtotal</th>
                            <th class="text-center">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $totalVenda = 0;
                            $i          = 1;
                            foreach ($listVenda as $r):
                                $nomeProduto    = htmlspecialchars($r['nome_produto'] ?? '');
                                $tipoProduto    = htmlspecialchars($r['tipoProduto'] ?? '');
                                $precoVenda     = number_format((float) ($r['preco_venda'] ?? 0), 2, ',', '.');
                                $quant          = (int) ($r['quant'] ?? 0);
                                $subtotalValor  = (float) ($r['subtotal'] ?? 0);
                                $subtotal       = number_format($subtotalValor, 2, ',', '.');
                                $totalVenda    += $subtotalValor;
                        ?>
                        <tr>
                            <td><?php echo $i; ?></td>
                            <td><?php echo $nomeProduto; ?></td>
                            <td><?php echo $tipoProduto; ?></td>
                            <td><?php echo $precoVenda; ?></td>
                            <td><?php echo $quant; ?></td>
                            <td><?php echo $subtotal; ?> Kz</td>
                            <td>Resumo por produto</td>
                        </tr>
                        <?php
                                $i++;
                            endforeach;
                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td></td>
                            <td><strong>Total vendido líquido</strong></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="text-align: right"><strong><?php echo number_format($totalVenda, 2, ',', '.'); ?> Kz</strong></td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
        </div>

        <div class="mt-3">
            <button class="btn btn-success btn-print">Gerar PDF</button>
        </div>

        <div class="imprimir d-none">
            <div class="text-center"><img class="rounded-circle" src="<?php echo URLADM; ?>imagens/nelisa_img.jpeg"
                    width="70" height="100" style="text-align: center;"></div>
            <h4 style="text-align: center; padding: 0px; height: 15px;">Nelisa Farma</h4>

            <br>
            <h3 class="text-center mb-3 mt-5"><b>Relatório das Vendas</b></h3>
            <p class="text-center mb-4"> <?php echo htmlspecialchars($descricaoListaAtual); ?></p>

            <table class="table table-striped table-hover table-bordered m-auto"
                style="box-shadow: 0px 0px 25px 0px rgba(0, 0, 0, 0.2); width: 900px;">
                <thead>
                    <tr>
                        <th>Nº</th>
                        <th>Nome do Produto</th>
                        <th>Tipo Produto</th>
                        <th>Preço Unit</th>
                        <th>Qtdade</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $totalPdf  = 0;
                        $j         = 1;
                        foreach ($listVenda as $r):
                            $nomeProduto    = htmlspecialchars($r['nome_produto'] ?? '');
                            $tipoProduto    = htmlspecialchars($r['tipoProduto'] ?? '');
                            $precoVenda     = number_format((float) ($r['preco_venda'] ?? 0), 2, ',', '.');
                            $quant          = (int) ($r['quant'] ?? 0);
                            $subtotalValor  = (float) ($r['subtotal'] ?? 0);
                            $subtotal       = number_format($subtotalValor, 2, ',', '.');
                            $totalPdf      += $subtotalValor;
                    ?>
                    <tr>
                        <td><?php echo $j; ?></td>
                        <td><?php echo $nomeProduto; ?></td>
                        <td><?php echo $tipoProduto; ?></td>
                        <td><?php echo $precoVenda; ?></td>
                        <td><?php echo $quant; ?></td>
                        <td><?php echo $subtotal; ?> Kz</td>
                    </tr>
                    <?php
                            $j++;
                        endforeach;
                    ?>
                    <tr>
                        <th colspan="2">Total vendido líquido</th>
                        <td></td>
                        <td></td>
                        <th style="text-align: right" colspan="2"><?php echo number_format($totalPdf, 2, ',', '.'); ?> Kz</th>
                    </tr>
                </tbody>
            </table>

            <br><br>
            <h5 style="text-align:center">Luanda, aos <?php echo date('d/m/Y'); ?></h5>
            <p class="text-center mt-5">O Responsável</p>
            <p class="text-center">___________________________________</p>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    function filtrarTurnosPorUsuarioRelatorio() {
        var idUsuario = ($('#filtroRelUsuario').val() || '').toString();
        var $turno = $('#filtroRelTurno');

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

    function aplicarCamposFiltroRelatorio() {
        var tipo = $('#tipoFiltroRelatorio').val();

        $('#filtroRelUsuarioDiv, #filtroRelMesDiv, #filtroRelTurnoDiv, #filtroRelDataRefDiv, #filtroRelDataInicialDiv, #filtroRelDataFinalDiv').hide();

        if (tipo === '1') {
            $('#filtroRelUsuarioDiv').show();
        } else if (tipo === '2') {
            $('#filtroRelUsuarioDiv, #filtroRelMesDiv').show();
        } else if (tipo === '3') {
            $('#filtroRelUsuarioDiv, #filtroRelTurnoDiv').show();
        } else if (tipo === '4') {
            $('#filtroRelUsuarioDiv, #filtroRelDataInicialDiv, #filtroRelDataFinalDiv').show();
        } else if (tipo === '5') {
            $('#filtroRelDataRefDiv').show();
        } else if (tipo === '6') {
            $('#filtroRelDataInicialDiv, #filtroRelDataFinalDiv').show();
        }

        filtrarTurnosPorUsuarioRelatorio();
    }

    function atualizarNomeUsuario() {
        var nome = $('#filtroRelUsuario option:selected').text() || '';
        if (nome === 'Selecione') {
            nome = '';
        }
        $('#nomeUsuarioSelecionado').val(nome);
    }

    $(document).on('change', '#tipoFiltroRelatorio', aplicarCamposFiltroRelatorio);
    $(document).on('change', '#filtroRelUsuario', atualizarNomeUsuario);
    $(document).on('change', '#filtroRelUsuario', filtrarTurnosPorUsuarioRelatorio);

    aplicarCamposFiltroRelatorio();
    atualizarNomeUsuario();
    filtrarTurnosPorUsuarioRelatorio();
});
</script>
