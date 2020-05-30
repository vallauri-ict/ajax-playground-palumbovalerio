-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 28, 2020 alle 16:55
-- Versione del server: 10.1.38-MariaDB
-- Versione PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4b_scuola`
--
CREATE DATABASE IF NOT EXISTS `4b_scuola` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `4b_scuola`;

-- --------------------------------------------------------

--
-- Struttura della tabella `chimica`
--

CREATE TABLE `chimica` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `chimica`
--

INSERT INTO `chimica` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `diritto_e_economia`
--

CREATE TABLE `diritto_e_economia` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `diritto_e_economia`
--

INSERT INTO `diritto_e_economia` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `fisica`
--

CREATE TABLE `fisica` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `fisica`
--

INSERT INTO `fisica` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `geografia`
--

CREATE TABLE `geografia` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `geografia`
--

INSERT INTO `geografia` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `ginnastica`
--

CREATE TABLE `ginnastica` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ginnastica`
--

INSERT INTO `ginnastica` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 8),
(16, 'Palumbo', '4^B', 8),
(17, 'Serratore', '4^C', 10),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 8),
(20, 'Conti', '5^A', 10),
(21, 'Esposito', '5^B', 10),
(22, 'Ricci', '5^C', 4),
(23, 'Bruno', '5^D', 5),
(24, 'Rizzo', '5^E', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `informatica`
--

CREATE TABLE `informatica` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `informatica`
--

INSERT INTO `informatica` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 7),
(16, 'Palumbo', '4^B', 10),
(17, 'Serratore', '4^C', 10),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 8),
(20, 'Conti', '5^A', 10),
(21, 'Esposito', '5^B', 10),
(22, 'Ricci', '5^C', 4),
(23, 'Bruno', '5^D', 5),
(24, 'Rizzo', '5^E', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `inglese`
--

CREATE TABLE `inglese` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `inglese`
--

INSERT INTO `inglese` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 10),
(16, 'Palumbo', '4^B', 6),
(17, 'Serratore', '4^C', 10),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 8),
(20, 'Conti', '5^A', 10),
(21, 'Esposito', '5^B', 10),
(22, 'Ricci', '5^C', 4),
(23, 'Bruno', '5^D', 5),
(24, 'Rizzo', '5^E', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `italiano`
--

CREATE TABLE `italiano` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `italiano`
--

INSERT INTO `italiano` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 8),
(16, 'Palumbo', '4^B', 9),
(17, 'Serratore', '4^C', 8),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 7),
(20, 'Conti', '5^A', 10),
(21, 'Esposito', '5^B', 10),
(22, 'Ricci', '5^C', 4),
(23, 'Bruno', '5^D', 5),
(24, 'Rizzo', '5^E', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `matematica`
--

CREATE TABLE `matematica` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `matematica`
--

INSERT INTO `matematica` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 9),
(16, 'Palumbo', '4^B', 10),
(17, 'Serratore', '4^C', 10),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 10),
(20, 'Conti', '5^A', 10),
(21, 'Esposito', '5^B', 10),
(22, 'Ricci', '5^C', 4),
(23, 'Bruno', '5^D', 5),
(24, 'Rizzo', '5^E', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `professori`
--

CREATE TABLE `professori` (
  `codProf` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `materie` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `professori`
--

INSERT INTO `professori` (`codProf`, `nominativo`, `materie`, `pwd`) VALUES
(1, 'Rossi', 'matematica', '5f4dcc3b5aa765d61d8327deb882cf99'),
(2, 'Verdi', 'italiano, storia', '5f4dcc3b5aa765d61d8327deb882cf99'),
(3, 'Abbà', 'geografia', '5f4dcc3b5aa765d61d8327deb882cf99'),
(4, 'Cerrato', 'inglese', '5f4dcc3b5aa765d61d8327deb882cf99'),
(5, 'Allegri', 'informatica', '5f4dcc3b5aa765d61d8327deb882cf99'),
(6, 'Berutti', 'sistemi_e_reti', '5f4dcc3b5aa765d61d8327deb882cf99'),
(7, 'Isaia', 'tpsit', '5f4dcc3b5aa765d61d8327deb882cf99'),
(8, 'Cerutti', 'telecomunicazioni', '5f4dcc3b5aa765d61d8327deb882cf99'),
(9, 'Airale', 'scienze', '5f4dcc3b5aa765d61d8327deb882cf99'),
(10, 'Serra', 'fisica', '5f4dcc3b5aa765d61d8327deb882cf99'),
(11, 'Demaria', 'chimica', '5f4dcc3b5aa765d61d8327deb882cf99'),
(12, 'Vettori', 'diritto_e_economia', '5f4dcc3b5aa765d61d8327deb882cf99'),
(13, 'Parola', 'tecnologia', '5f4dcc3b5aa765d61d8327deb882cf99'),
(14, 'Ferri', 'ginnastica', '5f4dcc3b5aa765d61d8327deb882cf99'),
(15, 'Bertolino', 'religione', '5f4dcc3b5aa765d61d8327deb882cf99');

-- --------------------------------------------------------

--
-- Struttura della tabella `religione`
--

CREATE TABLE `religione` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `religione`
--

INSERT INTO `religione` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 10),
(16, 'Palumbo', '4^B', 10),
(17, 'Serratore', '4^C', 10),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 10),
(20, 'Conti', '5^A', 10),
(21, 'Esposito', '5^B', 10),
(22, 'Ricci', '5^C', 4),
(23, 'Bruno', '5^D', 5),
(24, 'Rizzo', '5^E', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `scienze`
--

CREATE TABLE `scienze` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `scienze`
--

INSERT INTO `scienze` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `sistemi_e_reti`
--

CREATE TABLE `sistemi_e_reti` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sistemi_e_reti`
--

INSERT INTO `sistemi_e_reti` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 7),
(16, 'Palumbo', '4^B', 8),
(17, 'Serratore', '4^C', 10),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 8),
(20, 'Conti', '5^A', 10),
(21, 'Esposito', '5^B', 10),
(22, 'Ricci', '5^C', 4),
(23, 'Bruno', '5^D', 5),
(24, 'Rizzo', '5^E', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `storia`
--

CREATE TABLE `storia` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `storia`
--

INSERT INTO `storia` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 7),
(16, 'Palumbo', '4^B', 10),
(17, 'Serratore', '4^C', 9),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 6),
(20, 'Conti', '5^A', 10),
(21, 'Esposito', '5^B', 10),
(22, 'Ricci', '5^C', 4),
(23, 'Bruno', '5^D', 5),
(24, 'Rizzo', '5^E', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `tecnologia`
--

CREATE TABLE `tecnologia` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tecnologia`
--

INSERT INTO `tecnologia` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `telecomunicazioni`
--

CREATE TABLE `telecomunicazioni` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `telecomunicazioni`
--

INSERT INTO `telecomunicazioni` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 6),
(16, 'Palumbo', '4^B', 7),
(17, 'Serratore', '4^C', 10),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `tpsit`
--

CREATE TABLE `tpsit` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tpsit`
--

INSERT INTO `tpsit` (`codAlunno`, `nominativo`, `classe`, `media`) VALUES
(1, 'Allemandi', '1^A', 7),
(2, 'Gilli', '1^B', 8),
(3, 'Garello', '1^C', 6),
(4, 'Oddenino', '1^D', 5),
(5, 'Marengo', '1^E', 5),
(6, 'Morielli', '2^A', 8),
(7, 'Appendino', '2^B', 7),
(8, 'Barberis', '2^C', 9),
(9, 'Russo', '2^E', 7),
(10, 'Bianchi', '3^A', 5),
(11, 'Romano', '3^B', 8),
(12, 'Gallo', '3^C', 7),
(13, 'Costa', '3^D', 6),
(14, 'Fontana', '3^E', 8),
(15, 'Marcarino', '4^A', 9),
(16, 'Palumbo', '4^B', 10),
(17, 'Serratore', '4^C', 10),
(18, 'Ferrari', '4^D', 8),
(19, 'Cerato', '4^E', 10),
(20, 'Conti', '5^A', 10),
(21, 'Esposito', '5^B', 10),
(22, 'Ricci', '5^C', 4),
(23, 'Bruno', '5^D', 5),
(24, 'Rizzo', '5^E', 8);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `chimica`
--
ALTER TABLE `chimica`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `diritto_e_economia`
--
ALTER TABLE `diritto_e_economia`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `fisica`
--
ALTER TABLE `fisica`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `geografia`
--
ALTER TABLE `geografia`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `ginnastica`
--
ALTER TABLE `ginnastica`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `informatica`
--
ALTER TABLE `informatica`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `inglese`
--
ALTER TABLE `inglese`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `italiano`
--
ALTER TABLE `italiano`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `matematica`
--
ALTER TABLE `matematica`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `professori`
--
ALTER TABLE `professori`
  ADD PRIMARY KEY (`codProf`);

--
-- Indici per le tabelle `religione`
--
ALTER TABLE `religione`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `scienze`
--
ALTER TABLE `scienze`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `sistemi_e_reti`
--
ALTER TABLE `sistemi_e_reti`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `storia`
--
ALTER TABLE `storia`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `tecnologia`
--
ALTER TABLE `tecnologia`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `telecomunicazioni`
--
ALTER TABLE `telecomunicazioni`
  ADD PRIMARY KEY (`codAlunno`);

--
-- Indici per le tabelle `tpsit`
--
ALTER TABLE `tpsit`
  ADD PRIMARY KEY (`codAlunno`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `chimica`
--
ALTER TABLE `chimica`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `diritto_e_economia`
--
ALTER TABLE `diritto_e_economia`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `fisica`
--
ALTER TABLE `fisica`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `geografia`
--
ALTER TABLE `geografia`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `ginnastica`
--
ALTER TABLE `ginnastica`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `informatica`
--
ALTER TABLE `informatica`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `inglese`
--
ALTER TABLE `inglese`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `italiano`
--
ALTER TABLE `italiano`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `matematica`
--
ALTER TABLE `matematica`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `professori`
--
ALTER TABLE `professori`
  MODIFY `codProf` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `religione`
--
ALTER TABLE `religione`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `scienze`
--
ALTER TABLE `scienze`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `sistemi_e_reti`
--
ALTER TABLE `sistemi_e_reti`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `storia`
--
ALTER TABLE `storia`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `tecnologia`
--
ALTER TABLE `tecnologia`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `telecomunicazioni`
--
ALTER TABLE `telecomunicazioni`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `tpsit`
--
ALTER TABLE `tpsit`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
