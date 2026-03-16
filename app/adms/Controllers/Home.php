<?php
namespace App\adms\Controllers;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

class Home
{
    private array $Dados = [];

    public function index()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT) ?? [];

        $nivel = (int)($_SESSION['adms_niveis_acesso_id'] ?? 0);
        $isGerencia = in_array($nivel, [1, 2], true);

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();

        if ($isGerencia) {
            $dash = new \App\adms\Models\AdmsDashboardGerencia();

            $periodo = $this->resolverPeriodo($this->Dados);

            $filtros = [
                'dt_ini'            => $periodo['dt_ini'],
                'dt_fim'            => $periodo['dt_fim'],
                'id_usuario'        => !empty($this->Dados['id_usuario']) ? (int)$this->Dados['id_usuario'] : null,
                'id_forma_pagamento'=> !empty($this->Dados['id_forma_pagamento']) ? (int)$this->Dados['id_forma_pagamento'] : null,
                'id_turno'          => !empty($this->Dados['id_turno']) ? (int)$this->Dados['id_turno'] : null,
            ];

            // mantém o que veio do POST + dt_ini/dt_fim + periodo_tipo
            $this->Dados['filtros'] = array_merge($this->Dados, $periodo);

            $this->Dados['listaVendedores']   = $dash->listarVendedores();
            $this->Dados['listaTurnosFiltro'] = $dash->listarTurnosParaFiltro($filtros);

            $this->Dados['turnoAtivo'] = $dash->buscarTurnoAtivo();
            if (!empty($this->Dados['turnoAtivo']['id'])) {
                $this->Dados['turnoAtivoResumo'] = $dash->resumoTurno((int)$this->Dados['turnoAtivo']['id']);
            } else {
                $this->Dados['turnoAtivoResumo'] = ['qtd_vendas' => 0, 'total_vendido' => 0];
            }

            $this->Dados['kpis']         = $dash->kpis($filtros);
            $this->Dados['mixPagamentos']= $dash->mixPagamentos($filtros);
            $this->Dados['turnos']       = $dash->listarTurnos($filtros);

            $this->Dados['top5Vendidos'] = $dash->top5Vendidos($filtros);
            $this->Dados['top5Lucro']    = $dash->top5Lucro($filtros);

            $this->Dados['alertaEstoqueBaixo'] = $dash->alertasEstoqueBaixo();
            $this->Dados['alertaValidade']     = $dash->alertasValidadeProxima(30);

            $this->Dados['totalSaidas'] = $dash->totalSaidas($filtros);
            $this->Dados['resultadoPeriodo'] =
                (float)($this->Dados['kpis']['faturacao'] ?? 0) - (float)($this->Dados['totalSaidas'] ?? 0);

            $carregarView = new \Core\ConfigView("adms/Views/home/homeGerencia", $this->Dados);
            $carregarView->renderizar();
            return;
        }

        $carregarView = new \Core\ConfigView("adms/Views/home/home", $this->Dados);
        $carregarView->renderizar();
    }

    private function resolverPeriodo(array $dados): array
    {
        $tipo = $dados['periodo_tipo'] ?? 'hoje';

        $hoje = date('Y-m-d');
        $dtIni = $hoje . " 00:00:00";
        $dtFim = $hoje . " 23:59:59";

        if ($tipo === 'ontem') {
            $d = date('Y-m-d', strtotime('-1 day'));
            $dtIni = $d . " 00:00:00";
            $dtFim = $d . " 23:59:59";
        } elseif ($tipo === '7dias') {
            $dtIni = date('Y-m-d', strtotime('-6 day')) . " 00:00:00";
            $dtFim = $hoje . " 23:59:59";
        } elseif ($tipo === '30dias') {
            $dtIni = date('Y-m-d', strtotime('-29 day')) . " 00:00:00";
            $dtFim = $hoje . " 23:59:59";
        } elseif ($tipo === 'mes_atual') {
            $dtIni = date('Y-m-01') . " 00:00:00";
            $dtFim = $hoje . " 23:59:59";
        } elseif ($tipo === 'data_unica' && !empty($dados['data_unica'])) {
            $d = $dados['data_unica'];
            $dtIni = $d . " 00:00:00";
            $dtFim = $d . " 23:59:59";
        } elseif ($tipo === 'intervalo' && !empty($dados['data_inicio']) && !empty($dados['data_fim'])) {
            $dtIni = $dados['data_inicio'] . " 00:00:00";
            $dtFim = $dados['data_fim'] . " 23:59:59";
        }

        return ['dt_ini' => $dtIni, 'dt_fim' => $dtFim, 'periodo_tipo' => $tipo];
    }
}