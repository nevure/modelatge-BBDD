-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2020 at 04:25 PM
-- Server version: 10.3.22-MariaDB-1
-- PHP Version: 7.3.15-3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `culampolla`
--
CREATE DATABASE IF NOT EXISTS `culampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `culampolla`;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(64) NOT NULL,
  `via` varchar(64) NOT NULL,
  `numero` varchar(24) NOT NULL,
  `pis` varchar(8) NOT NULL,
  `puerta` varchar(8) NOT NULL,
  `codigoPostal` varchar(12) NOT NULL,
  `ciudad` varchar(32) NOT NULL,
  `provincia` varchar(32) NOT NULL,
  `pais` varchar(32) NOT NULL,
  `telefon` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `data_alta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `via`, `numero`, `pis`, `puerta`, `codigoPostal`, `ciudad`, `provincia`, `pais`, `telefon`, `email`, `data_alta`) VALUES
(1, 'Ana Buenavista', 'lluna', '4bis', '3', 'esq.', '08036', 'Barcelona', 'Barcelona', 'Espanya', '+34937983454', 'ana@buenavista.com', '2020-06-01'),
(2, 'Joan Carles ', 'pl sol', '5', 'dreta 5', '2', '08012', 'Barcelona', 'Barcelona', 'Espanya', '+346583452109', 'jc@jca.com', '2020-05-12'),
(3, 'Nona Castella', 'carrer tordera', '26', '3', '1', '08012', 'Barcelona', 'Barcelona', 'Espanya', '+34937653214', 'nona@mevacompanyia.com', '2020-06-05'),
(4, 'Ricard Fernández', 'carrer pi i margall', '26', '3', '1', '08012', 'Barcelona', 'Barcelona', 'Espanya', '+34937322214', 'ricard@mevacompanyia.com', '2020-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `detall_factures`
--

DROP TABLE IF EXISTS `detall_factures`;
CREATE TABLE `detall_factures` (
  `factura_id` int(11) NOT NULL,
  `ullera_id` int(11) NOT NULL,
  `pvp` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detall_factures`
--

INSERT INTO `detall_factures` (`factura_id`, `ullera_id`, `pvp`) VALUES
(1, 3, 241);

-- --------------------------------------------------------

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
CREATE TABLE `empleats` (
  `id_empleat` tinyint(4) NOT NULL,
  `Nom` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empleats`
--

INSERT INTO `empleats` (`id_empleat`, `Nom`) VALUES
(1, 'Carol Mirablau'),
(2, 'Pere Soler');

-- --------------------------------------------------------

--
-- Table structure for table `factures`
--

DROP TABLE IF EXISTS `factures`;
CREATE TABLE `factures` (
  `id_factura` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `empleat_id` tinyint(4) NOT NULL,
  `pvp_total` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `factures`
--

INSERT INTO `factures` (`id_factura`, `client_id`, `empleat_id`, `pvp_total`) VALUES
(1, 3, 1, 256);

-- --------------------------------------------------------

--
-- Table structure for table `marques`
--

DROP TABLE IF EXISTS `marques`;
CREATE TABLE `marques` (
  `id_marca` smallint(6) NOT NULL,
  `proveidor_id` smallint(6) NOT NULL,
  `nom` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marques`
--

INSERT INTO `marques` (`id_marca`, `proveidor_id`, `nom`) VALUES
(1, 2, 'Biosca STAR'),
(2, 2, 'Biosca LOW'),
(3, 1, 'BV fashion'),
(4, 1, 'BV winter'),
(5, 1, 'BV one');

-- --------------------------------------------------------

--
-- Table structure for table `proveidors`
--

DROP TABLE IF EXISTS `proveidors`;
CREATE TABLE `proveidors` (
  `id_proveidor` smallint(6) NOT NULL,
  `Nom` varchar(32) NOT NULL,
  `Via` varchar(32) NOT NULL,
  `número` varchar(8) NOT NULL,
  `pis` varchar(8) NOT NULL,
  `porta` varchar(8) NOT NULL,
  `codiPostal` varchar(12) NOT NULL,
  `Ciutat` varchar(32) NOT NULL,
  `Provincia` varchar(32) NOT NULL,
  `Pais` varchar(32) NOT NULL,
  `Telefon` varchar(16) NOT NULL,
  `Fax` varchar(16) NOT NULL,
  `NIF-CIF` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proveidors`
--

INSERT INTO `proveidors` (`id_proveidor`, `Nom`, `Via`, `número`, `pis`, `porta`, `codiPostal`, `Ciutat`, `Provincia`, `Pais`, `Telefon`, `Fax`, `NIF-CIF`) VALUES
(1, 'Bonavista tenics', 'palafrugell', '3', '', '', '08084', 'Badalona', 'Barcelona', 'Espanya', '+34933987634', '+34933987634', 'B23456134'),
(2, 'Ulleres Biosca', 'ciutat', '2', 'nau 3', '', '08214', 'Tordera', 'Barcelona', 'Espanya', '+3493356634', '+3493227634', 'B22156134');

-- --------------------------------------------------------

--
-- Table structure for table `recomanacions`
--

DROP TABLE IF EXISTS `recomanacions`;
CREATE TABLE `recomanacions` (
  `client_id_recomana` int(11) NOT NULL,
  `client_id_recomanat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recomanacions`
--

INSERT INTO `recomanacions` (`client_id_recomana`, `client_id_recomanat`) VALUES
(1, 4),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
CREATE TABLE `ulleres` (
  `id_ullera` int(11) NOT NULL,
  `marca_id` smallint(6) NOT NULL,
  `graduacio` tinyint(4) NOT NULL,
  `tipus_montura` enum('Flotant','Pasta','Metàl.lica','') NOT NULL,
  `colorMontura` varchar(12) NOT NULL,
  `colorVidreEsq` varchar(12) NOT NULL,
  `colorVidreDre` varchar(12) NOT NULL,
  `Preu` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ulleres`
--

INSERT INTO `ulleres` (`id_ullera`, `marca_id`, `graduacio`, `tipus_montura`, `colorMontura`, `colorVidreEsq`, `colorVidreDre`, `Preu`) VALUES
(1, 5, 3, 'Pasta', 'blau', 'verd 2', 'verd 2', 231),
(2, 5, 4, 'Metàl.lica', 'blau', 'groc', 'groc', 178),
(3, 2, 3, 'Flotant', 'gris', 'blanc', 'blanc', 241);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `detall_factures`
--
ALTER TABLE `detall_factures`
  ADD KEY `factura_id` (`factura_id`),
  ADD KEY `ullera_id` (`ullera_id`);

--
-- Indexes for table `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indexes for table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `empleat_id` (`empleat_id`);

--
-- Indexes for table `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- Indexes for table `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id_proveidor`);

--
-- Indexes for table `recomanacions`
--
ALTER TABLE `recomanacions`
  ADD KEY `client_id_recomana` (`client_id_recomana`),
  ADD KEY `client_id_recomanat` (`client_id_recomanat`);

--
-- Indexes for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ullera`),
  ADD KEY `marca_id` (`marca_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleat` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `factures`
--
ALTER TABLE `factures`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marques`
--
ALTER TABLE `marques`
  MODIFY `id_marca` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id_proveidor` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ullera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detall_factures`
--
ALTER TABLE `detall_factures`
  ADD CONSTRAINT `detall_factures_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `factures` (`id_factura`),
  ADD CONSTRAINT `detall_factures_ibfk_2` FOREIGN KEY (`ullera_id`) REFERENCES `ulleres` (`id_ullera`);

--
-- Constraints for table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `factures_ibfk_2` FOREIGN KEY (`empleat_id`) REFERENCES `empleats` (`id_empleat`);

--
-- Constraints for table `marques`
--
ALTER TABLE `marques`
  ADD CONSTRAINT `marques_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidors` (`id_proveidor`);

--
-- Constraints for table `recomanacions`
--
ALTER TABLE `recomanacions`
  ADD CONSTRAINT `recomanacions_ibfk_1` FOREIGN KEY (`client_id_recomana`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `recomanacions_ibfk_2` FOREIGN KEY (`client_id_recomanat`) REFERENCES `clients` (`id_client`);

--
-- Constraints for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marques` (`id_marca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
