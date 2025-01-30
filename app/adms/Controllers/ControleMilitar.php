<?php

namespace App\adms\Controllers;

date_default_timezone_set('Africa/Luanda');

if (!defined('URL')) {
    header("Location: /");
    exit();
}

/**
 * Controler Militar para gerir o avaliando militar
 *
 * @copyright (c) 2019, Jose Reis - DI
 */
class ControleMilitar
{

    private $Resultado;
    private $Dados;
    private $UserId;
    private $PageId;
    private $MilitarId;
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


    public function cadastrarMilitar()
    {



        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);


        $CadPessoa = new \App\adms\Models\ModelsMilitar();
        $CadMilitar = new \App\adms\Models\ModelsMilitar();
        // $foto = new \App\adms\Models\ModelsMilitar();



        if (!empty($this->Dados['SendCadMilitar'])) :
            unset($this->Dados['SendCadMilitar']);


            //$nomeFicheiro="foto_padrao/avatar-male.jpg";
            $this->Dados["telefone"] = 1;

            if (!empty($CadPessoa->verificaNIP($this->Dados["nip"]))) {

                $_SESSION['msgcad'] = "<div class='alert alert-danger'>O NIP que tentou registar já existe!</div>";
            } else {


                $DadosPessoa = array(
                    'Nome' => $this->Dados["nome"],
                    'Telefone' => $this->Dados["telefone"],
                    'cod_usuario' => (int) $_SESSION['usuario_id'],
                    'created' => date('Y-m-d H:i:s')
                );

                $CadPessoa->cadastrarPessoa($DadosPessoa);
                if ($CadPessoa->getResultado() >= 1) {

                    /*====================== Script Para Registar Dados Militares ====================*/

                    #ARRAY DE DADOS PARA INSERIR NA TABELA MILITAR
                    $DadosMilitar = array(
                        'NIP' => $this->Dados["nip"],
                        'Cod_Patente' => $this->Dados["patente"],
                        'disponibilidade' => $this->Dados["disponidilidade"],
                        'Cod_Unidade' => $this->Dados["unidade"],
                        'data_ultimo_servico' => $this->Dados["data_ultimo_servico"],
                        'Cod_Pessoa' => $CadPessoa->getResultado(),
                        'cod_usuario' => $_SESSION['usuario_id'],
                        'created' => date('Y-m-d H:i:s'),
                        'cod_ramo' => $this->Dados["ramo"],
                    );

                    $CadMilitar->cadastrarMilitar($DadosMilitar);

                    if ($CadMilitar->getResultado() >= 1) {

                        $_SESSION['msgcad'] = "<div class='alert alert-success'>Militar registado com sucesso! </div>";
                    } else {
                        $CadPessoa->apagarPessoa($CadPessoa->getResultado());
                        $_SESSION['msgcad'] = "<div class='alert alert-danger'>" . $CadMilitar->getMsg() . "</div>";
                    }

                    /*======================Fim Script Para Registar Dados Militares====================*/
                } else {
                    $_SESSION['msgcad'] = "<div class='alert alert-danger'>" . $CadPessoa->getMsg() . "</div>";
                }
                /*===================================== Fim Script regista Pessoa ==============================*/
            }

        endif;
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/militar/registarMilitar", $this->Dados);
        $carregarView->renderizar();
    }




    public function listarEspecialista($PageId = null)
    {
        $this->PageId = (int) $PageId;
        $paginacao = new \App\adms\Models\helper\AdmsPaginacao(URLADM . 'CadastrarEspecialista/listar');
        $paginacao->condicao($this->PageId, $this->LimiteResultado);
        $paginacao->paginacao("SELECT COUNT(tb_pessoa.cod_pessoa) AS num_result 
                FROM tb_pessoa");
        $this->ResultadoPg = $paginacao->getResultado();

        $listarUsuario = new \App\adms\Models\helper\AdmsRead();
        $listarUsuario->fullRead("SELECT cod_militar,nome,apelido,nip,abreviatura_patente,abreviatura_ramo,designacao_u_e_o,designacao_cargo
                FROM tb_pessoa
                INNER JOIN tb_militar ON tb_militar.cod_pessoa=tb_pessoa.cod_pessoa
                INNER JOIN tb_patente ON tb_militar.cod_patente=tb_patente.cod_patente
                INNER JOIN tb_u_e_o ON tb_militar.cod_u_e_o=tb_u_e_o.cod_u_e_o
                INNER JOIN tb_regiao ON tb_u_e_o.cod_regiao = tb_regiao.cod_regiao 
                INNER JOIN tb_ramo ON tb_regiao.cod_ramo=tb_ramo.cod_ramo
                INNER JOIN tb_cargo ON tb_militar.cod_cargo=tb_cargo.cod_cargo ORDER BY tb_militar.cod_patente ASC LIMIT :limit OFFSET :offset", "limit={$this->LimiteResultado}&offset={$paginacao->getOffset()}");
        $this->Resultado = $listarUsuario->getResultado();
        return $this->Resultado;
    }

    public function listar($PageId = null)
    {
        $this->PageId = (int) $PageId ? $PageId : 1;

        $botao = [
            'cad_usuario' => ['menu_controller' => 'cadastrar-usuario', 'menu_metodo' => 'cad-usuario'],
            'vis_usuario' => ['menu_controller' => 'ver-usuario', 'menu_metodo' => 'ver-usuario'],
            'edit_usuario' => ['menu_controller' => 'editar-usuario', 'menu_metodo' => 'edit-usuario'],
            'del_usuario' => ['menu_controller' => 'apagar-usuario', 'menu_metodo' => 'apagar-usuario']
        ];
        $listarBotao = new \App\adms\Models\AdmsBotao();
        $this->Dados['botao'] = $listarBotao->valBotao($botao);

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $this->Dados['listUser'] = $this->listarEspecialista($this->PageId);
        $this->Dados['paginacao'] = $this->getResultadoPg();

        $carregarView = new \Core\ConfigView("adms/Views/especialista/listarEspecialista", $this->Dados);
        $carregarView->renderizar();
    }


    public function carregarProvincias()
    {
        $saida = null;
        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

        $listarProvincias = new \App\adms\Models\ModelsEspecialista();
        $provincias = $listarProvincias->CarregarProvincias($this->Dados['parametro']);
        foreach ($provincias as $provincia) {
            extract($provincia);
            $saida .= '<option value="' . $cod_provincia . '">' . utf8_encode($designacao_provincia) . '</option>';
        }

        echo $saida;
    }

    public function visualizar($DadosId = null)
    {
        $this->DadosId = (int) $DadosId;
        if (!empty($this->DadosId)) {

            $DetalhesEspecialista = new \App\adms\Models\ModelsEspecialista();
            $this->Dados['dadosEspecialista'] = $DetalhesEspecialista->visualizar($this->DadosId);
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/especialista/visualizarEspecialista", $this->Dados);
            $carregarView->renderizar();
        } else {


            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro:Detalhes do Especialista não encontrados!</div>";
            $UrlDestino = URLADM . 'CadastrarEspecialista/listar';
            header("Location: $UrlDestino");
        }
    }


    public function relatorioGeral()
    {
        $CarregarView = new ConfigView("relatorios/MapaEspecialista");
        $CarregarView->renderizar();
    }



    public function pesquisarEspecialista($PageId = null)
    {
        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        if (!empty($this->Dados['pesquisaEspecialista'])) :
            unset($this->Dados['pesquisaEspecialista']);
            $pesquisaEspecialista = new \App\adms\Models\ModelsEspecialista();


            if ($this->Dados['filtro'] == 1) {
                $this->Resultado = $pesquisaEspecialista->pesquisarEspecialistaNIP($this->Dados['nip']);
                unset($this->Dados);
            } else if ($this->Dados['filtro'] == 2) {
                $this->Resultado = $pesquisaEspecialista->pesquisarEspecialistaUEO($this->Dados['unidade']);
                unset($this->Dados);
            } else if ($this->Dados['filtro'] == 3) {
                $this->Resultado = $pesquisaEspecialista->pesquisarEspecialistaPATENTE($this->Dados['patente']);
                unset($this->Dados);
            } else {
                $this->Resultado = $pesquisaEspecialista->pesquisarEspecialistaUEO_PATENTE($this->Dados['unidade'], $this->Dados['patente']);
                unset($this->Dados);
            }

            if (!empty($this->getResultado())) {

                $this->Dados['resultado'] = $this->getResultado();
            }
        endif;




        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/especialista/pesquisarEspecialista", $this->Dados);
        $carregarView->renderizar();
    }

    public function pesquisarCompetenciaEspecialista($PageId = null)
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        if (!empty($this->Dados['pesquisaEspecialista'])) :
            unset($this->Dados['pesquisaEspecialista']);
            $buscarMilitarCompetencias = new \App\adms\Models\ModelsEspecialista();



            $ueo = isset($this->Dados['unidade']) ? $this->Dados['unidade'] : null;
            $patente = isset($this->Dados['patente']) ? $this->Dados['patente'] : null;
            $grauAcademico = isset($this->Dados['habilitacao_literaria']) ? $this->Dados['habilitacao_literaria'] : null;
            $certificado = isset($this->Dados['certificado']) ? $this->Dados['certificado'] : null;
            $cursoMilitar = isset($this->Dados['cursoMilitar']) ? $this->Dados['cursoMilitar'] : null;

            unset($this->Dados);
            $this->Dados = $buscarMilitarCompetencias->buscarMilitaresCompetencia($ueo, $patente, $grauAcademico, $certificado, $cursoMilitar);
        //  var_dump($this->Dados['militar']);

        endif;

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/especialista/pesquisarCompetenciaEspecialista", $this->Dados);
        $carregarView->renderizar();
    }

    //==================================================================================================
    public function editarDadosMilitar($nip)
    {

        $NipMilitar = $nip;

        if (!empty($NipMilitar)) {

            $Militar = new \App\adms\Models\ModelsMilitar();

            //
            $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
            if (!empty($this->Dados['SendEditMilitar'])) {
                unset($this->Dados['SendEditMilitar']);


                // Verifcar se o NIP e mesmo 
                if (count($Militar->verificarNIPparaEditarMilitar($this->Dados['nip'], $this->Dados['cod_militar'])) > 0) {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>O Nip já esta registado</div>";
                    $UrlDestino = URL . 'controleEscalaServico/listarMilitDisponiveis';
                    header("Location: $UrlDestino");
                } elseif (count($Militar->verificarTelefoneparaEditarMilitar($this->Dados['telefone'], $this->Dados['cod_pessoa'])) > 0) {
                    $_SESSION['msg'] = "<div class='alert alert-danger'>O Nip já esta registado</div>";
                    $UrlDestino = URL . 'controleEscalaServico/listarMilitDisponiveis';
                    header("Location: $UrlDestino");
                } else {

                    $DadosPessoa = array(
                        "Nome" => $this->Dados['nome'],
                        "Telefone" => $this->Dados['telefone'],
                        "modified" => date('Y-m-d H:i:s')
                    );

                    if ($Militar->editar_Pessoa($DadosPessoa, $this->Dados['cod_pessoa'])) {
                        // Editar militar 
                        $DadosMilitar = array(
                            "NIP" => $this->Dados['nip'],
                            "Cod_Patente" => $this->Dados['patente'],
                            "Cod_Unidade" => $this->Dados['unidade'],
                            "modified" => date('Y-m-d H:i:s'),
                            'disponibilidade' => $this->Dados['disponidilidade'],
                            'data_ultimo_servico' => $this->Dados['data_ultimo_servico'],
                            'cod_ramo' => $this->Dados['ramo']
                        );


                        if ($Militar->editar_Militar($DadosMilitar, $this->Dados['cod_militar'])) {
                            $_SESSION['msg'] = "<div class='alert alert-success'>Os dados do militar foi alterado com sucesso</div>";
                            $UrlDestino = URL . 'controleEscalaServico/listarMilitDisponiveis';
                            header("Location: $UrlDestino");
                        } else {
                            $_SESSION['msg'] = "<div class='alert alert-danger'>Não conseguiu editar os dados, verifica os campos</div>";
                            $UrlDestino = URL . 'controleEscalaServico/listarMilitDisponiveis';
                            header("Location: $UrlDestino");
                        }
                    } else {
                        $_SESSION['msg'] = "<div class='alert alert-danger'>Não conseguiu editar os dados, verifica os campos</div>";
                        $UrlDestino = URL . 'controleEscalaServico/listarMilitDisponiveis';
                        header("Location: $UrlDestino");
                    }
                }
            }


            // Buscar os dados do militar
            $this->Dados['Militar'] = $Militar->buscarMilitarEspecifico($NipMilitar);


            if (!empty($this->Dados['Militar'])) {

                $DadosEspecialista = new \App\adms\Models\ModelsEspecialista();
                $listarMenu = new \App\adms\Models\AdmsMenu();
                $this->Dados['menu'] = $listarMenu->itemMenu();
                $carregarView = new \Core\ConfigView("adms/Views/militar/alterardados", $this->Dados);
                $carregarView->renderizar();
            } else {
                $_SESSION['msg'] = "<div class='alert alert-danger'>O militar não existe registado no sistema</div>";
                $UrlDestino = URL . 'controleEscalaServico/listarMilitDisponiveis';
                header("Location: $UrlDestino");
            }
        } else {
            die("ERRO: Entre em contacto com a DI");
        }
    }

    //==================================================================================================
    public function visualizarMilitar($nip)
    {
        $NipMilitar = (int) $nip;

        $Militar = new \App\adms\Models\ModelsMilitar();
        // Buscar os dados do militar
        $this->Dados['Militar'] = $Militar->buscarMilitarEspecifico($NipMilitar);

        //Escala de Serviço
        $this->Dados['Escala'] = $Militar->buscarEscalasDeSevicoMilitar($NipMilitar);

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu']    = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/militar/visualizarMilitar", $this->Dados);
        $carregarView->renderizar();
    }

    //==================================================================================================


    private function alterarPrivado()
    {
        if (!empty($this->Dados['SendEditaEspecialista'])) :
            unset($this->Dados['SendEditaEspecialista']);
            $EditaEspecialista = new ModelsEspecialista();
            $EditaEspecialista->editar($this->EspecialistaId, $this->Dados);
            if (!$EditaEspecialista->getResultado()) :
                $this->Dados['msg'] = $EditaEspecialista->getMsg();
            else :
                $this->Dados['msg'] = $EditaEspecialista->getMsg();
                $UrlDestino = URL . 'controle-Especialista/visualizar/' . $this->EspecialistaId;
                header("Location: $UrlDestino");
            endif;
        else :
            $VerEspecialista = new ModelsEspecialista();
            $this->Dados = $VerEspecialista->visualizar($this->EspecialistaId);
            if ($VerEspecialista->getRowCount() <= 0) :
                $_SESSION['msg'] = "<div class='alert alert-danger'>Necessário selecionar um Especialista</div>";
                $UrlDestino = URL . 'controle-especialista/index';
                header("Location: $UrlDestino");
            endif;
        //var_dump($this->Dados);
        endif;
    }
    /*
    public function pesquisarEspecialista($PageId = null) {
        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        if (!empty($this->Dados['SendPesquisaEspecialistaNip'])){
            unset($this->Dados['SendPesquisaEspecialistaNip']);
        }
        else{
            $this->PageId = ((int) $PageId ? $PageId : 1);
            $this->Dados['name'] = filter_input(INPUT_GET, 'name', FILTER_DEFAULT);
        }

        $PesquisarEspecialistas = new \App\adms\Models\ModelsEspecialista();
        $this->Dados = $PesquisarEspecialistas->pesquisarEspecialistaNip($this->PageId, $this->Dados);
        $CarregarView = new \App\adms\Controllers\ConfigView("adms/Views/especialista/pesquisarEspecialista", $this->Dados);
        $CarregarView->renderizar();
    }
*/
}
