<?php
require '../../vendor/autoload.php';
require '../session.php';

use App\Database;
use App\Usuario;

$database = new Database();
$db = $database->getConnection();

$usuario = new Usuario($db);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Coleta os dados do formulário
    $nome = $_POST['nome'] ?? '';
    $email = $_POST['email'] ?? '';
    $senha = $_POST['senha'] ?? '';
    $confirmar_senha = $_POST['confirmar_senha'] ?? '';

    // Verifica se a senha e a confirmação são iguais
    if ($senha === $confirmar_senha) {
        if ($usuario->inserirUsuario($nome, $email, $senha)) {
            echo "Usuário inserido com sucesso!";
        } else {
            echo "Falha ao inserir usuário.";
        }
    } else {
        echo "As senhas não coincidem.";
    }
}
?>
<?php include '../navbar.php'; ?>
<div class="container mt-2">
    <h2>Cadastro de Usuário</h2>
    <form method="POST">
        <div class="form-group">
            <label for="nome">Nome</label>
            <input type="text" class="form-control" id="nome" name="nome" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" autocomplete="new-email" required>
        </div>
        <div class="form-group">
            <label for="senha">Senha</label>
            <input type="password" class="form-control" id="senha" name="senha" autocomplete="new-password" required>
        </div>
        <div class="form-group">
            <label for="confirmar_senha">Confirmar Senha</label>
            <input type="password" class="form-control" id="confirmar_senha" name="confirmar_senha" required>
        </div>

        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>
</div>
<?php include '../footer.php'; ?>