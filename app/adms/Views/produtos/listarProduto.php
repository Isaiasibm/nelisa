<?php
    if (! defined('URL')) {
    header("Location: /");
    exit();
    }

    $listarProduto = new \App\adms\Models\admsProduto();
    $produtos      = $listarProduto->listarProdutos();
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h2 class="display-4 titulo">Listar Produtos</h2>
            </div>
            <?php
                if (! empty($this->Dados['botao']['cad_pagina'])) {
                ?>
                <a href="<?php echo URLADM . 'ControleProduto/registarProduto'; ?>">
                    <div class="p-2">
                        <button class="btn btn-outline-success btn-sm">
                            Cadastrar
                        </button>
                    </div>
                </a>
                <?php
                    }
                ?>

        </div>
        <?php
            if (empty($produtos)) {
            ?>
            <div class="alert alert-danger" role="alert">
                Nenhum produto encontrado!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <?php
                }
                if (isset($_SESSION['msg'])) {
                    echo $_SESSION['msg'];
                    unset($_SESSION['msg']);
                }
            ?>
        <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable" data-page-length="10" data-priority="0,1,2">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Produto</th>
                        <th class="d-none d-sm-table-cell">Código de Barras</th>
                        <th class="d-none d-sm-table-cell">Fabricante</th>
                        <th class="d-none d-sm-table-cell">Tipo</th>
                        <th>Preço Venda</th>
                        <th>Estoque</th>
                        <th class="d-none d-sm-table-cell">Validade</th>
                        <th class="text-center">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        foreach ($produtos as $produto) {
                            extract($produto);
                            $dropdownId = 'acoesListar' . (int) $id_produto;
                        ?>
                        <tr>
                            <th><?php echo (int) $id_produto; ?></th>
                            <td><?php echo htmlspecialchars($nome_produto ?? ''); ?></td>
                            <td class="d-none d-sm-table-cell"><?php echo htmlspecialchars($bar_code ?? ''); ?></td>
                            <td class="d-none d-sm-table-cell"><?php echo htmlspecialchars($nome_fabricante ?? ''); ?></td>
                            <td class="d-none d-sm-table-cell"><?php echo htmlspecialchars($tipoProduto ?? ''); ?></td>
                            <td><?php echo number_format((float) ($preco_venda ?? 0), 2, ',', '.'); ?></td>
                            <td><?php echo (int) ($quantidade_estoque ?? 0); ?></td>
                            <td class="d-none d-sm-table-cell"><?php echo htmlspecialchars($data_validade ?? ''); ?></td>
                            <td class="text-center">
                                <span class="d-none d-md-block">
                                    <?php
                                        if (! empty($this->Dados['botao']['vis_pagina'])) {
                                                echo "<a href='" . URLADM . "controllerEstoque/detalhesProdutoEstoque/$id_produto' class='btn btn-outline-primary btn-sm'>Detalhes</a> ";
                                            }
                                            if (! empty($this->Dados['botao']['edit_pagina'])) {
                                                echo "<a href='" . URLADM . "EditarProduto/editProduto/$id_produto' class='btn btn-outline-warning btn-sm'>Editar</a> ";
                                            }
                                        ?>
                                </span>
                                <div class="dropdown d-block d-md-none">
                                    <button class="btn btn-primary dropdown-toggle btn-sm" type="button" id="<?php echo $dropdownId; ?>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Ações
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="<?php echo $dropdownId; ?>">
                                        <?php
                                            if (! empty($this->Dados['botao']['vis_pagina'])) {
                                                    echo "<a class='dropdown-item' href='" . URLADM . "controllerEstoque/detalhesProdutoEstoque/$id_produto'>Detalhes</a>";
                                                }
                                                if (! empty($this->Dados['botao']['edit_pagina'])) {
                                                    echo "<a class='dropdown-item' href='" . URLADM . "EditarProduto/editProduto/$id_produto'>Editar</a>";
                                                }
                                            ?>


                                    </div>
                                </div>
                            </td>
                        </tr>
                        <?php
                            }
                        ?>

                </tbody>
            </table>
        </div>
    </div>
</div>
