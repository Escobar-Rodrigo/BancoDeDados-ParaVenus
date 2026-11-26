-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/11/2026 às 01:19
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_paravenus`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_administrador`
--

CREATE TABLE `tb_administrador` (
  `id_admin` int(11) NOT NULL,
  `nome_admin` varchar(50) NOT NULL,
  `email_admin` varchar(50) NOT NULL,
  `senha_admin` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_avaliacao`
--

CREATE TABLE `tb_avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `id_usuario` int(50) NOT NULL,
  `id_empresa` int(50) NOT NULL,
  `nota` int(50) NOT NULL,
  `comentario` varchar(14) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_candidatura`
--

CREATE TABLE `tb_candidatura` (
  `id_candidatura` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_vaga` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_curriculo`
--

CREATE TABLE `tb_curriculo` (
  `id_curriculo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `linkedin_url` varchar(500) NOT NULL,
  `data_atualizacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_denuncia`
--

CREATE TABLE `tb_denuncia` (
  `id_denuncia` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_empresas`
--

CREATE TABLE `tb_empresas` (
  `id_empresa` int(11) NOT NULL,
  `nome_empresa` varchar(50) NOT NULL,
  `email_empresa` varchar(50) NOT NULL,
  `senha_email` varchar(50) NOT NULL,
  `cnpj_empresa` varchar(14) NOT NULL,
  `descr_empresa` varchar(255) NOT NULL,
  `setor_empresa` varchar(50) NOT NULL,
  `localizacao_empresa` varchar(50) NOT NULL,
  `data_cadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuarios`
--

CREATE TABLE `tb_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(50) NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `senha_usuario` varchar(50) NOT NULL,
  `data_nascimento` int(14) NOT NULL,
  `linkedin_url` int(255) NOT NULL,
  `data_cadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_vaga`
--

CREATE TABLE `tb_vaga` (
  `id_vaga` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `titulo_vaga` varchar(50) NOT NULL,
  `descr_vaga` varchar(50) NOT NULL,
  `area_vaga` varchar(14) NOT NULL,
  `localizacao_vaga` varchar(255) NOT NULL,
  `salario_vaga` int(50) NOT NULL,
  `data_publicacao` datetime NOT NULL,
  `status_vaga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_administrador`
--
ALTER TABLE `tb_administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Índices de tabela `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `tb_avaliacao_ibfk_1` (`id_empresa`);

--
-- Índices de tabela `tb_candidatura`
--
ALTER TABLE `tb_candidatura`
  ADD PRIMARY KEY (`id_candidatura`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_vaga` (`id_vaga`);

--
-- Índices de tabela `tb_curriculo`
--
ALTER TABLE `tb_curriculo`
  ADD PRIMARY KEY (`id_curriculo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `tb_denuncia`
--
ALTER TABLE `tb_denuncia`
  ADD PRIMARY KEY (`id_denuncia`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `tb_denuncia_ibfk_1` (`id_usuario`);

--
-- Índices de tabela `tb_empresas`
--
ALTER TABLE `tb_empresas`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Índices de tabela `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices de tabela `tb_vaga`
--
ALTER TABLE `tb_vaga`
  ADD PRIMARY KEY (`id_vaga`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_administrador`
--
ALTER TABLE `tb_administrador`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_candidatura`
--
ALTER TABLE `tb_candidatura`
  MODIFY `id_candidatura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_curriculo`
--
ALTER TABLE `tb_curriculo`
  MODIFY `id_curriculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_denuncia`
--
ALTER TABLE `tb_denuncia`
  MODIFY `id_denuncia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_empresas`
--
ALTER TABLE `tb_empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_vaga`
--
ALTER TABLE `tb_vaga`
  MODIFY `id_vaga` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
  ADD CONSTRAINT `tb_avaliacao_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresas` (`id_empresa`);

--
-- Restrições para tabelas `tb_candidatura`
--
ALTER TABLE `tb_candidatura`
  ADD CONSTRAINT `tb_candidatura_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tb_candidatura_ibfk_2` FOREIGN KEY (`id_vaga`) REFERENCES `tb_vaga` (`id_vaga`);

--
-- Restrições para tabelas `tb_curriculo`
--
ALTER TABLE `tb_curriculo`
  ADD CONSTRAINT `tb_curriculo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`);

--
-- Restrições para tabelas `tb_denuncia`
--
ALTER TABLE `tb_denuncia`
  ADD CONSTRAINT `tb_denuncia_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`);

--
-- Restrições para tabelas `tb_vaga`
--
ALTER TABLE `tb_vaga`
  ADD CONSTRAINT `tb_vaga_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresas` (`id_empresa`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
