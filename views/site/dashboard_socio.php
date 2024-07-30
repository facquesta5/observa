<?php
require '../../vendor/autoload.php';
require '../session.php';

use App\Usuario;

$usuarioObj = new Usuario();
$usuarioObj->checkSocio();
?>

<?php include '../navbar.php'; ?>
<div class="container">
    <p>Você é um Socio.</p>
</div>
<?php include '../footer.php'; ?>