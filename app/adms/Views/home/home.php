<?php
if (!defined('URL')) {
  header("Location: /");
  exit();
}
?>

<div class="content p-1">
  <div class="list-group-item">
    <div class="d-flex">
      <?php
        $vis = new \App\adms\Models\helper\AdmsRead();
        $vis->ExeRead('adms_niveis_acessos WHERE id= 1');
        foreach ($vis->getResultado() as $doc):
          $tipoSer = $doc['nome'];
      ?>
        <div class="mr-auto p-2">
          <h1 class="display-4 titulo"><b>Quadro Informativo para o <?php echo htmlspecialchars($tipoSer); ?></b></h1><br>
        </div>
      <?php endforeach; ?>
    </div>

    <?php
      $turnoModel = new \App\adms\Models\AdmsTurno();
      $st = $turnoModel->statusTurnoUsuario((int)$_SESSION['usuario_id']);
    ?>

    <?php if (!empty($_SESSION['msg'])): ?>
      <?php echo $_SESSION['msg']; unset($_SESSION['msg']); ?>
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

              <?php if (!empty($st['falta'])): ?>
                <div class="alert alert-danger">
                  <b>FALTA</b> — Turno #<?php echo (int)$t['id']; ?> |
                  Previsto: <?php echo date('d/m/Y H:i', strtotime($t['inicio_previsto'])); ?>
                  até <?php echo date('d/m/Y H:i', strtotime($t['fim_previsto'])); ?>

                  <?php if (!empty($e['id_motivo_fecho'])): ?>
                    <?php
                      $r = new \App\adms\Models\helper\AdmsRead();
                      $r->fullRead("SELECT nome FROM tb_turnos_motivo_fecho WHERE id = :id LIMIT 1", "id=".(int)$e['id_motivo_fecho']);
                      $mot = $r->getResultado()[0]['nome'] ?? '';
                    ?>
                    <br><small class="text-muted">Motivo: <?php echo htmlspecialchars($mot); ?></small>
                  <?php endif; ?>
                </div>

              <?php elseif (!empty($st['concluido'])): ?>
                <div class="alert alert-success">
                  <b>CONCLUÍDO</b> — Turno #<?php echo (int)$t['id']; ?> |
                  Início real: <?php echo !empty($e['inicio_real']) ? date('d/m/Y H:i', strtotime($e['inicio_real'])) : '—'; ?> |
                  Fim real: <?php echo !empty($e['fim_real']) ? date('d/m/Y H:i', strtotime($e['fim_real'])) : '—'; ?>
                </div>

              <?php elseif (!empty($st['em_andamento'])): ?>
                <div class="alert alert-success">
                  <div class="row">
                    <div class="col-md-8">
                      <b>EM ANDAMENTO</b> — Turno #<?php echo (int)$t['id']; ?><br>
                      Previsto: <?php echo date('d/m/Y H:i', strtotime($t['inicio_previsto'])); ?>
                      até <?php echo date('d/m/Y H:i', strtotime($t['fim_previsto'])); ?><br>

                      Início real: <?php echo !empty($e['inicio_real']) ? date('d/m/Y H:i', strtotime($e['inicio_real'])) : '—'; ?>

                      <?php if (!empty($e['ip_inicio'])): ?>
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
                      <b>AGENDADO</b> — Turno #<?php echo (int)$t['id']; ?><br>
                      Previsto: <?php echo date('d/m/Y H:i', strtotime($t['inicio_previsto'])); ?>
                      até <?php echo date('d/m/Y H:i', strtotime($t['fim_previsto'])); ?>

                      <?php if (!empty($st['atrasado'])): ?>
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