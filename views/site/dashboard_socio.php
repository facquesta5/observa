<?php
require '../../vendor/autoload.php';
require '../session.php';
use App\Usuario;
$usuarioObj = new Usuario();
$usuarioObj->checkSocio();
?>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Dashboard do Operador</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Adicione outros estilos CSS se necessário -->
</head>
<body>

    <?php include '../navbar.php'; ?>
    <div class="container">
            <p>Você é um Socio.</p>
    </div>
</body>
</html>
