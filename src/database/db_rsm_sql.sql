-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/04/2025 às 21:00
-- Versão do servidor: 8.0.40
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_rsm.sql`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contato_rsm`
--

CREATE TABLE `tb_contato_rsm` (
  `id` int NOT NULL,
  `primeiro_nome` varchar(50) NOT NULL,
  `ultimo_nome` varchar(50) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `ddd` int NOT NULL, 
  `celular` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `mes_aniversario` int NOT NULL,
  `cpf` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_ddd_rsm`
--

CREATE TABLE `tb_ddd_rsm` (
  `id` int NOT NULL,
  `ddd` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tb_ddd_rsm`
--

INSERT INTO `tb_ddd_rsm` (`id`, `ddd`) VALUES
(1, '11'),
(2, '12'),
(3, '13'),
(4, '14'),
(5, '15'),
(6, '16'),
(7, '17'),
(8, '18'),
(9, '19'),
(10, '21'),
(11, '22'),
(12, '24'),
(13, '27'),
(14, '28'),
(15, '31'),
(16, '32'),
(17, '33'),
(18, '34'),
(19, '35'),
(20, '37'),
(21, '38'),
(22, '41'),
(23, '42'),
(24, '43'),
(25, '44'),
(26, '45'),
(27, '46'),
(28, '47'),
(29, '48'),
(30, '49'),
(31, '51'),
(32, '53'),
(33, '54'),
(34, '55'),
(35, '61'),
(36, '62'),
(37, '63'),
(38, '64'),
(39, '65'),
(40, '66'),
(41, '67'),
(42, '68'),
(43, '69'),
(44, '71'),
(45, '73'),
(46, '74'),
(47, '75'),
(48, '77'),
(49, '79'),
(50, '81'),
(51, '82'),
(52, '83'),
(53, '84'),
(54, '85'),
(55, '86'),
(56, '87'),
(57, '88'),
(58, '89'),
(59, '91'),
(60, '92'),
(61, '93'),
(62, '94'),
(63, '95'),
(64, '96'),
(65, '97'),
(66, '98'),
(67, '99');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_estado_rsm`
--

CREATE TABLE `tb_estado_rsm` (
  `id` int NOT NULL,
  `sigla` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tb_estado_rsm`
--

INSERT INTO `tb_estado_rsm` (`id`, `sigla`) VALUES
(1, 'AC'),
(2, 'AL'),
(3, 'AP'),
(4, 'AM'),
(5, 'BA'),
(6, 'CE'),
(7, 'DF'),
(8, 'ES'),
(9, 'GO'),
(10, 'MA'),
(11, 'MT'),
(12, 'MS'),
(13, 'MG'),
(14, 'PA'),
(15, 'PB'),
(16, 'PR'),
(17, 'PE'),
(18, 'PI'),
(19, 'RJ'),
(20, 'RN'),
(21, 'RS'),
(22, 'RO'),
(23, 'RR'),
(24, 'SC'),
(25, 'SP'),
(26, 'SE'),
(27, 'TO');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_ddd_rsm`
--
ALTER TABLE `tb_ddd_rsm`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_estado_rsm`
--
ALTER TABLE `tb_estado_rsm`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_ddd_rsm`
--
ALTER TABLE `tb_ddd_rsm`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `tb_estado_rsm`
--
ALTER TABLE `tb_estado_rsm`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
