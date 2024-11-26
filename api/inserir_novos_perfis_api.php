<?php
require '../vendor/autoload.php';
use App\Perfil;

$monitorar_perfil = new Perfil();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recebe o array de perfis a serem inseridos
    $data = json_decode(file_get_contents("php://input"), true);
    $perfis = $data['perfis'] ?? [];

    if (!empty($perfis)) {
        // Itera sobre os perfis e tenta inserir no banco de dados
        $insertStatus = $monitorar_perfil->armazenarPerfis($perfis);

        if ($insertStatus === 'Perfis cadastrados com sucesso.') {
            echo json_encode(['status' => 'success', 'message' => $insertStatus]);
        } else {
            echo json_encode(['status' => 'error', 'message' => $insertStatus]);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Nenhum perfil para inserir.']);
    }
}