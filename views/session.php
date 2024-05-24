<?php
session_start();

function checkLogin() {
    if (!isset($_SESSION['usuario_id'])) {
        header('Location: login.php');
        exit();
    }
}

function checkAdmin() {
    if ($_SESSION['tipo_usuario_id'] !== 1) {
        header('Location: acesso_negado.php');
        exit();
    }
}



?>
