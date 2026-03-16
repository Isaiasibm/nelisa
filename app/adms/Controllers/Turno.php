<?php
namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (! defined('URL')) {
    header("Location: /");
    exit();
}

class Turno extends Controller
{
    public function iniciar()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (empty($_SESSION['usuario_id'])) {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Sessão inválida. Faça login novamente.</div>";
            header("Location: " . URLADM . "login/index");
            exit();
        }

        $model = new \App\adms\Models\AdmsTurno();
        $res   = $model->iniciarTurno((int) $_SESSION['usuario_id']);

        if (! empty($res['success'])) {
            // guarda turno ativo na sessão (para venda)
            if (! empty($res['turno_id'])) {
                $_SESSION['turno_id'] = (int) $res['turno_id'];
            }
            $_SESSION['msg'] = "<div class='alert alert-success'>" . htmlspecialchars($res['message']) . "</div>";
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>" . htmlspecialchars($res['message']) . "</div>";
        }

        header("Location: " . URLADM . "home/index");
        exit();
    }

    public function finalizar()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (empty($_SESSION['usuario_id'])) {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Sessão inválida. Faça login novamente.</div>";
            header("Location: " . URLADM . "login/index");
            exit();
        }

        $model = new \App\adms\Models\AdmsTurno();
        $res   = $model->finalizarTurno((int) $_SESSION['usuario_id']);

        if (! empty($res['success'])) {
            unset($_SESSION['turno_id']); // encerrou (ou já não deve usar)
            $_SESSION['msg'] = "<div class='alert alert-success'>" . htmlspecialchars($res['message']) . "</div>";
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>" . htmlspecialchars($res['message']) . "</div>";
        }

        header("Location: " . URLADM . "home/index");
        exit();
    }

    public function verificar()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        header('Content-Type: application/json; charset=utf-8');

        if (empty($_SESSION['usuario_id'])) {
            echo json_encode(['success' => false, 'message' => 'Sessão inválida']);
            exit();
        }

        $model = new \App\adms\Models\AdmsTurno();
        $st    = $model->statusTurnoUsuario((int) $_SESSION['usuario_id']);

        echo json_encode(['success' => true, 'data' => $st]);
        exit();
    }

    public function registarTurno($turnoId = null)
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];

        $cadTurno = new \App\adms\Models\AdmsTurno();

        $idTurnoEdicao = (is_numeric($turnoId) && (int) $turnoId > 0) ? (int) $turnoId : 0;
        $turnoEdicao   = null;

        if ($idTurnoEdicao > 0) {
            $turnoEdicao = $cadTurno->buscarTurnoPorId($idTurnoEdicao);
            if (empty($turnoEdicao)) {
                $_SESSION['msgcad'] = "<div class='alert alert-danger'>Turno não encontrado para edição.</div>";
                $idTurnoEdicao      = 0;
            }
        }

        if (! empty($this->Dados['btnSubmitTurno'])):
            unset($this->Dados['btnSubmitTurno']);
            // ====================== Script Para Registar Dados do Turno ====================

            #ARRAY DE DADOS PARA INSERIR NA TABELA TURNO
            $dadosTurno = [
                'inicio_previsto' => str_replace('T', ' ', $this->Dados["data_inicio_turno"] ?? ''),
                'id_usuario'      => (int) ($this->Dados["funcionario"] ?? 0),
                'fim_previsto'    => str_replace('T', ' ', $this->Dados["data_fim_turno"] ?? ''),
                'id_status'       => 1,
                'criado_por'      => (int) ($_SESSION['usuario_id'] ?? 0),
                'created_at'      => date('Y-m-d H:i:s'),
            ];

            $cadTurno->cadastrarTurno($dadosTurno);

            if ($cadTurno->getResultado() >= 1) {
                $_SESSION['msgcad'] = "<div class='alert alert-success'>Turno registado com sucesso!
	                                    </div>";
                $this->Dados = [];
            } else {
                $msgErro            = $cadTurno->getMsg() ?: "Não foi possível registar o Turno";
                $_SESSION['msgcad'] = "<div class='alert alert-danger'>" . $msgErro . "</div>";
            }

//===================================== Fim Script regista Turno ==============================
        endif;

        if (! empty($this->Dados['btnEditarTurno'])):
            $idTurnoForm = (int) ($this->Dados['id_turno'] ?? 0);
            unset($this->Dados['btnEditarTurno'], $this->Dados['id_turno']);

            $dadosTurno = [
                'inicio_previsto' => str_replace('T', ' ', $this->Dados["data_inicio_turno"] ?? ''),
                'id_usuario'      => (int) ($this->Dados["funcionario"] ?? 0),
                'fim_previsto'    => str_replace('T', ' ', $this->Dados["data_fim_turno"] ?? ''),
            ];

            $cadTurno->editarTurno($idTurnoForm, $dadosTurno);

            if ($cadTurno->getResultado() >= 1) {
                $_SESSION['msgcad'] = "<div class='alert alert-success'>Turno atualizado com sucesso!</div>";
                $this->Dados        = [];
                $turnoEdicao        = null;
                $idTurnoEdicao      = 0;
            } else {
                $msgErro            = $cadTurno->getMsg() ?: "Não foi possível atualizar o Turno";
                $_SESSION['msgcad'] = "<div class='alert alert-danger'>" . $msgErro . "</div>";

                $turnoEdicao = [
                    'id'             => $idTurnoForm,
                    'inicio_previsto'=> $dadosTurno['inicio_previsto'],
                    'fim_previsto'   => $dadosTurno['fim_previsto'],
                    'id_usuario'     => $dadosTurno['id_usuario'],
                ];
            }

        endif;

        if ($idTurnoEdicao > 0 && empty($turnoEdicao)) {
            $turnoEdicao = $cadTurno->buscarTurnoPorId($idTurnoEdicao);
        }

        if (! empty($turnoEdicao)) {
            $this->Dados['turnoEdicao'] = $turnoEdicao;
        }

        // Listar turnos para mostrar na mesma página
        $this->Dados['listTurnos'] = $cadTurno->listarTurnos();
        //   var_dump($this->Dados['listTurnos']);
        $listarMenu          = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView        = new \Core\ConfigView("adms/Views/turnos/registarTurno", $this->Dados);
        $carregarView->renderizar();
    }

}
