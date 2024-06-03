<?php
require '../../vendor/autoload.php';

use App\Usuario;

$usuarios = new Usuario();
$usuarios->checkAdmin();
//* Paginação
//* Definir número de usuários por página
$limit = 10;
// Obter a página atual a partir do parâmetro GET, se não estiver definida, usar a primeira página
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $limit;
// Listar usuários com limite e deslocamento
$usuariosList = $usuarios->listar($limit, $offset);
// Obter o número total de usuários para calcular o número de páginas
$totalUsuarios = $usuarios->contarUsuarios();
$totalPages = ceil($totalUsuarios / $limit);
?>
<?php include '../navbar.php'; ?>
<div class="container">
    <div class="row" style="justify-content: space-between; align-items: baseline; margin-right: 0px; margin-left: 0px;">
        <h5 style="width: fit-content;">Usuários</h5>
        <a href="<?php echo $baseUrl; ?>/views/admin/usuario_cadastrar.php" class="btn btn-primary mb-2">Cadastrar Usuário</a>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Nome</th>
                <th>Email</th>
                <th>Criado em</th>
                <th>Tipo</th>
                <th>Ativo</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody style="font-size: small;">
            <?php foreach ($usuariosList as $usuario) : ?>
                <tr>
                    <td><?php echo $usuario['nome']; ?></td>
                    <td><?php echo $usuario['email']; ?></td>
                    <td><?php echo $usuario['criado_em']; ?></td>
                    <td><?php echo $usuario['tipo']; ?></td>
                    <td><?php echo ($usuario['ativo'] == 1) ? 'Sim' : 'Não'; ?></td>
                    <td><a href="">alterar</a> | <a href="">inativar</a></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div class="row" style="justify-content: center">
        <nav>
            <ul class="pagination">
                <?php for ($i = 1; $i <= $totalPages; $i++) : ?>
                    <li class="page-item <?php echo $i == $page ? 'active' : ''; ?>">
                        <a class="page-link" href="?page=<?php echo $i; ?>"><?php echo $i; ?></a>
                    </li>
                <?php endfor; ?>
            </ul>
        </nav>
    </div>
</div>
<?php include '../footer.php'; ?>