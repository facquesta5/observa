<?php
session_start();
require '../vendor/autoload.php';
?>
<?php include 'navbar.php'; ?>
<div class="container mt-5">
        <div class="jumbotron">
            <h1 class="display-4">Erro 404</h1>
            <p class="lead">A página que você está procurando não foi encontrada.</p>
            <hr class="my-4">
            <p>Verifique o endereço digitado ou volte para a página inicial.</p>
            <a class="btn btn-primary btn-lg" href="<?php echo $baseUrl ?>/views/index.php" role="button">Página Inicial</a>
        </div>
    </div>
<?php include 'footer.php'; ?>

