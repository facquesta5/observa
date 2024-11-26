<?php
if (!isset($_SESSION['usuario_id'])) {
    require '../vendor/autoload.php';
}
require '../../vendor/autoload.php';

use App\Base;

$baseurl = new Base();
$baseUrl = $baseurl->getBaseUrl();

?>

<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="<?php echo $baseUrl ?>/public/css/style.css">
</head>

<body>
    <link rel="stylesheet" :href="themeStylesheet" id="theme-stylesheet">
    <nav class="navbar navbar-expand-lg navbar-light bg-light pt-2">
        <a class="navbar-brand" style="padding-top: unset;" href="#">Meu Sistema</a>
        <div class="main-menu">
            <div class="menu-esquerda" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo $baseUrl ?>/views/index.php">Início</a>
                    </li>
                    <?php if (isset($_SESSION['usuario_id'])) : ?>

                        <?php if ($_SESSION['tipo_usuario_id'] == 1 || $_SESSION['tipo_usuario_id'] == 2) : ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo $baseUrl ?>/views/admin/user_list_view.php">Usuários</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Monitorar
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="<?php echo $baseUrl ?>/views/admin/comparar.php">Comparar</a>
                                    <a class="dropdown-item" href="#">Linha do tempo</a>
                                </div>
                            </li>

                        <?php endif; ?>

                    <?php endif; ?>
                </ul>
            </div>
            <div class="collapse navbar-collapse menu-direita">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item" id="theme-switcher">
                        <a class="nav-link" @click="switchTheme()">
                            <i id="icon" style="margin-top: 6px;" :class="iconClass"></i>
                        </a>
                    </li>
                    <?php if (isset($_SESSION['usuario_id'])) : ?>
                        <li class="nav-item" style="border-right: solid 1px #00000080;">
                            <a class="nav-link" style="cursor: auto;"><strong><?php echo $_SESSION['nome'] . ':</strong> ' . $_SESSION['tipo']; ?></a>
                        </li>
                        <?php if ($_SESSION['tipo_usuario_id'] == 1 || $_SESSION['tipo_usuario_id'] == 2) : ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo $baseUrl ?>/views/logout.php">Logout</a>
                            </li>
                        <?php endif; ?>
                    <?php else : ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo $baseUrl ?>/views/login.php">Login</a>
                        </li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
    </nav>

    </div>
    <div id="app">
        <!-- Breadcrumb -->
        <!-- <div class="container mt-2">
            <?php //echo $breadcrumb; 
            ?>
        </div> -->
        <div class="container mt-2">