<?php 


namespace App\adms\Controllers;

class ControllerRequisicao extends Controller {
    private $Dados;
    private $result;

	public function ReciveRequest() {


		header('Content-Type: application/json; charset=utf-8');

		$this->Dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
		$regVenda = new \App\adms\Models\admsVenda();
		$regItems = new \App\adms\Models\admsVenda();
		$regPagVenda = new \App\adms\Models\admsVenda();
		$regDetalhePag = new \App\adms\Models\admsVenda();
		$updEstoque = new \App\adms\Models\admsVenda();
					
		if (isset($this->Dados['accao']) && $this->Dados['accao'] === "RealizarVenda") {
				
			$carrinho = json_decode($this->Dados['carrinho'], true);
			if (!empty($carrinho)) {
		//$valorVendido= (double)$this->Dados['totalVenda'];
			
//Array das vendas

				$DadosVenda =  array('total'=>$this->Dados['totalVenda'],'id_usuario'=> (int) $_SESSION['usuario_id'],'data_venda'=>date('Y-m-d H:i:s'));
				//Registo de venda
				$regVenda->cadastrarVenda($DadosVenda);

					if ($regVenda->getResultado() >= 1) { 
						$idVenda = $regVenda->getResultado(); // ID da venda
$dataHoje = date('Y-m-d');

// Conta o número de vendas já feitas no mesmo dia
$totalHoje = $regVenda->contarVendasDoDia($dataHoje);

// Cria número da fatura
$numeroFatura = 'FAT-' . str_pad($idVenda, 4, '0', STR_PAD_LEFT) . '-' . str_pad($totalHoje, 4, '0', STR_PAD_LEFT);
	
							
							// Carregar os itens do carrinho...
						foreach ($carrinho as $item) {

							
							//	Registar itens de venda
								$itensVenda = array('id_venda'=>$regVenda->getResultado(),'id_produto'=>$item["id"], 'quantidade'=>$item["quantidade"],'preco_unitario'=>$item["preco"],'subtotal'=>$item["subtotal"],'id_usuario'=> (int) $_SESSION['usuario_id'],'created'=>date('Y-m-d H:i:s'));
								
								$regItems->cadastrarItemVenda($itensVenda);
						
							if ($regItems->getResultado() >= 1) { 
									// Registar de pagamento

									//Atualizar o estoque
						
/*
							$itensVenda=array('quantidade_disponivel'=>$item["estoque"]);
							$idProduto=$item["id"];							
							//$updEstoque->updateEstoque($itensVenda,$idProduto);	
							*/
						

							$updEstoque->decrementarEstoque($item["id"], $item["quantidade"]);
							
									//Calcular o valor total pago
									$valorTotalPago = $this->Dados['emDinheiro'] + $this->Dados['multicaixa'] + $this->Dados['transferencia'];
									//Registar dados na tabela Pagamento venda
									$pagVenda = array('id_venda'=>$regVenda->getResultado(),'valor_total'=>$this->Dados["totalVenda"], 'valor_pago'=>$valorTotalPago,'troco'=>$this->Dados["troco"],'id_usuario'=> (int) $_SESSION['usuario_id'],'created_at'=>date('Y-m-d H:i:s'));

									$regPagVenda->cadastrarPagamentoVenda($pagVenda);
										if ($regPagVenda->getResultado() >= 1) { 
											
											if ($this->Dados['emDinheiro']>0) {
												$detalhePag = array('id_pagamento'=>$regPagVenda->getResultado(),'id_forma_pagamento'=>1, 'valor_pagamento'=>$this->Dados['emDinheiro'],'id_usuario'=> (int) $_SESSION['usuario_id'],'created_at'=>date('Y-m-d H:i:s'));
												$regDetalhePag->cadastrarDetalhesPagamento($detalhePag);
												
											}
											if ($this->Dados['multicaixa']>0) {
												$detalhePag = array('id_pagamento'=>$regPagVenda->getResultado(),'id_forma_pagamento'=>2, 'valor_pagamento'=>$this->Dados['multicaixa'],'id_usuario'=> (int) $_SESSION['usuario_id'],'created_at'=>date('Y-m-d H:i:s'));
																						
												$regDetalhePag->cadastrarDetalhesPagamento($detalhePag);
												}
											if ($this->Dados['transferencia']>0) {
												$detalhePag = array('id_pagamento'=>$regPagVenda->getResultado(),'id_forma_pagamento'=>3, 'valor_pagamento'=>$this->Dados['transferencia'],'id_usuario'=> (int) $_SESSION['usuario_id'],'created_at'=>date('Y-m-d H:i:s'));											
												$regDetalhePag->cadastrarDetalhesPagamento($detalhePag);
											}
											
											$this->result = [
												'success' => true,
												'numero_fatura' => $numeroFatura,
												'message' => 'Venda realizada com sucesso Ok OK',
											];
										
										}

								}

			
						} 
				
							
			// var_dump($this->result);
					} else {
						$this->result = [
							'success' => false,
							'message' => 'Falha ao realizar a venda',
						];
					}
					
			} 
			else {
					$this->result = [
						'success' => false,
						'message' => 'Carrinho vazio ou dados inválidos',
					];
					}
			
		
			
		}
		else {
				$this->result = [
					'success' => false,
					'message' => 'Ação inválida',
				];
			}
		echo json_encode($this->result);
		exit;

	}

}


?>