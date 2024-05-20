<?php

require 'vendor/autoload.php';

?>

<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Cadastro de Usuário</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <div id="app">
        <div class="container mt-5">
            <h2>Cadastro de Usuário</h2>
            <form method="POST" @submit="checkPassword">
                <div class="form-group">
                    <label for="nome">Nome</label>
                    <input type="text" class="form-control" id="nome" name="nome" v-model="nome" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" v-model="email" autocomplete="new-email" required>
                </div>
                <div class="form-group">
                    <label for="senha">Senha</label>
                    <input type="password" class="form-control" id="senha" name="senha" v-model="senha" autocomplete="new-password" required>
                </div>
                <div class="form-group">
                    <label for="confirmar_senha">Confirmar Senha</label>
                    <input type="password" class="form-control" id="confirmar_senha" name="confirmar_senha" v-model="confirmar_senha" required>
                </div>

                <button type="submit" class="btn btn-primary">Cadastrar</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        new Vue({
            el: '#app',
            data: {
                nome: '',
                email: '',
                senha: '',
                confirmar_senha: ''
            },
            methods: {
                checkPassword: function(event) {
                    event.preventDefault();
                    if (this.senha !== this.confirmar_senha) {
                        alert('As senhas não coincidem!');
                    } else {
                        this.cadastrarUsuario();
                    }
                },
                cadastrarUsuario: function() {
                    const userData = {
                        nome: this.nome,
                        email: this.email,
                        senha: this.senha
                    };

                    axios.post('retorno_cadastrar.php', userData)
                        .then((response) => {
                            console.log('Server response:', response.data);

                            if (response.data.mensagem === 'Usuário cadastrado com sucesso.') {
                                this.nome = '';
                                this.email = '';
                                this.senha = '';
                                this.confirmar_senha = '';

                                alert('Usuário cadastrado com sucesso!');
                            } else {
                                alert(response.data.mensagem);
                            }
                        })
                        .catch((error) => {
                            console.log('Error:', error);
                            alert('Houve um erro ao cadastrar o usuário.');
                        });
                }
            }
        });
    </script>
</body>

</html>
