<?php
require 'session.php';
checkLogin();
checkAdmin();

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Painel do Administrador</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <div class="container mt-5">
        <h2>Painel do Administrador</h2>
        <p>Aqui você pode gerenciar o sistema.</p>
    </div>
</body>
</html>