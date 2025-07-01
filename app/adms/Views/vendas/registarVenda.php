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
                    <a href="<?php echo URLADM.'home/index/'?>" class="btn badge badge-danger btn-sm px-1"
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
   
        <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable">
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
        
            if(!empty($this->Dados['listProd'])):
                $i=1;
                //  var_dump($this->Dados['listProd']);
                // $relatorio  = new \App\adms\Models\ModelsPaciente();  
                foreach ($this->Dados['listProd'] as $r)
                {        
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
                                                data-id=' $id_produto' 
                                                data-nome='$nome_produto' 
                                                data-preco='$preco_venda'
                                                data-estoque='$quantidade_estoque'>
                    Adicionar
                                </button>
                      
                               
                                 </td>
                         </tr>";
                    $i++;
                }
            else :  
                echo "<tr><td class='tg-lboi' colspan='15'>Não existem produtos em estoque! </td></tr>";  
            endif; 
                    ?>
            </tbody>
        </table>

    </div>
</div> 

    <div class="form-row" style="display: none;" id="carrinhoDiv">
        <div class="form-group col-md-6">
            <h3>Carrinho de Compras</h3>
            <table id="carrinho" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Qt</th>
                        <th>Preço</th>
                        <th>Subtotal</th>
                        <th>Ação</th>
                    </tr>
                </thead>
                <tbody>
                <!-- O carrinho será preenchido dinamicamente -->
                </tbody>
            </table>
            <div class="text-right">
                <h4>Total: <span id="total">0.00</span> Kz</h4>
                <button id="checkout-enable" class="btn btn-primary">Checkout</button>
               
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
               
    <label for="nif_cliente" class="mr-2">NIF do Cliente:</label>
    <input name="nif_cliente" type="text" class="form-control" id="nif_cliente" placeholder="Opcional">
    <input name="nome_cliente" type="text" class="form-control" id="nome_cliente" placeholder="Opcional">




                <button id="finalizar-compra" class="btn btn-success" style="display: none;">Finalizar Compra</button>
        </div>


    </div>
      

            
</div>  
                         
                                    
        <div id="thermal-invoice" style="display: none; font-family: 'Courier New', monospace; font-size: 12px; width: 58mm;">
    <div style="text-align: center;">
        <h2>Nelisa Farma</h2>
        <p style="font-size: 6px">NIF: 5484036305, tel. 923 600 263</p>
        <p>Recibo de Compras</p>
        
        
    </div>
    <hr />
<p>Detalhes do cliente:</p>
<p style="text-align: center;" id="invoice-nif"></p>
<p style="text-align: center;" id="invoice-nome"></p>


    <div>
        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr>
                    <th style="text-align: left;">Item</th>
                    <th style="text-align: center;">Qtd</th>
                    <th style="text-align: right;">Preço</th>
                </tr>
            </thead>
            <tbody id="invoice-items">
                <!-- Items will be inserted here dynamically -->
            </tbody>
        </table>
    </div>
    <hr />
    <div>
        <p style="text-align: right;">Preço total: <span id="invoice-total"></span> Kz</p>
        <p style="text-align: right;">Valor Pago: <span id="invoice-paid"></span> Kz</p>
        <p style="text-align: right;">Troco: <span id="invoice-change"></span> Kz</p>
        <p style="text-align: center;">Data: <span id="invoice-date"></span></p>
    </div> 
    <hr />
    <p style="text-align: right;">Atendido por: <span id="invoice-user"><?php echo $_SESSION['usuario_nome']; ?> </span> </p>
   
    <p style="text-align: center;">Benfica Zona Verde, Rua 18!</p>

    <p style="text-align: center;">Obrigado por escolher Nelisa Farma!</p>
</div>


        </div>
        
        </div>
    </div>



