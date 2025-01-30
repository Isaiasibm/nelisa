<?php
    header('Content-type: text/html; charset=utf-8');
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">

                <h3 class="display-2 titulo">Relatório das Vendas</h3>
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
                                <th class="d-none d-sm-table-cell">Nº</th>
                                <th class="d-none d-sm-table-cell">Nome do Produto</th>
                                <th class="d-none d-sm-table-cell">Tipo Produto</th>
                                <th class="d-none d-sm-table-cell">Preço Unit</th>
                                <th class="d-none d-sm-table-cell">Qtdade</th>
                                <th class="d-none d-sm-table-cell">Subtotal</th>
                                <th class="text-center">Ações</th>
                </tr>
            </thead>
            <tbody>
        <?php
        
            if(!empty($this->Dados['dadosRelatorio'])):
                $i=1;
                //  var_dump($this->Dados['listProd']);
                // $relatorio  = new \App\adms\Models\ModelsPaciente();  
                foreach ($this->Dados['dadosRelatorio'] as $r)
                {        
                        extract($r);    
                        ?>                                   
                         <tr>                           
                        <td><?php echo $i; ?></td>
                        <td><?php echo $nome_produto; ?></td>
                        <td><?php echo $tipoProduto;    ?></td>
                        <td><?php echo $preco_venda ?></td>
                        <td><?php echo $quant;  ?></td>
                        <td><?php echo $subtotal;  ?></td>
                </tr>
             <?php       
             $i++;
                }
            else :  
                echo "<tr><td class='tg-lboi' colspan='15'>Não houve vendas do usuário selecionado! </td></tr>";  
            endif; 
                    ?>
            </tbody>
        </table>

    </div>
</div> 

    
      

            
</div>  
                         
                                    
       


        </div>
        
        </div>
    </div>



