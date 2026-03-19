// ✅ coloca aqui a URL REAL do teu endpoint (ver secção 2 abaixo)

let carrinhoData = [];
let vendaEmProcesso = false;
let invoiceLogoBase64 = '';

function initDataTables() {
  if (!$.fn.DataTable) return;

  $(".tabelaPersonalizadaDataTable").each(function () {
    if ($.fn.DataTable.isDataTable(this)) return;

    // lê configurações por tabela
    const pageLength = parseInt($(this).data("page-length")) || 5;
    const orderStr = ($(this).data("order") || "").toString().trim();

    // exemplo: "2,3,8" (nome, preço, ações)
    const priorityStr = ($(this).data("priority") || "").toString().trim();
    const priorityCols = priorityStr
      ? priorityStr.split(",").map(s => parseInt(s.trim())).filter(n => !isNaN(n))
      : [];

    // monta columnDefs dinamicamente
    const columnDefs = [];

    // prioridades altas (ficam por padrão)
    priorityCols.forEach((colIndex, i) => {
      columnDefs.push({ responsivePriority: i + 1, targets: colIndex });
    });

    // opcional: colunas que você quer que caiam primeiro (resto)
    // se não definiu priority, deixa o responsive decidir.
    const forceLowStr = ($(this).data("low-priority") || "").toString().trim();
    const lowCols = forceLowStr
      ? forceLowStr.split(",").map(s => parseInt(s.trim())).filter(n => !isNaN(n))
      : [];

    let orderConfig = undefined;
    if (orderStr) {
      const orderParts = orderStr.split(",");
      const orderCol = parseInt((orderParts[0] || "").trim(), 10);
      const orderDir = ((orderParts[1] || "asc").trim().toLowerCase() === "desc") ? "desc" : "asc";
      if (!isNaN(orderCol)) {
        orderConfig = [[orderCol, orderDir]];
      }
    }

    lowCols.forEach((colIndex, i) => {
      columnDefs.push({ responsivePriority: 10000 + (i + 1), targets: colIndex });
    });

    $(this).DataTable({
      pageLength: pageLength,
      autoWidth: false,
      responsive: true,
      order: orderConfig,
      columnDefs: columnDefs.length ? columnDefs : undefined,
      language: {
        emptyTable: "Nenhum registro encontrado",
        processing: "A processar...",
        lengthMenu: "Mostrar _MENU_ registos",
        zeroRecords: "Não foram encontrados resultados",
        info: "Mostrando de _START_ até _END_ de _TOTAL_ registos",
        infoEmpty: "Mostrando de 0 até 0 de 0 registos",
        infoFiltered: "(filtrado de _MAX_ registos no total)",
        search: "Procurar:",
        paginate: {
          first: "Primeiro",
          previous: "Anterior",
          next: "Seguinte",
          last: "Último"
        }
      }
    });
  });
}

$(document).ready(function () {
  initDataTables();

  // Pré-carrega o logo da fatura em base64 para impressão sem delay de rede
  if (window.BASE_URL) {
    fetch(window.BASE_URL + 'imagens/nelisa_img.jpeg')
      .then(function(r) { return r.blob(); })
      .then(function(blob) {
        var reader = new FileReader();
        reader.onloadend = function() { invoiceLogoBase64 = reader.result; };
        reader.readAsDataURL(blob);
      })
      .catch(function() { invoiceLogoBase64 = ''; });
  }

  // -------------------------
  // PRINT
  // -------------------------
  $(".btn-print").off("click").on("click", function () {
    $(".imprimir").removeClass("d-none");
    $(".imprimir").print();
    $(".imprimir").addClass("d-none");
  });

  // -------------------------
  // RELATÓRIO DE VENDAS (filtros)
  // -------------------------
  function aplicarVisibilidadeTipoLista(tipoLista) {
    if (tipoLista == 1) {
      $("#userDiv").hide();
      $("#dataInicialDiv").show();
      $("#dataFinalDiv").hide();
    } else if (tipoLista == 2) {
      $("#userDiv").hide();
      $("#dataInicialDiv").show();
      $("#dataFinalDiv").show();
    } else if (tipoLista == 3) {
      $("#userDiv").show();
      $("#dataInicialDiv").show();
      $("#dataFinalDiv").hide();
    } else if (tipoLista == 4) {
      $("#userDiv").show();
      $("#dataInicialDiv").show();
      $("#dataFinalDiv").show();
    } else {
      $("#userDiv").hide();
      $("#dataInicialDiv").hide();
      $("#dataFinalDiv").hide();
    }
  }

  $(document).off("change", "#tipoLista").on("change", "#tipoLista", function () {
    aplicarVisibilidadeTipoLista($(this).val());
  });

  if ($("#tipoLista").length) {
    aplicarVisibilidadeTipoLista($("#tipoLista").val());
  }

  function toggleGrupoFiltroEstoque(selector, show) {
    const $grupo = $(selector);
    if (!$grupo.length) return;

    if (show) {
      $grupo.show();
      $grupo.find("input, select, textarea, button").prop("disabled", false);
      return;
    }

    $grupo.hide();
    $grupo.find("input, select, textarea").each(function () {
      const tipo = ($(this).attr("type") || "").toLowerCase();
      if (tipo === "checkbox" || tipo === "radio") {
        $(this).prop("checked", false);
      } else if (this.tagName && this.tagName.toLowerCase() === "select") {
        this.selectedIndex = 0;
      } else {
        $(this).val("");
      }
    });
    $grupo.find("input, select, textarea, button").prop("disabled", true);
  }

  function aplicarTipoListaEstoque(tipoListaEstoque) {
    const tipo = parseInt(tipoListaEstoque || "1", 10);

    const grupos = [
      "#grupoTextoBusca",
      "#fornecedorDiv",
      "#userDivEstoque",
      "#loteDiv",
      "#dataCompraInicialDiv",
      "#dataCompraFinalDiv",
      "#dataRegistoInicialDiv",
      "#dataRegistoFinalDiv",
      "#validadeAteDiv",
      "#disponibilidadeDiv",
      "#categoriaDiv",
      "#tipoProdutoDiv",
      "#estadoDiv"
    ];

    grupos.forEach(function (selector) {
      toggleGrupoFiltroEstoque(selector, false);
    });

    if (tipo === 2) {
      toggleGrupoFiltroEstoque("#dataCompraInicialDiv", true);
      toggleGrupoFiltroEstoque("#dataCompraFinalDiv", true);
    } else if (tipo === 3) {
      toggleGrupoFiltroEstoque("#dataRegistoInicialDiv", true);
      toggleGrupoFiltroEstoque("#dataRegistoFinalDiv", true);
    } else if (tipo === 4) {
      toggleGrupoFiltroEstoque("#userDivEstoque", true);
    } else if (tipo === 5) {
      toggleGrupoFiltroEstoque("#fornecedorDiv", true);
    } else if (tipo === 6) {
      toggleGrupoFiltroEstoque("#loteDiv", true);
    } else if (tipo === 7) {
      grupos.forEach(function (selector) {
        toggleGrupoFiltroEstoque(selector, true);
      });
    }
  }

  $(document).off("change", "#tipoListaEstoque").on("change", "#tipoListaEstoque", function () {
    aplicarTipoListaEstoque($(this).val());
  });

  if ($("#tipoListaEstoque").length) {
    aplicarTipoListaEstoque($("#tipoListaEstoque").val());
  }

  // -------------------------
  // POS binds
  // -------------------------
  bindAddCart();
  bindCheckoutEnable();
  bindFinalizarCompra();
  bindRecalculoTroco();




  // estado inicial do checkout
  $("#finalizar-compra").hide();
  if ($("#campos-pagamento").length) $("#campos-pagamento").hide();
});


// =========================
// 1) ADICIONAR AO CARRINHO
// =========================
function bindAddCart() {
  $(document).off("click", ".btn-add-cart").on("click", ".btn-add-cart", function () {
    const id = parseInt($(this).data("id")) || 0;
    const nome = $(this).data("nome") || "";
    const preco = parseFloat($(this).data("preco")) || 0;
    const estoqueTotal = parseInt($(this).data("estoque")) || 0;

    if (!id) return;

    const existente = carrinhoData.find((item) => item.id === id);
    const isSemEstoque = (estoqueTotal <= 0);

    if (existente) {
      if (!existente.semEstoque && (existente.quantidade + 1 > estoqueTotal)) {
        alert("Estoque insuficiente. Será gerado alerta para a gerência se insistir em vender sem estoque.");
        return;
      }
      existente.quantidade++;
      existente.subtotal = existente.quantidade * existente.preco;

      if (!existente.semEstoque) existente.estoque--;
    } else {
      if (isSemEstoque) {
        alert("Aviso: produto sem estoque. A venda será registada e será gerado alerta para a gerência ajustar a tb_estoque.");
      }
      carrinhoData.push({
        id,
        nome,
        preco,
        quantidade: 1,
        subtotal: preco,
        estoque: Math.max(estoqueTotal - 1, 0),
        semEstoque: isSemEstoque,
      });
    }

    atualizarCarrinho();
  });
}


// =========================
// 2) RENDER DO CARRINHO
// =========================
function atualizarCarrinho() {
  const tabelaCarrinho = $("#carrinho tbody");
  tabelaCarrinho.empty();

  const totalVenda = calcularTotalVenda();

  carrinhoData.forEach((item, index) => {
    const maxPermitido = item.semEstoque ? 999999 : (item.estoque + item.quantidade);

    tabelaCarrinho.append(`
      <tr>
        <td>
          ${item.nome}
          ${item.semEstoque ? '<br><small class="text-danger">Sem estoque (alerta)</small>' : ''}
        </td>
        <td>
          <div class="d-flex align-items-center justify-content-center" style="gap:6px;">
            <button class="btn btn-outline-danger btn-sm rounded-circle btn-minus"
                    data-index="${index}" title="Diminuir">
              <i class="fas fa-minus"></i>
            </button>

            <input type="number"
                   min="1"
                   max="${maxPermitido}"
                   value="${item.quantidade}"
                   class="form-control form-control-sm text-center input-quantidade"
                   data-index="${index}" style="width: 70px;" />

            <button class="btn btn-outline-success btn-sm rounded-circle btn-plus"
                    data-index="${index}" title="Aumentar">
              <i class="fas fa-plus"></i>
            </button>
          </div>
        </td>
        <td class="text-right">${item.preco.toFixed(2)}</td>
        <td class="text-right">${item.subtotal.toFixed(2)}</td>
      </tr>
    `);
  });

  $("#total").text(totalVenda.toFixed(2));
  $("#total2").text(totalVenda.toFixed(2));

  if (carrinhoData.length > 0) $("#carrinhoDiv").show();
  else $("#carrinhoDiv").hide();

  bindCarrinhoEventos();
  calcularTroco();
}

function bindCarrinhoEventos() {
  $(".input-quantidade").off("change").on("change", function () {
    const index = parseInt($(this).data("index"));
    let novaQuantidade = parseInt($(this).val());

    if (isNaN(novaQuantidade) || novaQuantidade <= 0) {
      $(this).val(carrinhoData[index].quantidade);
      return;
    }

    const item = carrinhoData[index];

    if (!item.semEstoque) {
      const maxPermitido = item.estoque + item.quantidade;
      if (novaQuantidade > maxPermitido) {
        alert(`Estoque insuficiente. Máximo permitido: ${maxPermitido}`);
        $(this).val(item.quantidade);
        return;
      }
      item.estoque = maxPermitido - novaQuantidade;
    }

    item.quantidade = novaQuantidade;
    item.subtotal = novaQuantidade * item.preco;

    atualizarCarrinho();
  });

  $(".btn-plus").off("click").on("click", function () {
    const index = parseInt($(this).data("index"));
    const item = carrinhoData[index];

    if (!item.semEstoque) {
      const maxPermitido = item.estoque + item.quantidade;
      if (item.quantidade + 1 > maxPermitido) {
        alert(`Estoque insuficiente. Máximo permitido: ${maxPermitido}`);
        return;
      }
      item.estoque = maxPermitido - (item.quantidade + 1);
    }

    item.quantidade++;
    item.subtotal = item.quantidade * item.preco;

    atualizarCarrinho();
  });

  $(".btn-minus").off("click").on("click", function () {
    const index = parseInt($(this).data("index"));
    const item = carrinhoData[index];

    if (item.quantidade > 1) {
      item.quantidade--;
      item.subtotal = item.quantidade * item.preco;

      if (!item.semEstoque) {
        const maxPermitido = item.estoque + item.quantidade + 1;
        item.estoque = maxPermitido - item.quantidade;
      }
    } else {
      carrinhoData.splice(index, 1);
    }

    atualizarCarrinho();
  });
}

function calcularTotalVenda() {
  return carrinhoData.reduce((acc, item) => acc + (parseFloat(item.subtotal) || 0), 0);
}


// =========================
// 3) CHECKOUT
// =========================
function bindCheckoutEnable() {
  $("#checkout-enable").off("click").on("click", function () {
    if (carrinhoData.length === 0) {
      alert("O carrinho está vazio!");
      return;
    }
    $("#campos-pagamento").slideDown();
    $("#checkout-enable").hide();
    $("#finalizar-compra").show();
  });
}


// =========================
// 4) TROCO
// =========================
function bindRecalculoTroco() {
  $("#em_dinheiro, #multicaixa, #transferencia")
    .off("keyup change")
    .on("keyup change", function () {
      calcularTroco();
    });
}

function calcularTroco() {
  const totalVenda = calcularTotalVenda();
  const emDinheiro = parseFloat($("#em_dinheiro").val()) || 0;
  const multicaixa = parseFloat($("#multicaixa").val()) || 0;
  const transferencia = parseFloat($("#transferencia").val()) || 0;

  const totalPago = emDinheiro + multicaixa + transferencia;
  $("#total_pago").text(totalPago.toFixed(2));

  if (totalPago >= totalVenda) $("#troco").text((totalPago - totalVenda).toFixed(2));
  else $("#troco").text("0.00");

  let apagar = totalVenda - totalPago;
  if (apagar < 0) apagar = 0;
  $("#total2").text(apagar.toFixed(2));
}


// =========================
// 5) FINALIZAR COMPRA ✅
// =========================
function bindFinalizarCompra() {
  $("#finalizar-compra").off("click").on("click", function (e) {
    e.preventDefault();

    if (vendaEmProcesso) return;

    if (carrinhoData.length === 0) {
      alert("O carrinho está vazio!");
      return;
    }

    const totalVenda = calcularTotalVenda();
    const emDinheiro = parseFloat($("#em_dinheiro").val()) || 0;
    const multicaixa = parseFloat($("#multicaixa").val()) || 0;
    const transferencia = parseFloat($("#transferencia").val()) || 0;

    const totalPago = emDinheiro + multicaixa + transferencia;
    if (totalPago < totalVenda) {
      alert("Pagamento insuficiente.");
      return;
    }

    const troco = totalPago - totalVenda;

    enviarVenda({
      carrinho: carrinhoData,
      totalVenda: totalVenda,
      emDinheiro: emDinheiro,
      multicaixa: multicaixa,
      transferencia: transferencia,
      troco: troco
    });
  });
}

function uuid() {
  // request_id simples (bom para idempotência)
  return 'req_' + Date.now() + '_' + Math.random().toString(16).slice(2);
}

function enviarVenda(payload) {
  vendaEmProcesso = true;

  const requestId = uuid();

  const data = {
    accao: "RealizarVenda",
    request_id: requestId,
    carrinho: JSON.stringify(payload.carrinho),
    totalVenda: payload.totalVenda,
    emDinheiro: payload.emDinheiro,
    multicaixa: payload.multicaixa,
    transferencia: payload.transferencia,
    troco: payload.troco
  };

  $("#finalizar-compra").prop("disabled", true).text("A processar...");

  $.ajax({
    url: window.BASE_URL + "controller-requisicao/recive-request",
    type: "POST",
    dataType: "json",
    data: data
  })
  .done(function (res) {
    try {
      if (res && res.success) {
        // Preencher e imprimir a fatura existente logo (thermal-invoice)
        const numero_fatura = res.numero_fatura || 'N/A';

        // Dados da fatura
        const invoiceData = {
          date: new Date().toLocaleString('pt-PT'),
          numero: numero_fatura,
          items: carrinhoData,
          total: calcularTotalVenda(),
          paid: parseFloat($("#total_pago").text()),
          change: parseFloat($("#troco").text()),
          nif_cliente: $("#nif_cliente").val() || '',
          nome_cliente: $("#nome_cliente").val() || '',
          usuario: window.usuario_nome || ''
        };

        // Preencher a fatura
        $("#invoice-number").text(invoiceData.numero);
        $("#invoice-date").text(invoiceData.date);
        $("#invoice-nif").text(invoiceData.nif_cliente ? invoiceData.nif_cliente : '000000000');
        $("#invoice-nome").text(invoiceData.nome_cliente || 'Consumidor Final');

        // Injetar logo (base64 pré-carregado evita HTTP extra na impressão)
        if (invoiceLogoBase64) {
          $("#invoice-logo").attr('src', invoiceLogoBase64);
        } else {
          $("#invoice-logo").attr('src', window.BASE_URL + 'imagens/nelisa_img.jpeg');
        }

        let itemsHtml = '';
        invoiceData.items.forEach((item) => {
          const nomeAbreviado = item.nome.substring(0, 25);
          itemsHtml += `
            <tr style="line-height: 1.3; border-bottom: 1px dotted #ddd;">
              <td style="text-align: left; padding: 3px 0; word-wrap: break-word; flex: 1; font-size: 10px;">${nomeAbreviado}</td>
              <td style="text-align: center; padding: 3px 0; width: 35px; font-size: 10px;">${item.quantidade}</td>
              <td style="text-align: right; padding: 3px 0; width: 56px; white-space: nowrap; font-size: 10px;">${item.subtotal.toFixed(2)}</td>
            </tr>
          `;
        });
        $("#invoice-items").html(itemsHtml);

        $("#invoice-total").text(invoiceData.total.toFixed(2) + ' Kz');
        $("#invoice-paid").text(invoiceData.paid.toFixed(2) + ' Kz');
        $("#invoice-change").text(invoiceData.change.toFixed(2) + ' Kz');

        // Imprimir a fatura
        try {
          const invoiceContent = document.getElementById("thermal-invoice").innerHTML;
          const printWindow = window.open("", "_blank", "width=400,height=600");
          if (printWindow) {
            printWindow.document.open();
            printWindow.document.write(`
              <html>
              <head>
                <title>Fatura ${invoiceData.numero}</title>
                <style>
                  * { margin: 0; padding: 0; box-sizing: border-box; }
                  @page { size: 80mm auto; margin: 0; }
                  body {
                    font-family: Consolas, 'Courier New', monospace;
                    font-size: 11px;
                    line-height: 1.4;
                    width: 80mm;
                    margin: 0;
                    padding: 0 0 0 0.6mm;
                    background: white;
                  }
                  h2 { font-size: 15px; font-weight: bold; }
                  p { margin: 0; padding: 0; }
                  img { display: block; margin: 0 auto; }
                  table { width: 100%; border-collapse: collapse; margin: 0; }
                  th, td { padding: 3px 0; margin: 0; }
                  @media print {
                    body { margin: 0; padding: 0 0 0 0.6mm; width: 80mm; }
                    html, body { -webkit-print-color-adjust: exact; print-color-adjust: exact; }
                  }
                </style>
              </head>
              <body>${invoiceContent}</body>
              </html>
            `);
            printWindow.document.close();
            printWindow.focus();
            var _printed = false;
            function _doPrint() {
              if (_printed) return;
              _printed = true;
              try { printWindow.print(); } catch (e) { /* impresora não disponível Detalhes */ }
              try { printWindow.close(); } catch (e) { /* já fechada */ }
            }
            printWindow.onload = _doPrint;
            setTimeout(_doPrint, 400);
          } else {
            console.warn("Popup bloqueado pelo browser. Fatura não impressa.");
          }
        } catch (printErr) {
          console.error("Erro ao abrir janela de impressão:", printErr);
        }

        alert(res.message);

        // limpa carrinho
        carrinhoData = [];
        atualizarCarrinho();

        // reset pagamentos
        $("#em_dinheiro, #multicaixa, #transferencia").val("");
        $("#nif_cliente, #nome_cliente").val("");
        calcularTroco();

        // fecha checkout
        if ($("#campos-pagamento").length) $("#campos-pagamento").hide();
        $("#finalizar-compra").hide();
        $("#checkout-enable").show();

      } else {
        alert((res && res.message) ? res.message : "Falha ao realizar a venda.");
      }
    } catch (e) {
      console.error("Erro ao processar resposta da venda:", e);
      alert("Ocorreu um erro ao processar a venda. Por favor, verifique o registo antes de tentar novamente.");
    }
  })
  .fail(function (xhr) {
    console.error("Erro AJAX:", xhr.responseText);
    alert("Erro ao comunicar com o servidor. Veja o Console/Network.");
  })
  .always(function () {
    vendaEmProcesso = false;
    $("#finalizar-compra").prop("disabled", false).text("Finalizar compra");
  });
}