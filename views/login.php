<?php
require '../vendor/autoload.php';

use App\Usuario;

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $usuarioObj = new Usuario();
    $usuario = $usuarioObj->login($email, $senha);
    if ($usuario) {
        session_start();
        $_SESSION['nome'] = $usuario['nome'];
        $_SESSION['tipo'] = $usuario['tipo'];
        $_SESSION['usuario_id'] = $usuario['id'];
        $_SESSION['tipo_usuario_id'] = $usuario['tipo_usuario_id'];

        // Redirecionar com base no tipo de usuário
        switch ($usuario['tipo_usuario_id']) {
            case 1:  // Administrador
                header('Location: admin/dashboard_admin.php');
                break;
            case 2:  // Sócio
                header('Location: site/dashboard_socio.php');
                break;
            case 3:  // Operador
                header('Location: dashboard_operador.php');
                break;
            default: // Outros ou Usuário comum
                header('Location: dashboard.php');
                break;
        }
        exit();
    } else {
        $error = 'Email ou senha inválidos!';
    }
}
?>

<?php include 'navbar.php'; ?>
    
    <?php if ($error) : ?>
        <div class="alert alert-danger"><?= $error ?></div>
    <?php endif; ?>
    <div class="d-flex justify-content-center">
        <div class="login-form-wrapper">
        <h2>Login</h2>
            <form method="POST">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="senha">Senha</label>
                    <input type="password" class="form-control" id="senha" name="senha" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
    </div>
<?php include 'footer.php'; ?>

<style>
    .login-form-wrapper {
        width: 100%;
        max-width: 400px; /* Largura máxima */
        padding: 15px;
        margin: auto;
    }
</style>