<?php
namespace App;

use PDO;
use PDOException;
class Database {
    private static $instance = null;
    private $pdo;
    private $error;

    private function __construct() {
        try {
            $this->pdo = new PDO('mysql:host=localhost;dbname=projeto_oo', 'root', '');
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            $this->error = $e->getMessage();
        }
    }

    public static function getInstance() {
        if (self::$instance == null) {
            self::$instance = new Database();
        }
        return self::$instance;
    }

    public function query($sql, $params = []) {
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            $this->error = $e->getMessage();
            return [];
        }
    }

    public function error() {
        return $this->error;
    }
}