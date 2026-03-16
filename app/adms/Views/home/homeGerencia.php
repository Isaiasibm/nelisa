<?php
    header('Content-type: text/html; charset=utf-8');

    $f = $this->Dados['filtros'] ?? [];
    $k = $this->Dados['kpis'] ?? [];
?>
<div class="content dash-page">

  <!-- Cabeçalho -->
  <div class="d-flex align-items-start justify-content-between mb-2">
    <div>
      <h1 class="titulo mb-1"><b>Bem Vindo ao Painel de Administração</b></h1>
      <small class="text-muted">
        Período:
        <?php echo date('d/m/Y H:i', strtotime($f['dt_ini'] ?? date('Y-m-d 00:00:00'))); ?>
        até
        <?php echo date('d/m/Y H:i', strtotime($f['dt_fim'] ?? date('Y-m-d 23:59:59'))); ?>
      </small>


    <?php
        $turnoModel = new \App\adms\Models\AdmsTurno();
        $st         = $turnoModel->statusTurnoUsuario((int) $_SESSION['usuario_id']);
    ?>

    <?php if (! empty($_SESSION['msg'])): ?>
      <?php echo $_SESSION['msg'];unset($_SESSION['msg']); ?>
    <?php endif; ?>

    <div class="row mb-3 justify-content-center">
      <div class="col-12">
        <div class="card border-primary">
          <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Status do Turno</h5>
          </div>

          <div class="card-body">

            <?php if (empty($st['tem_turno'])): ?>
              <div class="alert alert-secondary mb-0">
                Nenhum turno agendado para si neste período. Contacte a gerência.
              </div>

            <?php else:
                    $t = $st['turno'];
                    $e = $st['exec'] ?? null;
            ?>

              <?php if (! empty($st['falta'])): ?>
                <div class="alert alert-danger">
                  <b>FALTA</b> — Turno #<?php echo (int) $t['id']; ?> |
                  Previsto: <?php echo date('d/m/Y H:i', strtotime($t['inicio_previsto'])); ?>
                  até <?php echo date('d/m/Y H:i', strtotime($t['fim_previsto'])); ?>

                  <?php if (! empty($e['id_motivo_fecho'])): ?>
                    <?php
                        $r = new \App\adms\Models\helper\AdmsRead();
                            $r->fullRead("SELECT nome FROM tb_turnos_motivo_fecho WHERE id = :id LIMIT 1", "id=" . (int) $e['id_motivo_fecho']);
                            $mot = $r->getResultado()[0]['nome'] ?? '';
                    ?>
                    <br><small class="text-muted">Motivo: <?php echo htmlspecialchars($mot); ?></small>
                  <?php endif; ?>
                </div>

              <?php elseif (! empty($st['concluido'])): ?>
                <div class="alert alert-success">
                  <b>CONCLUÍDO</b> — Turno #<?php echo (int) $t['id']; ?> |
                  Início real: <?php echo ! empty($e['inicio_real']) ? date('d/m/Y H:i', strtotime($e['inicio_real'])) : '—'; ?> |
                  Fim real: <?php echo ! empty($e['fim_real']) ? date('d/m/Y H:i', strtotime($e['fim_real'])) : '—'; ?>
                </div>

              <?php elseif (! empty($st['em_andamento'])): ?>
                <div class="alert alert-success">
                  <div class="row">
                    <div class="col-md-8">
                      <b>EM ANDAMENTO</b> — Turno #<?php echo (int) $t['id']; ?><br>
                      Previsto: <?php echo date('d/m/Y H:i', strtotime($t['inicio_previsto'])); ?>
                      até <?php echo date('d/m/Y H:i', strtotime($t['fim_previsto'])); ?><br>

                      Início real: <?php echo ! empty($e['inicio_real']) ? date('d/m/Y H:i', strtotime($e['inicio_real'])) : '—'; ?>

                      <?php if (! empty($e['ip_inicio'])): ?>
                        <br><small class="text-muted">IP início: <?php echo htmlspecialchars($e['ip_inicio']); ?></small>
                      <?php endif; ?>
                    </div>

                    <div class="col-md-4 text-right">
                      <form method="post" action="<?php echo URLADM; ?>turno/finalizar" class="d-inline">
                        <button class="btn btn-danger btn-sm" type="submit">
                          <i class="fas fa-power-off"></i> Finalizar Turno
                        </button>
                      </form>
                    </div>
                  </div>
                </div>

              <?php else: ?>
                <div class="alert alert-warning">
                  <div class="row align-items-center">
                    <div class="col-md-9">
                      <b>AGENDADO</b> — Turno #<?php echo (int) $t['id']; ?><br>
                      Previsto: <?php echo date('d/m/Y H:i', strtotime($t['inicio_previsto'])); ?>
                      até <?php echo date('d/m/Y H:i', strtotime($t['fim_previsto'])); ?>

                      <?php if (! empty($st['atrasado'])): ?>
                        <br><small class="text-danger"><b>Atrasado</b> (passou 10 min do início previsto)</small>
                      <?php endif; ?>
                    </div>

                    <div class="col-md-3 text-right">
                      <form method="post" action="<?php echo URLADM; ?>turno/iniciar" class="d-inline">
                        <button class="btn btn-success btn-sm" type="submit">
                          <i class="fas fa-play"></i> Iniciar Turno
                        </button>
                      </form>
                    </div>
                  </div>
                </div>
              <?php endif; ?>

            <?php endif; ?>

          </div>
        </div>
      </div>
    </div>







    </div>
  </div>













  <?php if (! empty($_SESSION['msg'])): ?>
    <?php echo $_SESSION['msg'];unset($_SESSION['msg']); ?>
  <?php endif; ?>

  <!-- FILTROS -->
  <form method="post" class="mb-2">
    <div class="card">
      <div class="card-header d-flex align-items-center justify-content-between">
        <b>Filtros</b>
        <small class="text-muted d-none d-md-inline">Aplique para atualizar o dashboard</small>
      </div>

      <div class="card-body">

        <div class="form-row">
          <div class="form-group col-md-3">
            <label>Período</label>
            <select class="form-control" id="periodo_tipo" name="periodo_tipo">
              <?php
                  $periodoTipo = $f['periodo_tipo'] ?? 'hoje';
                  $opts        = [
                      'hoje'       => 'Hoje',
                      'ontem'      => 'Ontem',
                      '7dias'      => 'Últimos 7 dias',
                      '30dias'     => 'Últimos 30 dias',
                      'mes_atual'  => 'Mês atual',
                      'data_unica' => 'Data única',
                      'intervalo'  => 'Intervalo',
                  ];
                  foreach ($opts as $val => $lab) {
                      $sel = ($periodoTipo === $val) ? "selected" : "";
                      echo "<option value='{$val}' {$sel}>{$lab}</option>";
                  }
              ?>
            </select>
          </div>

          <div class="form-group col-md-3" id="div_data_unica" style="display:none;">
            <label>Data</label>
            <input type="date" class="form-control" name="data_unica" id="data_unica"
              value="<?php echo htmlspecialchars($f['data_unica'] ?? ''); ?>">
          </div>

          <div class="form-group col-md-3" id="div_data_ini" style="display:none;">
            <label>Data início</label>
            <input type="date" class="form-control" name="data_inicio" id="data_inicio"
              value="<?php echo htmlspecialchars($f['data_inicio'] ?? ''); ?>">
          </div>

          <div class="form-group col-md-3" id="div_data_fim" style="display:none;">
            <label>Data fim</label>
            <input type="date" class="form-control" name="data_fim" id="data_fim"
              value="<?php echo htmlspecialchars($f['data_fim'] ?? ''); ?>">
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-4">
            <label>Vendedor</label>
            <select class="form-control" name="id_usuario">
              <option value="">Todos</option>
              <?php foreach (($this->Dados['listaVendedores'] ?? []) as $u): ?>
                <?php $sel = (! empty($f['id_usuario']) && (int) $f['id_usuario'] === (int) $u['id']) ? "selected" : ""; ?>
                <option value="<?php echo (int) $u['id']; ?>" <?php echo $sel; ?>>
                  <?php echo htmlspecialchars($u['nome']); ?>
                </option>
              <?php endforeach; ?>
            </select>
          </div>

          <div class="form-group col-md-4">
            <label>Forma de pagamento</label>
            <select class="form-control" name="id_forma_pagamento">
              <option value="">Todas</option>
              <option value="1" <?php echo(! empty($f['id_forma_pagamento']) && (int) $f['id_forma_pagamento'] === 1) ? 'selected' : ''; ?>>Dinheiro</option>
              <option value="2" <?php echo(! empty($f['id_forma_pagamento']) && (int) $f['id_forma_pagamento'] === 2) ? 'selected' : ''; ?>>Multicaixa</option>
              <option value="3" <?php echo(! empty($f['id_forma_pagamento']) && (int) $f['id_forma_pagamento'] === 3) ? 'selected' : ''; ?>>Transferência</option>
            </select>
          </div>

          <div class="form-group col-md-4">
            <label>Turno</label>
            <select class="form-control" name="id_turno">
              <option value="">Todos</option>
              <?php foreach (($this->Dados['listaTurnosFiltro'] ?? []) as $t): ?>
                <?php
                    $txt = "#{$t['id']} - {$t['nome']} - " . date('d/m H:i', strtotime($t['inicio_em']));
                    $sel = (! empty($f['id_turno']) && (int) $f['id_turno'] === (int) $t['id']) ? "selected" : "";
                ?>
                <option value="<?php echo (int) $t['id']; ?>" <?php echo $sel; ?>>
                  <?php echo htmlspecialchars($txt); ?>
                </option>
              <?php endforeach; ?>
            </select>
          </div>
        </div>

        <div class="d-flex align-items-center" style="gap:10px;">
          <button type="submit" class="btn btn-primary">
            <i class="fas fa-filter"></i> Aplicar
          </button>

          <a class="btn btn-secondary" href="<?php echo URLADM; ?>home/index">
            <i class="fas fa-undo"></i> Limpar
          </a>
        </div>

      </div>
    </div>
  </form>

  <!-- KPIs -->
  <div class="row mb-2">
    <div class="col-md-3 mb-2">
      <div class="card kpi-card bg-success text-white">
        <div class="card-body text-center">
          <div class="kpi-title">Faturação</div>
          <div class="kpi-value"><?php echo number_format((float) ($k['faturacao'] ?? 0), 2, ',', '.'); ?></div>
          <small>Kz</small>
        </div>
      </div>
    </div>

    <div class="col-md-2 mb-2">
      <div class="card kpi-card bg-info text-white">
        <div class="card-body text-center">
          <div class="kpi-title">Nº Vendas</div>
          <div class="kpi-value"><?php echo (int) ($k['qtd_vendas'] ?? 0); ?></div>
        </div>
      </div>
    </div>

    <div class="col-md-2 mb-2">
      <div class="card kpi-card bg-primary text-white">
        <div class="card-body text-center">
          <div class="kpi-title">Ticket médio</div>
          <div class="kpi-value"><?php echo number_format((float) ($k['ticket_medio'] ?? 0), 2, ',', '.'); ?></div>
          <small>Kz</small>
        </div>
      </div>
    </div>

    <div class="col-md-2 mb-2">
      <div class="card kpi-card bg-warning">
        <div class="card-body text-center">
          <div class="kpi-title">Total recebido</div>
          <div class="kpi-value"><?php echo number_format((float) ($k['total_recebido'] ?? 0), 2, ',', '.'); ?></div>
          <small>Kz</small>
        </div>
      </div>
    </div>

    <div class="col-md-3 mb-2">
      <div class="card kpi-card bg-dark text-white">
        <div class="card-body text-center">
          <div class="kpi-title">Lucro estimado</div>
          <div class="kpi-value"><?php echo number_format((float) ($k['lucro_estimado'] ?? 0), 2, ',', '.'); ?></div>
          <small>Kz</small><br>

        </div>
      </div>
    </div>
  </div>

  <!-- Turno ativo -->
  <div class="card border-primary mb-2">
    <div class="card-header bg-primary text-white"><b>Turno ativo</b></div>
    <div class="card-body">
      <?php if (! empty($this->Dados['turnoAtivo'])): ?>
        <?php $t = $this->Dados['turnoAtivo'];
        $tr              = $this->Dados['turnoAtivoResumo'] ?? ['qtd_vendas' => 0, 'total_vendido' => 0]; ?>
        <div class="alert alert-success mb-0">
          <div class="row">
            <div class="col-md-8">
              <b>#<?php echo (int) $t['id']; ?></b> — Operador: <b><?php echo htmlspecialchars($t['operador']); ?></b><br>
              Início: <?php echo date('d/m/Y H:i', strtotime($t['inicio_em'])); ?> |
              Fim previsto: <?php echo date('d/m/Y H:i', strtotime($t['fim_previsto_em'])); ?><br>
              Vendas: <b><?php echo (int) $tr['qtd_vendas']; ?></b> |
              Total: <b><?php echo number_format((float) $tr['total_vendido'], 2, ',', '.'); ?> Kz</b>
            </div>
            <div class="col-md-4 text-right">
              <a class="btn btn-outline-success btn-sm" href="#">Ver detalhe</a>
            </div>
          </div>
        </div>
      <?php else: ?>
        <div class="alert alert-warning mb-0">Nenhum turno em andamento neste momento.</div>
      <?php endif; ?>
    </div>
  </div>

  <!-- SEÇÕES COLAPSÁVEIS -->
  <div class="accordion" id="dashAccordion">

    <!-- Top 5 -->
    <div class="card">
      <div class="card-header d-flex justify-content-between align-items-center">
        <button class="btn btn-link p-0 text-left" type="button" data-toggle="collapse"
          data-target="#collapseTop5" aria-expanded="true" aria-controls="collapseTop5">
          <b>Produtos mais vendidos</b>
        </button>
        <small class="text-muted">Clique para expandir/encolher</small>
      </div>

      <div id="collapseTop5" class="collapse show" data-parent="#dashAccordion">
        <div class="card-body">
          <div class="row">

            <div class="col-md-6 mb-2">
              <div class="card">
                <div class="card-header"><b>Top 5 produtos mais vendidos</b></div>
                <div class="card-body p-0">
                  <div class="table-responsive">
                    <table class="table table-sm mb-0">
                      <thead>
                        <tr>
                          <th>Produto</th>
                          <th class="text-right">Qtd</th>
                          <th class="text-right">Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php if (! empty($this->Dados['top5Vendidos'])): ?>
                          <?php foreach ($this->Dados['top5Vendidos'] as $r): ?>
                            <tr>
                              <td><?php echo htmlspecialchars($r['nome_produto']); ?></td>
                              <td class="text-right"><?php echo (int) $r['total_quantidade']; ?></td>
                              <td class="text-right"><?php echo number_format((float) $r['total_faturado'], 2, ',', '.'); ?></td>
                            </tr>
                          <?php endforeach; ?>
                        <?php else: ?>
                          <tr><td colspan="3" class="text-center text-muted">Sem dados no período.</td></tr>
                        <?php endif; ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-6 mb-2">
              <div class="card">
                <div class="card-header"><b>Top 5 produtos com mais lucro estimado</b></div>
                <div class="card-body p-0">
                  <div class="table-responsive">
                    <table class="table table-sm mb-0">
                      <thead>
                        <tr>
                          <th>Produto</th>
                          <th class="text-right">Lucro</th>
                          <th class="text-right">Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php if (! empty($this->Dados['top5Lucro'])): ?>
                          <?php foreach ($this->Dados['top5Lucro'] as $r): ?>
                            <tr>
                              <td><?php echo htmlspecialchars($r['nome_produto']); ?></td>
                              <td class="text-right"><?php echo number_format((float) $r['lucro_estimado'], 2, ',', '.'); ?></td>
                              <td class="text-right"><?php echo number_format((float) $r['total_faturado'], 2, ',', '.'); ?></td>
                            </tr>
                          <?php endforeach; ?>
                        <?php else: ?>
                          <tr><td colspan="3" class="text-center text-muted">Sem dados no período.</td></tr>
                        <?php endif; ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>

    <!-- Turnos (oculto) -->
    <div class="card">
      <div class="card-header d-flex justify-content-between align-items-center">
        <button class="btn btn-link p-0 text-left" type="button" data-toggle="collapse"
          data-target="#collapseTurnos" aria-expanded="false" aria-controls="collapseTurnos">
          <b>Turnos do período</b>
        </button>
        <small class="text-muted">Clique para expandir</small>
      </div>

      <div id="collapseTurnos" class="collapse" data-parent="#dashAccordion">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Operador</th>
                  <th>Status</th>
                  <th>Início</th>
                  <th>Fim</th>
                  <th class="text-right">Vendas</th>
                  <th class="text-right">Total</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (($this->Dados['turnos'] ?? []) as $r): ?>
                  <tr>
                    <td><?php echo (int) $r['id']; ?></td>
                    <td><?php echo htmlspecialchars($r['operador']); ?></td>
                    <td><?php echo htmlspecialchars($r['status']); ?></td>
                    <td><?php echo date('d/m/Y H:i', strtotime($r['inicio_em'])); ?></td>
                    <td><?php echo ! empty($r['fim_em']) ? date('d/m/Y H:i', strtotime($r['fim_em'])) : '—'; ?></td>
                    <td class="text-right"><?php echo (int) $r['qtd_vendas']; ?></td>
                    <td class="text-right"><?php echo number_format((float) $r['total_vendido'], 2, ',', '.'); ?></td>
                  </tr>
                <?php endforeach; ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Alertas (oculto) -->
    <div class="card">
      <div class="card-header d-flex justify-content-between align-items-center">
        <button class="btn btn-link p-0 text-left" type="button" data-toggle="collapse"
          data-target="#collapseAlertas" aria-expanded="false" aria-controls="collapseAlertas">
          <b>Alertas</b>
        </button>
        <small class="text-muted">Clique para expandir</small>
      </div>

      <div id="collapseAlertas" class="collapse" data-parent="#dashAccordion">
        <div class="card-body">
          <div class="row">

            <div class="col-md-6 mb-2">
              <div class="card border-danger">
                <div class="card-header bg-danger text-white"><b>Estoque baixo</b></div>
                <div class="card-body p-0">
                  <div class="table-responsive">
                    <table class="table table-sm mb-0">
                      <thead>
                        <tr>
                          <th>Produto</th>
                          <th class="text-right">Qtd</th>
                          <th class="text-right">Min</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach (($this->Dados['alertaEstoqueBaixo'] ?? []) as $r): ?>
                          <tr>
                            <td><?php echo htmlspecialchars($r['nome_produto']); ?></td>
                            <td class="text-right"><?php echo (int) $r['quantidade_estoque']; ?></td>
                            <td class="text-right"><?php echo (int) $r['estoque_min']; ?></td>
                          </tr>
                        <?php endforeach; ?>
                        <?php if (empty($this->Dados['alertaEstoqueBaixo'])): ?>
                          <tr><td colspan="3" class="text-center text-muted">Sem alertas.</td></tr>
                        <?php endif; ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-6 mb-2">
              <div class="card border-warning">
                <div class="card-header bg-warning"><b>Validade nos próximos <?php echo $this->Dados['dias_validade'] ?? 90; ?> dias</b></div>
                <div class="card-body p-0">
                  <div class="table-responsive">
                    <table class="table table-sm mb-0">
                      <thead>
                        <tr>
                          <th>Produto</th>
                          <th>Lote</th>
                          <th class="text-right">Qtd</th>
                          <th>Validade</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach (($this->Dados['alertaValidade'] ?? []) as $r): ?>
                          <tr>
                            <td><?php echo $r['nome_produto']; ?></td>
                            <td><?php echo $r['lote']; ?></td>
                            <td class="text-right"><?php echo (int) $r['quantidade_disponivel']; ?></td>
                            <td><?php echo date('d/m/Y', strtotime($r['data_validade'])); ?></td>
                          </tr>
                        <?php endforeach; ?>
                        <?php if (empty($this->Dados['alertaValidade'])): ?>
                          <tr><td colspan="4" class="text-center text-muted">Sem alertas.</td></tr>
                        <?php endif; ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>

  </div><!-- /accordion -->

</div>

<script>
  (function(){
    function togglePeriodo() {
      var tipo = document.getElementById('periodo_tipo').value;

      document.getElementById('div_data_unica').style.display = (tipo === 'data_unica') ? 'block' : 'none';
      document.getElementById('div_data_ini').style.display   = (tipo === 'intervalo') ? 'block' : 'none';
      document.getElementById('div_data_fim').style.display   = (tipo === 'intervalo') ? 'block' : 'none';
    }
    document.getElementById('periodo_tipo').addEventListener('change', togglePeriodo);
    togglePeriodo();
  })();
</script>