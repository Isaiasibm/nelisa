<?php
namespace App\adms\Models;

if (! defined('URL')) {
    header("Location: /");
    exit();
}

class AdmsTurno
{
    private $Resultado;
    private $Dados;
    private $msg;

    // atraso só depois de 10 min
    private int $MIN_ATRASO = 10;

    // tolerância para clicar terminar
    private int $TOL_FIM = 15;

    public function getResultado()
    {
        return $this->Resultado;
    }

    public function getMsg()
    {
        return $this->msg;
    }

    private function validarDados(): void
    {
        if (! is_array($this->Dados)) {
            $this->Resultado = false;
            return;
        }

        $this->Dados = array_map('strip_tags', $this->Dados);
        $this->Dados = array_map('trim', $this->Dados);

        if (in_array('', $this->Dados, true)) {
            $this->Resultado = false;
            return;
        }

        if (! empty($this->Dados['inicio_previsto']) && ! empty($this->Dados['fim_previsto'])) {
            $inicio = strtotime($this->Dados['inicio_previsto']);
            $fim    = strtotime($this->Dados['fim_previsto']);
            if ($inicio === false || $fim === false || $fim <= $inicio) {
                $this->Resultado = false;
                return;
            }
        }

        $this->Resultado = true;
    }

    private function agora(): string
    {
        return date('Y-m-d H:i:s');
    }

    private function getIpCliente(): string
    {
        $ip = $_SERVER['REMOTE_ADDR'] ?? '';
        if (! empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $parts = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $cand  = trim($parts[0]);
            if ($cand !== '') {
                $ip = $cand;
            }

        }
        return $ip !== '' ? $ip : '0.0.0.0';
    }

    private function getUserAgent(): ?string
    {
        return $_SERVER['HTTP_USER_AGENT'] ?? null;
    }

    private function buscarMotivoFechoId(string $nome): ?int
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead("SELECT id FROM tb_turnos_motivo_fecho WHERE nome = :n LIMIT 1", "n={$nome}");
        $res = $read->getResultado();
        if (! empty($res)) {
            return (int) $res[0]['id'];
        }

        // cria se não existir
        $create = new \App\adms\Models\helper\AdmsCreate();
        $create->exeCreate('tb_turnos_motivo_fecho', ['nome' => $nome]);
        if ($create->getResultado() >= 1) {
            return (int) $create->getResultado();
        }

        return null;
    }

    /**
     * Pega o turno "do período" do utilizador:
     * - prioriza turno do dia (por inicio_previsto)
     * - retorna sempre o mais recente do dia (ou o mais recente que toque hoje)
     */
    public function buscarTurnoDoUsuarioAgora(int $idUsuario): ?array
    {
        $read  = new \App\adms\Models\helper\AdmsRead();
        $agora = $this->agora();

        $sql = "
            SELECT t.*, s.nome AS status_nome
            FROM tb_turnos t
            JOIN tb_turno_status s ON s.id = t.id_status
            WHERE t.id_usuario = :u
              AND (
                    DATE(t.inicio_previsto) = DATE(:agora)
                 OR DATE(t.fim_previsto)   = DATE(:agora)
                 OR (:agora BETWEEN t.inicio_previsto AND DATE_ADD(t.fim_previsto, INTERVAL 1 DAY))
              )
            ORDER BY t.inicio_previsto DESC
            LIMIT 1
        ";

        $read->fullRead($sql, "u={$idUsuario}&agora={$agora}");
        $res = $read->getResultado();
        return ! empty($res) ? $res[0] : null;
    }

    public function buscarExecucaoPorTurno(int $idTurno): ?array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT * FROM tb_turnos_execucao WHERE id_turno = :id LIMIT 1",
            "id={$idTurno}"
        );
        $res = $read->getResultado();
        return ! empty($res) ? $res[0] : null;
    }

    private function criarOuAtualizarExecucaoAtraso(int $idTurno, bool $atrasado): void
    {
        $exec = $this->buscarExecucaoPorTurno($idTurno);

        $upd    = new \App\adms\Models\helper\AdmsUpdate();
        $create = new \App\adms\Models\helper\AdmsCreate();

        if ($exec) {
            if ((int) $exec['atrasado'] !== (int) $atrasado) {
                $upd->exeUpdate(
                    'tb_turnos_execucao',
                    ['atrasado' => $atrasado ? 1 : 0],
                    "WHERE id_turno = :t",
                    "t={$idTurno}"
                );
            }
            return;
        }

        // cria execução mínima só para marcar atraso (sem inicio_real)
        $create->exeCreate('tb_turnos_execucao', [
            'id_turno'   => $idTurno,
            'atrasado'   => $atrasado ? 1 : 0,
            'falta'      => 0,
            'ip_login'   => $this->getIpCliente(),
            'user_agent' => $this->getUserAgent(),
        ]);
    }

    /**
     * Regras automáticas:
     * A) Se inicio_real IS NULL e agora > fim_previsto => falta
     * B) Se inicio_real NOT NULL e fim_real IS NULL e agora > fim_previsto + 15min => auto-fecha e marca falta
     * C) Atraso: se inicio_real IS NULL e agora > inicio_previsto+10min e agora <= fim_previsto
     */
    public function aplicarRegrasAutomaticas(int $idUsuario): void
    {
        $turno = $this->buscarTurnoDoUsuarioAgora($idUsuario);
        if (! $turno) {
            return;
        }

        $idTurno = (int) $turno['id'];
        $exec    = $this->buscarExecucaoPorTurno($idTurno);
        $agora   = $this->agora();

        $inicioPrev = strtotime($turno['inicio_previsto']);
        $fimPrev    = strtotime($turno['fim_previsto']);
        $agoraTs    = strtotime($agora);

        // C) atraso (só se ainda não iniciou)
        if ((! $exec || empty($exec['inicio_real'])) && $agoraTs > ($inicioPrev + ($this->MIN_ATRASO * 60)) && $agoraTs <= $fimPrev) {
            $this->criarOuAtualizarExecucaoAtraso($idTurno, true);
        }

        // A) falta se nunca iniciou e passou fim_previsto
        if ((! $exec || empty($exec['inicio_real'])) && $agoraTs > $fimPrev) {
            // marca turno como falta (se ainda não foi concluído/falta)
            if ((int) $turno['id_status'] !== 3 && (int) $turno['id_status'] !== 4) {
                $updT = new \App\adms\Models\helper\AdmsUpdate();
                $updT->exeUpdate(
                    'tb_turnos',
                    ['id_status' => 4],
                    "WHERE id = :t AND id_usuario = :u AND id_status IN (1,2)",
                    "t={$idTurno}&u={$idUsuario}"
                );
            }

            // garante execução marcada como falta
            $motId = $this->buscarMotivoFechoId('Falta (não iniciou)');
            if ($exec) {
                $updE = new \App\adms\Models\helper\AdmsUpdate();
                $updE->exeUpdate(
                    'tb_turnos_execucao',
                    [
                        'falta'           => 1,
                        'id_motivo_fecho' => $motId,
                        'ip_fim'          => $this->getIpCliente(),
                        'fim_real'        => $exec['fim_real'] ?? null,
                    ],
                    "WHERE id_turno = :t",
                    "t={$idTurno}"
                );
            } else {
                $create = new \App\adms\Models\helper\AdmsCreate();
                $create->exeCreate('tb_turnos_execucao', [
                    'id_turno'        => $idTurno,
                    'falta'           => 1,
                    'id_motivo_fecho' => $motId,
                    'ip_login'        => $this->getIpCliente(),
                    'user_agent'      => $this->getUserAgent(),
                ]);
            }
            return;
        }

        // B) auto-fecho se iniciou e não terminou e passou tolerância
        if ($exec && ! empty($exec['inicio_real']) && empty($exec['fim_real'])) {
            $limite = strtotime($turno['fim_previsto'] . " +{$this->TOL_FIM} minutes");
            if ($agoraTs > $limite) {
                $motId = $this->buscarMotivoFechoId('Auto-fecho (tolerância excedida)');

                // fecha execução
                $updE = new \App\adms\Models\helper\AdmsUpdate();
                $updE->exeUpdate(
                    'tb_turnos_execucao',
                    [
                        'fim_real'        => $agora,
                        'falta'           => 1,
                        'id_motivo_fecho' => $motId,
                        'ip_fim'          => $this->getIpCliente(),
                        'fechado_por'     => null,
                    ],
                    "WHERE id_turno = :t AND fim_real IS NULL",
                    "t={$idTurno}"
                );

                // marca falta no turno
                $updT = new \App\adms\Models\helper\AdmsUpdate();
                $updT->exeUpdate(
                    'tb_turnos',
                    ['id_status' => 4],
                    "WHERE id = :t AND id_usuario = :u AND id_status = 2",
                    "t={$idTurno}&u={$idUsuario}"
                );
            }
        }
    }

    public function statusTurnoUsuario(int $idUsuario): array
    {
        $this->aplicarRegrasAutomaticas($idUsuario);

        $turno = $this->buscarTurnoDoUsuarioAgora($idUsuario);
        if (! $turno) {
            return ['tem_turno' => false];
        }

        $exec = $this->buscarExecucaoPorTurno((int) $turno['id']);

        $agoraTs    = time();
        $inicioPrev = strtotime($turno['inicio_previsto']);
        $fimPrev    = strtotime($turno['fim_previsto']);

        $atrasado = false;
        if (! $exec || empty($exec['inicio_real'])) {
            if ($agoraTs > ($inicioPrev + ($this->MIN_ATRASO * 60)) && $agoraTs <= $fimPrev) {
                $atrasado = true;
            }
        }

        $emAndamento = ((int) $turno['id_status'] === 2);
        $falta       = ((int) $turno['id_status'] === 4);
        $concluido   = ((int) $turno['id_status'] === 3);

        return [
            'tem_turno'    => true,
            'turno'        => $turno,
            'exec'         => $exec,
            'atrasado'     => $atrasado,
            'em_andamento' => $emAndamento,
            'falta'        => $falta,
            'concluido'    => $concluido,
        ];
    }

    public function iniciarTurno(int $idUsuario): array
    {
        $this->aplicarRegrasAutomaticas($idUsuario);

        $turno = $this->buscarTurnoDoUsuarioAgora($idUsuario);
        if (! $turno) {
            return ['success' => false, 'message' => 'Nenhum turno agendado para si neste período. Contacte a gerência.'];
        }

        $idTurno = (int) $turno['id'];

        if ((int) $turno['id_status'] === 4) {
            return ['success' => false, 'message' => 'Este turno já está marcado como falta.'];
        }

        if ((int) $turno['id_status'] === 3) {
            return ['success' => false, 'message' => 'Este turno já foi concluído.'];
        }

        if ((int) $turno['id_status'] === 2) {
            return ['success' => true, 'turno_id' => $idTurno, 'message' => 'O seu turno já está em andamento.'];
        }

        // só permite iniciar se estiver agendado (assumimos id_status=1)
        if ((int) $turno['id_status'] !== 1) {
            return ['success' => false, 'message' => 'Este turno não está disponível para iniciar.'];
        }

        $agora      = $this->agora();
        $inicioPrev = strtotime($turno['inicio_previsto']);
        $agoraTs    = strtotime($agora);

        $isAtrasado = ($agoraTs > ($inicioPrev + ($this->MIN_ATRASO * 60))) ? 1 : 0;

        // cria execução (1 por turno)
        $exec = $this->buscarExecucaoPorTurno($idTurno);

        if (! $exec) {
            $create = new \App\adms\Models\helper\AdmsCreate();
            $create->exeCreate('tb_turnos_execucao', [
                'id_turno'    => $idTurno,
                'inicio_real' => $agora,
                'atrasado'    => $isAtrasado,
                'falta'       => 0,
                'ip_login'    => $this->getIpCliente(),
                'ip_inicio'   => $this->getIpCliente(),
                'user_agent'  => $this->getUserAgent(),
            ]);
            if ($create->getResultado() < 1) {
                return ['success' => false, 'message' => 'Falha ao criar execução do turno.'];
            }
        } else {
            // se já existe execução mas sem inicio_real, preenche
            if (empty($exec['inicio_real'])) {
                $upd = new \App\adms\Models\helper\AdmsUpdate();
                $upd->exeUpdate(
                    'tb_turnos_execucao',
                    [
                        'inicio_real' => $agora,
                        'atrasado'    => $isAtrasado,
                        'ip_inicio'   => $this->getIpCliente(),
                        'ip_login'    => $exec['ip_login'] ?: $this->getIpCliente(),
                        'user_agent'  => $exec['user_agent'] ?: $this->getUserAgent(),
                    ],
                    "WHERE id_turno = :t",
                    "t={$idTurno}"
                );
            }
        }

        // muda status para em_andamento
        $updT = new \App\adms\Models\helper\AdmsUpdate();
        $updT->exeUpdate(
            'tb_turnos',
            ['id_status' => 2],
            "WHERE id = :t AND id_usuario = :u AND id_status = 1",
            "t={$idTurno}&u={$idUsuario}"
        );

        return ['success' => true, 'turno_id' => $idTurno, 'message' => 'Turno iniciado com sucesso.'];
    }

    public function finalizarTurno(int $idUsuario): array
    {
        $this->aplicarRegrasAutomaticas($idUsuario);

        $turno = $this->buscarTurnoDoUsuarioAgora($idUsuario);
        if (! $turno) {
            return ['success' => false, 'message' => 'Nenhum turno encontrado para finalizar.'];
        }

        $idTurno = (int) $turno['id'];

        if ((int) $turno['id_status'] !== 2) {
            return ['success' => false, 'message' => 'O seu turno não está em andamento.'];
        }

        $exec = $this->buscarExecucaoPorTurno($idTurno);
        if (! $exec || empty($exec['inicio_real'])) {
            return ['success' => false, 'message' => 'Execução do turno não encontrada.'];
        }

        if (! empty($exec['fim_real'])) {
            return ['success' => true, 'message' => 'Turno já foi finalizado anteriormente.'];
        }

        $agora = $this->agora();
        $motId = $this->buscarMotivoFechoId('Fecho manual');

        // registra fim
        $updE = new \App\adms\Models\helper\AdmsUpdate();
        $updE->exeUpdate(
            'tb_turnos_execucao',
            [
                'fim_real'        => $agora,
                'ip_fim'          => $this->getIpCliente(),
                'falta'           => 0,
                'id_motivo_fecho' => $motId,
                'fechado_por'     => $idUsuario,
            ],
            "WHERE id_turno = :t AND fim_real IS NULL",
            "t={$idTurno}"
        );

        // muda status para concluído
        $updT = new \App\adms\Models\helper\AdmsUpdate();
        $updT->exeUpdate(
            'tb_turnos',
            ['id_status' => 3],
            "WHERE id = :t AND id_usuario = :u AND id_status = 2",
            "t={$idTurno}&u={$idUsuario}"
        );

        return ['success' => true, 'message' => 'Turno finalizado com sucesso.'];
    }

    public function cadastrarTurno(array $dadosTurno)
    {
        $this->Dados = $dadosTurno;
        $this->ValidarDados();
        if ($this->Resultado):
            $Create = new \App\adms\Models\helper\AdmsCreate;

            $Create->exeCreate('tb_turnos', $this->Dados);
            if ($Create->getResultado() >= 1):

                $this->Resultado = $Create->getResultado();
            else:
                $this->msg       = "<b>Erro:</b> Turno não registado! tente novamente";
                $this->Resultado = 0;
            endif;

        else:
            $this->msg       = "<b>Erro:</b> Preencha de forma correta os campos dos dados do turno ";
            $this->Resultado = 0;
        endif;
    }

    public function buscarTurnoPorId(int $idTurno): ?array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id, id_usuario, inicio_previsto, fim_previsto, id_status
             FROM tb_turnos
             WHERE id = :id
             LIMIT 1",
            "id={$idTurno}"
        );

        $res = $read->getResultado();
        return ! empty($res) ? $res[0] : null;
    }

    public function editarTurno(int $idTurno, array $dadosTurno): void
    {
        $this->Dados = $dadosTurno;
        $this->ValidarDados();

        if (! $this->Resultado) {
            $this->msg       = "<b>Erro:</b> Preencha de forma correta os campos dos dados do turno ";
            $this->Resultado = 0;
            return;
        }

        $upTurno = new \App\adms\Models\helper\AdmsUpdate();
        $upTurno->exeUpdate("tb_turnos", $this->Dados, "WHERE id = :id", "id={$idTurno}");

        if ($upTurno->getResultado()) {
            $this->Resultado = $idTurno;
            return;
        }

        $this->msg       = "<b>Erro:</b> Turno não atualizado! tente novamente";
        $this->Resultado = 0;
    }

    public function listarTurnos()
    {
        $listProdutos = new \App\adms\Models\helper\AdmsRead();
        $listProdutos->fullRead("SELECT
            t.id,
            t.inicio_previsto,
            t.fim_previsto,
            t.id_status,
            u.nome AS funcionario,
            uc.nome AS criado_por_nome,
            t.created_at
         FROM tb_turnos t
         LEFT JOIN adms_usuarios u ON u.id = t.id_usuario
         LEFT JOIN adms_usuarios uc ON uc.id = t.criado_por
         ORDER BY t.id DESC");
        return $listProdutos->getResultado();
    }

}
