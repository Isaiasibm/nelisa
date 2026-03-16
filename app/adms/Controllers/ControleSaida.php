<?php

namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (!defined('URL')) {
    header("Location: /");
    exit(); 
}
 
/**
 * Controller saida
 *
 * @copyright (c) 2019, IBM - NELISA
 */
class ControleSaida {

    private $Resultado;
    private $Dados;
    private $UserId;
    private $PageId;
    private $LimiteResultado = 40;
    private $ResultadoPg;

    function getResultadoPg()
    {
        return $this->ResultadoPg;
    }

   function getResultado()
    {
        return $this->Resultado;
    }

    private function dataEhFutura(?string $data): bool
    {
        if (empty($data)) {
            return false;
        }

        return strtotime($data) > strtotime(date('Y-m-d'));
    }

    private function registroPodeSerAlterado(?string $data): bool
    {
        if (empty($data)) {
            return false;
        }

        $timestampRegistro = strtotime($data);
        $inicioJanela = strtotime(date('Y-m-d') . ' -3 days');

        if (date('Y-m', $timestampRegistro) === date('Y-m')) {
            return true;
        }

        return $timestampRegistro >= $inicioJanela;
    }

    public function registarSaida($idSaida = null) {

        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];
        $cadSaida = new \App\adms\Models\admsSaida();
        $idSaida = (int)($idSaida ?? 0);

        if ($idSaida > 0) {
            $saidaEdicao = $cadSaida->buscarSaidaPorId($idSaida);
            if (empty($saidaEdicao)) {
                $_SESSION['msgcad'] = "<div class='alert alert-danger'>Saída não encontrada para edição.</div>";
                header("Location: " . URLADM . "controleSaida/listarSaida");
                exit();
            }

            if (!$this->registroPodeSerAlterado($saidaEdicao['data_saida'] ?? null)) {
                $_SESSION['msgcad'] = "<div class='alert alert-danger'>Edição bloqueada: só é permitido alterar saídas do mês atual ou dos últimos 3 dias.</div>";
                header("Location: " . URLADM . "controleSaida/listarSaida");
                exit();
            }

            $this->Dados['saidaEdicao'] = $saidaEdicao;
        }
 
        if (!empty($this->Dados['btnSubmitSaida'])){
            unset($this->Dados['btnSubmitSaida']);

            if ($this->dataEhFutura($this->Dados['data_saida'] ?? null)) {
                $_SESSION['msgcad'] = "<div class='alert alert-danger'>Data inválida: não é permitido registar saída em data futura.</div>";
                $listarMenu = new \App\adms\Models\AdmsMenu();
                $this->Dados['menu'] = $listarMenu->itemMenu();
                $carregarView = new \Core\ConfigView("adms/Views/saidas/registarSaida", $this->Dados);
                $carregarView->renderizar();
                return;
            }

        // ====================== Script Para Registar Dados da Saída ====================

                    #ARRAY DE DADOS PARA INSERIR NA TABELA SAÍDA
            $dadosSaida = array('id_tipo_saida'=>$this->Dados["id_tipo_saida"],
            'valor'=>$this->Dados["valor_saida"],'data_saida'=>$this->Dados["data_saida"], 
            'descricao'=>$this->Dados["descricao_saida"],
            'id_responsavel_saida'=>$this->Dados["responsavel_saida"],
            'id_autorizou'=>$this->Dados["quem_autorizou"],
            'id_user'=> (int) $_SESSION['usuario_id'],
            'created_at'=>date('Y-m-d H:i:s'));
 
   //     destinatarioOutro
  
            $cadSaida->cadastrarSaida($dadosSaida);
            if($cadSaida->getResultado()>=1){

                $_SESSION['msgcad'] = "<div class='alert alert-success'>Saída registada com sucesso!</div>";
                    unset($this->Dados);
                    }
                    else{

                        $_SESSION['msgcad'] = "<div class='alert alert-danger'>"."Não foi possível registar a saída"."</div>";
                    }

        } elseif (!empty($this->Dados['btnEditarSaida'])) {
            $idSaidaForm = (int)($this->Dados['id_saida'] ?? 0);
            unset($this->Dados['btnEditarSaida'], $this->Dados['id_saida']);

            if ($this->dataEhFutura($this->Dados['data_saida'] ?? null)) {
                $_SESSION['msgcad'] = "<div class='alert alert-danger'>Data inválida: não é permitido atualizar saída para data futura.</div>";
                $this->Dados['saidaEdicao'] = $cadSaida->buscarSaidaPorId($idSaidaForm);
                $listarMenu = new \App\adms\Models\AdmsMenu();
                $this->Dados['menu'] = $listarMenu->itemMenu();
                $carregarView = new \Core\ConfigView("adms/Views/saidas/registarSaida", $this->Dados);
                $carregarView->renderizar();
                return;
            }

            $dadosSaida = array(
                'id_tipo_saida' => $this->Dados['id_tipo_saida'] ?? null,
                'valor' => $this->Dados['valor_saida'] ?? null,
                'data_saida' => $this->Dados['data_saida'] ?? null,
                'descricao' => $this->Dados['descricao_saida'] ?? null,
                'id_responsavel_saida' => $this->Dados['responsavel_saida'] ?? null,
                'id_autorizou' => $this->Dados['quem_autorizou'] ?? null,
                'id_user' => (int)($_SESSION['usuario_id'] ?? 0)
            );

            $cadSaida->editarSaida($idSaidaForm, $dadosSaida);
            if ($cadSaida->getResultado() >= 1) {
                $_SESSION['msgcad'] = "<div class='alert alert-success'>Saída atualizada com sucesso!</div>";
                header("Location: " . URLADM . "controleSaida/listarSaida");
                exit();
            }

            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Não foi possível atualizar a saída.</div>";
            $this->Dados['saidaEdicao'] = $cadSaida->buscarSaidaPorId($idSaidaForm);
           
        //===================================== Fim Script regista Produto ==============================
                              }
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/saidas/registarSaida", $this->Dados);
        $carregarView->renderizar();        
    }

    public function listarSaida()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];
        $saidaModel = new \App\adms\Models\admsSaida();

        $filtros = [];
        $tipoFiltro = (int)($this->Dados['tipoListaSaida'] ?? 0);
        $textoSaida = 'Lista geral das saídas realizadas';

        if (!empty($this->Dados['brtnListarSaida'])) {
            $idUsuario = (int)($this->Dados['id_usuario'] ?? 0);
            $nomeUsuario = trim((string)($this->Dados['nome_usuario'] ?? ''));

            if ($tipoFiltro === 2) {
                $dataRef = trim((string)($this->Dados['data_ref'] ?? ''));
                if ($dataRef === '') {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Informe a data para listar as saídas.</div>";
                } else {
                    $filtros['data_ini'] = date('Y-m-d', strtotime($dataRef)) . ' 00:00:00';
                    $filtros['data_fim'] = date('Y-m-d', strtotime($dataRef)) . ' 23:59:59';
                    $textoSaida = 'Saídas realizadas no dia ' . date('d/m/Y', strtotime($dataRef));
                }
            } elseif ($tipoFiltro === 3) {
                $dataInicial = trim((string)($this->Dados['data_inicial'] ?? ''));
                $dataFinal = trim((string)($this->Dados['data_final'] ?? ''));
                if ($dataInicial === '' || $dataFinal === '') {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Informe data inicial e data final.</div>";
                } else {
                    $filtros['data_ini'] = date('Y-m-d', strtotime($dataInicial)) . ' 00:00:00';
                    $filtros['data_fim'] = date('Y-m-d', strtotime($dataFinal)) . ' 23:59:59';
                    $textoSaida = 'Saídas realizadas no período de '
                        . date('d/m/Y', strtotime($dataInicial)) . ' à '
                        . date('d/m/Y', strtotime($dataFinal));
                }
            } elseif ($tipoFiltro === 4) {
                if ($idUsuario < 1) {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Selecione o usuário para este filtro.</div>";
                } else {
                    $filtros['id_user'] = $idUsuario;
                    $textoSaida = "Saídas realizadas pelo usuário {$nomeUsuario}";
                }
            } elseif ($tipoFiltro === 5) {
                $mesRef = trim((string)($this->Dados['mes_ref'] ?? ''));
                if ($idUsuario < 1 || $mesRef === '') {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Selecione usuário e mês para este filtro.</div>";
                } else {
                    $filtros['id_user'] = $idUsuario;
                    $filtros['mes_ref'] = $mesRef;
                    $textoSaida = "Saídas do usuário {$nomeUsuario} no mês {$mesRef}";
                }
            } elseif ($tipoFiltro === 6) {
                $dataInicial = trim((string)($this->Dados['data_inicial'] ?? ''));
                $dataFinal = trim((string)($this->Dados['data_final'] ?? ''));
                if ($idUsuario < 1 || $dataInicial === '' || $dataFinal === '') {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Selecione usuário e intervalo de datas para este filtro.</div>";
                } else {
                    $filtros['id_user'] = $idUsuario;
                    $filtros['data_ini'] = date('Y-m-d', strtotime($dataInicial)) . ' 00:00:00';
                    $filtros['data_fim'] = date('Y-m-d', strtotime($dataFinal)) . ' 23:59:59';
                    $textoSaida = 'Saídas do usuário ' . $nomeUsuario
                        . ' no período de ' . date('d/m/Y', strtotime($dataInicial))
                        . ' à ' . date('d/m/Y', strtotime($dataFinal));
                }
            } elseif ($tipoFiltro === 7) {
                $mesRef = trim((string)($this->Dados['mes_ref'] ?? ''));
                if ($mesRef === '') {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>Selecione o mês para gerar o relatório mensal.</div>";
                } else {
                    $filtros['mes_ref'] = $mesRef;
                    $textoSaida = "Saídas gerais do mês {$mesRef}";
                }
            }
        }

        $this->Dados['usuariosSaida'] = $saidaModel->listarUsuariosComSaidas();
        $this->Dados['filtrosSaida'] = $this->Dados;
        $this->Dados['textoSaida'] = $textoSaida;

        if (!empty($filtros)) {
            $this->Dados['listSaida'] = $saidaModel->listarSaidasComFiltros($filtros);
        } else {
            $this->Dados['listSaida'] = $saidaModel->lisatarSaidas();
        }

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();       
        $carregarView = new \Core\ConfigView("adms/Views/saidas/listarSaida", $this->Dados);
        $carregarView->renderizar();
    }

    public function eliminarSaida($idSaida = null)
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $idSaida = (int)($idSaida ?? 0);
        if ($idSaida < 1) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Registro de saída inválido.</div>";
            header("Location: " . URLADM . "controleSaida/listarSaida");
            exit();
        }

        $saidaModel = new \App\adms\Models\admsSaida();

        $saida = $saidaModel->buscarSaidaPorId($idSaida);
        if (empty($saida)) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Saída não encontrada.</div>";
            header("Location: " . URLADM . "controleSaida/listarSaida");
            exit();
        }

        if (!$this->registroPodeSerAlterado($saida['data_saida'] ?? null)) {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Eliminação bloqueada: só é permitido eliminar saídas do mês atual ou dos últimos 3 dias.</div>";
            header("Location: " . URLADM . "controleSaida/listarSaida");
            exit();
        }

        $saidaModel->eliminarSaida($idSaida);

        if ($saidaModel->getResultado() >= 1) {
            $_SESSION['msgcad'] = "<div class='alert alert-success'>Saída eliminada com sucesso.</div>";
        } else {
            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Não foi possível eliminar a saída.</div>";
        }

        header("Location: " . URLADM . "controleSaida/listarSaida");
        exit();
    }



  
    

}
