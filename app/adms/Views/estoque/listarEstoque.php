<?php
    header('Content-type: text/html; charset=utf-8');

    $filtros          = $this->Dados['filtrosEstoque'] ?? [];
    $fornecedores     = $this->Dados['fornecedoresFiltroEstoque'] ?? [];
    $usuarios         = $this->Dados['usuariosFiltroEstoque'] ?? [];
    $categorias       = $this->Dados['categoriasFiltroEstoque'] ?? [];
    $tiposProduto     = $this->Dados['tiposFiltroEstoque'] ?? [];
    $estadosEstoque   = $this->Dados['estadosFiltroEstoque'] ?? [];
    $tipoListaEstoque = (int) ($filtros['tipoListaEstoque'] ?? 1);
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">

                <h3 class="display-2 titulo">Listar Produtos em Estoque</h3>
            </div>

            <div class="p-2">
                <a href="<?php echo URLADM . 'home/index/' ?>" class="btn badge badge-danger btn-sm px-1"
                    style="font-size: 10pt; border-radius:7px 7px;">
                    <i class="fas fa-home"></i>Fechar</a>
            </div>
        </div>
        <hr style="color: #8fdc8f ">

        <form action="" method="post" autocomplete="off" id="filtroEstoqueForm">
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Tipo de lista</label>
                    <select class="form-control" name="tipoListaEstoque" id="tipoListaEstoque" required>
                        <option value="1" <?php echo $tipoListaEstoque === 1 ? 'selected' : ''; ?>>Geral</option>
                        <option value="2" <?php echo $tipoListaEstoque === 2 ? 'selected' : ''; ?>>Por intervalo de data de compra</option>
                        <option value="3" <?php echo $tipoListaEstoque === 3 ? 'selected' : ''; ?>>Por intervalo de data de registo</option>
                        <option value="4" <?php echo $tipoListaEstoque === 4 ? 'selected' : ''; ?>>Por usuário (compra/registo)</option>
                        <option value="5" <?php echo $tipoListaEstoque === 5 ? 'selected' : ''; ?>>Por fornecedor</option>
                        <option value="6" <?php echo $tipoListaEstoque === 6 ? 'selected' : ''; ?>>Por lote</option>
                        <option value="7" <?php echo $tipoListaEstoque === 7 ? 'selected' : ''; ?>>Filtro avançado</option>
                    </select>
                </div>

                <div class="form-group col-md-3" id="grupoTextoBusca" style="display:none;">
                    <label>Produto / Código de barras</label>
                    <input type="text" class="form-control" name="texto_busca" placeholder="Nome ou código"
                        value="<?php echo htmlspecialchars($filtros['texto_busca'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-3" id="fornecedorDiv" style="display:none;">
                    <label>Fornecedor</label>
                    <select class="form-control" name="id_fornecedor">
                        <option value="">Todos</option>
                        <?php foreach ($fornecedores as $fornecedor): ?>
                            <option value="<?php echo (int) $fornecedor['id_fornecedor']; ?>"
                                <?php echo((int) ($filtros['id_fornecedor'] ?? 0) === (int) $fornecedor['id_fornecedor']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($fornecedor['nome'] ?? ''); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group col-md-3" id="userDivEstoque" style="display:none;">
                    <label>Usuário (compra/registo)</label>
                    <select class="form-control" name="id_user">
                        <option value="">Todos</option>
                        <?php foreach ($usuarios as $usuario): ?>
                            <option value="<?php echo (int) $usuario['id']; ?>"
                                <?php echo((int) ($filtros['id_user'] ?? 0) === (int) $usuario['id']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($usuario['nome'] ?? ''); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group col-md-3" id="loteDiv" style="display:none;">
                    <label>Lote</label>
                    <input type="text" class="form-control" name="lote" placeholder="Ex.: AEL25059"
                        value="<?php echo htmlspecialchars($filtros['lote'] ?? ''); ?>">
                </div>
            </div>

            <div class="form-row">

                <div class="form-group col-md-2" id="dataCompraInicialDiv" style="display:none;">
                    <label>Data compra inicial</label>
                    <input type="date" class="form-control" name="data_compra_ini"
                        value="<?php echo htmlspecialchars($filtros['data_compra_ini'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="dataCompraFinalDiv" style="display:none;">
                    <label>Data compra final</label>
                    <input type="date" class="form-control" name="data_compra_fim"
                        value="<?php echo htmlspecialchars($filtros['data_compra_fim'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="dataRegistoInicialDiv" style="display:none;">
                    <label>Registo inicial</label>
                    <input type="date" class="form-control" name="data_registo_ini"
                        value="<?php echo htmlspecialchars($filtros['data_registo_ini'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="dataRegistoFinalDiv" style="display:none;">
                    <label>Registo final</label>
                    <input type="date" class="form-control" name="data_registo_fim"
                        value="<?php echo htmlspecialchars($filtros['data_registo_fim'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="validadeAteDiv" style="display:none;">
                    <label>Validade até</label>
                    <input type="date" class="form-control" name="validade_ate"
                        value="<?php echo htmlspecialchars($filtros['validade_ate'] ?? ''); ?>">
                </div>

                <div class="form-group col-md-2" id="disponibilidadeDiv" style="display:none;">
                    <label>&nbsp;</label>
                    <div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="somente_disponivel" value="1" id="somenteDisponivel"
                                <?php echo ! empty($filtros['somente_disponivel']) ? 'checked' : ''; ?>>
                            <label class="form-check-label" for="somenteDisponivel">Só disponíveis</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="somente_vencidos" value="1" id="somenteVencidos"
                                <?php echo ! empty($filtros['somente_vencidos']) ? 'checked' : ''; ?>>
                            <label class="form-check-label" for="somenteVencidos">Só vencidos</label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-row">

                <div class="form-group col-md-3" id="categoriaDiv" style="display:none;">
                    <label>Categoria</label>
                    <select class="form-control" name="id_categoria">
                        <option value="">Todas</option>
                        <?php foreach ($categorias as $categoria): ?>
                            <option value="<?php echo (int) $categoria['id_categoria']; ?>"
                                <?php echo((int) ($filtros['id_categoria'] ?? 0) === (int) $categoria['id_categoria']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($categoria['nome'] ?? ''); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group col-md-3" id="tipoProdutoDiv" style="display:none;">
                    <label>Tipo de produto</label>
                    <select class="form-control" name="id_tipo_produto">
                        <option value="">Todos</option>
                        <?php foreach ($tiposProduto as $tipo): ?>
                            <option value="<?php echo (int) $tipo['id']; ?>"
                                <?php echo((int) ($filtros['id_tipo_produto'] ?? 0) === (int) $tipo['id']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($tipo['descrição'] ?? ''); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group col-md-3" id="estadoDiv" style="display:none;">
                    <label>Estado de estoque</label>
                    <select class="form-control" name="id_estado">
                        <option value="">Todos</option>
                        <?php foreach ($estadosEstoque as $estado): ?>
                            <option value="<?php echo (int) $estado['id']; ?>"
                                <?php echo((int) ($filtros['id_estado'] ?? 0) === (int) $estado['id']) ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($estado['designacao_estado_estoque'] ?? ''); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group col-md-3">
                    <label>&nbsp;</label>
                    <div>
                        <button type="submit" class="btn btn-success btn-sm" value="1" name="btnFiltrarEstoque">Filtrar</button>
                        <a href="<?php echo URLADM . 'controllerEstoque/listarEstoque'; ?>" class="btn btn-secondary btn-sm">Limpar</a>
                    </div>
                </div>
            </div>
        </form>

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

        <table class="table table-striped table-hover table-bordered tabelaPersonalizadaDataTable" data-page-length="10" data-priority="6,1,4,0">
            <thead>
                <tr>
                    <th>#</th>
                    <th > Nome do Produto </th>
                    <th > Código Barras </th>
                    <th >Preço Compra</th>
                    <th >Preço Venda</th>
                    <th>Quant Estoque</th>
                    <th >Data Validade</th>
                    <th>Acções</th>
                </tr>
            </thead>
            <tbody>
        <?php if (! empty($this->Dados['listEstoque'])): ?>
            <?php foreach ($this->Dados['listEstoque'] as $r): ?>
                <?php
                    $idProduto       = (int) ($r['id_produto'] ?? 0);
                    $nomeProduto     = htmlspecialchars($r['nome_produto'] ?? '');
                    $barCode         = htmlspecialchars($r['bar_code'] ?? '');
                    $precoCompra     = htmlspecialchars($r['preco_compra'] ?? '');
                    $precoVenda      = htmlspecialchars($r['preco_venda'] ?? '');
                    $quantidadeTotal = htmlspecialchars($r['quantidade_total'] ?? '0');
                    $dataValidade    = htmlspecialchars($r['data_validade'] ?? ($r['data_validade_mais_proxima'] ?? ''));
                    $dropdownId      = 'dropdownEstoque' . $idProduto;
                ?>
                <tr>
                    <td class="tg-lboi"><?php echo $idProduto; ?></td>
                    <td class="tg-lboi"><?php echo $nomeProduto; ?></td>
                    <td class="tg-lboi"><?php echo $barCode; ?></td>
                    <td class="tg-lboi"><?php echo $precoCompra; ?></td>
                    <td class="tg-lboi"><?php echo $precoVenda; ?></td>
                    <td class="tg-lboi"><?php echo $quantidadeTotal; ?></td>
                    <td class="tg-lboi"><?php echo $dataValidade; ?></td>
                    <td class="text-center" style="white-space:nowrap;">
                        <div class="dropdown show">
                            <a class="btn btn-success dropdown-toggle" href="#" role="button" id="<?php echo $dropdownId; ?>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Acções
                            </a>
                            <div class="dropdown-menu" aria-labelledby="<?php echo $dropdownId; ?>">
                                <a class="dropdown-item" href="<?php echo URLADM . 'controllerEstoque/detalhesProdutoEstoque/' . $idProduto; ?>">Mais detalhes</a>
                                <a class="dropdown-item" href="<?php echo URLADM . 'EditarProduto/editProduto/' . $idProduto; ?>">Editar produto</a>
                            </div>
                        </div>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>
            </tbody>
        </table>

    </div>
</div>




</div>
</div>