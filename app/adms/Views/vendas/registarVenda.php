<?php
    header('Content-type: text/html; charset=utf-8');
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">

                <h3 class="display-2 titulo">Registar Vendas</h3>
            </div>

             <div class="p-2">
                    <a href="<?php echo URLADM . 'home/index/' ?>" class="btn badge badge-danger btn-sm px-1"
                  style="font-size: 10pt; border-radius:7px 7px;">
                      <i class="fas fa-home"></i>Fechar</a>
                </div>
        </div>
        <hr style="color: #8fdc8f ">
    <?php
        if (isset($_SESSION['msg'])):
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        endif;
        if (isset($_SESSION['msgcad'])):
            echo $_SESSION['msgcad'];
            unset($_SESSION['msgcad']);
        endif;

    ?>

<div class="form-row">

    <div class="form-group col-md-12">

       <div class="table-responsive vendas-table-wrap">
 <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable w-100"
       data-page-length="5"
       data-priority="2,3,8"
       data-low-priority="0,1,4,5,6,7">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Bar Code</th>
                    <th > Nome do Produto </th>
                    <th >Preço</th>
                    <th>Tipo</th>
                    <th>Fabricante</th>
                    <th>Estoque</th>

                    <th >Validade</th>
                    <th>Acções</th>
                </tr>
            </thead>
            <tbody>
        <?php

            if (! empty($this->Dados['listProd'])):
                $i = 1;
                //  var_dump($this->Dados['listProd']);
                // $relatorio  = new \App\adms\Models\ModelsPaciente();
                foreach ($this->Dados['listProd'] as $r) {
                    extract($r);

                    echo "<tr>
		                            <td class='tg-lboi'>$id_produto</td>
		                             <td class='tg-lboi'>$bar_code</td>
		                            <td class='tg-lboi'>$nome_produto </td>
		                            <td class='tg-lboi'>$preco_venda</td>
		                              <td class='tg-lboi'>$tipoProduto</td>
		                                <td class='tg-lboi'>$nome_fabricante</td>

		                            <td class='tg-lboi'>$quantidade_estoque</td>

		                            <td class='tg-lboi'>$data_validade</td>
		                            <td class='tg-lboi'>
		                                <div class='dropdown'>
		                                <button class='btn btn-primary btn-add-cart'
		                                                data-id='$id_produto'
		                                                data-nome='$nome_produto'
		                                                data-preco='$preco_venda'
		                                                data-estoque='$quantidade_estoque'>
		                    Adicionar
		                                </button>


		                                 </td>
		                         </tr>";
                    $i++;
                } else :
                echo "<tr><td class='tg-lboi' colspan='15'>Não existem produtos em estoque! </td></tr>";
            endif;
        ?>
            </tbody>
        </table>
        </div>

    </div>
</div>

    <div class="form-row" style="display: none;" id="carrinhoDiv">
        <div class="form-group col-md-6">
            <h3>Carrinho de Compras</h3>
            <table id="carrinho" class="table table-bordered">
                <thead>
                    <tr>
                        <th style="text-align: center;">Produto</th>
                        <th style="text-align: center;">Qt</th>
                        <th style="text-align: center;">Preço</th>
                        <th style="text-align: center;"> Subtotal</th>

                    </tr>
                </thead>
                <tbody>
                <!-- O carrinho será preenchido dinamicamente -->
                </tbody>
            </table>
          <div class="checkout-bar mt-2">
  <div class="checkout-total">
    <span class="label">Total</span>
    <span class="value"><span id="total">0.00</span> Kz</span>
  </div>

  <div class="checkout-actions">
    <button id="checkout-enable" class="btn btn-primary btn-sm">Checkout</button>
  </div>
</div>
        </div>

        <div class="form-group col-md-1"> </div>
        <div class="form-group col-md-5" id="campos-pagamento" style="display: none;">
                <h3>Valor a pagar: <i id="total2">0.00 </i> Kz</h3>
                <div class="form-inline mb-3">
                    <label for="em_dinheiro" class="mr-2">Em Dinheiro:</label>
                    <input name="em_dinheiro" type="text" class="form-control" id="em_dinheiro" placeholder="Valor em Dinheiro">
                </div>
                <div class="form-inline mb-3">
                    <label for="multicaixa" class="mr-2">Multicaixa:</label>
                    <input name="multicaixa" type="text" class="form-control" id="multicaixa" placeholder="Valor Multicaixa">
                </div>
                <div class="form-inline mb-3">
                    <label for="transferencia" class="mr-2">Transferência:</label>
                    <input name="transferencia" type="text" class="form-control" id="transferencia" placeholder="Valor Transferência">
                </div>
                <div class="form-inline d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex align-items-center">
                        <label for="troco" class="mr-2">Troco:</label>
                        <div id="troco" class="form-control bg-light" style="width: 150px;">0.00</div>
                    </div>
                    <div class="d-flex align-items-center">
                        <label for="total_pago" class="mr-1">Total Pago:</label>
                        <div id="total_pago" class="form-control bg-light" style="width: 150px;">0.00</div>
                    </div>
                </div>

                    <label for="nif_cliente" class="mr-2">Dados do Cliente:</label>
    <input name="nif_cliente" type="text" class="form-control" id="nif_cliente" placeholder="Nif do cliente">
    <input name="nome_cliente" type="text" class="form-control" id="nome_cliente" placeholder="Nome do cliente">

                <div class="checkout-actions-right mt-2">
  <button id="finalizar-compra" class="btn btn-success btn-sm w-100" style="display: none;">
    Finalizar Compra
  </button>
</div>
        </div>


    </div>



</div>


        <div id="thermal-invoice" style="display: none; font-family: 'Courier New', monospace; font-size: 11px; width: 80mm; margin: 0; padding: 0;">
    <!-- CABEÇALHO -->
    <div style="text-align: center; margin-bottom: 6px;">
        <img id="invoice-logo" src="" alt="Nelisa Farma" style="max-width: 80px; height: auto; display: block; margin: 0 auto 4px auto;">
        <h2 style="margin: 0; padding: 0; font-size: 15px; font-weight: bold; letter-spacing: 1px;">NELISA FARMA</h2>
        <p style="margin: 2px 0; font-size: 9px;">NIF: 5484036305 | Tel: 923 600 263</p>
        <p style="margin: 2px 0 0 0; font-size: 9px;">Benfica Zona Verde, Rua 18 | Luanda</p>
    </div>

    <!-- SEPARADOR -->
    <div style="border-top: 1px dashed #333; margin: 5px 0; padding: 0;"></div>

    <!-- TIPO E NÚMERO DE FATURA -->
    <div style="text-align: center; margin: 5px 0;">
        <p style="margin: 0; font-size: 13px; font-weight: bold;">FATURA Nº </p>
        <p style="margin: 2px 0; font-size: 12px; font-weight: bold; letter-spacing: 1px;" id="invoice-number"></p>
    </div>

    <!-- SEPARADOR -->
    <div style="border-top: 1px dashed #333; margin: 5px 0; padding: 0;"></div>

    <!-- CLIENTE Detalhes -->
    <div style="margin: 5px 0; font-size: 10px;">
        <table style="width: 100%; border-collapse: collapse;">
            <tr>
                <td style="font-weight: bold; width: 30px;">Cliente:</td>
                <td style="text-align: right; white-space: nowrap; width: 1%;" id="invoice-nome">Consumidor Final</td>
            </tr>
            <tr>
                <td style="font-weight: bold;">NIF:</td>
                <td style="text-align: right; white-space: nowrap; width: 1%;" id="invoice-nif">000000000</td>
            </tr>
        </table>
    </div>

    <!-- SEPARADOR -->
    <div style="border-top: 1px dashed #333; margin: 5px 0; padding: 0;"></div>

    <!-- TABELA DE ITENS -->
    <div style="margin: 5px 0;">
        <table style="width: 100%; border-collapse: collapse; margin: 0; padding: 0;">
            <thead style="border-bottom: 1px solid #333;">
                <tr style="line-height: 1.2;">
                    <th style="text-align: left; padding: 3px 0; font-weight: bold; font-size: 10px;">ITEM</th>
                    <th style="text-align: center; padding: 3px 0; font-weight: bold; font-size: 10px; width: 35px;">QTD</th>
                    <th style="text-align: right; padding: 3px 0; font-weight: bold; font-size: 10px; width: 56px; white-space: nowrap;">VALOR</th>
                </tr>
            </thead>
            <tbody id="invoice-items" style="border-bottom: 1px solid #333;">
                <!-- Items will be inserted here dynamically -->
            </tbody>
        </table>
    </div>

    <!-- SEPARADOR -->
    <div style="border-top: 1px solid #333; margin: 5px 0; padding: 0;"></div>

    <!-- RESUMO FINANCEIRO -->
    <div style="margin: 8px 0; font-size: 11px;">
        <table style="width: 100%; border-collapse: collapse; table-layout: fixed;">
            <tbody>
                <tr>
                    <td style="text-align: left; padding: 3px 0; font-weight: 600;">Preco total:</td>
                    <td style="text-align: right; padding: 3px 0; font-weight: 700; width: 64px; white-space: nowrap;" id="invoice-total">0.00 Kz</td>
                </tr>
                <tr>
                    <td style="text-align: left; padding: 3px 0; font-weight: 600;">Valor pago:</td>
                    <td style="text-align: right; padding: 3px 0; font-weight: 700; width: 64px; white-space: nowrap;" id="invoice-paid">0.00 Kz</td>
                </tr>
                <tr>
                    <td colspan="2" style="padding: 2px 0;">
                        <div style="border-top: 1px dashed #333;"></div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; padding: 3px 0; font-size: 12px; font-weight: 800;">TROCO:</td>
                    <td style="text-align: right; padding: 3px 0; font-size: 12px; font-weight: 800; width: 64px; white-space: nowrap;" id="invoice-change">0.00 Kz</td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- SEPARADOR -->
    <div style="border-top: 1px solid #333; margin: 5px 0; padding: 0;"></div>

    <!-- DATA E OPERADOR -->
    <div style="margin: 5px 0; font-size: 9px;">
        <table style="width: 100%; border-collapse: collapse;">
            <tr>
                <td style="font-weight: 600;">Data:</td>
                <td style="text-align: right; font-weight: 600; width: 1%; white-space: nowrap;" id="invoice-date"></td>
            </tr>
            <tr>
                <td style="padding-top: 2px;">Atendido por:</td>
                <td style="text-align: right; padding-top: 2px; font-weight: bold; width: 1%; white-space: nowrap;" id="invoice-user"><?php echo $_SESSION['usuario_nome']; ?></td>
            </tr>
        </table>
    </div>

    <!-- SEPARADOR -->
    <div style="border-top: 1px dashed #333; margin: 5px 0; padding: 0;"></div>

    <!-- AVISO LEGAL -->
    <div style="margin: 5px 0; font-size: 8px; font-style: italic; text-align: center; line-height: 1.4;">
        <p style="margin: 0;">Os artigos foram postos à disposição</p>
        <p style="margin: 0;">do cliente na data indicada.</p>
    </div>

    <!-- SEPARADOR -->
    <div style="border-top: 1px dashed #333; margin: 5px 0; padding: 0;"></div>

    <!-- RODAPÉ -->
    <div style="text-align: center; margin: 6px 0; font-size: 9px;">
        <p style="margin: 3px 0; font-weight: bold; font-size: 11px;">OBRIGADO PELA SUA VISITA!</p>
        <p style="margin: 2px 0;">Volte sempre a Nelisa Farma</p>

    </div>

    <!-- PROCESSADO POR -->
    <div style="border-top: 1px dashed #333; margin: 5px 0; padding: 0;"></div>
    <div style="text-align: center; margin: 4px 0; font-size: 7.5px; color: #555;">
        <p style="margin: 0;">Processado por: <strong>Nelisa Soft</strong></p>
    </div>

    <!-- ESPAÇO DE CORTE -->
    <div style="text-align: center; margin: 6px 0; font-size: 8px; color: #aaa; letter-spacing: 2px;">
        <p style="margin: 0;">- - - - - - - - - - - - - - - - - -</p>
    </div>
</div>


        </div>

        </div>
    </div>



