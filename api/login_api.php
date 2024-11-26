<?php
require '../vendor/autoload.php';

use App\Usuario;

header('Content-Type: application/json');  // Define o retorno como JSON

$response = ['success' => false, 'message' => ''];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $email = $input['email'] ?? '';
    $senha = $input['senha'] ?? '';

    $usuarioObj = new Usuario();
    $usuario = $usuarioObj->login($email, $senha);

    if ($usuario && is_array($usuario)) {
        session_start();
        $_SESSION['nome'] = $usuario['nome'];
        $_SESSION['tipo'] = $usuario['tipo'];
        $_SESSION['usuario_id'] = $usuario['id'];
        $_SESSION['tipo_usuario_id'] = $usuario['tipo_usuario_id'];

        // Redirecionar com base no tipo de usuário
        switch ($usuario['tipo_usuario_id']) {
            case 1:  // Administrador
                $response['redirect'] = 'admin/dashboard_admin.php';
                break;
            case 2:  // Sócio
                $response['redirect'] = 'site/dashboard_socio.php';
                break;
            case 3:  // Operador
                $response['redirect'] = 'dashboard_operador.php';
                break;
            default: // Outros ou Usuário comum
                $response['redirect'] = 'dashboard.php';
                break;
        }
        $response['success'] = true;
    } else {
        $response['message'] = 'Email ou senha inválidos!';
    }

    echo json_encode($response);
    exit();
}
?>