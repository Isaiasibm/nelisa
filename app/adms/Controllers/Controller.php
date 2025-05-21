<?php

namespace App\adms\Controllers;

if (!defined('URL')) {
    header("Location: /");
    exit();
}

class Controller
{
    public function __construct()
    {
        $this->verificarLogin();
    }

    /**
     * Método para verificar se o usuário está logado
     */
    private function verificarLogin()
    {
        if (!isset($_SESSION['usuario_id']) || empty($_SESSION['usuario_id'])) {
            header("Location: " . URL . "/login");
            exit();
        }
    }
}
