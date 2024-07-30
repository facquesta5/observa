<?php
// Função para obter o prefixo da URL
function getBaseUrl()
{
    // Verifica se o servidor está usando HTTPS
    $isHttps = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on';

    // Monta o prefixo da URL baseado no protocolo e no host
    $baseUrl = ($isHttps ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'];

    // Adiciona a porta, se necessário
    if ($_SERVER['SERVER_PORT'] !== '80' && $_SERVER['SERVER_PORT'] !== '443') {
        $baseUrl .= ':' . $_SERVER['SERVER_PORT'];
    }

    // Verifica se o servidor é localhost
    if ($_SERVER['SERVER_NAME'] === 'localhost' || $_SERVER['SERVER_ADDR'] === '127.0.0.1') {
        // Adiciona o nome do projeto ao URL base
        $baseUrl .= '/basic-php_oo-vue';
    }

    return $baseUrl;
}

// Obtém o prefixo da URL
$baseUrl = getBaseUrl();
// Função para gerar breadcrumb
function generateBreadcrumb($baseUrl)
{
    // Obtenha a URL atual
    $currentUrl = $_SERVER['REQUEST_URI'];

    // Remova o prefixo do projeto se estiver no localhost
    if (strpos($currentUrl, '/basic-php_oo-vue') !== false) {
        $currentUrl = str_replace('/basic-php_oo-vue', '', $currentUrl);
    }

    // Parse a URL para separar o path e a query string
    $parsedUrl = parse_url($currentUrl);
    $path = $parsedUrl['path'];
    $query = isset($parsedUrl['query']) ? $parsedUrl['query'] : '';

    // Remova o diretório "views" da URL
    $path = str_replace('/views', '', $path);
    // Remova a extensão ".php" da URL
    $path = str_replace('.php', '', $path);
    // Separe a URL em partes
    $urlParts = explode('/', trim($path, '/'));

    // Crie o breadcrumb
    $breadcrumb = '<nav aria-label="breadcrumb"><ol class="breadcrumb">';

    // Se estivermos na página inicial, mostrar apenas "Home"
    if (empty($urlParts[0]) || $urlParts[0] == 'index') {
        $breadcrumb .= '<li class="breadcrumb-item active" aria-current="page">Home</li>';
    } else {
        $breadcrumb .= '<li class="breadcrumb-item"><a href="' . $baseUrl . '/views/index.php">Home</a></li>';
        $currentPath = '';

        // Ajusta a URL para admin
        if ($urlParts[0] == 'dashboard_admin') {
            array_unshift($urlParts, 'admin');
            $urlParts[1] = 'dashboard_admin';
        }

        // Último item não deve ter link
        $lastIndex = count($urlParts) - 1;
        foreach ($urlParts as $index => $part) {
            if (!empty($part)) {
                $currentPath .= '/' . $part;

                // Verifica se a parte é "Admin" e ajusta o link
                if (strtolower($part) == 'admin') {
                    $breadcrumb .= '<li class="breadcrumb-item"><a href="' . $baseUrl . '/views/admin/dashboard_admin.php">' . ucfirst($part) . '</a></li>';
                } else {
                    // Tratar o caso específico da página de usuários com parâmetro page
                    if ($part == 'usuarios' && !empty($query)) {
                        $breadcrumb .= '<li class="breadcrumb-item active" aria-current="page">Usuarios</li>';
                    } else {
                        if ($index == $lastIndex) {
                            // Último item, sem link
                            $breadcrumb .= '<li class="breadcrumb-item active" aria-current="page">' . ucfirst($part) . '</li>';
                        } else {
                            // Outros itens, com link
                            $breadcrumb .= '<li class="breadcrumb-item"><a href="' . $baseUrl . '/views' . $currentPath . '.php">' . ucfirst($part) . '</a></li>';
                        }
                    }
                }
            }
        }
    }
    $breadcrumb .= '</ol></nav>';
    return $breadcrumb;
}
$breadcrumb = generateBreadcrumb($baseUrl);
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
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Meu Sistema</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo $baseUrl ?>/views/index.php">Início</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo $baseUrl ?>/views/admin/usuarios.php">Usuários</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo $baseUrl ?>/views/admin/carros.php">Carros</a>
                </li>
                <li class="nav-item" id="theme-switcher">
                    <a class="nav-link" @click="switchTheme()">
                        Switch theme
                        <i id="icon" :class="iconClass"></i>
                    </a>
                </li>
                <!-- Adicione outros itens de menu conforme necessário -->
            </ul>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">

                <?php if (isset($_SESSION['usuario_id'])) : ?>
                    <li class="nav-item" style="border-right: solid 1px #00000080;">
                        <a class="nav-link" style="cursor: auto;"><?php echo $_SESSION['nome'] . ': ' . $_SESSION['tipo']; ?></a>
                    </li>
                    <?php if ($_SESSION['tipo_usuario_id'] == 1 || $_SESSION['tipo_usuario_id'] == 2)  : ?>
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
    </nav>

    </div>
    <div id="app">
        <!-- Breadcrumb -->
        <div class="container mt-2">
            <?php echo $breadcrumb; ?>
        </div>
        <div class="container mt-2">