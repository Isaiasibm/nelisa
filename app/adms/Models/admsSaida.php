<?php
namespace App\adms\Models;

if (!defined('URL')) {
    header("Location: /");
    exit();
} 
/**
 * Descricao de admsSaida
 *
 * @copyright (c) 2025 IBM
 */
class admsSaida {

    private $Resultado;
    private $EspecialistaId;
    private $Dados;
    private $msg;
    private $RowCount; 
    private $ResultadoPaginacao;
    private $PageId;

    const Entity = 'tb_pessoa';

    function getResultado() {
        return $this->Resultado;
    }

    function getMsg() {
        return $this->msg;
    }

    function getRowCount() {
        return $this->RowCount;
    }



    public function cadastrarSaida(array $dadosProduto) {
        $this->Dados = $dadosProduto;
        $this->ValidarDados();
        if ($this->Resultado):
           $Create = new \App\adms\Models\helper\AdmsCreate;

        $Create->exeCreate('tb_saidas', $this->Dados);        
        if ($Create->getResultado()>=1):
            
            $this->Resultado = $Create->getResultado();
        else:
          $this->msg = "<b> Erro:</b> Saída não registada! tente novamente"; 
          $this->Resultado = 0;           
        endif;

        else:
          $this->msg = "<b>Erro:</b> Preencha de forma correta os campos dos dados da saída"; 
          $this->Resultado = 0;
        endif;
    }


    private function validarDados() {
        $this->Dados = array_map('strip_tags', $this->Dados);
        $this->Dados = array_map('trim', $this->Dados);
        if (in_array('', $this->Dados)):
            $this->Resultado = false;
        else:
    //  $this->Dados['password'] = md5($this->Dados['password']);
            $this->Resultado = true;
        endif;
    }


    public function lisatarSaidas(){
        $listProdutos = new \App\adms\Models\helper\AdmsRead();
                    $listProdutos->fullRead("SELECT 
  s.id,
  s.data_saida,
  s.descricao,
  pa.Nome AS nome_autorizou,
  pd.Nome AS nome_destinatario,
  pr.Nome AS nome_responsavel_saida,
  s.id_estado_saida,
  s.id_tipo_saida,
  s.valor,
	ts.descricao AS tipo_saida
FROM tb_saidas s
LEFT JOIN tb_pessoa pa ON s.id_autorizou = pa.Cod_Pessoa
LEFT JOIN tb_pessoa pd ON s.id_destinatario = pd.Cod_Pessoa
LEFT JOIN tb_pessoa pr ON s.id_responsavel_saida = pr.Cod_Pessoa
INNER JOIN tb_tipo_saida ts ON s.id_tipo_saida = ts.id 
ORDER BY s.data_saida DESC;");
                    return $listProdutos->getResultado();
        }


        public function lisatarSaidasData($data){
            $listProdutos = new \App\adms\Models\helper\AdmsRead();
                        $listProdutos->fullRead("SELECT 
      s.id,
      s.data_saida,
      s.descricao,
      pa.Nome AS nome_autorizou,
      pd.Nome AS nome_destinatario,
      pr.Nome AS nome_responsavel_saida,
      s.id_estado_saida,
      s.id_tipo_saida,
      s.valor,
        ts.descricao AS tipo_saida
    FROM tb_saidas s
    LEFT JOIN tb_pessoa pa ON s.id_autorizou = pa.Cod_Pessoa
    LEFT JOIN tb_pessoa pd ON s.id_destinatario = pd.Cod_Pessoa
    LEFT JOIN tb_pessoa pr ON s.id_responsavel_saida = pr.Cod_Pessoa
    INNER JOIN tb_tipo_saida ts ON s.id_tipo_saida = ts.id WHERE s.data_saida=:dataSaida
    ORDER BY s.data_saida DESC;","dataSaida={$data}");
                        return $listProdutos->getResultado();
            }


            public function lisatarSaidasIntervaloData($data1, $data2){
                $listProdutos = new \App\adms\Models\helper\AdmsRead();
                            $listProdutos->fullRead("SELECT 
          s.id,
          s.data_saida,
          s.descricao,
          pa.Nome AS nome_autorizou,
          pd.Nome AS nome_destinatario,
          pr.Nome AS nome_responsavel_saida,
          s.id_estado_saida,
          s.id_tipo_saida,
          s.valor,
            ts.descricao AS tipo_saida
        FROM tb_saidas s
        LEFT JOIN tb_pessoa pa ON s.id_autorizou = pa.Cod_Pessoa
        LEFT JOIN tb_pessoa pd ON s.id_destinatario = pd.Cod_Pessoa
        LEFT JOIN tb_pessoa pr ON s.id_responsavel_saida = pr.Cod_Pessoa
        INNER JOIN tb_tipo_saida ts ON s.id_tipo_saida = ts.id WHERE s.data_saida BETWEEN :data1 AND :data2
        ORDER BY s.data_saida DESC;","data1={$data1}&data2={$data2}");
                            return $listProdutos->getResultado();
                }

    public function listarUsuariosComSaidas(): array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT DISTINCT u.id, u.nome
             FROM tb_saidas s
             INNER JOIN adms_usuarios u ON u.id = s.id_user
             ORDER BY u.nome ASC"
        );

        return $read->getResultado() ?: [];
    }

    public function listarSaidasComFiltros(array $filtros = []): array
    {
        $where = [];
        $params = [];

        if (!empty($filtros['id_user'])) {
            $where[] = 's.id_user = :id_user';
            $params['id_user'] = (int)$filtros['id_user'];
        }

        if (!empty($filtros['mes_ref'])) {
            $where[] = "DATE_FORMAT(s.data_saida, '%Y-%m') = :mes_ref";
            $params['mes_ref'] = (string)$filtros['mes_ref'];
        }

        if (!empty($filtros['data_ini']) && !empty($filtros['data_fim'])) {
            $where[] = 's.data_saida BETWEEN :data_ini AND :data_fim';
            $params['data_ini'] = (string)$filtros['data_ini'];
            $params['data_fim'] = (string)$filtros['data_fim'];
        }

        $sqlWhere = '';
        if (!empty($where)) {
            $sqlWhere = ' WHERE ' . implode(' AND ', $where);
        }

        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT
                s.id,
                s.data_saida,
                s.descricao,
                s.id_user,
                pa.nome AS nome_autorizou,
                pd.nome AS nome_destinatario,
                pr.nome AS nome_responsavel_saida,
                s.id_estado_saida,
                s.id_tipo_saida,
                s.valor,
                ts.descricao AS tipo_saida,
                au.nome AS nome_user
             FROM tb_saidas s
             LEFT JOIN tb_pessoa pa ON s.id_autorizou = pa.cod_pessoa
             LEFT JOIN tb_pessoa pd ON s.id_destinatario = pd.cod_pessoa
             LEFT JOIN tb_pessoa pr ON s.id_responsavel_saida = pr.cod_pessoa
             INNER JOIN tb_tipo_saida ts ON s.id_tipo_saida = ts.id
             LEFT JOIN adms_usuarios au ON au.id = s.id_user
             {$sqlWhere}
             ORDER BY s.data_saida DESC",
            http_build_query($params)
        );

        return $read->getResultado() ?: [];
    }

    public function buscarSaidaPorId(int $idSaida): ?array
    {
        $read = new \App\adms\Models\helper\AdmsRead();
        $read->fullRead(
            "SELECT id, id_tipo_saida, valor, data_saida, descricao, id_responsavel_saida, id_autorizou
             FROM tb_saidas
             WHERE id = :id
             LIMIT 1",
            "id={$idSaida}"
        );

        $res = $read->getResultado();
        return !empty($res) ? $res[0] : null;
    }

    public function editarSaida(int $idSaida, array $dadosSaida): void
    {
        $this->Dados = $dadosSaida;
        $this->ValidarDados();

        if (!$this->Resultado) {
            $this->msg = "<b>Erro:</b> Preencha de forma correta os campos dos dados da saída";
            $this->Resultado = 0;
            return;
        }

        $update = new \App\adms\Models\helper\AdmsUpdate();
        $update->exeUpdate('tb_saidas', $this->Dados, 'WHERE id = :id', "id={$idSaida}");

        if ($update->getResultado()) {
            $this->Resultado = $idSaida;
        } else {
            $this->msg = "<b>Erro:</b> Não foi possível atualizar a saída";
            $this->Resultado = 0;
        }
    }

    public function eliminarSaida(int $idSaida): void
    {
        $delete = new \App\adms\Models\helper\AdmsDelete();
        $delete->exeDelete('tb_saidas', 'WHERE id = :id', "id={$idSaida}");

        if ($delete->getResultado()) {
            $this->Resultado = $idSaida;
        } else {
            $this->msg = "<b>Erro:</b> Não foi possível eliminar a saída";
            $this->Resultado = 0;
        }
    }

            
        

     

      public function registarUsuario(array $DadosUser) {

        $this->Dados = $DadosUser;
        
        $this->ValidarDados();

        if ($this->Resultado):
         
            $Create = new \App\adms\Models\helper\AdmsCreate;
        $Create->exeCreate('adms_usuarios', $this->Dados);
        if ($Create->getResultado()):
            $this->Resultado = $Create->getResultado();
        else:
          $this->Resultado = 0;
          $this->msg = "<b>Erro:</b> Usuário não registado. Preencha de forma correta os campos!";
        endif;
        endif;
        
    }


}
