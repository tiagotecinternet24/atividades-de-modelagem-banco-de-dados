-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/02/2025 às 12:49
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
-- Banco de dados: `catalogo_de_filmes`
--
CREATE DATABASE IF NOT EXISTS `catalogo_de_filmes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `catalogo_de_filmes`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `detalhes`
--

CREATE TABLE `detalhes` (
  `id` int(11) NOT NULL,
  `duracao` int(11) NOT NULL,
  `sinopse` text NOT NULL,
  `bilheteria` decimal(16,2) DEFAULT NULL,
  `orcamento` decimal(16,2) DEFAULT NULL,
  `filme_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `detalhes`
--

INSERT INTO `detalhes` (`id`, `duracao`, `sinopse`, `bilheteria`, `orcamento`, `filme_id`) VALUES
(2, 170, 'O Senhor dos Anéis: A Sociedade do Anel, de J.R.R. Tolkien, é o primeiro livro da trilogia que narra a jornada de Frodo Bolseiro, um hobbit que recebe a missão de destruir um anel mágico e poderoso que pode trazer grande mal para o mundo. O anel foi criado pelo Senhor das Trevas, Sauron, e seu poder corruptor ameaça toda a Terra-média. Frodo, junto com um grupo de aliados — Aragorn, Gandalf, Legolas, Gimli, Boromir e outros hobbits, Sam, Merry e Pippin — forma a Sociedade do Anel, com o objetivo de levar o anel até o Monte da Perdição, onde ele deve ser destruído. A história mistura aventura, amizade, batalhas épicas e o confronto entre o bem e o mal.', 150007896.00, 100500000.00, 2),
(3, 145, 'Interstellar (2014), dirigido por Christopher Nolan, é um filme de ficção científica que explora temas como amor, tempo, espaço e a sobrevivência humana. A história se passa em um futuro distópico, onde a Terra está morrendo devido a desastres ecológicos, como tempestades de poeira. Cooper (Matthew McConaughey), um piloto e engenheiro, é recrutado por uma missão secreta para viajar através de um buraco de minhoca, localizado perto de Saturno, em busca de um novo planeta habitável para a humanidade.', NULL, NULL, 3),
(4, 125, 'Franquia de filmes de ação que começou em 2001, centrada em torno de corridas de rua, carros modificados e, eventualmente, assaltos e missões de espionagem de alta octanagem. O primeiro filme, Vingadores e Furiosos (2001), dirigido por Rob Cohen, apresenta o policial Brian O\'Conner (Paul Walker), que se infiltra em uma gangue de corridas de rua liderada por Dominic Toretto (Vin Diesel). A trama gira em torno da lealdade, amizade e traição, com o foco principal nas corridas ilegais e no mundo underground dos carros.', 150789000.00, 568749870.00, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `filmes`
--

CREATE TABLE `filmes` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `lancamento` date NOT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `filmes`
--

INSERT INTO `filmes` (`id`, `titulo`, `lancamento`, `genero_id`) VALUES
(2, 'O Senhor dos Anéis: A Sociedade do Anel', '2001-12-12', 3),
(3, 'Interestelar', '2014-10-10', 4),
(4, 'Velozes e Furiosos: Qualquer Um', '2008-05-05', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `generos`
--

INSERT INTO `generos` (`id`, `nome`) VALUES
(1, 'Suspense Infantil'),
(2, 'Ação'),
(3, 'Fantasia'),
(4, 'Ficção científica');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `detalhes`
--
ALTER TABLE `detalhes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalhes_filmes` (`filme_id`);

--
-- Índices de tabela `filmes`
--
ALTER TABLE `filmes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_filmes_generos` (`genero_id`);

--
-- Índices de tabela `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `detalhes`
--
ALTER TABLE `detalhes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `filmes`
--
ALTER TABLE `filmes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `detalhes`
--
ALTER TABLE `detalhes`
  ADD CONSTRAINT `fk_detalhes_filmes` FOREIGN KEY (`filme_id`) REFERENCES `filmes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `filmes`
--
ALTER TABLE `filmes`
  ADD CONSTRAINT `fk_filmes_generos` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
