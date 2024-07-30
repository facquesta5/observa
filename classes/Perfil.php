<?php

namespace App;

use PDO;
use PDOException;

class Perfil
{
    protected $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    public function extrairPerfis($lista)
    {
        $linhas = explode("\n", $lista);
        $perfis = [];

        for ($i = 0; $i < count($linhas); $i += 3) {
            if (isset($linhas[$i + 1]) && isset($linhas[$i + 2])) {
                $perfis[] = [
                    'foto' => trim($linhas[$i]),
                    'username' => trim($linhas[$i + 1]),
                    'nome' => trim($linhas[$i + 2])
                ];
            }
        }

        return $perfis;
    }

    public function armazenarPerfis($perfis)
    {
        foreach ($perfis as $perfil) {
            $this->db->query(
                "INSERT INTO monitorar_perfis (foto, username, nome) VALUES (?, ?, ?)",
                [$perfil['foto'], $perfil['username'], $perfil['nome']]
            );
        }
    }

    public function compararPerfis($novaLista)
    {
        $perfisNaoArmazenados = [];
        $perfis = $this->extrairPerfis($novaLista);

        // Extrai todos os usernames de uma vez só
        $todos_usuarios = $this->db->query("SELECT username FROM monitorar_perfis");
        $usernames_armazenados = array_map(function ($usuario) {
            return $usuario['username'];
        }, $todos_usuarios);

        // Percorre a lista de perfis e verifica se não estão na lista de usernames armazenados
        foreach ($perfis as $perfil) {
            if (!in_array($perfil['username'], $usernames_armazenados)) {
                $perfisNaoArmazenados[] = $perfil;
            }
        }

        return $perfisNaoArmazenados;
    }

    public function contarRegistros()
    {
        // Executa a consulta para contar o número de registros na tabela monitorar_perfis
        $result = $this->db->query("SELECT COUNT(*) as total FROM monitorar_perfis");

        // Retorna o total de registros
        return $result[0]['total'];
    }
}
