<?php
require '../../vendor/autoload.php';
use App\Usuario;
$usuarioObj = new Usuario();
$usuarioObj->checkAdmin();
?>
<?php include '../navbar.php'; ?>
<div class="container">
    <p>Você é um Administrador.</p>
</div>
<?php include '../footer.php'; ?>

