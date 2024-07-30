<?php
require '../../vendor/autoload.php';

use App\Perfil;

$monitorar_perfil = new Perfil();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $novaLista = $_POST['nova_lista'];

    $perfisNaoArmazenados = $monitorar_perfil->compararPerfis($novaLista);

    var_dump($perfisNaoArmazenados);
    if (empty($perfisNaoArmazenados)) {
        echo "<h3>Todos os perfis já estão armazenados.</h3>";
    } else {
        // echo "<h3>Perfis não armazenados:</h3>";
        // foreach ($perfisNaoArmazenados as $perfil) {
        //     echo "<p>Username: {$perfil['username']} - Nome: {$perfil['nome']}</p>";
        // }
        echo "<pre>";
        print_r($perfisNaoArmazenados)  ;
        echo "</pre>";
    }
}

