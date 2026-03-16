<?php
header('Content-type: text/html; charset=utf-8');

$filtros = $this->Dados['filtrosSaida'] ?? [];
$tipoFiltro = (int)($filtros['tipoListaSaida'] ?? 0);
$usuarios = $this->Dados['usuariosSaida'] ?? [];
$listSaida = $this->Dados['listSaida'] ?? [];
$textoSaida = $this->Dados['textoSaida'] ?? 'Lista geral das saídas realizadas';
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h3 class="display-2 titulo">Listar Saídas</h3>
            </div>

            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/'; ?>" class="btn badge badge-danger btn-sm px-1"
                    style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-home"></i>Fechar</a>
            </div>
        </div>
        <hr style="color: #8fdc8f ">

        <form method="post" action="" autocomplete="off" id="formListarSaidas">
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Escolha o tipo de lista</label>
                    <select class="form-control" name="tipoListaSaida" id="tipoListaSaida" required>
                        <option value="">Selecione</option>
                        <option value="1" <?php echo $tipoFiltro === 1 ? 'selected' : ''; ?>>Geral</option>
                        <option value="2" <?php echo $tipoFiltro === 2 ? 'selected' : ''; ?>>Por data de saída</option>
                        <option value="3" <?php echo $tipoFiltro === 3 ? 'selected' : ''; ?>>Por intervalo de data</option>
                        <option value="4" <?php echo $tipoFiltro === 4 ? 'selected' : ''; ?>>Saídas por usuário</option>
                        <option value="5" <?php echo $tipoFiltro === 5 ? 'selected' : ''; ?>>Saídas do usuário no mês</option>
                        <option value="6" <?php echo $tipoFiltro === 6 ? 'selected' : ''; ?>>Saídas do usuário por intervalo</option>
                        <option value="7" <?php echo $tipoFiltro === 7 ? 'selected' : ''; ?>>Saídas gerais no mês</option>
                    </select>
                </div>

                <div class="form-group col-md-3" id="userDiv" style="display:none;">
                    <label>Usuário</label>
                    <select class="form-control" name="id_usuario" id="usuarioSaida">
                        <option value="">Selecione o usuário</option>
                        <?php foreach ($usuarios as $u): ?>
                            <option value="<?php echo (int)$u['id']; ?>"
                                <?php echo ((int)($filtros['id_usuario'] ?? 0) === (int)$u['id']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($u['nome']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                    <input type="hidden" name="nome_usuario" id="nomeUsuarioSaida"
                        value="<?php echo htmlspecialchars($filtros['nome_usuario'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="mesRefDiv" style="display:none;">
                    <label>Mês</label>
                    <input type="month" class="form-control" name="mes_ref" id="mesRef"
                        value="<?php echo htmlspecialchars($filtros['mes_ref'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="dataRefDiv" style="display:none;">
                    <label>Data</label>
                    <input type="date" class="form-control" name="data_ref" id="dataRef"
                        max="<?php echo date('Y-m-d'); ?>"
                        value="<?php echo htmlspecialchars($filtros['data_ref'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="dataInicialDiv" style="display:none;">
                    <label>Data inicial</label>
                    <input type="date" class="form-control" name="data_inicial" id="dataInicial"
                        max="<?php echo date('Y-m-d'); ?>"
                        value="<?php echo htmlspecialchars($filtros['data_inicial'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="dataFinalDiv" style="display:none;">
                    <label>Data final</label>
                    <input type="date" class="form-control" name="data_final" id="dataFinal"
                        max="<?php echo date('Y-m-d'); ?>"
                        value="<?php echo htmlspecialchars($filtros['data_final'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2">
                    <label>&nbsp;</label>
                    <div>
                        <button type="submit" class="btn btn-success btn-sm" value="1" name="brtnListarSaida">
                            Listar
                        </button>
                        <a href="<?php echo URLADM . 'controleSaida/listarSaida'; ?>" class="btn btn-secondary btn-sm">Limpar</a>
                    </div>
                </div>
            </div>
        </form>

        <hr style="color: #8fdc8f ">

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

        <div class="alert alert-info py-2">
            <strong>Lista atual:</strong> <?php echo htmlspecialchars($textoSaida); ?>
        </div>

        <div class="form-row">
            <div class="form-group col-md-12">
                <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable" data-page-length="10" data-priority="0,1,4">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Tipo de Saída</th>
                            <th>Descrição</th>
                            <th>Valor Kz</th>
                            <th>Data</th>
                            <th>Responsável</th>
                            <th>Quem autorizou</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $i = 1;
                        $totalSaida = 0;
                        foreach ($listSaida as $r):
                            $dataS = !empty($r['data_saida']) ? date('d/m/Y', strtotime($r['data_saida'])) : '';
                            $valor = (float)($r['valor'] ?? 0);
                            $totalSaida += $valor;
                        ?>
                        <tr>
                            <td><?php echo $i; ?></td>
                            <td><?php echo htmlspecialchars($r['tipo_saida'] ?? ''); ?></td>
                            <td><?php echo htmlspecialchars($r['descricao'] ?? ''); ?></td>
                            <td><?php echo number_format($valor, 2, ',', '.'); ?> Kz</td>
                            <td><?php echo $dataS; ?></td>
                            <td><?php echo htmlspecialchars($r['nome_responsavel_saida'] ?? ''); ?></td>
                            <td><?php echo htmlspecialchars($r['nome_autorizou'] ?? ''); ?></td>
                            <td class="text-center" style="white-space:nowrap;">
                                <a class="btn btn-sm btn-info" href="<?php echo URLADM . 'controleSaida/registarSaida/' . (int)$r['id']; ?>">
                                    <i class="fas fa-edit"></i> Editar
                                </a>
                                <form method="post" action="<?php echo URLADM . 'controleSaida/eliminarSaida/' . (int)$r['id']; ?>"
                                    style="display:inline-block;"
                                    onsubmit="return confirm('Tem certeza que deseja eliminar esta saída?');">
                                    <button type="submit" class="btn btn-sm btn-danger">
                                        <i class="fas fa-trash"></i> Eliminar
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <?php
                            $i++;
                        endforeach;
                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td></td>
                            <td><strong>Total</strong></td>
                            <td></td>
                            <td style="text-align:right;"><strong><?php echo number_format($totalSaida, 2, ',', '.'); ?> Kz</strong></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <button class="btn btn-success btn-print">Gerar PDF</button>
        </div>

        <div class="imprimir d-none">
            <div class="text-center"><img class="rounded-circle" src="<?php echo URLADM; ?>imagens/nelisa_img.jpeg"
                    width="70" height="100" style="text-align: center;"></div>
            <h4 style="text-align: center; padding: 0px; height: 15px;">Nelisa Farma</h4>

            <br>
            <h3 style="text-align: center;">Relatório de Saídas</h3>
            <p style="text-align: center;"><strong>Lista atual:</strong> <?php echo htmlspecialchars($textoSaida); ?></p>

            <div class="form-row">
                <div class="form-group col-md-12">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Tipo de Saída</th>
                                <th>Descrição</th>
                                <th>Valor Kz</th>
                                <th>Data</th>
                                <th>Responsável</th>
                                <th>Quem autorizou</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $j = 1;
                            $totalSaidaPdf = 0;
                            foreach ($listSaida as $r):
                                $dataS = !empty($r['data_saida']) ? date('d/m/Y', strtotime($r['data_saida'])) : '';
                                $valor = (float)($r['valor'] ?? 0);
                                $totalSaidaPdf += $valor;
                            ?>
                            <tr>
                                <td><?php echo $j; ?></td>
                                <td><?php echo htmlspecialchars($r['tipo_saida'] ?? ''); ?></td>
                                <td><?php echo htmlspecialchars($r['descricao'] ?? ''); ?></td>
                                <td><?php echo number_format($valor, 2, ',', '.'); ?> Kz</td>
                                <td><?php echo $dataS; ?></td>
                                <td><?php echo htmlspecialchars($r['nome_responsavel_saida'] ?? ''); ?></td>
                                <td><?php echo htmlspecialchars($r['nome_autorizou'] ?? ''); ?></td>
                            </tr>
                            <?php
                                $j++;
                            endforeach;
                            ?>
                            <tr>
                                <th colspan="2">Total</th>
                                <td></td>
                                <th style="text-align:right;"><?php echo number_format($totalSaidaPdf, 2, ',', '.'); ?> Kz</th>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <br><br>
            <p class="text-center mt-4">Luanda, aos <?php echo date('d/m/Y'); ?></p>
            <p class="text-center mt-5">O Responsável</p>
            <p class="text-center">___________________________________</p>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    function aplicarFiltrosSaida() {
        var tipo = $('#tipoListaSaida').val();

        $('#userDiv, #mesRefDiv, #dataRefDiv, #dataInicialDiv, #dataFinalDiv').hide();

        if (tipo === '2') {
            $('#dataRefDiv').show();
        } else if (tipo === '3') {
            $('#dataInicialDiv, #dataFinalDiv').show();
        } else if (tipo === '4') {
            $('#userDiv').show();
        } else if (tipo === '5') {
            $('#userDiv, #mesRefDiv').show();
        } else if (tipo === '6') {
            $('#userDiv, #dataInicialDiv, #dataFinalDiv').show();
        } else if (tipo === '7') {
            $('#mesRefDiv').show();
        }
    }

    function atualizarNomeUsuarioSaida() {
        var nome = $('#usuarioSaida option:selected').text() || '';
        if (nome === 'Selecione o usuário') {
            nome = '';
        }
        $('#nomeUsuarioSaida').val(nome);
    }

    $(document).on('change', '#tipoListaSaida', aplicarFiltrosSaida);
    $(document).on('change', '#usuarioSaida', atualizarNomeUsuarioSaida);

    aplicarFiltrosSaida();
    atualizarNomeUsuarioSaida();
});
</script>
