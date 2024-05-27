<?php
session_start();
require '../../vendor/autoload.php';
?>
<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Carros</title>
    <!-- Inclua o CSS do Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Inclua o Vue.js -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <!-- Inclua o Axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body>
    <?php include '../navbar.php'; ?>
    <!-- Breadcrumb -->
    <div class="container mt-2">
        <?php echo $breadcrumb; ?>
    </div>
    <div id="app" class="container mt-2">
        <div class="row" style="justify-content: space-between;align-items: baseline;margin-right: 0px;
            margin-left: 0px;">
            <h2 style="width: fit-content;">Carros</h2>
            <a href="#" class="btn btn-primary mb-2">Cadastrar Carro</a>
        </div>
        <table class="table" v-if="carros.length">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Ano</th>
                    <th>Preço</th>
                    <th>Disponível</th>
                    <th>Criado Em</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="carro in carros" :key="carro.id">
                    <td>{{ carro.id }}</td>
                    <td>{{ carro.marca }}</td>
                    <td>{{ carro.modelo }}</td>
                    <td>{{ carro.ano }}</td>
                    <td>R$ {{ formatarPreco(carro.preco) }}</td>
                    <td>{{ carro.disponivel ? 'Sim' : 'Não' }}</td>
                    <td>{{ carro.criado_em }}</td>
                </tr>
            </tbody>
        </table>
        <div v-else>
            <p>Nenhum carro disponível no momento.</p>
        </div>
    </div>
    <!-- Inclua o JS do Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        new Vue({
            el: '#app',
            data: {
                carros: []
            },
            methods: {
                carregarCarros: function() {
                    axios.get('retorno_carros_listar.php')
                        .then(response => {
                            this.carros = response.data;
                            console.log(this.carros);
                        })
                        .catch(error => {
                            console.error('Erro ao carregar os carros:', error);
                        });
                },
                formatarPreco: function(preco) {
                    return parseFloat(preco).toFixed(2).replace('.', ',');
                }
            },
            mounted() {
                this.carregarCarros();
            }
        });
    </script>
</body>
</html>
