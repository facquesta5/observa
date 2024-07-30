<?php
require '../../vendor/autoload.php';

use App\Perfil;
use App\Usuario;

$usuarioObj = new Usuario();
$usuarioObj->checkAdmin();

$perfilObj = new Perfil();



?>

<?php include '../navbar.php'; ?>
<div class="container">
    <h2>Armazenar Perfis do Instagram</h2>
    <p>Número de registros: <?php echo $perfilObj->contarRegistros(); ?></p>
    <form method="POST" action="armazenar_perfis.php">
        <div class="form-group">
            <label for="lista">Lista de Perfis</label>
            <textarea class="form-control" id="lista" name="lista" rows="10" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Armazenar</button>
    </form>

    <form method="POST" action="comparar_perfis.php" class="mt-4">
        <div class="form-group">
            <label for="nova_lista">Nova Lista de Perfis</label>
            <textarea class="form-control" id="nova_lista" name="nova_lista" rows="10" required></textarea>
        </div>
        <button type="submit" class="btn btn-secondary">Comparar Perfis</button>
    </form>
</div>
<?php include '../footer.php'; ?>