<?php

namespace App;

use PDO;
use PDOException;

 class Usuario extends Database
{
    private $conn;

    public function __construct() {
        $this->conn = Database::getInstance()->getConnection();
    }

    public function login($email, $senha) {
        
        if (empty($email) || empty($senha)) {
            return 'Por favor, preencha todos os campos.';
        }

        try {
            // Preparando a consulta com placeholders
            $query = "
                SELECT 
                    u.id, u.senha, u.tipo_usuario_id, u.nome, tu.tipo 
                FROM 
                    usuarios u
                LEFT JOIN 
                    tipos_usuarios tu ON tu.id = u.tipo_usuario_id
                WHERE 
                    u.email = :email
            ";
            // Preparando a declaração
            $stmt = $this->conn->prepare($query);
            // Vinculando o parâmetro
            $stmt->bindParam(':email', $email);
            // Executando a consulta
            $stmt->execute();
            // Obtendo o resultado
            $result = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$result) {
                return 'Usuário não encontrado.';
            }

            // Verificando a senha
            if (password_verify($senha, $result['senha'])) {
                return $result;
            } else {
                return 'Senha incorreta.';
            }
        } catch (PDOException $e) {
            return 'Erro no login: ' . $e->getMessage();
        }
    }
    
    // Método para inserir um novo usuário
    public function inserirUsuario($nome, $email, $senha)
    {
        try {
            $query =
                "INSERT INTO usuarios (nome, email, senha, tipo_usuario_id) 
            VALUES (:nome, :email, :senha, :tipo_usuario_id)";

            $stmt = $this->conn->prepare($query);
            // Hash da senha antes de armazenar no banco de dados
            $senhaHash = password_hash($senha, PASSWORD_DEFAULT);
            // Valor fixo para tipo_usuario_id
            $tipoUsuarioId = 1;
            // Bind dos parâmetros
            $stmt->bindParam(':nome', $nome);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':senha', $senhaHash);
            $stmt->bindParam(':tipo_usuario_id', $tipoUsuarioId);
            // Executa a query
            if ($stmt->execute()) {
                return true;
            }
            return false;
        } catch (PDOException $e) {
            echo "Erro ao inserir usuário: " . $e->getMessage();
            return false;
        }
    }

    public function cadastrar($nome, $email, $senha)
    {
        if (empty($nome) || empty($email) || empty($senha)) {
            return 'Por favor, preencha todos os campos.';
        }

        $senhaHash = password_hash($senha, PASSWORD_DEFAULT);
        $this->conn->query("INSERT INTO usuarios (nome, email, senha, tipo_usuario_id) 
        VALUES (?, ?, ?, ?)", [$nome, $email, $senhaHash, 2]);

        return 'Usuário cadastrado com sucesso.';
    }

    public function listar($limit = 10, $offset = 0)
    {
        try {
            // SQL query para listar usuários com limite e deslocamento
            $sql = "SELECT u.id, u.nome, u.email, u.criado_em, u.ativo, tu.tipo 
                    FROM usuarios u
                    LEFT JOIN tipos_usuarios tu ON tu.id = u.tipo_usuario_id
                    ORDER BY u.id DESC
                    LIMIT :limit OFFSET :offset";

            // Preparar a declaração
            $stmt = $this->conn->prepare($sql);

            // Bind dos parâmetros
            $stmt->bindValue(':limit', (int) $limit, PDO::PARAM_INT);
            $stmt->bindValue(':offset', (int) $offset, PDO::PARAM_INT);

            // Executar a declaração
            $stmt->execute();

            // Obter os resultados
            $usuarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

            // Retornar os resultados
            return $usuarios;
        } catch (PDOException $e) {
            // Em caso de erro, exibir a mensagem de erro
            echo "Erro ao listar usuários: " . $e->getMessage();
            return false;
        }
    }


    // Adicionar método para contar o número total de usuários
    public function contarUsuarios()
    {
        try {
            // SQL query para contar o total de usuários
            $sql = "SELECT COUNT(*) as total FROM usuarios";

            // Preparar a declaração
            $stmt = $this->conn->prepare($sql);

            // Executar a declaração
            $stmt->execute();

            // Obter o resultado
            $result = $stmt->fetch(PDO::FETCH_ASSOC);

            // Retornar o total de usuários
            return $result['total'];
        } catch (PDOException $e) {
            // Em caso de erro, exibir a mensagem de erro
            echo "Erro ao contar usuários: " . $e->getMessage();
            return false;
        }
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
