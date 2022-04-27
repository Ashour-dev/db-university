-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2022 at 09:51 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-university`
--

-- --------------------------------------------------------

--
-- Table structure for table `corsi`
--

CREATE TABLE `corsi` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `id_corso_laurea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `corsi di laurea`
--

CREATE TABLE `corsi di laurea` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `id_dip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_esame`
--

CREATE TABLE `data_esame` (
  `matricola` int(11) NOT NULL,
  `id_esame` int(11) NOT NULL,
  `voto` int(3) NOT NULL,
  `Sufficienza` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dipartimenti`
--

CREATE TABLE `dipartimenti` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `esame`
--

CREATE TABLE `esame` (
  `id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `id_corso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `insegnanti`
--

CREATE TABLE `insegnanti` (
  `id` int(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Numero di telefono` int(18) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `id_corso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studente`
--

CREATE TABLE `studente` (
  `matricola` int(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Numero di telefono` int(18) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `id_corso_laurea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_corso_laurea` (`id_corso_laurea`);

--
-- Indexes for table `corsi di laurea`
--
ALTER TABLE `corsi di laurea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dip` (`id_dip`);

--
-- Indexes for table `data_esame`
--
ALTER TABLE `data_esame`
  ADD KEY `id_esame` (`id_esame`),
  ADD KEY `id_studente` (`matricola`);

--
-- Indexes for table `dipartimenti`
--
ALTER TABLE `dipartimenti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `esame`
--
ALTER TABLE `esame`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_corso` (`id_corso`);

--
-- Indexes for table `insegnanti`
--
ALTER TABLE `insegnanti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_corso` (`id_corso`);

--
-- Indexes for table `studente`
--
ALTER TABLE `studente`
  ADD PRIMARY KEY (`matricola`),
  ADD KEY `id_corso_laurea` (`id_corso_laurea`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `corsi`
--
ALTER TABLE `corsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `corsi di laurea`
--
ALTER TABLE `corsi di laurea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dipartimenti`
--
ALTER TABLE `dipartimenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `esame`
--
ALTER TABLE `esame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insegnanti`
--
ALTER TABLE `insegnanti`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `corsi`
--
ALTER TABLE `corsi`
  ADD CONSTRAINT `corsi_ibfk_1` FOREIGN KEY (`id_corso_laurea`) REFERENCES `corsi di laurea` (`id`);

--
-- Constraints for table `corsi di laurea`
--
ALTER TABLE `corsi di laurea`
  ADD CONSTRAINT `corsi di laurea_ibfk_1` FOREIGN KEY (`id_dip`) REFERENCES `dipartimenti` (`id`);

--
-- Constraints for table `data_esame`
--
ALTER TABLE `data_esame`
  ADD CONSTRAINT `data_esame_ibfk_1` FOREIGN KEY (`id_esame`) REFERENCES `esame` (`id`),
  ADD CONSTRAINT `data_esame_ibfk_2` FOREIGN KEY (`matricola`) REFERENCES `studente` (`matricola`);

--
-- Constraints for table `esame`
--
ALTER TABLE `esame`
  ADD CONSTRAINT `esame_ibfk_1` FOREIGN KEY (`id_corso`) REFERENCES `corsi` (`id`);

--
-- Constraints for table `insegnanti`
--
ALTER TABLE `insegnanti`
  ADD CONSTRAINT `insegnanti_ibfk_1` FOREIGN KEY (`id_corso`) REFERENCES `corsi` (`id`);

--
-- Constraints for table `studente`
--
ALTER TABLE `studente`
  ADD CONSTRAINT `studente_ibfk_1` FOREIGN KEY (`id_corso_laurea`) REFERENCES `corsi di laurea` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
