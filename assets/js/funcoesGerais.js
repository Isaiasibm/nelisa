// ✅ coloca aqui a URL REAL do teu endpoint (ver secção 2 abaixo)

  let carrinhoData = [];
let vendaEmProcesso = false;
/* =========================================
   GERAIS + DATATABLE + POS (CARRINHO)
   - sem duplicações
   - sem ready aninhado
   - bindFinalizarCompra implementado
========================================= */



$(document).ready(function () {

  // -------------------------
  // DATATABLE (com proteção)
  // -------------------------
  /*
  if ($.fn.DataTable) {
    $(".tabelaPersonalizadaDataTable").each(function () {
      if (!$.fn.DataTable.isDataTable(this)) {
        $(this).DataTable({
          pageLength: 5,
          lengthMenu: [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "Todos"]],
          autoWidth: false,       // ✅ evita widths estranhas
          responsive: true,      // (se não tiveres extensão responsive)
          language: {
            sEmptyTable: "Nenhum registro encontrado",
            sProcessing: "A processar...",
            sLengthMenu: "Mostrar _MENU_ registos",
            sZeroRecords: "Não foram encontrados resultados",
            sInfo: "Mostrando de _START_ até _END_ de _TOTAL_ registos",
            sInfoEmpty: "Mostrando de 0 até 0 de 0 registos",
            sInfoFiltered: "(filtrado de _MAX_ registos no total)",
            sSearch: "Procurar:",
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
          },
        });
      }
    });
  }
  */

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
});

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
    if (res && res.success) {
      alert(res.message + (res.numero_fatura ? ("\nFatura: " + res.numero_fatura) : ""));

      // limpa carrinho
      carrinhoData = [];
      atualizarCarrinho();

      // reset pagamentos
      $("#em_dinheiro, #multicaixa, #transferencia").val("");
      calcularTroco();

      // fecha checkout
      if ($("#campos-pagamento").length) $("#campos-pagamento").hide();
      $("#finalizar-compra").hide();
      $("#checkout-enable").show();

    } else {
      alert((res && res.message) ? res.message : "Falha ao realizar a venda.");
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