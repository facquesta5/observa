<?php
session_start();
require '../vendor/autoload.php';
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
    <?php include 'navbar.php'; ?>
    <!-- Breadcrumb -->
    <div class="container mt-2">
        <?php echo $breadcrumb; ?>
    </div>
    <div id="app" class="container mt-2">
        
            
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
                    axios.get('admin/retorno_carros_listar.php')
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
