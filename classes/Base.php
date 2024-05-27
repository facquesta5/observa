<?php


class Base {

    // Função para obter o prefixo da URL
    function getBaseUrl() {
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

}