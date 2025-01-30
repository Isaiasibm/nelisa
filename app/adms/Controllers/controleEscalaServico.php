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
class controleEscalaServico
{

    private $Resultado;
    private $Dados;
    private $DadoId;
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

    public function processarEscala()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $Processa = new \App\adms\Models\admsEscalaServico();
        $militaresSelecionadosPEscala = array();
        $dadosDoMilitaresSelecionadosPEscala = array();

        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);

            $parametroListar = $this->Dados['mes'];
            $dividir = explode('-', $parametroListar);
            $this->Dados["numMes"] = $dividir[0];
            $this->Dados["mesTexto"] = $dividir[1];

            $parametroListar1 = $this->Dados['tipoServico'];
            $dividir = explode('-', $parametroListar1);
            $this->Dados["idTipoServ"] = $dividir[0];
            $this->Dados["tipoServ"] = $dividir[1];

            $tipoServico = $this->Dados['idTipoServ'];

            $mes = $this->Dados['numMes'];
            $ano = $this->Dados['ano'];
            $dia = 1;
            if ($mes <= 9) {
                $mes = '0' . $mes;
            }
            $anoMes = $ano . '-' . $mes;

            //Quantidade de dias do mês
            $limiteEscalaMes = cal_days_in_month(CAL_GREGORIAN, $mes, $ano);
            $diasDoMes = $limiteEscalaMes;
            //Verificar se a escala já foi processada
            $quantidadeProcessados = $Processa->verificarAnoMesEscala($anoMes, $tipoServico);

            //Se a quantidade de militares processados for maior que 1
            if (count($quantidadeProcessados) > 0) {
                // A Quantidade de dias do mês será decrementada             
                $limiteEscalaMes -= count($quantidadeProcessados);
            }
            // Se ainda restar dias no mês
            if ($limiteEscalaMes > 0) {
                # code...
                //Buscar Militares que nunca trabalharam
                $militaresNovosDisponiveis = $Processa->CarregarMilitaresNovosDisponiveis($tipoServico, $limiteEscalaMes);

                //     var_dump($militaresNovosDisponiveis[0]["NIP"]);
                //Se atingirem o limite necessario
                if (count($militaresNovosDisponiveis) == $limiteEscalaMes) {

                    foreach ($militaresNovosDisponiveis as $m) {
                        extract($m);

                        while ($dia <= $diasDoMes) {
                            # code...

                            if ($dia <= 9) {
                                $dia = '0' . $dia;
                            }
                            $data = $ano . '-' . $mes . '-' . $dia;

                            //buscar a data da escala existente para se preencher onde ainda não se registou 
                            $quantEscalados = $Processa->verificarDataEscala($data, $tipoServico);
                            if (count($quantEscalados) < 1) {
                                //Cria o array com os dados do militar a ser escalado
                                $DadosEscala = array('nip_militar' => $NIP, 'Cod_Patente' => $Cod_Patente, 'Cod_u_e_o' => $Cod_Unidade, 'id_tipo' => $tipoServico, 'data_servico' => date($data), 'cod_usuario' => (int) $_SESSION['usuario_id'], 'created' => date('Y-m-d H:i:s'));
                                //Insere o militar na escala
                                $Processa->processaEscala($DadosEscala);
                                /*Se o militar foi escalado, adiciona no array de militares escalados e incrementa o dia*/
                                if ($Processa->getResultado() > 0) {
                                    array_push($militaresSelecionadosPEscala, $m);
                                    $dia++;
                                }
                                break; //interromper o ciclo while caso escale algum militar
                            }
                            // Se neste dia já houver militar escalado, incrementa o dia do mês
                            else {
                                $dia++;
                            }
                        } //fim do cilco While
                    }
                    $_SESSION['msgcad'] = "<div class='alert alert-success'>Escala processada com sucesso! </div>";
                } else if (count($militaresNovosDisponiveis) < $limiteEscalaMes) {

                    //Escalar militares novos se existirem e nao completarem o limite exigido
                    if (count($militaresNovosDisponiveis) != 0) {

                        foreach ($militaresNovosDisponiveis as $m) {
                            extract($m);
                            while ($dia <= $diasDoMes) {

                                if ($dia <= 9) {
                                    $dia = '0' . $dia;
                                }
                                $data = $ano . '-' . $mes . '-' . $dia;

                                //buscar a data da escala existente para se preencher onde ainda não se registou 
                                $quantEscalados = $Processa->verificarDataEscala($data, $tipoServico);
                                if (count($quantEscalados) < 1) {
                                    //cria o array com os dados do militar
                                    $DadosEscala = array('nip_militar' => $NIP, 'Cod_Patente' => $Cod_Patente, 'Cod_u_e_o' => $Cod_Unidade, 'id_tipo' => $tipoServico, 'data_servico' => date($data), 'cod_usuario' => (int) $_SESSION['usuario_id'], 'created' => date('Y-m-d H:i:s'));

                                    $Processa->processaEscala($DadosEscala);

                                    /*Se o militar foi escalado adiciona no array de militares escalados e incrementa o dia*/
                                    if ($Processa->getResultado() > 0) {

                                        array_push($militaresSelecionadosPEscala, $m);

                                        $dia++;
                                    }
                                    break; //interromper o ciclo while caso escale algum militar
                                }
                                // Se neste dia já houver militar escalado, incrementa o dia do mês e volta a procurar o dia seguinte;
                                else {

                                    $dia++;
                                }
                            } //fim do cilco While    
                        }

                        //Criar a diferenca dos militares novos para establecer o novo limite dos militares antigos
                        $limiteEscalaMes -= count($militaresNovosDisponiveis);
                    }

                    /*Buscar Militares antigos a serem escalados*/
                    $militaresAntigosDisponiveis = $Processa->CarregarMilitaresAntigosDisponiveis($tipoServico, $limiteEscalaMes);

                    //Escalar se existirem
                    if (count($militaresAntigosDisponiveis) != 0) {

                        foreach ($militaresAntigosDisponiveis as $m) {

                            extract($m);

                            while ($dia <= $diasDoMes) {

                                if ($dia <= 9) {
                                    $dia = '0' . $dia;
                                }

                                $data = $ano . '-' . $mes . '-' . $dia;

                                //buscar a data da escala existente para se preencher onde ainda não se registou 
                                $quantEscalados = $Processa->verificarDataEscala($data, $tipoServico);
                                if (count($quantEscalados) < 1) {
                                    $DadosEscala = array('nip_militar' => $NIP, 'Cod_Patente' => $Cod_Patente, 'Cod_u_e_o' => $Cod_Unidade, 'id_tipo' => $tipoServico, 'data_servico' => date($data), 'cod_usuario' => (int) $_SESSION['usuario_id'], 'created' => date('Y-m-d H:i:s'));

                                    $Processa->processaEscala($DadosEscala);

                                    /*Se o militar foi escalado adiciona no array de militares escalados e incrementa o dia*/
                                    if ($Processa->getResultado() > 0) {
                                        $this->Dados["dadosMilitar"] = $Processa->lisEscalaProcessadaAgora($NIP);

                                        array_push($militaresSelecionadosPEscala, $m);

                                        $dia++;
                                    }
                                    break; //interromper o ciclo while caso escale algum militar
                                }
                                // Se neste dia já houver militar escalado, incrementa o dia do mês e volta a procurar o dia seguinte;
                                else {

                                    $dia++;
                                }
                            } //fim do cilco While   

                        }
                    }

                    $_SESSION['msgcad'] = "<div class='alert alert-success'>Escala processada com sucesso! </div>";
                } else {
                    $_SESSION['msgcad'] = "<div class='alert alert-danger'>Existe anomalias na escala em que pretende processar, deve contactar o desenvolvedor do sistema!</div>";
                }
            } else {
                $_SESSION['msgcad'] = "<div class='alert alert-danger'>A escala que tentou processar, já existe!</div>";
            }

        endif;

        $this->Dados["MilitaresEscalados"] = $militaresSelecionadosPEscala;

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/processarEscala", $this->Dados);
        $carregarView->renderizar();
    }


    public function processarReserva()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $Processa = new \App\adms\Models\admsEscalaServico();
        $militarSeleceionadoReserva = array();
        $dadosDomilitarSeleceionadoReserva = array();
        $militaresEscalaTentada = array();

        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);

            $parametroListar = $this->Dados['mes'];
            $dividir = explode('-', $parametroListar);
            $this->Dados["numMes"] = $dividir[0];
            $this->Dados["mesTexto"] = $dividir[1];

            $parametroListar1 = $this->Dados['tipoServico'];
            $dividir = explode('-', $parametroListar1);
            $this->Dados["idTipoServ"] = $dividir[0];
            $this->Dados["tipoServ"] = $dividir[1];

            $tipoServico = $this->Dados['idTipoServ'];

            $mes = $this->Dados['numMes'];
            if ($mes <= 9) {
                $mes = '0' . $mes;
            }
            $ano = $this->Dados['ano'];
            $anoMes = $ano . '-' . $mes . '-';


            //Quantidade de dias do mês
            $limiteEscalaMes = cal_days_in_month(CAL_GREGORIAN, $mes, $ano);

            //Buscar id de escalas que ainda não tenham reservas

            $buscarIdEscala = $Processa->lisEscalaQueNaoTemReserva($tipoServico, $anoMes);
            //Buscar a quantidade que se necessita para escalar reservas neste mês
            $QuantNecessaria = count($buscarIdEscala);
            //var_dump($buscarIdEscala);
            $militaresReservas = $Processa->carregarReservas($tipoServico, $anoMes, $QuantNecessaria);
            $quantReserva = count($militaresReservas);
            if ($QuantNecessaria > $limiteEscalaMes) {
                $_SESSION['msgcad'] = "<div class='alert alert-danger'>A escala que tentou processar, tem alguma anomalia, por favor contacte o administrador para resolver o problema! </div>";
                // var_dump($QuantNecessaria);
                // var_dump($limiteEscalaMes);
            } else if ($QuantNecessaria == 0) {
                $_SESSION['msgcad'] = "<div class='alert alert-danger'> A escala de reserva para os parâmetros escolhidos já foi processada!!! </div>";
            } else {

                if ($quantReserva > 0 and $QuantNecessaria > 0) {
                    $i = 0;
                    foreach ($militaresReservas as $m) {
                        extract($m);
                        $idEscala = $buscarIdEscala[$i]["id"];
                        $dataServico = $buscarIdEscala[$i]["data_servico"];
                        //$this->Dados["data_reserva"]=$dataServico;
                        //Adicionar o campo data_serv ao objecto $m que tem os dados dos militares reserva.
                        $m["data_serv"] = $dataServico;
                        $i = $i + 1;
                        //var_dump($m);
                        $DadosReserva = array('nip_Militar_reserva' => $NIP, 'id_escala_servico' => $idEscala, 'data_reserva' => $dataServico, 'id_patente_reserva' => $Cod_Patente, 'id_unidade_reserva' => $Cod_Unidade, 'cod_usuario' => (int) $_SESSION['usuario_id'], 'created' => date('Y-m-d H:i:s'));

                        $Processa->processaReserva($DadosReserva);

                        if ($Processa->getResultado() > 0) {
                            //  $this->Dados["dadosMilitar"]= $Processa->lisReservaProcessadaAgora($NIP);

                            array_push($militarSeleceionadoReserva, $m);

                            //var_dump($militarSeleceionadoReserva);
                            $_SESSION['msgcad'] = "<div class='alert alert-success'>Escala de Reservas processada com sucesso! </div>";
                        } else {
                            $_SESSION['msgcad'] = "<div class='alert alert-danger'>Não foi possível processar. Por favor contacte o administrador!</div>";
                        }
                    }
                } else {
                    $_SESSION['msgcad'] = "<div class='alert alert-danger'>A escala que tentou processar, já existe!</div>";
                }
            }

        endif;

        $this->Dados["MilitaresEscaladosReserva"] = $militarSeleceionadoReserva;

        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/processarReserva", $this->Dados);
        $carregarView->renderizar();
    }

    public function listarEscala()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $lista = new \App\adms\Models\admsEscalaServico();

        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);
            $tipoLista = $this->Dados['tipoEscala'];

            if ($this->Dados['tipoServico'] != "") {
                # code...

                $parametroListar1 = $this->Dados['tipoServico'];
                $dividir = explode('-', $parametroListar1);
                $this->Dados["idTipoServ"] = $dividir[0];
                $this->Dados["tipoServ"] = $dividir[1];

                $tipoServico = $this->Dados['idTipoServ'];
            }

            if ($this->Dados['mes'] != "") {
                $parametroListar = $this->Dados['mes'];
                $dividir = explode('-', $parametroListar);
                $this->Dados["numMes"] = $dividir[0];
                $this->Dados["mesTexto"] = $dividir[1];
                $mes = $this->Dados['numMes'];

                $ano = $this->Dados['ano'];
                $anoMes = $ano . '-' . $mes;
            }

            if ($this->Dados['unidade'] != "") {
                $parametroListar1 = $this->Dados['unidade'];
                $dividir = explode('aa2aa', $parametroListar1);
                $this->Dados["idUnidade"] = $dividir[0];
                $this->Dados["DesUnidade"] = $dividir[1];

                $ueo = $this->Dados['idUnidade'];
            }

            $data = $this->Dados['dataInicial'];

            if ($tipoLista == 1) {
                # code...
                $this->Dados['dadosEscala'] = $lista->lisEscala($tipoServico, $anoMes);
            }

            if ($tipoLista == 2) {
                $this->Dados['dadosEscala'] = $lista->lisEscalaData($tipoServico, $data);
            }
            if ($tipoLista == 3) {
                $data2 = $this->Dados['dataFinal'];
                $this->Dados['dadosEscala'] = $lista->lisEscalaIntervaloData($tipoServico, $data, $data2);
            }
            if ($tipoLista == 4) {
                $this->Dados['dadosEscala'] = $lista->lisGeralData($data);
            }

            if ($tipoLista == 5) {

                $this->Dados['dadosEscala'] = $lista->lisGeralUeo($ueo);
            }
            if ($tipoLista == 6) {

                $this->Dados['dadosEscala'] = $lista->lisGeralUeoMes($ueo, $anoMes);
            }

            if ($tipoLista == 7) {

                $this->Dados['dadosEscala'] = $lista->lisGeralUeoTipoServicoMes($ueo, $tipoServico, $anoMes);
            }

            if ($tipoLista == 8) {

                $this->Dados['dadosEscala'] = $lista->lisGeralUeoData($ueo, $data);
            }

            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarEscala", $this->Dados);
            $carregarView->renderizar();

        else :
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarEscala", $this->Dados);
            $carregarView->renderizar();
        endif;
    }

    public function visualizar($DadosId = null)
    {
        $this->DadoId = (int) $DadosId;

        if (!empty($this->DadoId)) {
            $verEscalado = new \App\adms\Models\admsEscalaServico();
            $this->Dados['militarEscalado'] = $verEscalado->buscarDadosMilitarEscalado($this->DadoId);
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu']    = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/militar/detalhesMilitar", $this->Dados);
            $carregarView->renderizar();
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'> Erro:Detalhes do militar não encontrados!!! </div>";
            $UrlDestino = URLADM . 'controleEscalaServico/listarEscala';
            header("Location: $UrlDestino");
        }
    }

    public function listarMilitDisponiveis()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $lista = new \App\adms\Models\admsEscalaServico();
        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);

            $tipoListaMilitar = $this->Dados['tipoListaMilitar'];

            $disponibilidade = null;



            if ($tipoListaMilitar == 1) {
                // code...

                $this->Dados['dadosMilitares'] = $lista->lisMilitaresGeral();
            } elseif ($tipoListaMilitar == 2) {
                $ueo = $this->Dados["Unidade"];
                $this->Dados['dadosMilitares'] = $lista->lisMilitaresUeo($ueo);
            } elseif ($tipoListaMilitar == 3) {                
                $disponibilidade = $this->Dados["disponibilidade"];
                $this->Dados['dadosMilitares'] = $lista->lisMilitaresDisponiveis($disponibilidade);
            } elseif ($tipoListaMilitar == 4) {
                $ueo = $this->Dados["Unidade"];
                $disponibilidade = $this->Dados["disponibilidade"];
                $this->Dados['dadosMilitares'] = $lista->lisMilitaresDisponiveisUeo($disponibilidade, $ueo);
            } else {
                $this->Dados['dadosMilitares'] = $lista->lisMilitaresGeral();
            }
            //var_dump($this->Dados['dadosMilitares']);

            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarMilitaresDisponiveis", $this->Dados);
            $carregarView->renderizar();

        else :
            $this->Dados['dadosMilitares'] = $lista->lisMilitaresGeral();
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarMilitaresDisponiveis", $this->Dados);
            $carregarView->renderizar();
        endif;
    }


    public function listarReserva()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $lista = new \App\adms\Models\admsEscalaServico();

        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);

            $parametroListar = $this->Dados['mes'];
            $dividir = explode('-', $parametroListar);
            $this->Dados["numMes"] = $dividir[0];
            $this->Dados["mesTexto"] = $dividir[1];

            $parametroListar1 = $this->Dados['tipoServico'];
            $dividir = explode('-', $parametroListar1);
            $this->Dados["idTipoServ"] = $dividir[0];
            $this->Dados["tipoServ"] = $dividir[1];

            $tipoServico = $this->Dados['idTipoServ'];

            $mes = $this->Dados['numMes'];

            $ano = $this->Dados['ano'];
            $anoMes = $ano . '-' . $mes;

            $this->Dados['dadosEscala'] = $lista->lisEscala($tipoServico, $anoMes);

            //$this->Dados['dadosReserva']=$lista->lisReserva($idEscalaServico);
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            //var_dump($this->Dados['dadosEscala']);
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarReserva", $this->Dados);
            $carregarView->renderizar();

        else :
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarReserva", $this->Dados);
            $carregarView->renderizar();
        endif;
    }


    public function listarAusente()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $lista = new \App\adms\Models\admsEscalaServico();

        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);

            $tpLista = $this->Dados['tipoLista'];



            if ($tpLista == 1 || $tpLista == 2) {

                $parametroListar1 = $this->Dados['tipoServico'];
                $dividir = explode('-', $parametroListar1);
                $this->Dados["idTipoServ"] = $dividir[0];
                $this->Dados["tipoServ"] = $dividir[1];

                $tipoServico = $this->Dados['idTipoServ'];
            }

            if ($tpLista == 4 || $tpLista == 5) {


                $parametroListar = $this->Dados['unidade'];
                $dividir = explode('aa2aa', $parametroListar);
                $this->Dados["codUeo"] = $dividir[0];
                $this->Dados["desigUeo"] = $dividir[1];
            }

            if ($tpLista == 1) {
                # code...

                $parametroListar = $this->Dados['mes'];
                $dividir = explode('-', $parametroListar);
                $this->Dados["numMes"] = $dividir[0];
                $this->Dados["mesTexto"] = $dividir[1];

                $mes = $this->Dados['numMes'];

                $ano = $this->Dados['ano'];
                $anoMes = $ano . '-' . $mes;


                $this->Dados['dadosAusente'] = $lista->lisAusTipoMes($tipoServico, $anoMes);
            } elseif ($tpLista == 2) {
                $this->Dados['dadosAusente'] = $lista->lisAusTipoIntervalo($tipoServico, $this->Dados["dataInicial"], $this->Dados["dataFinal"]);
            } elseif ($tpLista == 3) {
                $this->Dados['dadosAusente'] = $lista->lisAusIntervalo($this->Dados["dataInicial"], $this->Dados["dataFinal"]);
            } elseif ($tpLista == 4) {
                $this->Dados['dadosAusente'] = $lista->lisAusUeo($this->Dados["codUeo"]);
            } elseif ($tpLista == 5) {
                $this->Dados['dadosAusente'] = $lista->lisAusUeoIntervalo($this->Dados["codUeo"], $this->Dados["dataInicial"], $this->Dados["dataFinal"]);
            } elseif ($tpLista == 9) {
                # code...
                $this->Dados['dadosAusente'] = $lista->lisAusente();
            }

            //$this->Dados['dadosReserva']=$lista->lisReserva($idEscalaServico);
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            //var_dump($this->Dados['dadosEscala']);
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarAusente", $this->Dados);
            $carregarView->renderizar();

        else :
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarAusente", $this->Dados);
            $carregarView->renderizar();
        endif;
    }


    public function listarPresente()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $lista = new \App\adms\Models\admsEscalaServico();

        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);

            $tpLista = $this->Dados['tipoLista'];



            if ($tpLista == 1 || $tpLista == 2) {

                $parametroListar1 = $this->Dados['tipoServico'];
                $dividir = explode('-', $parametroListar1);
                $this->Dados["idTipoServ"] = $dividir[0];
                $this->Dados["tipoServ"] = $dividir[1];

                $tipoServico = $this->Dados['idTipoServ'];
            }

            if ($tpLista == 4 || $tpLista == 5) {


                $parametroListar = $this->Dados['unidade'];
                $dividir = explode('aa2aa', $parametroListar);
                $this->Dados["codUeo"] = $dividir[0];
                $this->Dados["desigUeo"] = $dividir[1];
            }

            if ($tpLista == 1) {
                # code...

                $parametroListar = $this->Dados['mes'];
                $dividir = explode('-', $parametroListar);
                $this->Dados["numMes"] = $dividir[0];
                $this->Dados["mesTexto"] = $dividir[1];

                $mes = $this->Dados['numMes'];

                $ano = $this->Dados['ano'];
                $anoMes = $ano . '-' . $mes;


                $this->Dados['dadosPresente'] = $lista->lisPresTipoMes($tipoServico, $anoMes);
            } elseif ($tpLista == 2) {
                $this->Dados['dadosPresente'] = $lista->lisPresTipoIntervalo($tipoServico, $this->Dados["dataInicial"], $this->Dados["dataFinal"]);
            } elseif ($tpLista == 3) {
                $this->Dados['dadosPresente'] = $lista->lisPresIntervalo($this->Dados["dataInicial"], $this->Dados["dataFinal"]);
            } elseif ($tpLista == 4) {
                $this->Dados['dadosPresente'] = $lista->lisPresUeo($this->Dados["codUeo"]);
            } elseif ($tpLista == 5) {
                $this->Dados['dadosPresente'] = $lista->lisPresUeoIntervalo($this->Dados["codUeo"], $this->Dados["dataInicial"], $this->Dados["dataFinal"]);
            } elseif ($tpLista == 9) {
                # code...
                $this->Dados['dadosPresente'] = $lista->lisPresenca();
            }
            //var_dump($this->Dados['dadosPresente']);
            //$this->Dados['dadosReserva']=$lista->lisReserva($idEscalaServico);
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            //var_dump($this->Dados['dadosEscala']);
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarPresenca", $this->Dados);
            $carregarView->renderizar();

        else :
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarPresenca", $this->Dados);
            $carregarView->renderizar();
        endif;
    }


    public function apresentarGrafico()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $lista = new \App\adms\Models\admsEscalaServico();

        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);

            $tpLista = $this->Dados['tipografico'];

            if ($tpLista == 1 || $tpLista == 3) {
                $parametroListar = $this->Dados['mes'];
                $dividir = explode('-', $parametroListar);
                $this->Dados["numMes"] = $dividir[0];
                $this->Dados["mesTexto"] = $dividir[1];
                $mes = $this->Dados['numMes'];

                $ano = $this->Dados['ano'];
                $anoMes = $ano . '-' . $mes;
            }
            if ($tpLista == 2 || $tpLista == 4) {

                $data1 = $this->Dados['dataInicial'];
                $data2 = $this->Dados['dataFinal'];
            }

            //echo($anoMes);
            if ($tpLista == 1) {
                // code...

                $this->Dados['ausenteUnidadeGrafico'] = $lista->graficoUnidadeGeralAusente($anoMes);
            }
            if ($tpLista == 2) {
                // code...

                $this->Dados['ausenteUnidadeGraficoIntervalo'] = $lista->graficoUnidadeGeralAusenteIntervalo($data1, $data2);
            }


            if ($tpLista == 3) {
                $this->Dados['ausenteTipoServicoGrafico'] = $lista->graficoTipoServicoMesAusente($anoMes);
            }

            if ($tpLista == 4) {
                $this->Dados['ausenteTipoServicoGraficoIntervalo'] = $lista->graficoTipoServicoMesAusenteIntervalo($data1, $data2);
            }

            //var_dump($this->Dados['ausenteUnidadeGrafico']);
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            //var_dump($this->Dados['dadosAusente']);
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarGrafico", $this->Dados);
            $carregarView->renderizar();

        else :
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarGrafico", $this->Dados);
            $carregarView->renderizar();
        endif;
    }



    public function apresentarGraficoPresenca()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $lista = new \App\adms\Models\admsEscalaServico();

        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);

            $tpLista = $this->Dados['tipografico'];

            if ($tpLista == 1 || $tpLista == 3) {
                $parametroListar = $this->Dados['mes'];
                $dividir = explode('-', $parametroListar);
                $this->Dados["numMes"] = $dividir[0];
                $this->Dados["mesTexto"] = $dividir[1];
                $mes = $this->Dados['numMes'];

                $ano = $this->Dados['ano'];
                $anoMes = $ano . '-' . $mes;
            }
            if ($tpLista == 2 || $tpLista == 4) {

                $data1 = $this->Dados['dataInicial'];
                $data2 = $this->Dados['dataFinal'];
            }

            //echo($anoMes);
            if ($tpLista == 1) {
                // code...

                $this->Dados['presenteUnidadeGrafico'] = $lista->graficoUnidadeGeralPresente($anoMes);
            }
            if ($tpLista == 2) {
                // code...

                $this->Dados['presenteUnidadeGraficoIntervalo'] = $lista->graficoUnidadeGeralPresenteIntervalo($data1, $data2);
            }


            if ($tpLista == 3) {
                $this->Dados['presenteTipoServicoGrafico'] = $lista->graficoTipoServicoMesPresente($anoMes);
            }

            if ($tpLista == 4) {
                $this->Dados['presenteTipoServicoGraficoIntervalo'] = $lista->graficoTipoServicoMesPresenteIntervalo($data1, $data2);
            }




            //var_dump($this->Dados['ausenteUnidadeGrafico']);
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            //var_dump($this->Dados['dadosAusente']);
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarGraficoPresenca", $this->Dados);
            $carregarView->renderizar();

        else :
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/listarGraficoPresenca", $this->Dados);
            $carregarView->renderizar();
        endif;
    }






    public function alterData($DadosId = null)
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $this->DadosId = (string) $DadosId;

        if (!empty($this->Dados['btnConfirmacao'])) {
            unset($this->Dados['btnConfirmacao']);

            $parametroListar = $this->DadosId;
            $dividir = explode('-', $parametroListar);

            $this->Dados["idEscala"] = $dividir[0];
            $this->Dados["nipEscalado"] = $dividir[1];

            $altData = new \App\adms\Models\admsEscalaServico();
            $altData->alterarData($this->Dados);
        }
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/alterarDataEscala", $this->Dados);
        $carregarView->renderizar();
    }

    public function verMilitarEscalado($DadosId)
    {

        $this->DadosId = (int) $DadosId;
        if (!empty($this->DadosId)) {
            $verPeca = new \App\adms\Models\admsEscalaServico();
            $this->Dados['militarEscalado'] = $verPeca->buscarDadosMilitarEscalado($this->DadosId);
            $listarMenu = new \App\adms\Models\AdmsMenu();
            $this->Dados['menu'] = $listarMenu->itemMenu();
            $carregarView = new \Core\ConfigView("adms/Views/militar/detalhesMilitar", $this->Dados);
            $carregarView->renderizar();
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro:Dados não encontrados!</div>";
            $UrlDestino = URLADM . 'controleEscalaServico/listarEscala';
            header("Location: $UrlDestino");
        }
    }

    public function imprimirEscala()
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

        $imprima = new \App\adms\Models\admsEscalaServico();

        if (!empty($this->Dados['enviar'])) :
            unset($this->Dados['enviar']);

            $parametroListar = $this->Dados['mes'];
            $dividir = explode('-', $parametroListar);
            $this->Dados["numMes"] = $dividir[0];
            $this->Dados["mesTexto"] = $dividir[1];

            $parametroListar1 = $this->Dados['tipoServico'];
            $dividir = explode('-', $parametroListar1);
            $this->Dados["idTipoServ"] = $dividir[0];
            $this->Dados["tipoServ"] = $dividir[1];

            //var_dump($this->Dados["tipoServico"]);
            //die;
            //var_dump($this->Dados["tipoServ"]);
            $tipoServico = $this->Dados['idTipoServ'];

            $mesExt = $this->Dados['mesTexto'];
            $mes = $this->Dados['numMes'];
            $ano = $this->Dados['ano'];
            if ($mes <= 9) {
                $mes = '0' . $mes;
            }
            $data = $ano . '-' . $mes;
            //var_dump($data);
            $this->Dados["dadosEscalaPrinc"] = $imprima->imprimirEscala($tipoServico, $data);

            include 'app/adms/Controllers/escalaServicoImprimir.php';
            die;

        endif;
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/imprimirEscala", $this->Dados);
        $carregarView->renderizar();
    }


    public function imprimirNotificacao($id)
    {

        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

        $imprima = new \App\adms\Models\admsEscalaServico();

        //echo $id;

        //$ueo=null;


        $this->Dados["dadosEscalaNot"] = $imprima->notificacaoIndividualDados($id);
        foreach ($this->Dados["dadosEscalaNot"] as $dadosNotif) :
            extract($dadosNotif);
            //$ueo=$Designacao_Unidade;
            $dataSeparada = explode('-', $data_servico);
            $ano = $dataSeparada[0];
            $mes = $dataSeparada[1];
            $dia = $dataSeparada[2];

            //var_dump($dadosEsc);
            include 'app/adms/Controllers/notificacaoImprimir.php';

        endforeach;

        /*
  $this->Dados["dadosEscalaPrinc"]=$imprima->imprimirEscala($tipoServico,$data);

  //$this->Dados["dadosReserva"]= $imprima->buscaReservaImprimirEscala($this->Dados["dadosEscalaPrinc"]["idEsc"]);
//$this->Dados['tipo']=$tipoServico;
include 'app/adms/Controllers/escalaServicoImprimir.php';
die;



        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/imprimirEscala", $this->Dados);
        $carregarView->renderizar(); */
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


    public function confirmarPresenca($DadosId = null)
    {
        $this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        $this->DadosId = (string) $DadosId;

        if (!empty($this->Dados['btnConfirmacao'])) {
            unset($this->Dados['btnConfirmacao']);

            $parametroListar = $this->DadosId;
            $dividir = explode('-', $parametroListar);

            $this->Dados["idEscala"] = $dividir[0];
            $this->Dados["nipEscalado"] = $dividir[1];
            //    $this->Dados["dataServico"]=$dividir[2];

            // var_dump($this->Dados["nipEscalado"]." ".$this->Dados["idEscala"]);

            $confirmPres = new \App\adms\Models\admsEscalaServico();
            $confirmPres->confirmePresenca($this->Dados);
        }
        $listarMenu = new \App\adms\Models\AdmsMenu();
        $this->Dados['menu'] = $listarMenu->itemMenu();
        $carregarView = new \Core\ConfigView("adms/Views/EscalaServico/confirmarEscala", $this->Dados);
        $carregarView->renderizar();
    }
}
