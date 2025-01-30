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
  let estoque=0;

  // Adicionar produto ao carrinho
  $(".btn-add-cart").click(function () {
    const id = $(this).data("id");
    const nome = $(this).data("nome");
    const preco = parseFloat($(this).data("preco")); // Converte para número

    estoque = parseInt($(this).data("estoque")); // Converte para número
    //alert(estoque);

    // Verificar se o produto já está no carrinho
    const existente = carrinhoData.find((item) => item.id === id);

    if (existente) {
      //Verificar se o estoque terminou, não deve adicionar item ao carrinho
      if(existente.estoque<0){
        alert("Estoque insuficiente para esse produto");
      }else{
      existente.quantidade++; // Incrementa a quantidade
      existente.subtotal = existente.quantidade * existente.preco; // Atualiza o subtotal
      existente.estoque -= existente.quantidade;
      }
    
    } else {
      // Adiciona um novo item ao carrinho
      carrinhoData.push({
        id,
        nome,
        preco,
        quantidade: 1,
        subtotal: preco, // Inicializa o subtotal com o preço unitário
        estoque: estoque-1,
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

    // Configura o evento de remoção do item
    $(".btn-remove").click(function () {
      const index = $(this).data("index");
      carrinhoData.splice(index, 1); // Remove o item do array
      atualizarCarrinho(); // Atualiza o carrinho novamente
      if (carrinhoData.length === 0) {

     $("#carrinhoDiv").hide();
      }
    });

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
        estoque:estoque,
        accao: "RealizarVenda", // Action identifier for the backend
      },
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      processData: true,
      dataType: "json",

      success: function (response) {
        if (response.success) {
          alert("Venda realizada com sucesso");

          carrinhoData = []; // Limpa o carrinho após sucesso
          atualizarCarrinho();
        } else {
          alert("Erro ao realizar a venda: " + response.message);
        }
      },

      error: function (xhr, status, error) {
        console.error("Erro na requisição:", xhr.responseText);
      },
    });
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

    // Print the invoice
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



});
