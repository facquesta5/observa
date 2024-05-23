<?php
require 'vendor/autoload.php';
$db = App\Database::getInstance();
$db->query("SELECT * FROM carros");
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Carros</title>
    <!-- Inclua o CSS do Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <?php include 'navbar.php'; ?>
    <div class="container mt-5">
        <h2>Carros Disponíveis</h2>
        <table class="table">
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
                <?php foreach($db->results() as $carro): ?>
                    <tr>
                        <td><?= htmlspecialchars($carro->id) ?></td>
                        <td><?= htmlspecialchars($carro->marca) ?></td>
                        <td><?= htmlspecialchars($carro->modelo) ?></td>
                        <td><?= htmlspecialchars($carro->ano) ?></td>
                        <td>R$ <?= htmlspecialchars(number_format($carro->preco, 2, ',', '.')) ?></td>
                        <td><?= $carro->disponivel ? 'Sim' : 'Não' ?></td>
                        <td><?= htmlspecialchars($carro->criado_em) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <!-- Inclua o JS do Bootstrap -->
    
</body>
</html>

