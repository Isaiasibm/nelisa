<?php
namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

class AdmsDashboardGerencia
{
    private function buildWhereVendas(array $filtros, string $aliasVenda = 'v'): array
    {
        $where  = "{$aliasVenda}.data_venda BETWEEN :dt_ini AND :dt_fim";
        $params = "dt_ini={$filtros['dt_ini']}&dt_fim={$filtros['dt_fim']}";

        if (!empty($filtros['id_usuario'])) {
            $where  .= " AND {$aliasVenda}.id_usuario = :id_usuario";
            $params .= "&id_usuario=" . (int)$filtros['id_usuario'];
        }

        if (!empty($filtros['id_turno'])) {
            $where  .= " AND {$aliasVenda}.id_turno = :id_turno";
            $params .= "&id_turno=" . (int)$filtros['id_turno'];
        }

        return [$where, $params];
    }

    private function buildWherePagamentos(array $filtros): array
    {
        // pv.created_at é TIMESTAMP no teu schema
        $where  = "pv.created_at BETWEEN :dt_ini AND :dt_fim";
        $params = "dt_ini={$filtros['dt_ini']}&dt_fim={$filtros['dt_fim']}";

        if (!empty($filtros['id_usuario'])) {
            $where  .= " AND v.id_usuario = :id_usuario";
            $params .= "&id_usuario=" . (int)$filtros['id_usuario'];
        }

        if (!empty($filtros['id_turno'])) {
            $where  .= " AND v.id_turno = :id_turno";
            $params .= "&id_turno=" . (int)$filtros['id_turno'];
        }

        if (!empty($filtros['id_forma_pagamento'])) {
            $where  .= " AND dp.id_forma_pagamento = :id_forma";
            $params .= "&id_forma=" . (int)$filtros['id_forma_pagamento'];
        }

        return [$where, $params];
    }

    public function listarVendedores(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead("SELECT id, nome FROM adms_usuarios ORDER BY nome ASC");
        return $read->getResultado() ?? [];
    }

    public function listarTurnosParaFiltro(array $filtros): array
    {
        $read  = new \App\adms\Models\helper\AdmsRead();
        $dtIni = $filtros['dt_ini'];
        $dtFim = $filtros['dt_fim'];

        // Ajustado: tb_turnos tem inicio_previsto/fim_previsto
        // Alias inicio_em para manter a view
        $sql = "SELECT
                    t.id,
                    COALESCE(e.inicio_real, t.inicio_previsto) AS inicio_em,
                    u.nome
                FROM tb_turnos t
                JOIN adms_usuarios u ON u.id = t.id_usuario
                LEFT JOIN tb_turnos_execucao e ON e.id_turno = t.id
                WHERE t.inicio_previsto BETWEEN :dt_ini AND :dt_fim
                ORDER BY t.inicio_previsto DESC
                LIMIT 200";

        $read->fullRead($sql, "dt_ini={$dtIni}&dt_fim={$dtFim}");
        return $read->getResultado() ?? [];
    }

    public function buscarTurnoAtivo(): ?array
    {
        $read = new \App\adms\Models\helper\AdmsRead();

        // Ajustado: tabela status correta tb_turno_status
        // Aliases para a view: inicio_em, fim_previsto_em, fim_em
        $read->fullRead(
            "SELECT
                t.*,
                u.nome AS operador,
                s.nome AS status_nome,
                COALESCE(e.inicio_real, t.inicio_previsto) AS inicio_em,
                t.fim_previsto AS fim_previsto_em,
                e.fim_real AS fim_em
             FROM tb_turnos t
             JOIN adms_usuarios u ON u.id = t.id_usuario
             JOIN tb_turno_status s ON s.id = t.id_status
             LEFT JOIN tb_turnos_execucao e ON e.id_turno = t.id
             WHERE t.id_status = 2
             ORDER BY COALESCE(e.inicio_real, t.inicio_previsto) DESC
             LIMIT 1"
        );

        $res = $read->getResultado();
        return !empty($res) ? $res[0] : null;
    }

    public function resumoTurno(int $idTurno): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                COUNT(*) AS qtd_vendas,
                COALESCE(SUM(total),0) AS total_vendido
             FROM venda
             WHERE id_turno = :id_turno",
            "id_turno={$idTurno}"
        );

        $res = $read->getResultado();
        return !empty($res) ? $res[0] : ['qtd_vendas' => 0, 'total_vendido' => 0];
    }

    public function kpis(array $filtros): array
    {
        [$whereV, $paramsV] = $this->buildWhereVendas($filtros, 'v');
        [$whereP, $paramsP] = $this->buildWherePagamentos($filtros);

        $read = new \App\adms\Models\helper\AdmsRead();

        // faturação, qtd vendas
        $read->fullRead(
            "SELECT
                COUNT(*) AS qtd_vendas,
                COALESCE(SUM(v.total),0) AS faturacao
             FROM venda v
             WHERE {$whereV}",
            $paramsV
        );
        $k1 = $read->getResultado()[0] ?? ['qtd_vendas' => 0, 'faturacao' => 0];

        // total recebido + troco total
        $read->fullRead(
            "SELECT
                COALESCE(SUM(dp.valor_pagamento),0) AS total_recebido,
                COALESCE(SUM(pv.troco),0) AS troco_total
             FROM tb_detalhes_pagamento dp
             JOIN tb_pagamento_venda pv ON pv.id_pagamento = dp.id_pagamento
             JOIN venda v ON v.id_venda = pv.id_venda
             WHERE {$whereP}",
            $paramsP
        );
        $k2 = $read->getResultado()[0] ?? ['total_recebido' => 0, 'troco_total' => 0];

        // lucro estimado (último preco_compra do estoque por produto)
        $read->fullRead(
            "SELECT
                COALESCE(SUM(i.subtotal),0) AS receita,
                COALESCE(SUM(i.quantidade * ec.preco_compra),0) AS custo_estimado,
                COALESCE(SUM((i.preco_unitario - ec.preco_compra) * i.quantidade),0) AS lucro_estimado
             FROM tb_item_venda i
             JOIN venda v ON v.id_venda = i.id_venda
             JOIN (
                SELECT e1.id_produto, e1.preco_compra
                FROM tb_estoque e1
                JOIN (
                    SELECT id_produto, MAX(created_at) AS max_created
                    FROM tb_estoque
                    WHERE preco_compra IS NOT NULL
                    GROUP BY id_produto
                ) last_e ON last_e.id_produto = e1.id_produto AND last_e.max_created = e1.created_at
             ) ec ON ec.id_produto = i.id_produto
             WHERE {$whereV}",
            $paramsV
        );
        $k3 = $read->getResultado()[0] ?? ['lucro_estimado' => 0];

        $qtd    = (int)$k1['qtd_vendas'];
        $fat    = (float)$k1['faturacao'];
        $ticket = $qtd > 0 ? ($fat / $qtd) : 0;

        return [
            'qtd_vendas'     => $qtd,
            'faturacao'      => $fat,
            'ticket_medio'   => $ticket,
            'total_recebido' => (float)$k2['total_recebido'],
            'troco_total'    => (float)$k2['troco_total'],
            'lucro_estimado' => (float)$k3['lucro_estimado'],
        ];
    }

    public function mixPagamentos(array $filtros): array
    {
        [$whereP, $paramsP] = $this->buildWherePagamentos($filtros);

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                dp.id_forma_pagamento,
                CASE dp.id_forma_pagamento
                    WHEN 1 THEN 'Dinheiro'
                    WHEN 2 THEN 'Multicaixa'
                    WHEN 3 THEN 'Transferência'
                    ELSE 'Outro'
                END AS forma,
                COALESCE(SUM(dp.valor_pagamento),0) AS total
             FROM tb_detalhes_pagamento dp
             JOIN tb_pagamento_venda pv ON pv.id_pagamento = dp.id_pagamento
             JOIN venda v ON v.id_venda = pv.id_venda
             WHERE {$whereP}
             GROUP BY dp.id_forma_pagamento
             ORDER BY total DESC",
            $paramsP
        );

        return $read->getResultado() ?? [];
    }

    public function listarTurnos(array $filtros): array
    {
        $read   = new \App\adms\Models\helper\AdmsRead();
        $where  = "t.inicio_previsto BETWEEN :dt_ini AND :dt_fim";
        $params = "dt_ini={$filtros['dt_ini']}&dt_fim={$filtros['dt_fim']}";

        if (!empty($filtros['id_usuario'])) {
            $where  .= " AND t.id_usuario = :id_usuario";
            $params .= "&id_usuario=" . (int)$filtros['id_usuario'];
        }

        // Ajustado: campos reais do tb_turnos + join exec para fim real
        // Aliases para view: inicio_em, fim_previsto_em, fim_em
        $sql = "SELECT
                    t.id,
                    u.nome AS operador,
                    s.nome AS status,
                    COALESCE(e.inicio_real, t.inicio_previsto) AS inicio_em,
                    t.fim_previsto AS fim_previsto_em,
                    e.fim_real AS fim_em,
                    COUNT(v.id_venda) AS qtd_vendas,
                    COALESCE(SUM(v.total),0) AS total_vendido
                FROM tb_turnos t
                JOIN adms_usuarios u ON u.id = t.id_usuario
                JOIN tb_turno_status s ON s.id = t.id_status
                LEFT JOIN tb_turnos_execucao e ON e.id_turno = t.id
                LEFT JOIN venda v ON v.id_turno = t.id
                WHERE {$where}
                GROUP BY t.id, u.nome, s.nome, inicio_em, fim_previsto_em, fim_em
                ORDER BY inicio_em DESC
                LIMIT 200";

        $read->fullRead($sql, $params);
        return $read->getResultado() ?? [];
    }

    public function top5Vendidos(array $filtros): array
    {
        [$whereV, $paramsV] = $this->buildWhereVendas($filtros, 'v');

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                p.id_produto,
                p.nome_produto,
                COALESCE(SUM(i.quantidade),0) AS total_quantidade,
                COALESCE(SUM(i.subtotal),0) AS total_faturado
             FROM tb_item_venda i
             JOIN tb_produtos p ON p.id_produto = i.id_produto
             JOIN venda v ON v.id_venda = i.id_venda
             WHERE {$whereV}
             GROUP BY p.id_produto, p.nome_produto
             ORDER BY total_quantidade DESC
             LIMIT 5",
            $paramsV
        );

        return $read->getResultado() ?? [];
    }

    public function top5Lucro(array $filtros): array
    {
        [$whereV, $paramsV] = $this->buildWhereVendas($filtros, 'v');

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                p.id_produto,
                p.nome_produto,
                COALESCE(SUM(i.quantidade),0) AS total_quantidade,
                COALESCE(SUM(i.subtotal),0) AS total_faturado,
                COALESCE(SUM((i.preco_unitario - ec.preco_compra) * i.quantidade),0) AS lucro_estimado
             FROM tb_item_venda i
             JOIN tb_produtos p ON p.id_produto = i.id_produto
             JOIN venda v ON v.id_venda = i.id_venda
             JOIN (
                SELECT e1.id_produto, e1.preco_compra
                FROM tb_estoque e1
                JOIN (
                    SELECT id_produto, MAX(created_at) AS max_created
                    FROM tb_estoque
                    WHERE preco_compra IS NOT NULL
                    GROUP BY id_produto
                ) last_e ON last_e.id_produto = e1.id_produto AND last_e.max_created = e1.created_at
             ) ec ON ec.id_produto = i.id_produto
             WHERE {$whereV}
             GROUP BY p.id_produto, p.nome_produto
             ORDER BY lucro_estimado DESC
             LIMIT 5",
            $paramsV
        );

        return $read->getResultado() ?? [];
    }

    public function alertasEstoqueBaixo(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();

        // Ajuste: a tua view usa $r['quantidade_estoque'], então aliasei assim
        $read->fullRead(
            "SELECT
                p.id_produto,
                p.nome_produto,
                COALESCE(SUM(e.quantidade_disponivel),0) AS quantidade_estoque,
                p.estoque_min
             FROM tb_produtos p
             LEFT JOIN tb_estoque e
               ON e.id_produto = p.id_produto
              AND (e.id_localizacao IN (1,2) OR e.id_localizacao IS NULL)
             GROUP BY p.id_produto, p.nome_produto, p.estoque_min
             HAVING quantidade_estoque <= p.estoque_min
             ORDER BY quantidade_estoque ASC
             LIMIT 20"
        );

        return $read->getResultado() ?? [];
    }

    public function alertasValidadeProxima(int $dias = 90): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();

        // A tua view espera nome_produto, lote, quantidade_disponivel, data_validade
        $read->fullRead(
            "SELECT
                p.nome_produto,
                e.lote,
                e.quantidade_disponivel,
                e.data_validade
             FROM tb_estoque e
             JOIN tb_produtos p ON p.id_produto = e.id_produto
             WHERE e.quantidade_disponivel > 0
               AND (e.id_localizacao IN (1,2) OR e.id_localizacao IS NULL)
               AND e.data_validade IS NOT NULL
               AND e.data_validade <= DATE_ADD(CURDATE(), INTERVAL {$dias} DAY)
             ORDER BY e.data_validade ASC
             LIMIT 20"
        );

        return $read->getResultado() ?? [];
    }

    public function totalSaidas(array $filtros): float
    {
        $read = new \App\adms\Models\helper\AdmsRead();

        $read->fullRead(
            "SELECT COALESCE(SUM(valor),0) AS total_saidas
             FROM tb_saidas
             WHERE created_at BETWEEN :dt_ini AND :dt_fim",
            "dt_ini={$filtros['dt_ini']}&dt_fim={$filtros['dt_fim']}"
        );

        $res = $read->getResultado();
        return !empty($res) ? (float)$res[0]['total_saidas'] : 0.0;
    }
}