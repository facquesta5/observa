<?php
require '../vendor/autoload.php';
use App\Perfil;

$monitorar_perfil = new Perfil();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Certifique-se de que 'nova_lista' está sendo recebida corretamente
    $novaLista = $_POST['nova_lista'] ?? '';
    
    // Comparar perfis e obter os não registrados
    $naoRegistrados = $monitorar_perfil->compararPerfis($novaLista);

    // Retorna a lista de perfis não registrados em formato JSON
    header('Content-Type: application/json');
    echo json_encode($naoRegistrados);
}