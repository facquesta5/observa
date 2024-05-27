<?php
require '../../vendor/autoload.php';
use App\Carro;

$carros = new Carro();
$carros = $carros->listar();

header('Content-Type: application/json');
echo json_encode($carros);
?>