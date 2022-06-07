-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Jun-2022 às 06:25
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lancult_bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `discursao`
--

CREATE TABLE `discursao` (
  `ID` int(11) NOT NULL,
  `TITULO` varchar(100) NOT NULL,
  `DESCRICAO` varchar(500) NOT NULL,
  `DATA` datetime DEFAULT NULL,
  `IMAGEM` varchar(255) DEFAULT NULL,
  `ATIVO` enum('ATIVO','INATIVO') DEFAULT 'ATIVO',
  `USUARIOS_ID` int(11) NOT NULL,
  `IDIOMAS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `idiomas`
--

CREATE TABLE `idiomas` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `idiomas`
--

INSERT INTO `idiomas` (`ID`, `NOME`) VALUES
(1, 'Português'),
(2, 'Inglês'),
(3, 'Espanhol'),
(4, 'Francês');

-- --------------------------------------------------------

--
-- Estrutura da tabela `paises`
--

CREATE TABLE `paises` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `paises`
--

INSERT INTO `paises` (`ID`, `NOME`) VALUES
(1, 'Brasil'),
(2, 'Reino Unido'),
(3, 'Estados Unidos'),
(4, 'Espanha'),
(5, 'França'),
(6, 'Outros países');

-- --------------------------------------------------------

--
-- Estrutura da tabela `respostas`
--

CREATE TABLE `respostas` (
  `ID` int(11) NOT NULL,
  `DESCRICAO` varchar(500) NOT NULL,
  `DATA` datetime DEFAULT NULL,
  `PONTUACAO` tinyint(4) NOT NULL DEFAULT 0,
  `DISCURSAO_ID` int(11) NOT NULL,
  `USUARIOS_ID` int(11) NOT NULL,
  `votos` int(11) NOT NULL DEFAULT 0,
  `ATIVO` enum('ATIVO','INATIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE `tipo` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo`
--

INSERT INTO `tipo` (`ID`, `NOME`) VALUES
(1, 'Estudante'),
(2, 'Professor'),
(3, 'Nativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(80) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `DATA_CADASTRAMENTO` datetime DEFAULT NULL,
  `PAISES_ID` int(11) NOT NULL,
  `TIPO_ID` int(11) NOT NULL,
  `STATUS` enum('ATIVO','INATIVO') DEFAULT 'ATIVO',
  `PERFIL` enum('ADMIN','USUARIO') DEFAULT 'USUARIO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`ID`, `NOME`, `EMAIL`, `PASSWORD`, `DATA_CADASTRAMENTO`, `PAISES_ID`, `TIPO_ID`, `STATUS`, `PERFIL`) VALUES
(44, 'Maria V', 'maria@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-06-05 16:06:58', 1, 1, 'ATIVO', 'USUARIO'),
(45, 'Julia Ba', 'julia@gmail.com', 'df6d2338b2b8fce1ec2f6dda0a630eb0', '2022-06-06 22:06:09', 2, 2, 'ATIVO', 'USUARIO');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `discursao`
--
ALTER TABLE `discursao`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_DISCURSAO_USUARIOS1_idx` (`USUARIOS_ID`),
  ADD KEY `fk_DISCURSAO_IDIOMAS1_idx` (`IDIOMAS_ID`);

--
-- Índices para tabela `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `respostas`
--
ALTER TABLE `respostas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_RESPOSTAS_DISCURSAO1_idx` (`DISCURSAO_ID`),
  ADD KEY `fk_RESPOSTAS_USUARIOS1_idx` (`USUARIOS_ID`);

--
-- Índices para tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`),
  ADD KEY `fk_USUARIOS_PAISES1_idx` (`PAISES_ID`),
  ADD KEY `fk_USUARIOS_TIPO1_idx` (`TIPO_ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `discursao`
--
ALTER TABLE `discursao`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de tabela `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `paises`
--
ALTER TABLE `paises`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `respostas`
--
ALTER TABLE `respostas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `discursao`
--
ALTER TABLE `discursao`
  ADD CONSTRAINT `fk_DISCURSAO_IDIOMAS1` FOREIGN KEY (`IDIOMAS_ID`) REFERENCES `idiomas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_DISCURSAO_USUARIOS1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `usuarios` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `respostas`
--
ALTER TABLE `respostas`
  ADD CONSTRAINT `fk_RESPOSTAS_DISCURSAO1` FOREIGN KEY (`DISCURSAO_ID`) REFERENCES `discursao` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_RESPOSTAS_USUARIOS1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `usuarios` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_USUARIOS_PAISES1` FOREIGN KEY (`PAISES_ID`) REFERENCES `paises` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_USUARIOS_TIPO1` FOREIGN KEY (`TIPO_ID`) REFERENCES `tipo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
