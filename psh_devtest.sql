-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2020 at 01:06 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psh_devtest`
--

-- --------------------------------------------------------

--
-- Table structure for table `psh_game`
--

CREATE TABLE `psh_game` (
  `id_stat` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `score` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `psh_game`
--

INSERT INTO `psh_game` (`id_stat`, `id_player`, `creation_date`, `score`) VALUES
(193, 190, '2020-12-31 12:05:00', 21),
(194, 191, '2020-12-31 12:05:00', 36),
(195, 192, '2020-12-31 12:05:00', 90),
(196, 193, '2020-12-31 12:05:00', 62),
(197, 194, '2020-12-31 12:05:00', 62),
(198, 195, '2020-12-31 12:05:00', 13),
(199, 196, '2020-12-31 12:05:10', 52),
(200, 197, '2020-12-31 12:05:10', 30),
(201, 198, '2020-12-31 12:05:20', 97),
(202, 199, '2020-12-31 12:05:20', 44),
(203, 200, '2020-12-31 12:05:20', 45),
(204, 201, '2020-12-31 12:05:20', 23),
(205, 202, '2020-12-31 12:05:20', 8),
(206, 203, '2020-12-31 12:05:20', 64),
(207, 204, '2020-12-31 12:05:20', 79),
(208, 205, '2020-12-31 12:05:20', 7),
(209, 206, '2020-12-31 12:05:20', 36);

-- --------------------------------------------------------

--
-- Table structure for table `psh_players`
--

CREATE TABLE `psh_players` (
  `id_player` int(11) NOT NULL,
  `nickname` text NOT NULL,
  `pfp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `psh_players`
--

INSERT INTO `psh_players` (`id_player`, `nickname`, `pfp`) VALUES
(190, 'پارمیسزارعی', 'https://randomuser.me/api/portraits/med/women/89.jpg'),
(191, 'PedroGonzalez', 'https://randomuser.me/api/portraits/med/men/78.jpg'),
(192, 'RomaneDenis', 'https://randomuser.me/api/portraits/med/women/60.jpg'),
(193, 'GraysonMoore', 'https://randomuser.me/api/portraits/med/men/72.jpg'),
(194, 'EthanGreen', 'https://randomuser.me/api/portraits/med/men/1.jpg'),
(195, 'MaëlyRoussel', 'https://randomuser.me/api/portraits/med/women/56.jpg'),
(196, 'شایانرضاییان', 'https://randomuser.me/api/portraits/med/men/44.jpg'),
(197, 'ZehraStoll', 'https://randomuser.me/api/portraits/med/women/94.jpg'),
(198, 'IsabelleHarvey', 'https://randomuser.me/api/portraits/med/women/61.jpg'),
(199, 'VirginiaSchuh', 'https://randomuser.me/api/portraits/med/women/44.jpg'),
(200, 'LobkeMohamud', 'https://randomuser.me/api/portraits/med/women/38.jpg'),
(201, 'DariaAlles', 'https://randomuser.me/api/portraits/med/women/19.jpg'),
(202, 'MillaSavela', 'https://randomuser.me/api/portraits/med/women/78.jpg'),
(203, 'MarcoRuiz', 'https://randomuser.me/api/portraits/med/men/48.jpg'),
(204, 'JennyKing', 'https://randomuser.me/api/portraits/med/women/81.jpg'),
(205, 'IreneStrandberg', 'https://randomuser.me/api/portraits/med/women/64.jpg'),
(206, 'AndréeGerard', 'https://randomuser.me/api/portraits/med/women/74.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `psh_game`
--
ALTER TABLE `psh_game`
  ADD PRIMARY KEY (`id_stat`),
  ADD KEY `id_player` (`id_player`);

--
-- Indexes for table `psh_players`
--
ALTER TABLE `psh_players`
  ADD PRIMARY KEY (`id_player`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `psh_game`
--
ALTER TABLE `psh_game`
  MODIFY `id_stat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `psh_players`
--
ALTER TABLE `psh_players`
  MODIFY `id_player` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `psh_game`
--
ALTER TABLE `psh_game`
  ADD CONSTRAINT `psh_game_ibfk_1` FOREIGN KEY (`id_player`) REFERENCES `psh_players` (`id_player`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
