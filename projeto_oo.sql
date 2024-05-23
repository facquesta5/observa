-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Maio-2024 às 23:11
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_oo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carros`
--

CREATE TABLE `carros` (
  `id` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `disponivel` tinyint(1) DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `carros`
--

INSERT INTO `carros` (`id`, `marca`, `modelo`, `ano`, `preco`, `disponivel`, `criado_em`) VALUES
(1, 'Ford', 'Focus', 2020, '77.00', 1, '2024-05-14 13:33:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessoes`
--

CREATE TABLE `sessoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `expira_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_usuarios`
--

CREATE TABLE `tipos_usuarios` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipos_usuarios`
--

INSERT INTO `tipos_usuarios` (`id`, `tipo`) VALUES
(1, 'Administrador'),
(2, 'Sócio'),
(3, 'Operador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_usuario_id` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `criado_em`, `tipo_usuario_id`) VALUES
(1, 'Fernando Queiroz Acquesta', 'facquesta5@hotmail.com', '$2y$10$t1Cf7FVfhcoMKIAxLPQnvOkFmSbRSxs9JW/.rRvVEG.rY.eALgcj.', '2024-05-14 14:12:52', 2),
(2, 'Romer Simpsons', 'romer.simpsons@hotmail.com', '$2y$10$SsSv4Zsg8w5dLwu0fRYgN.JbuXHGQ/ludUEIf4DXVWWhh9YbMOLfm', '2024-05-14 14:13:47', 3),
(3, 'geronimo', 'gera@gmail.com', '$2y$10$fKxT7dIhOQMxnKeXYLZEcecXxjZkt4P1U7K6WSEgst1LzrsrPJiBq', '2024-05-14 16:00:19', 3),
(4, 'geronimo', 'g@gmail.com', '$2y$10$bZ6hmcvSSqM2R3KNwEWMV.vCHkVUVjpZr4UeNG5O3CTZFkdPLkpVi', '2024-05-14 16:00:32', 3),
(5, 'OnlinePoket', 'online@gmail.com', '$2y$10$DORikxUWkAeUYcmmm5H/7OyZNz4cG03KF0ZSq11HLD4Z4THrz.WUC', '2024-05-14 16:05:33', 3),
(7, 'Giovana', 'gi@hotmail.com', '$2y$10$ajCtTHxHF1sRmtkZ7XvbROZQc/fUJwcXXIlB2iFWIVdKXFOHdpC9q', '2024-05-14 16:08:06', 3),
(10, 'Otavio', 'otavio@gmail.com', '$2y$10$g3IdnvP335tn1cBmHQI.juFoKIKxZci2t9vpc0D7FnGLgwBQDBTAy', '2024-05-14 16:13:35', 3),
(15, 'RODOX', 'rodolfinho@gmail.cpom', '$2y$10$99hFOkV0Cavf.lAYsKlcn./LwYo.K6NH60fcojSldB5SixGw41NDS', '2024-05-20 19:48:34', 3),
(16, 'Juninho Play', 'juninho@gmail.com', '$2y$10$jpH/y0.ccvGC7OF26R9gDOn3hcEDs/8c7k1jFlcy1/INE1uHKUjdG', '2024-05-20 20:00:07', 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `usuarios_ibfk_1` (`tipo_usuario_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carros`
--
ALTER TABLE `carros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD CONSTRAINT `sessoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipos_usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
