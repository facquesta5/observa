<?php
namespace App;

use PDO;
use PDOException;
class Base
{

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
            $baseUrl .= '/basic-php_oo-vue-2';
        }

        return $baseUrl;
    }

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
}
