
<body>
    <form class="form-signin" method="POST" action="">
    <div class="d-flex flex-column align-items-center justify-content-center">
        <img class="img-fluid" src="<?php echo URLADM . 'imagens/nelisa_img.jpeg'; ?>" alt="Nelisa" width="72" >
        
        <br>
        <h1 class="h3 mb-3 font-weight-normal text-center"> GESTÃO DA FARMÁCIA - NELISA </h1>
    </div>
        <?php
        if (isset($_SESSION['msg'])) {
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        }
        if (isset($this->Dados['form'])) {
            $valorForm = $this->Dados['form'];
        }
        ?>
        <div class="form-group">
            <label>Usuário</label>
            <input name="usuario" type="text" class="form-control" placeholder="Digite o usuário" value=""> 
        </div>
        <div class="form-group">
            <label>Senha</label>
            <input name="senha" type="password" class="form-control" placeholder="Digite a senha">
        </div>

        
        <input name="SendLogin" type="submit" class="btn btn-lg btn-primary btn-block" value="Acessar">


        <p class="text-center"><a href="<?php echo URLADM . 'esqueceu-senha/esqueceu-senha' ?>">Esqueceu a senha?</a></p>
    </form>
</body>

