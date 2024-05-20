<?php
namespace App;
class Database {
    private static $instance = null;
    private $pdo, $query, $error = false, $results, $count = 0;

    private function __construct() {
        try {
            $this->pdo = new \PDO('mysql:host=localhost;dbname=projeto_oo', 'root', '');
        } catch(\PDOException $e) {
            die($e->getMessage());
        }
    }

    public static function getInstance() {
        if (!isset(self::$instance)) {
            self::$instance = new Database();
        }
        return self::$instance;
    }

    // Método para executar queries
    public function query($sql, $params = array()) {
        $this->error = false;
        if ($this->query = $this->pdo->prepare($sql)) {
            $x = 1;
            if (count($params)) {
                foreach ($params as $param) {
                    $this->query->bindValue($x, $param);
                    $x++;
                }
            }

            if ($this->query->execute()) {
                $this->results = $this->query->fetchAll(\PDO::FETCH_OBJ);
                $this->count = $this->query->rowCount();
            } else {
                $this->error = true;
            }
        }

        return $this;
    }

    // Métodos para buscar resultados e contar linhas
    public function results() {
        return $this->results;
    }

    public function count() {
        return $this->count;
    }

    // Método para verificar se houve erro na query
    public function error() {
        return $this->error;
    }
}