<?php

namespace App;

use PDO;
use PDOException;

class Socio extends Database
{
    private $conn;

    public function __construct()
    {
        // Obtenha a conexão do banco de dados da classe Database
        $this->conn = Database::getInstance()->getConnection();
    }

    public function migrarTipo()
    {
        // Mapeamento correto dos tipos para seus IDs em id_socio_categoria
        $mapeamentoTipos = [
            'PJ'  => 5,  // Pessoa Jurídica
            'PFE' => 7,  // Professores
            'PSQ' => 6,  // Pesquisador
            'PFA' => 4,  // Pessoa Física - Profissional
            'BCD' => 1,  // Biblioteca e Centro de Documentação
            'MH'  => 3   // Membro Honorário
        ];

        // Preparar o SQL para atualização
        $sql = "UPDATE socios SET id_socio_categoria = :id_socio_categoria WHERE tipo = :tipo";
        $stmt = $this->conn->prepare($sql);

        // Executar o update para cada tipo no mapeamento
        foreach ($mapeamentoTipos as $tipo => $idCategoria) {
            $stmt->execute([
                ':id_socio_categoria' => $idCategoria,
                ':tipo' => $tipo
            ]);
        }

        echo "Atualização concluída!";
    }

    public function processInsertToUpdate($insertText)
    {
        // Exibir erro de PHP, caso exista
        // ini_set('display_errors', 1);
        // ini_set('display_startup_errors', 1);
        // error_reporting(E_ALL);

        // Explodir o texto por linha
        $lines = explode("\n", $insertText);
        $updates = [];

        foreach ($lines as $line) {
            // Verifica se a linha contém um comando de valores
            echo "Processando linha: $line<br>"; // Para depuração

            // Remover espaços em branco
            $line = trim($line);

            // Verificar se a linha não está vazia
            if (!empty($line)) {
                // Remover os parênteses e dividir os valores
                $value = str_replace(['(', ')'], '', $line);
                $valueParts = explode(',', $value);

                // Remover espaços em branco
                $valueParts = array_map('trim', $valueParts);

                // O primeiro valor é o id
                $id = $valueParts[0];

                // O segundo valor é o nome, verificar se existe
                if (isset($valueParts[1])) {
                    // Obter o nome e escapar aspas simples
                    $nome = trim($valueParts[1], "'"); // Remove aspas simples do início e do fim
                    $nome = str_replace("'", "''", $nome); // Escapar aspas simples para SQL

                    // Montar o UPDATE
                    $updateQuery = "UPDATE `socios` SET `nome` = '$nome' WHERE `id` = $id;";
                    $updates[] = $updateQuery;

                    // Exibir o comando de update gerado
                    echo "Comando UPDATE gerado: $updateQuery<br>";
                } else {
                    echo "Nome não encontrado para o ID: $id<br>";
                }
            }
        }

        // Exibir os comandos UPDATE gerados
        if (empty($updates)) {
            echo "Nenhum comando UPDATE gerado.<br>";
        } else {
            echo "Comandos UPDATE gerados:<br>";
            foreach ($updates as $update) {
                echo $update . "<br>";
            }
        }
    }
}
