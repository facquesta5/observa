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
        $this->db->query("INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)", [$nome, $email, $senhaHash]);

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
}
?>
