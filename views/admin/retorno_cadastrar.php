<?php

require '../../vendor/autoload.php';
use App\Usuario;

header('Content-Type: application/json');

// Verifique se o método é POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtenha os dados do POST e decodifique o JSON
    $input = json_decode(file_get_contents('php://input'), true);
    $nome = $input['nome'];
    $email = $input['email'];
    $senha = $input['senha'];
    // Faça algo com os dados aqui, como inseri-los em um banco de dados
    $usuario = new Usuario();
    $mensagem = $usuario->cadastrar($nome, $email, $senha);
    // Retorne uma resposta com os dados recebidos
    echo json_encode(['mensagem' => $mensagem]);
} else {
    // Método não permitido
    http_response_code(405);
    echo json_encode(['mensagem' => 'Método não permitido']);
}
?>
