<?php
session_start();
require '../../vendor/autoload.php';
?>

<?php include '../navbar.php'; ?>

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
<?php include '../footer.php'; ?>
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