-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 03, 2020 alle 08:41
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
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `chimica`
--

INSERT INTO `chimica` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 11),
(2, 'Gilli', '1^B', 8, 11),
(3, 'Garello', '1^C', 6, 11),
(4, 'Oddenino', '1^D', 5, 11),
(5, 'Marengo', '1^E', 5, 11),
(6, 'Morielli', '2^A', 8, 11),
(7, 'Appendino', '2^B', 7, 11),
(8, 'Barberis', '2^C', 9, 11),
(9, 'Russo', '2^E', 7, 11);

-- --------------------------------------------------------

--
-- Struttura della tabella `diritto_e_economia`
--

CREATE TABLE `diritto_e_economia` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `diritto_e_economia`
--

INSERT INTO `diritto_e_economia` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 12),
(2, 'Gilli', '1^B', 8, 12),
(3, 'Garello', '1^C', 6, 12),
(4, 'Oddenino', '1^D', 5, 12),
(5, 'Marengo', '1^E', 5, 12),
(6, 'Morielli', '2^A', 8, 12),
(7, 'Appendino', '2^B', 7, 12),
(8, 'Barberis', '2^C', 9, 12),
(9, 'Russo', '2^E', 7, 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `domande`
--

CREATE TABLE `domande` (
  `codProf` int(255) NOT NULL,
  `domanda` varchar(255) NOT NULL DEFAULT 'Quale è il tuo cibo preferito?',
  `risposta` varchar(255) NOT NULL DEFAULT 'pizza'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `domande`
--

INSERT INTO `domande` (`codProf`, `domanda`, `risposta`) VALUES
(1, 'Quale è il tuo cibo preferito?', 'pizza'),
(2, 'Quale è il tuo cibo preferito?', 'pizza'),
(3, 'Quale è il tuo cibo preferito?', 'pizza'),
(4, 'Quale è il tuo cibo preferito?', 'pizza'),
(5, 'Quale è il tuo cibo preferito?', 'pizza'),
(6, 'Quale è il tuo cibo preferito?', 'pizza'),
(7, 'Quale è il tuo cibo preferito?', 'pizza'),
(8, 'Quale è il tuo cibo preferito?', 'pizza'),
(9, 'Quale è il tuo cibo preferito?', 'pizza'),
(10, 'Quale è il tuo cibo preferito?', 'pizza'),
(11, 'Quale è il tuo cibo preferito?', 'pizza'),
(12, 'Quale è il tuo cibo preferito?', 'pizza'),
(13, 'Quale è il tuo cibo preferito?', 'pizza'),
(14, 'Quale è il tuo cibo preferito?', 'pizza'),
(15, 'Quale è il tuo cibo preferito?', 'pizza');

-- --------------------------------------------------------

--
-- Struttura della tabella `fisica`
--

CREATE TABLE `fisica` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `fisica`
--

INSERT INTO `fisica` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 10),
(2, 'Gilli', '1^B', 8, 10),
(3, 'Garello', '1^C', 6, 10),
(4, 'Oddenino', '1^D', 5, 10),
(5, 'Marengo', '1^E', 5, 10),
(6, 'Morielli', '2^A', 8, 10),
(7, 'Appendino', '2^B', 7, 10),
(8, 'Barberis', '2^C', 9, 10),
(9, 'Russo', '2^E', 7, 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `geografia`
--

CREATE TABLE `geografia` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `geografia`
--

INSERT INTO `geografia` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 3),
(2, 'Gilli', '1^B', 8, 3),
(3, 'Garello', '1^C', 6, 3),
(4, 'Oddenino', '1^D', 5, 3),
(5, 'Marengo', '1^E', 5, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `ginnastica`
--

CREATE TABLE `ginnastica` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '14'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ginnastica`
--

INSERT INTO `ginnastica` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 14),
(2, 'Gilli', '1^B', 8, 14),
(3, 'Garello', '1^C', 6, 14),
(4, 'Oddenino', '1^D', 5, 14),
(5, 'Marengo', '1^E', 5, 14),
(6, 'Morielli', '2^A', 8, 14),
(7, 'Appendino', '2^B', 7, 14),
(8, 'Barberis', '2^C', 9, 14),
(9, 'Russo', '2^E', 7, 14),
(10, 'Bianchi', '3^A', 5, 14),
(11, 'Romano', '3^B', 8, 14),
(12, 'Gallo', '3^C', 7, 14),
(13, 'Costa', '3^D', 6, 14),
(14, 'Fontana', '3^E', 8, 14),
(15, 'Marcarino', '4^A', 8, 14),
(16, 'Palumbo', '4^B', 8, 14),
(17, 'Serratore', '4^C', 10, 14),
(18, 'Ferrari', '4^D', 8, 14),
(19, 'Cerato', '4^E', 8, 14),
(20, 'Conti', '5^A', 10, 14),
(21, 'Esposito', '5^B', 10, 14),
(22, 'Ricci', '5^C', 4, 14),
(23, 'Bruno', '5^D', 5, 14),
(24, 'Rizzo', '5^E', 8, 14);

-- --------------------------------------------------------

--
-- Struttura della tabella `informatica`
--

CREATE TABLE `informatica` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `informatica`
--

INSERT INTO `informatica` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 5),
(2, 'Gilli', '1^B', 8, 5),
(3, 'Garello', '1^C', 6, 5),
(4, 'Oddenino', '1^D', 5, 5),
(5, 'Marengo', '1^E', 5, 5),
(6, 'Morielli', '2^A', 8, 5),
(7, 'Appendino', '2^B', 7, 5),
(8, 'Barberis', '2^C', 9, 5),
(9, 'Russo', '2^E', 7, 5),
(10, 'Bianchi', '3^A', 5, 5),
(11, 'Romano', '3^B', 8, 5),
(12, 'Gallo', '3^C', 7, 5),
(13, 'Costa', '3^D', 6, 5),
(14, 'Fontana', '3^E', 8, 5),
(15, 'Marcarino', '4^A', 7, 5),
(16, 'Palumbo', '4^B', 10, 5),
(17, 'Serratore', '4^C', 10, 5),
(18, 'Ferrari', '4^D', 8, 5),
(19, 'Cerato', '4^E', 8, 5),
(20, 'Conti', '5^A', 10, 5),
(21, 'Esposito', '5^B', 10, 5),
(22, 'Ricci', '5^C', 4, 5),
(23, 'Bruno', '5^D', 5, 5),
(24, 'Rizzo', '5^E', 8, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `inglese`
--

CREATE TABLE `inglese` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `inglese`
--

INSERT INTO `inglese` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 4),
(2, 'Gilli', '1^B', 8, 4),
(3, 'Garello', '1^C', 6, 4),
(4, 'Oddenino', '1^D', 5, 4),
(5, 'Marengo', '1^E', 5, 4),
(6, 'Morielli', '2^A', 8, 4),
(7, 'Appendino', '2^B', 7, 4),
(8, 'Barberis', '2^C', 9, 4),
(9, 'Russo', '2^E', 7, 4),
(10, 'Bianchi', '3^A', 5, 4),
(11, 'Romano', '3^B', 8, 4),
(12, 'Gallo', '3^C', 7, 4),
(13, 'Costa', '3^D', 6, 4),
(14, 'Fontana', '3^E', 8, 4),
(15, 'Marcarino', '4^A', 10, 4),
(16, 'Palumbo', '4^B', 6, 4),
(17, 'Serratore', '4^C', 10, 4),
(18, 'Ferrari', '4^D', 8, 4),
(19, 'Cerato', '4^E', 8, 4),
(20, 'Conti', '5^A', 10, 4),
(21, 'Esposito', '5^B', 10, 4),
(22, 'Ricci', '5^C', 4, 4),
(23, 'Bruno', '5^D', 5, 4),
(24, 'Rizzo', '5^E', 8, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `italiano`
--

CREATE TABLE `italiano` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `italiano`
--

INSERT INTO `italiano` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 8, 2),
(2, 'Gilli', '1^B', 8, 2),
(3, 'Garello', '1^C', 6, 2),
(4, 'Oddenino', '1^D', 5, 2),
(5, 'Marengo', '1^E', 5, 2),
(6, 'Morielli', '2^A', 8, 2),
(7, 'Appendino', '2^B', 7, 2),
(8, 'Barberis', '2^C', 9, 2),
(9, 'Russo', '2^E', 7, 2),
(10, 'Bianchi', '3^A', 5, 2),
(11, 'Romano', '3^B', 8, 2),
(12, 'Gallo', '3^C', 7, 2),
(13, 'Costa', '3^D', 6, 2),
(14, 'Fontana', '3^E', 8, 2),
(15, 'Marcarino', '4^A', 8, 2),
(16, 'Palumbo', '4^B', 9, 2),
(17, 'Serratore', '4^C', 8, 2),
(18, 'Ferrari', '4^D', 8, 2),
(19, 'Cerato', '4^E', 7, 2),
(20, 'Conti', '5^A', 10, 2),
(21, 'Esposito', '5^B', 10, 2),
(22, 'Ricci', '5^C', 4, 2),
(23, 'Bruno', '5^D', 5, 2),
(24, 'Rizzo', '5^E', 8, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `matematica`
--

CREATE TABLE `matematica` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `matematica`
--

INSERT INTO `matematica` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 1),
(2, 'Gilli', '1^B', 8, 1),
(3, 'Garello', '1^C', 6, 1),
(4, 'Oddenino', '1^D', 5, 1),
(5, 'Marengo', '1^E', 5, 1),
(6, 'Morielli', '2^A', 8, 1),
(7, 'Appendino', '2^B', 7, 1),
(8, 'Barberis', '2^C', 9, 1),
(9, 'Russo', '2^E', 7, 1),
(10, 'Bianchi', '3^A', 5, 1),
(11, 'Romano', '3^B', 8, 1),
(12, 'Gallo', '3^C', 7, 1),
(13, 'Costa', '3^D', 6, 1),
(14, 'Fontana', '3^E', 8, 1),
(15, 'Marcarino', '4^A', 9, 1),
(16, 'Palumbo', '4^B', 10, 1),
(17, 'Serratore', '4^C', 10, 1),
(18, 'Ferrari', '4^D', 8, 1),
(19, 'Cerato', '4^E', 10, 1),
(20, 'Conti', '5^A', 10, 1),
(21, 'Esposito', '5^B', 10, 1),
(22, 'Ricci', '5^C', 4, 1),
(23, 'Bruno', '5^D', 5, 1),
(24, 'Rizzo', '5^E', 8, 1),
(25, 'Ribero', '1^A', 8, 1);

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
(1, 'Rossi', 'matematica', 'f13c58cd3a587d7995463375a528dd4b'),
(2, 'Verdi', 'italiano-storia', '70d295cbaeebbe5a5f01482bc54431dc'),
(3, 'Abbà', 'geografia', '1a542b8f4f57f499bf1d3eea2a354f45'),
(4, 'Cerrato', 'inglese', 'e1fca08cfed861d125a5cee98d663f7d'),
(5, 'Allegri', 'informatica', 'e28e9b2242e579f40bc78d08628c7297'),
(6, 'Berutti', 'sistemi_e_reti', '13771f6066fb7461102b15475051ddaf'),
(7, 'Isaia', 'tpsit', '6f338744a7636ededbeb73f6eecf1f6f'),
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
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '15'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `religione`
--

INSERT INTO `religione` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 15),
(2, 'Gilli', '1^B', 8, 15),
(3, 'Garello', '1^C', 6, 15),
(4, 'Oddenino', '1^D', 5, 15),
(5, 'Marengo', '1^E', 5, 15),
(6, 'Morielli', '2^A', 8, 15),
(7, 'Appendino', '2^B', 7, 15),
(8, 'Barberis', '2^C', 9, 15),
(9, 'Russo', '2^E', 7, 15),
(10, 'Bianchi', '3^A', 5, 15),
(11, 'Romano', '3^B', 8, 15),
(12, 'Gallo', '3^C', 7, 15),
(13, 'Costa', '3^D', 6, 15),
(14, 'Fontana', '3^E', 8, 15),
(15, 'Marcarino', '4^A', 10, 15),
(16, 'Palumbo', '4^B', 10, 15),
(17, 'Serratore', '4^C', 10, 15),
(18, 'Ferrari', '4^D', 8, 15),
(19, 'Cerato', '4^E', 10, 15),
(20, 'Conti', '5^A', 10, 15),
(21, 'Esposito', '5^B', 10, 15),
(22, 'Ricci', '5^C', 4, 15),
(23, 'Bruno', '5^D', 5, 15),
(24, 'Rizzo', '5^E', 8, 15);

-- --------------------------------------------------------

--
-- Struttura della tabella `scienze`
--

CREATE TABLE `scienze` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '9'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `scienze`
--

INSERT INTO `scienze` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 9),
(2, 'Gilli', '1^B', 8, 9),
(3, 'Garello', '1^C', 6, 9),
(4, 'Oddenino', '1^D', 5, 9),
(5, 'Marengo', '1^E', 5, 9),
(6, 'Morielli', '2^A', 8, 9),
(7, 'Appendino', '2^B', 7, 9),
(8, 'Barberis', '2^C', 9, 9),
(9, 'Russo', '2^E', 7, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `sistemi_e_reti`
--

CREATE TABLE `sistemi_e_reti` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '6'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sistemi_e_reti`
--

INSERT INTO `sistemi_e_reti` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 6),
(2, 'Gilli', '1^B', 8, 6),
(3, 'Garello', '1^C', 6, 6),
(4, 'Oddenino', '1^D', 5, 6),
(5, 'Marengo', '1^E', 5, 6),
(6, 'Morielli', '2^A', 8, 6),
(7, 'Appendino', '2^B', 7, 6),
(8, 'Barberis', '2^C', 9, 6),
(9, 'Russo', '2^E', 7, 6),
(10, 'Bianchi', '3^A', 5, 6),
(11, 'Romano', '3^B', 8, 6),
(12, 'Gallo', '3^C', 7, 6),
(13, 'Costa', '3^D', 6, 6),
(14, 'Fontana', '3^E', 8, 6),
(15, 'Marcarino', '4^A', 7, 6),
(16, 'Palumbo', '4^B', 8, 6),
(17, 'Serratore', '4^C', 10, 6),
(18, 'Ferrari', '4^D', 8, 6),
(19, 'Cerato', '4^E', 8, 6),
(20, 'Conti', '5^A', 10, 6),
(21, 'Esposito', '5^B', 10, 6),
(22, 'Ricci', '5^C', 4, 6),
(23, 'Bruno', '5^D', 5, 6),
(24, 'Rizzo', '5^E', 8, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `storia`
--

CREATE TABLE `storia` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `storia`
--

INSERT INTO `storia` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 2),
(2, 'Gilli', '1^B', 8, 2),
(3, 'Garello', '1^C', 6, 2),
(4, 'Oddenino', '1^D', 5, 2),
(5, 'Marengo', '1^E', 5, 2),
(6, 'Morielli', '2^A', 8, 2),
(7, 'Appendino', '2^B', 7, 2),
(8, 'Barberis', '2^C', 9, 2),
(9, 'Russo', '2^E', 7, 2),
(10, 'Bianchi', '3^A', 5, 2),
(11, 'Romano', '3^B', 8, 2),
(12, 'Gallo', '3^C', 7, 2),
(13, 'Costa', '3^D', 6, 2),
(14, 'Fontana', '3^E', 8, 2),
(15, 'Marcarino', '4^A', 7, 2),
(16, 'Palumbo', '4^B', 10, 2),
(17, 'Serratore', '4^C', 9, 2),
(18, 'Ferrari', '4^D', 8, 2),
(19, 'Cerato', '4^E', 6, 2),
(20, 'Conti', '5^A', 10, 2),
(21, 'Esposito', '5^B', 10, 2),
(22, 'Ricci', '5^C', 4, 2),
(23, 'Bruno', '5^D', 5, 2),
(24, 'Rizzo', '5^E', 8, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `tecnologia`
--

CREATE TABLE `tecnologia` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '13'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tecnologia`
--

INSERT INTO `tecnologia` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 13),
(2, 'Gilli', '1^B', 8, 13),
(3, 'Garello', '1^C', 6, 13),
(4, 'Oddenino', '1^D', 5, 13),
(5, 'Marengo', '1^E', 5, 13),
(6, 'Morielli', '2^A', 8, 13),
(7, 'Appendino', '2^B', 7, 13),
(8, 'Barberis', '2^C', 9, 13),
(9, 'Russo', '2^E', 7, 13);

-- --------------------------------------------------------

--
-- Struttura della tabella `telecomunicazioni`
--

CREATE TABLE `telecomunicazioni` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '8'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `telecomunicazioni`
--

INSERT INTO `telecomunicazioni` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 8),
(2, 'Gilli', '1^B', 8, 8),
(3, 'Garello', '1^C', 6, 8),
(4, 'Oddenino', '1^D', 5, 8),
(5, 'Marengo', '1^E', 5, 8),
(6, 'Morielli', '2^A', 8, 8),
(7, 'Appendino', '2^B', 7, 8),
(8, 'Barberis', '2^C', 9, 8),
(9, 'Russo', '2^E', 7, 8),
(10, 'Bianchi', '3^A', 5, 8),
(11, 'Romano', '3^B', 8, 8),
(12, 'Gallo', '3^C', 7, 8),
(13, 'Costa', '3^D', 6, 8),
(14, 'Fontana', '3^E', 8, 8),
(15, 'Marcarino', '4^A', 6, 8),
(16, 'Palumbo', '4^B', 7, 8),
(17, 'Serratore', '4^C', 10, 8),
(18, 'Ferrari', '4^D', 8, 8),
(19, 'Cerato', '4^E', 8, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `tpsit`
--

CREATE TABLE `tpsit` (
  `codAlunno` int(255) NOT NULL,
  `nominativo` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `media` int(255) NOT NULL,
  `codProf` int(255) NOT NULL DEFAULT '7'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tpsit`
--

INSERT INTO `tpsit` (`codAlunno`, `nominativo`, `classe`, `media`, `codProf`) VALUES
(1, 'Allemandi', '1^A', 7, 7),
(2, 'Gilli', '1^B', 8, 7),
(3, 'Garello', '1^C', 6, 7),
(4, 'Oddenino', '1^D', 5, 7),
(5, 'Marengo', '1^E', 5, 7),
(6, 'Morielli', '2^A', 8, 7),
(7, 'Appendino', '2^B', 7, 7),
(8, 'Barberis', '2^C', 9, 7),
(9, 'Russo', '2^E', 7, 7),
(10, 'Bianchi', '3^A', 5, 7),
(11, 'Romano', '3^B', 8, 7),
(12, 'Gallo', '3^C', 7, 7),
(13, 'Costa', '3^D', 6, 7),
(14, 'Fontana', '3^E', 8, 7),
(15, 'Marcarino', '4^A', 9, 7),
(16, 'Palumbo', '4^B', 10, 7),
(17, 'Serratore', '4^C', 10, 7),
(18, 'Ferrari', '4^D', 8, 7),
(19, 'Cerato', '4^E', 10, 7),
(20, 'Conti', '5^A', 10, 7),
(21, 'Esposito', '5^B', 10, 7),
(22, 'Ricci', '5^C', 4, 7),
(23, 'Bruno', '5^D', 5, 7),
(24, 'Rizzo', '5^E', 8, 7);

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
-- Indici per le tabelle `domande`
--
ALTER TABLE `domande`
  ADD PRIMARY KEY (`codProf`);

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
-- AUTO_INCREMENT per la tabella `domande`
--
ALTER TABLE `domande`
  MODIFY `codProf` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `fisica`
--
ALTER TABLE `fisica`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `geografia`
--
ALTER TABLE `geografia`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `tpsit`
--
ALTER TABLE `tpsit`
  MODIFY `codAlunno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
