<?php
    header('Content-type: text/html; charset=utf-8');

    $produto  = $this->Dados['produtoEstoque'] ?? [];
    $entradas = $this->Dados['entradasProduto'] ?? [];
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h3 class="display-2 titulo">Detalhes do Produto em Estoque</h3>
            </div>
            <div class="p-2">
                <a href="<?php echo URLADM . 'controllerEstoque/listarEstoque'; ?>" class="btn badge badge-secondary btn-sm px-2"
                    style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
                <a href="<?php echo URLADM . 'home/index/'; ?>" class="btn badge badge-danger btn-sm px-1"
                    style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-home"></i> Fechar
                </a>
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

        <div class="row mb-3">
            <div class="col-md-12">
                <div class="card border-info">
                    <div class="card-body">
                        <h4 class="card-title mb-3"><?php echo htmlspecialchars($produto['nome_produto'] ?? ''); ?></h4>

                        <div class="table-responsive">
                            <table class="table table-bordered table-sm mb-0">
                                <tbody>
                                    <tr>
                                        <th style="width:18%;">ID Produto</th>
                                        <td style="width:32%;"><?php echo (int) ($produto['id_produto'] ?? 0); ?></td>
                                        <th style="width:18%;">Código de barras</th>
                                        <td style="width:32%;"><?php echo htmlspecialchars($produto['bar_code'] ?? ''); ?></td>
                                    </tr>
                                    <tr>
                                        <th>Categoria</th>
                                        <td><?php echo htmlspecialchars($produto['categoria'] ?? ''); ?></td>
                                        <th>Tipo de produto</th>
                                        <td><?php echo htmlspecialchars($produto['tipoProduto'] ?? ''); ?></td>
                                    </tr>
                                    <tr>
                                        <th>Quantidade total</th>
                                        <td><?php echo (int) ($produto['quantidade_total'] ?? 0); ?></td>
                                        <th>Quantidade disponível</th>
                                        <td><?php echo (int) ($produto['quantidade_disponivel_total'] ?? 0); ?></td>
                                    </tr>
                                    <tr>
                                        <th>Preço de venda</th>
                                        <td><?php echo number_format((float) ($produto['preco_venda'] ?? 0), 2, ',', '.'); ?> Kz</td>
                                        <th>Validade mais próxima</th>
                                        <td><?php echo ! empty($produto['data_validade_mais_proxima']) ? date('d/m/Y', strtotime($produto['data_validade_mais_proxima'])) : '—'; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Primeira compra</th>
                                        <td><?php echo ! empty($produto['primeira_data_compra']) ? date('d/m/Y', strtotime($produto['primeira_data_compra'])) : '—'; ?></td>
                                        <th>Última entrada</th>
                                        <td><?php echo ! empty($produto['ultima_entrada']) ? date('d/m/Y H:i', strtotime($produto['ultima_entrada'])) : '—'; ?></td>
                                    </tr>
                                    <tr>
                                        <th>Fornecedores</th>
                                        <td colspan="3"><?php echo htmlspecialchars($produto['fornecedores'] ?? '—'); ?></td>
                                    </tr>
                                    <tr>
                                        <th>Lotes</th>
                                        <td colspan="3"><?php echo htmlspecialchars($produto['lotes'] ?? '—'); ?></td>
                                    </tr>
                                    <tr>
                                        <th>Descrição</th>
                                        <td colspan="3"><?php echo htmlspecialchars($produto['descricao_produto'] ?? ''); ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h4 class="mb-3">Entradas do produto</h4>
        <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable" data-page-length="10" data-priority="0,1,3" data-order="6,desc">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Lote</th>
                        <th>Fornecedor</th>
                        <th>Quantidade</th>
                        <th>Disponível</th>
                        <th>Validade</th>
                        <th>Data registo</th>
                        <th>Estado</th>
                        <th>Acções</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($entradas as $entrada): ?>
                        <tr>
                            <td><?php echo (int) ($entrada['id'] ?? 0); ?></td>
                            <td><?php echo htmlspecialchars($entrada['lote'] ?? ''); ?></td>
                            <td><?php echo htmlspecialchars($entrada['fornecedor'] ?? ''); ?></td>
                            <td><?php echo (int) ($entrada['quantidade'] ?? 0); ?></td>
                            <td><?php echo (int) ($entrada['quantidade_disponivel'] ?? 0); ?></td>
                            <td><?php echo ! empty($entrada['data_validade']) ? date('d/m/Y', strtotime($entrada['data_validade'])) : '—'; ?></td>
                            <td><?php echo ! empty($entrada['data_registo']) ? date('d/m/Y H:i', strtotime($entrada['data_registo'])) : '—'; ?></td>
                            <td><?php echo htmlspecialchars($entrada['estado_estoque'] ?? '—'); ?></td>
                            <td class="text-center" style="white-space:nowrap;">
                                <a class="btn btn-sm btn-info" href="<?php echo URLADM . 'controllerEstoque/detalhesEntradaEstoque/' . (int) ($entrada['id'] ?? 0); ?>">
                                    Ver entrada
                                </a>
                                <a class="btn btn-sm btn-success" href="<?php echo URLADM . 'controllerEstoque/editarEntradaEstoque/' . (int) ($entrada['id'] ?? 0); ?>">
                                    Editar entrada
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
