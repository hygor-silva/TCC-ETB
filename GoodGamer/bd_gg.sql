-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16-Out-2015 às 22:15
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bd_gg`
--
CREATE DATABASE IF NOT EXISTS `bd_gg` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_gg`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `capa`
--

CREATE TABLE IF NOT EXISTS `capa` (
`id_capa` int(11) NOT NULL,
  `tipo_capa` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `capa`
--

INSERT INTO `capa` (`id_capa`, `tipo_capa`) VALUES
(1, 'Dura'),
(2, 'Plastico'),
(3, 'BlueRay');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `cpf_cliente` varchar(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone_pessoal` varchar(10) NOT NULL,
  `telefone_recado` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cpf_cliente`, `nome`, `telefone_pessoal`, `telefone_recado`, `email`) VALUES
('22222222222', 'Tício ', '89898989', '98989898', 'ticio@gmail.com'),
('33333333333', 'Mévio', '87878787', '78787878', 'mevio@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
`id_empresa` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cnpj` int(11) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `razao_social` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
`id_funcionario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone_pessoal` varchar(10) NOT NULL,
  `telefone_recado` varchar(10) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `login` varchar(25) NOT NULL,
  `senha` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `id_perfil`, `nome`, `cpf`, `telefone_pessoal`, `telefone_recado`, `endereco`, `email`, `login`, `senha`) VALUES
(1, 1, 'Administrador do Sistema', '11111111111', '1111111111', '1111111111', 'endereço do administrador', 'email@admin.com', 'admin', '1'),
(2, 2, 'Oreia Seca', '44444444444', '80908090', '09809080', 'Riacho 2 City', 'oreia@gmail.com', 'estagiario', '1'),
(3, 3, 'Steev', '12345678900', '82822828', '28288282', 'Riacho 2 City', 'Steev@gmail.com', 'steev', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
`id_menu` int(11) NOT NULL,
  `menu` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `icone` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`id_menu`, `menu`, `link`, `icone`) VALUES
(1, 'Produtos', 'listar_produto.jsp', 'imagens/produto.png'),
(2, 'Vendas', 'verificar_venda_aberta.do', 'imagens/venda.png'),
(3, 'Clientes', 'listar_cliente.jsp', 'imagens/cliente.png'),
(4, 'Funcionarios', 'listar_funcionario.jsp', 'imagens/funcionario.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

CREATE TABLE IF NOT EXISTS `menu_perfil` (
  `id_menu` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`id_menu`, `id_perfil`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(2, 2),
(1, 3),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `midia`
--

CREATE TABLE IF NOT EXISTS `midia` (
`id_midia` int(11) NOT NULL,
  `tipo_midia` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `midia`
--

INSERT INTO `midia` (`id_midia`, `tipo_midia`) VALUES
(1, 'DVD'),
(2, 'BlueRay');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
`id_perfil` int(11) NOT NULL,
  `perfil` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Estagiário'),
(3, 'Vendedor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
`id_produto` int(11) NOT NULL,
  `id_capa` int(11) NOT NULL,
  `id_midia` int(11) NOT NULL,
  `descricao_produto` varchar(200) NOT NULL,
  `preco` double NOT NULL,
  `quantidade_estoque` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `id_capa`, `id_midia`, `descricao_produto`, `preco`, `quantidade_estoque`) VALUES
(1, 3, 1, 'LoL', 10, 16),
(2, 2, 2, 'Dota', 20, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_venda`
--

CREATE TABLE IF NOT EXISTS `produto_venda` (
  `id_produto` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `quantidade_itens` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto_venda`
--

INSERT INTO `produto_venda` (`id_produto`, `id_venda`, `quantidade_itens`) VALUES
(1, 1, 3),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 7, 3),
(2, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
`id_venda` int(11) NOT NULL,
  `cpf_cliente` varchar(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `aberta` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id_venda`, `cpf_cliente`, `valor`, `aberta`) VALUES
(1, '22222222222', 70, 1),
(2, NULL, 10, 1),
(3, NULL, 0, 1),
(4, NULL, 109.9, 1),
(5, '33333333333', 10, 1),
(7, '22222222222', 30, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `capa`
--
ALTER TABLE `capa`
 ADD PRIMARY KEY (`id_capa`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`cpf_cliente`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`id_empresa`), ADD KEY `fk_empresa_funcionario1_idx` (`id_funcionario`), ADD KEY `fk_empresa_produto1_idx` (`id_produto`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
 ADD PRIMARY KEY (`id_funcionario`), ADD KEY `fk_atendente_perfil1_idx` (`id_perfil`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `menu_perfil`
--
ALTER TABLE `menu_perfil`
 ADD PRIMARY KEY (`id_menu`,`id_perfil`), ADD KEY `fk_menu_has_perfil_perfil1_idx` (`id_perfil`), ADD KEY `fk_menu_has_perfil_menu1_idx` (`id_menu`);

--
-- Indexes for table `midia`
--
ALTER TABLE `midia`
 ADD PRIMARY KEY (`id_midia`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
 ADD PRIMARY KEY (`id_perfil`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
 ADD PRIMARY KEY (`id_produto`), ADD KEY `fk_produto_capa1_idx` (`id_capa`), ADD KEY `fk_produto_midia1_idx` (`id_midia`);

--
-- Indexes for table `produto_venda`
--
ALTER TABLE `produto_venda`
 ADD PRIMARY KEY (`id_produto`,`id_venda`), ADD KEY `fk_produto_has_venda_venda1_idx` (`id_venda`), ADD KEY `fk_produto_has_venda_produto1_idx` (`id_produto`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
 ADD PRIMARY KEY (`id_venda`), ADD KEY `fk_venda_cliente1_idx` (`cpf_cliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `capa`
--
ALTER TABLE `capa`
MODIFY `id_capa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `midia`
--
ALTER TABLE `midia`
MODIFY `id_midia` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `empresa`
--
ALTER TABLE `empresa`
ADD CONSTRAINT `fk_empresa_funcionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_empresa_produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
ADD CONSTRAINT `fk_atendente_perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
ADD CONSTRAINT `fk_menu_has_perfil_menu1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_menu_has_perfil_perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
ADD CONSTRAINT `fk_produto_capa1` FOREIGN KEY (`id_capa`) REFERENCES `capa` (`id_capa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_produto_midia1` FOREIGN KEY (`id_midia`) REFERENCES `midia` (`id_midia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto_venda`
--
ALTER TABLE `produto_venda`
ADD CONSTRAINT `fk_produto_has_venda_produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_produto_has_venda_venda1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
ADD CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
