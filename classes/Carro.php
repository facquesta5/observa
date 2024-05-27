<?php
namespace App;
class Carro {
    protected $db;

    public function __construct() {
        $this->db = Database::getInstance();
    }

    public function listar() {
       return $this->db->query("SELECT * FROM carros");
    }

}
?>
