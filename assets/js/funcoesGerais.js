$(document).ready(function () {
  $(".tabelaPersonalizadaDataTable").DataTable({
    language: {
      sEmptyTable: "Nenhum registro encontrado",
      sProcessing: "A processar...",
      sLengthMenu: "Mostrar _MENU_ registos",
      sZeroRecords: "Não foram encontrados resultados",
      sInfo: "Mostrando de _START_ até _END_ de _TOTAL_ registos",
      sInfoEmpty: "Mostrando de 0 até 0 de 0 registos",
      sInfoFiltered: "(filtrado de _MAX_ registos no total)",
      sInfoPostFix: "",
      sSearch: "Procurar:",
      sUrl: "",
      oPaginate: {
        sFirst: "Primeiro",
        sPrevious: "Anterior",
        sNext: "Seguinte",
        sLast: "Último",
      },
      aria: {
        sSortAscending: ": Ordenar colunas de forma ascendente",
        sSortDescending: ": Ordenar colunas de forma descendente",
      },
    }, //alert
  });

  //alert("Ola");

  $("#categoria").on("change", function () {
    var categoriaId = $(this).val(); // Obtém o ID da categoria selecionada
  });

  

  $(".btn-print").click(function(){
    $(".imprimir").removeClass("d-none");
    $(".imprimir").print();
    $(".imprimir").addClass("d-none");


});


let carrinhoData = []; // Array para armazenar os itens do carrinho
let estoque = 0;

// Adicionar produto ao carrinho
$(document).on("click", ".btn-add-cart", function () {
  const id = $(this).data("id");
  const nome = $(this).data("nome");
  const preco = parseFloat($(this).data("preco")); // Converte para número
  estoque = parseInt($(this).data("estoque")); // Estoque total do produto

  // Verificar se o produto já está no carrinho
  const existente = carrinhoData.find((item) => item.id === id);

  if (existente) {
    // Verificar se a quantidade atual no carrinho excede o estoque total
    if (existente.quantidade + 1 > estoque) {
      alert(`Estoque insuficiente para ${nome}. Quantidade disponível: ${estoque}`);
      return;
    }

    // Incrementar a quantidade e subtotal
    existente.quantidade++;
    existente.subtotal = existente.quantidade * existente.preco;
    //decrementar o estoque
    existente.estoque--;
  } else {
    // Verificar se há estoque disponível para um novo item
    if (estoque <= 0) {
      alert(`Estoque insuficiente para ${nome}.`);
      return;
    }

    // Adicionar um novo item ao carrinho
    carrinhoData.push({
      id,
      nome,
      preco,
      quantidade: 1,
      subtotal: preco, // Inicializa o subtotal com o preço unitário
      estoque: estoque-1 // Estoque total para referência
    });
  }

  atualizarCarrinho(); // Atualiza o carrinho e recalcula os totais
});

// Atualizar tabela do carrinho
function atualizarCarrinho() {
  const tabelaCarrinho = $("#carrinho tbody");
  tabelaCarrinho.empty();

  let total = 0; // Reinicia o total ao recalcular

  // Recria as linhas da tabela e soma os subtotais
  carrinhoData.forEach((item, index) => {
    total += item.subtotal; // Soma o subtotal de cada item

    tabelaCarrinho.append(`
      <tr>
          <td>${item.nome}</td>
          <td>${item.quantidade}</td>
          <td>${item.preco.toFixed(2)}</td>
          <td>${item.subtotal.toFixed(2)}</td>
          <td>
            <button class="btn btn-danger btn-remove" data-index="${index}">Remover</button>
          </td>
      </tr>
    `);
  });

  $("#total").text(total.toFixed(2)); // Atualiza o valor total na interface
  
  $("#total2").text(total.toFixed(2)); //Atualiza o total na div do checkout

  // Configura o evento de remoção do item
 $(".btn-remove").click(function () {
  const index = $(this).data("index");
  const item = carrinhoData[index];

  if (item.quantidade > 1) {
    // Decrementa a quantidade e recalcula o subtotal
    item.quantidade--;
    item.subtotal = item.quantidade * item.preco;

    // Incrementa o estoque do produto
    item.estoque++;

  } else {
    // Se a quantidade é 1, remove o item
    carrinhoData.splice(index, 1);
  }

  atualizarCarrinho(); // Atualiza o carrinho novamente

  // Esconde o carrinho se não houver itens
  if (carrinhoData.length === 0) {
    $("#carrinhoDiv").hide();
  }
});
//Fim de remover itens

  $("#carrinhoDiv").show();
}


  //Checkout booton
  $("#checkout-enable").click(function () {
    if (carrinhoData.length === 0) {
      alert("O carrinho está vazio!");
      return;
    }

    // Show payment fields and toggle buttons
    $("#campos-pagamento").slideDown(); // Smoothly display payment section
    $("#checkout-enable").hide(); // Hide Checkout button
    $("#finalizar-compra").show(); // Show Finalize Purchase button
  });

  // Requisição para finalizar a compra

  $("#finalizar-compra").click(function (e) {
    e.preventDefault();
    // console.log("Antes de enviar :", carrinhoData);

    if (carrinhoData.length === 0) {
      alert("O carrinho está vazio!");
      return;
    }

    const totalVenda = carrinhoData.reduce(
      (acc, item) => acc + item.subtotal,
      0
    );
    const emDinheiro = parseFloat($("#em_dinheiro").val()) || 0;
    const multicaixa = parseFloat($("#multicaixa").val()) || 0;
    const transferencia = parseFloat($("#transferencia").val()) || 0;

    const totalPago = emDinheiro + multicaixa + transferencia;
    $("#total_pago").text(totalPago.toFixed(2));

    if (totalPago < totalVenda) {
      alert("O total pago é insuficiente!");
      return;
    }


//alert(estoque);
    const troco = totalPago - totalVenda;
    $("#troco").text(troco.toFixed(2));
    
    $.ajax({
      type: "POST",
      url: "../ControllerRequisicao/ReciveRequest",
      data: {
        carrinho: JSON.stringify(carrinhoData),
        totalVenda: totalVenda,
        emDinheiro: emDinheiro, // Payment by cash
        multicaixa: multicaixa, // Payment by card
        transferencia: transferencia, // Payment by transfer
        troco: troco, // Change to give back
        estoque: estoque,
        accao: "RealizarVenda", // Action identifier for the backend
      },
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      processData: true,
      dataType: "json",

      success: function (response) {
        if (response.success) {
          alert("Venda realizada com sucesso");

             //Imprimir fatura
    const invoiceData = {
      date: new Date().toLocaleString(),
      items: carrinhoData,
      total: parseFloat($("#total").text()),
      paid: parseFloat($("#total_pago").text()),
      change: parseFloat($("#troco").text()),
    };

    // Popular a fatura
    $("#invoice-date").text(invoiceData.date);

    let itemsHtml = "";
    invoiceData.items.forEach((item) => {
      itemsHtml += `
                    <tr>
                        <td style="text-align: left;">${item.nome}</td>
                        <td style="text-align: center;">${item.quantidade}</td>
                        <td style="text-align: right;">${item.subtotal.toFixed(
                          2
                        )}</td>
                    </tr>
                `;
    });
    $("#invoice-items").html(itemsHtml);

    $("#invoice-total").text(invoiceData.total.toFixed(2));
    $("#invoice-paid").text(invoiceData.paid.toFixed(2));
    $("#invoice-change").text(invoiceData.change.toFixed(2));

    
    



    // Imprimir fatura

    
    const invoiceContent = document.getElementById("thermal-invoice").innerHTML;
    const printWindow = window.open("", "_blank", "width=400,height=400");
    printWindow.document.open();
    printWindow.document.write(`
                <html>
                <head>
                    <title>Fatura recibo</title>
                    <style>
                        body { font-family: 'Courier New', monospace; font-size: 12px; margin: 0; padding: 0; width: 58mm; }
                        table { width: 100%; border-collapse: collapse; }
                        th, td { padding: 5px; }
                    </style>
                </head>
                <body>${invoiceContent}</body>
                </html>
            `);
    printWindow.document.close();
    printWindow.focus();
    printWindow.print();
    printWindow.close();

   


   

          carrinhoData = []; // Limpa o carrinho após sucesso
          atualizarCarrinho();
          $("#carrinhoDiv").hide();
          
        } else {
          alert("Erro ao realizar a venda: " + response.message);
        }
      },

      error: function (xhr, status, error) {
        console.error("Erro na requisição:", xhr.responseText);
      },
    });

   
    // Após imprimir a fatura, recarregar a página
   // location.reload(); // Recarrega a página


  }); 




  // Calcular troco em tempo real
function calcularTroco() {
  const totalVenda = carrinhoData.reduce(
    (acc, item) => acc + item.subtotal,
    0
  );
  const emDinheiro = parseFloat($("#em_dinheiro").val()) || 0;
  const multicaixa = parseFloat($("#multicaixa").val()) || 0;
  const transferencia = parseFloat($("#transferencia").val()) || 0;

  const totalPago = emDinheiro + multicaixa + transferencia;

  $("#total_pago").text(totalPago.toFixed(2)); // Atualiza o valor total pago na interface

  if (totalPago >= totalVenda) {
    const troco = totalPago - totalVenda;
    $("#troco").text(troco.toFixed(2)); // Atualiza o troco

  } else {
    $("#troco").text("0.00"); // Se o total pago for insuficiente, mostra troco como 0
  }
  let apagar = totalVenda - totalPago;
  if (apagar>=0) {
    $("#total2").text(apagar.toFixed(2)); //Atualiza o total na div do checkout
  }else{
    apagar=0;
    $("#total2").text(apagar.toFixed(2)); //Atualiza o total na div do checkout
  }
  
}

// Eventos para recalcular o troco em tempo real
$("#em_dinheiro, #multicaixa, #transferencia").on("keyup change", function () {
  calcularTroco();
});



$('#tipoLista').on('change', function () {
 
 var tipoLista= $(this).val();
 //Apresentar apenas a data inicial
 if (tipoLista==1) {
  $('#userDiv').hide();
  $('#dataInicialDiv').show();
  $('#dataFinalDiv').hide();
  
 }
// Apresenta a data inicial e final
else if (tipoLista==2) {
  $('#userDiv').hide();
  $('#dataInicialDiv').show();
  $('#dataFinalDiv').show();
  
}
else if(tipoLista==3){
  $('#userDiv').show();
  $('#dataInicialDiv').show();
  $('#dataFinalDiv').hide();
  
  
}
else if(tipoLista==4){
$('#userDiv').show();
$('#dataInicialDiv').show();
$('#dataFinalDiv').show();

}
else{
  $('#userDiv').hide();
  $('#dataInicialDiv').hide();
  $('#dataFinalDiv').hide();
}
  
});

        $('.select2').select2({
            placeholder: "Digite, escaneie ou selecione um produto...",
            allowClear: true
        });




         // Cálculo Automático do Preço de Compra do Item
         function calcularPrecoCompraItem() {
          let precoPacote = parseFloat($('#preco_custo_pacote').val()) || 0;
          let qtdItensPacote = parseInt($('#qtNoPac').val()) || 1;

          if (qtdItensPacote > 0) {
              let precoItem = (precoPacote / qtdItensPacote).toFixed(2);
              $('#preco_custo_item').val(precoItem);
              calcularPrecoVendaItem(); // Atualiza também o preço de venda
          }
      }

      // Cálculo Automático do Preço de Venda do Item
      function calcularPrecoVendaItem() {
          let precoItem = parseFloat($('#preco_custo_item').val()) || 0;
          let percentualGanho = parseFloat($('#percentual_ganho').val()) || 0;

          let precoVenda = (precoItem + (precoItem * percentualGanho / 100)).toFixed(2);
          $('#preco_venda_item').val(precoVenda);
      }

      // Eventos para atualizar os preços ao preencher os campos
      $('#preco_custo_pacote, #qtNoPac').on('input', calcularPrecoCompraItem);
      $('#percentual_ganho').on('input', calcularPrecoVendaItem);
  
 
  


});
