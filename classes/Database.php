<?php
namespace App;

use PDO;
use PDOException;

class Database {
    private static $instance = null;
    private $conn;
    private $host;
    private $db_name;
    private $username;
    private $password;
    
    private function __construct() {
        $this->host = getenv('DB_HOST') ?: 'localhost';
        $this->db_name = getenv('DB_NAME') ?: 'projeto_oo';
        //$this->db_name = getenv('DB_NAME') ?: 'novo_brasindoor';
        $this->username = getenv('DB_USER') ?: 'root';
        $this->password = getenv('DB_PASS') ?: '';
        
        $this->conn = null;

        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo "Erro na conexão: " . $e->getMessage();
        }
    }

    public static function getInstance() {
        if (self::$instance == null) {
            self::$instance = new Database();
        }

        return self::$instance;
    }

    public function getConnection() {
        return $this->conn;
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
            $baseUrl .= '/basic-php_oo-vue-2';
        }

        return $baseUrl;
    }
    
}
