<?php
if (isset($this->Dados['form'])) {
    $valorForm = $this->Dados['form'];
}
if (isset($this->Dados['form'][0])) {
    $valorForm = $this->Dados['form'][0];
}
//var_dump($this->Dados['select']);
?>
<div class="content p-1">
    <div class="list-group-item">
        <div class="d-flex">
            <div class="mr-auto p-2">
                <h2 class="display-4 titulo">Cadastrar Usuário</h2>
            </div>
            <?php
            if ($this->Dados['botao']['list_usuario']) {
                ?>
                <div class="p-2">
                <a href="<?php echo URLADM . 'usuarios/listar'; ?>" class="btn btn-outline-info btn-sm">Listar</a>
            </div>
                <?php
            }
            ?>
            
             
        </div><hr>
        <?php
        if (isset($_SESSION['msg'])) {
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        }
        ?>
        <form method="POST" action="" enctype="multipart/form-data"> 
            
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label><span class="text-danger">*</span> Nome</label>
                    <input name="nome" type="text" class="form-control" placeholder="Digite o nome completo" value="<?php
                    if (isset($valorForm['nome'])) {
                        echo $valorForm['nome'];
                    }
                    ?>">
                </div>
                <div class="form-group col-md-6">
                    <label><span class="text-danger">*</span> Apelido</label>
                    <input name="apelido" type="text" class="form-control" placeholder="Como gostaria de ser chamado" value="<?php
                    if (isset($valorForm['apelido'])) {
                        echo $valorForm['apelido'];
                    }
                    ?>">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-5">
                    <label><span class="text-danger">*</span> E-mail</label>
                    <input name="email" type="text" class="form-control" placeholder="Seu melhor e-mail" value="<?php
                    if (isset($valorForm['email'])) {
                        echo $valorForm['email'];
                    }
                    ?>">
                </div>
                <div class="form-group col-md-4">
                    <label><span class="text-danger">*</span> Usuário</label>
                    <input name="usuario" type="text" class="form-control" id="nome" placeholder="Digite o usuário" value="<?php
                    if (isset($valorForm['usuario'])) {
                        echo $valorForm['usuario'];
                    }
                    ?>">
                </div>
                <div class="form-group col-md-3">
                    <label><span class="text-danger">*</span> Senha</label>
                    <input name="senha" type="password" class="form-control" id="nome" placeholder="Senha com mínimo 6 caracteres" value="<?php
                    if (isset($valorForm['senha'])) {
                        echo $valorForm['senha'];
                    }
                    ?>">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label><span class="text-danger">*</span> Nível de Acesso</label>
                   

                     <select class="form-control" name="adms_niveis_acesso_id" required="">
                        <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('adms_niveis_acessos');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $id_Nivel = $doc['id'];
                            $Nilvel_acesso = $doc['nome'];

                            if ($valorForm['id'] != $id):
                                $selecionado = "selected";
                            else:

                                $selecionado = "";
                            endif;
                            echo "<option value='$id_Nivel' $selecionado>$Nilvel_acesso</option>";
                        endforeach;
                        ?>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label><span class="text-danger">*</span> Situação</label>
                 

                     <select class="form-control" name="adms_sits_usuario_id" required="">
                        <option value="">Selecione</option>
                        <?php
                        $vis = new \App\adms\Models\helper\AdmsRead();
                        $vis->ExeRead('adms_sits_usuarios');

                        foreach ($vis->getResultado() as $doc):
                            extract($doc);
                            $id_Sit_user = $doc['id'];
                            $Sit_User = $doc['nome'];

                            if ($valorForm['id'] != $id):
                                $selecionado = "selected";
                            else:

                                $selecionado = "";
                            endif;
                            echo "<option value='$id_Sit_user' $selecionado>$Sit_User</option>";
                        endforeach;
                        ?>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">

                    <label><span class="text-danger">*</span> Foto (150x150)</label>
                    <input name="imagem_nova" type="file" onchange="previewImagem();">
                </div>
                <div class="form-group col-md-6">
                    <?php
                    $imagem_antiga = URLADM . 'assets/imagens/usuario/preview_img.png';
                    ?>
                    <img src="<?php echo $imagem_antiga; ?>" alt="Imagem do Usuário" id="preview-user" class="img-thumbnail" style="width: 150px; height: 150px;">
                </div>
            </div>

            <p>
                <span class="text-danger">* </span>Campo obrigatório
            </p>
            <input name="CadUsuario" type="submit" class="btn btn-warning" value="Salvar">
        </form>
    </div>
</div>
