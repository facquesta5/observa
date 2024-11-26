<?php
require '../../vendor/autoload.php';

use App\Usuario;
use App\Perfil;

$usuarioObj = new Usuario();
$usuarioObj->checkAdmin();
$perfilObj = new Perfil();
$perfis = $perfilObj->listarPerfis();

?>
<?php include '../navbar.php'; ?>
<div class="container">
    <div class="row">


        <div class="col-sm-3 pl-0 lista pr-1 mt-2" style="height: 400px; overflow-y: auto;">
            <!-- Primeira Coluna -->
            <table class="table lista table-striped">
                <thead>
                    <tr>
                        <th>Perfis Registrados</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($perfis as $perfil): ?>
                        <tr>
                            <td><small><?php echo htmlspecialchars($perfil['username']); ?></small></td>
                            <td><small><?php echo date('d/m/Y', strtotime($perfil['data_cadastro'])); ?></small></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>

        <div class="col-sm-3 compara-2 mt-2">
            <!-- Segunda Coluna -->
            <!-- Formulário para armazenar perfis -->
            <form method="POST" action="armazenar_perfis.php">
                <div class="form-group">
                    <label for="lista">Registrar lista</label>
                    <textarea class="form-control" id="lista" name="lista" rows="10" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Armazenar</button>
            </form>
        </div>

        <div class="col-sm-3 compara-2 mt-2">
            <!-- Terceira Coluna -->
            <!-- Formulário para comparar perfis -->
            <form @submit.prevent="compararPerfis" method="POST">
                <div class="form-group">
                    <label for="nova_lista">Lista de Novos Perfis</label>
                    <textarea class="form-control" v-model="novaLista" id="nova_lista" name="nova_lista"
                        rows="10"></textarea>
                </div>
                <button type="submit" class="btn btn-secondary">Comparar Perfis</button>
            </form>
        </div>

        <div class="col-sm-3 pl-0 lista pr-0 mt-2" style="height: 400px; overflow-y: auto;">
            <!-- Quarta Coluna -->
            <table class="table table-dark table-striped">
                <thead>
                    <tr>
                        <th>Perfis Não Registrados</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td v-if="comparar !== null && naoRegistrados.length === 0">Todos os perfis já estão registrados.</td>
                        <td v-if="comparar === 1 && naoRegistrados.length !== 0" colspan="2" class="text-center">
                            <a href="#" @click="inserirTodosPerfis()" class="fas fa-upload"></i> Inserir novos registros?</a>
                        </td>
                    </tr>
                    <tr v-for="(perfil, index) in naoRegistrados" :key="index">
                        <td><small>{{ perfil }}</small></td>
                        <td><small><?php echo date('d/m/Y'); ?></small></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>

<script>
    new Vue({
        el: '#app',
        data: {
            novaLista: '', // Armazena a nova lista de perfis do formulário
            naoRegistrados: [], // Armazena os perfis não registrados retornados pela comparação
            dataSelecionada: '', // Armazena a data selecionada
            comparar: null
        },
        methods: {
            inserirTodosPerfis() {
                // Certifique-se de que perfis não registrados existam
                if (this.naoRegistrados.length === 0) {
                    alert('Nenhum perfil disponível para inserção.');
                    return;
                }

                // Obtém a data atual se nenhuma data for selecionada
                // Data e hora no formato YYYY-MM-DD HH:mm:ss
                const dataCadastro = this.dataSelecionada && typeof this.dataSelecionada === 'string' ?
                    this.dataSelecionada + ' ' + new Date().toLocaleTimeString() :
                    new Date().toISOString().replace('T', ' ').split('.')[0];


                // Cria um array de objetos com perfil e data de cadastro
                const perfisParaInserir = this.naoRegistrados.map(perfil => ({
                    username: perfil,
                    data_cadastro: dataCadastro
                }));

                //console.log('Perfis para inserir:', perfisParaInserir); // Log para verificar os dados

                // Envia todos os perfis de uma vez para o backend usando Axios
                axios.post('../../api/inserir_novos_perfis_api.php', {
                        perfis: perfisParaInserir
                    })
                    .then(response => {
                        console.log('Resposta do servidor:', response.data);
                        if (response.data.status === 'success') {
                            alert('Perfis inseridos com sucesso!');
                        } else {
                            alert('Erro ao inserir perfis: ' + response.data.message);
                        }
                    })
                    .catch(error => {
                        console.error('Erro ao inserir perfis:', error);
                    });
            },
            compararPerfis() {
                // Exibe a modal imediatamente após o envio
                this.showModal = true;

                // Cria um objeto FormData para enviar os dados no formato correto
                let formData = new FormData();
                formData.append('nova_lista', this.novaLista);

                // Envia a lista de perfis via Axios para o backend
                axios.post('../../api/comparar_api.php', formData)
                    .then(response => {
                        // Converte o objeto de resposta em um array
                        let perfisArray = Object.values(response.data);
                        // Remove caracteres desnecessários (\r)
                        this.naoRegistrados = perfisArray.map(perfil => perfil.replace(/\r/g, ''));
                        this.comparar = 1;
                        // Log para ver o que está sendo retornado
                        //console.log(this.naoRegistrados);
                    })
                    .catch(error => {
                        console.error('Erro ao comparar perfis:', error);
                    });
            },
            closeModal() {
                this.showModal = false;
            }
        }
    });
</script>

<?php include '../footer.php'; ?>