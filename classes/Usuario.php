<?php

namespace App;

class Usuario {
    protected $db;

    public function __construct() {
        $this->db = Database::getInstance();
    }

    public function cadastrar($nome, $email, $senha) {
        if (empty($nome) || empty($email) || empty($senha)) {
            return 'Por favor, preencha todos os campos.';
        }

        $senhaHash = password_hash($senha, PASSWORD_DEFAULT);
        $this->db->query("INSERT INTO usuarios (nome, email, senha, tipo_usuario_id) VALUES (?, ?, ?, ?)", [$nome, $email, $senhaHash, 2]);

        if ($this->db->error()) {
            return 'Houve um erro ao cadastrar o usuário.';
        }

        return 'Usuário cadastrado com sucesso.';
    }

    public function login($email, $senha) {
        if (empty($email) || empty($senha)) {
            return 'Por favor, preencha todos os campos.';
        }

        $result = $this->db->query("SELECT id, senha, tipo_usuario_id FROM usuarios WHERE email = ?", [$email]);

        if ($this->db->error() || empty($result)) {
            return false;
        }

        $usuario = $result[0];

        if (password_verify($senha, $usuario['senha'])) {
            return $usuario;
        } else {
            return false;
        }
    }
    function checkOperador(){
        session_start();
        if (!isset($_SESSION['usuario_id']) || $_SESSION['tipo_usuario_id'] != 3) {
            header('Location: login.php');
            exit();
        }
    }
    function checkSocio(){
        if (!isset($_SESSION['usuario_id']) || $_SESSION['tipo_usuario_id'] != 2) {
            header('Location: login.php');
            exit();
        }

    }
    function checkAdmin(){
        session_start();
        if (!isset($_SESSION['usuario_id']) || $_SESSION['tipo_usuario_id'] != 1) {
            header('Location: ../../login.php');
            exit();
        }
    }

    public function logout(){
        session_start();
        session_unset();
        session_destroy();
        header('Location: login.php');
        exit();
    }

}
?>
