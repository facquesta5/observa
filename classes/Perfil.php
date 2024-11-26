<?php

namespace App;

use PDO;
use PDOException;

class Perfil extends Database
{
    private $conn;

    public function __construct()
    {
        // Obtenha a conexão do banco de dados da classe Database
        $this->conn = Database::getInstance()->getConnection();
    }

    public function listarPerfis()
    {
        try {
            // Preparar a consulta SQL
            $query = "SELECT id, username, data_cadastro FROM monitorar_perfis ORDER BY data_cadastro DESC";

            // Preparar a declaração
            $stmt = $this->conn->prepare($query);

            // Executar a consulta
            $stmt->execute();

            // Recuperar os registros e retorná-los como array associativo
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return $result;
        } catch (PDOException $e) {
            echo "Erro ao listar perfis: " . $e->getMessage();
            return [];
        }
    }

    public function compararPerfis($novaLista)
    {
        // Extrair perfis da nova lista
        $novosPerfis = $this->extrairPerfis($novaLista);

        // Extrair apenas os usernames dos perfis e normalizar (remover espaços e usar lowercase)
        $novosUsernames = array_map('trim', array_map('strtolower', array_column($novosPerfis, 'username')));

        // Preparar a query para buscar todos os usernames já cadastrados no banco
        $query = "SELECT username FROM monitorar_perfis";

        // Usar a conexão com o banco de dados
        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        // Obter todos os usernames já existentes e normalizar também
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $usernamesExistentes = array_map('trim', array_map('strtolower', array_column($result, 'username')));

        // Verificar quais usernames da nova lista não estão no banco
        $usernamesNaoRegistrados = array_diff($novosUsernames, $usernamesExistentes);

        return $usernamesNaoRegistrados;
    }
    function extrairPerfis($lista)
    {
        // Quebrar a lista em linhas
        $linhas = explode("\n", trim($lista));

        // Array para armazenar perfis
        $perfis = [];

        // Variável para armazenar dados temporários
        $temp = [];

        // Loop através de cada linha
        foreach ($linhas as $linha) {
            // Remove espaços em branco ao redor
            $linha = trim($linha);

            // Verifica se a linha começa com "Foto do perfil"
            if (strpos($linha, 'Foto do perfil') === 0) {
                // Se temp não está vazio, adiciona ao array perfis
                if (!empty($temp)) {
                    $perfis[] = $temp;
                    $temp = [];
                }
                // Adiciona a linha da foto ao array temporário
                $temp['foto'] = $linha;
            } elseif (empty($temp['username'])) {
                // Adiciona a linha do nome de usuário ao array temporário
                $temp['username'] = trim($linha); // Trim para remover espaços e normalizar
            } else {
                // Adiciona a linha do nome ao array temporário
                $temp['nome'] = trim($linha); // Trim para remover espaços e normalizar
            }
        }
        // Adiciona o último perfil ao array perfis
        if (!empty($temp)) {
            $perfis[] = $temp;
        }

        return $perfis;
    }

    public function armazenarPerfis($perfis)
    {
        try {
            foreach ($perfis as $perfil) {
                $username = $this->conn->quote($perfil['username']);
                $dataCadastro = $this->conn->quote($perfil['data_cadastro']);

                // Verifica se o perfil já existe
                $query = "SELECT COUNT(*) FROM monitorar_perfis WHERE username = $username";
                $result = $this->conn->query($query);
                $count = $result->fetchColumn();

                if ($count == 0) {
                    // Se o perfil não existe, insere-o
                    $insertQuery = "INSERT INTO monitorar_perfis (username, data_cadastro) 
                                VALUES ($username, $dataCadastro)";
                    $this->conn->query($insertQuery);
                }
            }

            return 'Perfis cadastrados com sucesso.';
        } catch (PDOException $e) {
            return 'Erro ao cadastrar perfis: ' . $e->getMessage();
        }
    }



    public function contarRegistros()
    {
        // Executa a consulta para contar o número de registros na tabela monitorar_perfis
        $result = $this->db->query("SELECT COUNT(*) as total FROM monitorar_perfis");

        // Retorna o total de registros
        return $result[0]['total'];
    }
}
