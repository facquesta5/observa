<?php
require '../vendor/autoload.php';

use App\Usuario;

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $senha = $_POST['senha'];

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

<div id="app">
    <div class="d-flex justify-content-center">
        <div class="login-form-wrapper">
            <h2>Login</h2>
            <div v-if="error" class="alert alert-danger">{{ error }}</div>
            <form @submit.prevent="login">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" v-model="email" class="form-control" id="email" required>
                </div>
                <div class="form-group">
                    <label for="senha">Senha</label>
                    <input type="password" v-model="senha" class="form-control" id="senha" required>
                </div>
                <button type="submit" class="btn btn-primary" :disabled="loading">Login</button>
            </form>
        </div>
    </div>
</div>
<script>
    new Vue({
        el: '#app',
        data() {
            return {
                email: '',
                senha: '',
                error: '',
                loading: false
            };
        },
        methods: {
            login() {
                this.loading = true;
                axios.post('../api/login_api.php', {
                        email: this.email,
                        senha: this.senha
                    })
                    .then(response => {
                        if (response.data.success) {
                            // Redireciona o usuário baseado no tipo de usuário
                            window.location.href = response.data.redirect;
                        } else {
                            // Define a mensagem de erro vinda do backend
                            this.error = response.data.message;
                        }
                    })
                    .catch(error => {
                        this.error = 'Erro ao realizar o login. Tente novamente.';
                    })
                    .finally(() => {
                        this.loading = false;
                    });
            }
        }
    });
</script>
<?php include 'footer.php'; ?>