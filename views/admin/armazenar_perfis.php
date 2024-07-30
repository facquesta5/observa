<?php
require '../../vendor/autoload.php';

use App\Perfil;

$monitorar_perfil = new Perfil();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $lista = $_POST['lista'];

    $perfis = $monitorar_perfil->extrairPerfis($lista);
    $monitorar_perfil->armazenarPerfis($perfis);

    echo "<h3>Perfis armazenados com sucesso!</h3>";
    foreach ($perfis as $perfil) {
        echo "<p>Username: {$perfil['username']} - Nome: {$perfil['nome']}</p>";
    }
}
