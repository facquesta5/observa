<?php 
session_start();
if (!isset($_SESSION['usuario_id']) || $_SESSION['tipo_usuario_id'] != 3) {
    header('Location: login.php');
    exit();
}
?>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Dashboard do Operador</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Adicione outros estilos CSS se necessário -->
</head>
<body>

    <?php include 'navbar.php'; ?>
    <div class="container mt-5">
            <p>Você é um Operador.</p>
    </div>
</body>
</html>