<?php

namespace App;

use PDO;
use PDOException;

class Usuario
{
    protected $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    public function cadastrar($nome, $email, $senha)
    {
        if (empty($nome) || empty($email) || empty($senha)) {
            return 'Por favor, preencha todos os campos.';
        }

        $senhaHash = password_hash($senha, PASSWORD_DEFAULT);
        $this->db->query("INSERT INTO usuarios (nome, email, senha, tipo_usuario_id) 
        VALUES (?, ?, ?, ?)", [$nome, $email, $senhaHash, 2]);

        return 'Usuário cadastrado com sucesso.';
    }

    public function listar($limit = 10, $offset = 0) {
        $sql = "SELECT u.id, u.nome, u.email, u.criado_em, u.ativo, tu.tipo 
                FROM usuarios u
                LEFT JOIN tipos_usuarios tu ON tu.id = u.tipo_usuario_id
                LIMIT $limit OFFSET $offset";
        $usuarios = $this->db->query($sql);
        return $usuarios;
    }

    // Adicionar método para contar o número total de usuários
    public function contarUsuarios() {
        $sql = "SELECT COUNT(*) as total FROM usuarios";
        $result = $this->db->query($sql);
        return $result[0]['total'];
    }



    public function login($email, $senha) {
        if (empty($email) || empty($senha)) {
            return 'Por favor, preencha todos os campos.';
        }

        $result = $this->db->query(
            "SELECT 
                u.id, u.senha, u.tipo_usuario_id, u.nome, tu.tipo 
                FROM usuarios u
            LEFT JOIN tipos_usuarios tu ON tu.id = u.tipo_usuario_id
            WHERE email = ?",
            [$email]
        );

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


    public function getBaseUrl()
    {
        // Verifica se o servidor está usando HTTPS
        $isHttps = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on';

        // Monta o prefixo da URL baseado no protocolo e no host
        $baseUrl = ($isHttps ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'];

        // Adiciona a porta, se necessário
        if ($_SERVER['SERVER_PORT'] !== '80' && $_SERVER['SERVER_PORT'] !== '443') {
            $baseUrl .= ':' . $_SERVER['SERVER_PORT'];
        }

        // Verifica se o servidor é localhost
        if ($_SERVER['SERVER_NAME'] === 'localhost' || $_SERVER['SERVER_ADDR'] === '127.0.0.1') {
            // Adiciona o nome do projeto ao URL base
            $baseUrl .= '/basic-php_oo-vue';
        }

        return $baseUrl;
    }
    public function checkSocio()
    {
        $baseUrl = $this->getBaseUrl();
        if (!isset($_SESSION['usuario_id']) || $_SESSION['tipo_usuario_id'] != 2) {
            header('Location: ' . $baseUrl . '/views/login.php');
            exit();
        }
    }

    function checkOperador()
    {
        session_start();
        $baseUrl = $this->getBaseUrl();
        if (!isset($_SESSION['usuario_id']) || $_SESSION['tipo_usuario_id'] != 3) {
            header('Location: ' . $baseUrl . '/views/login.php');
            exit();
        }
    }

    function checkAdmin()
    {
        session_start();
        $baseUrl = $this->getBaseUrl();
        if (!isset($_SESSION['usuario_id']) || $_SESSION['tipo_usuario_id'] != 1) {
            header('Location: ' . $baseUrl . '/views/login.php');
            exit();
        }
    }

    public function logout()
    {
        session_start();
        session_unset();
        session_destroy();
        $baseUrl = $this->getBaseUrl();
        header('Location: ' . $baseUrl . '/views/login.php');
        exit();
    }
}
