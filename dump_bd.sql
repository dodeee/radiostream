-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 13 oct. 2019 à 14:40
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `radio`
--

-- --------------------------------------------------------

--
-- Structure de la table `directlive`
--

DROP TABLE IF EXISTS `directlive`;
CREATE TABLE IF NOT EXISTS `directlive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `son` varchar(200) NOT NULL,
  `heuredebut` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=605 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `directlive`
--

INSERT INTO `directlive` (`id`, `son`, `heuredebut`) VALUES
(604, '0740.mp3', '2019-10-13 14:29:28');

-- --------------------------------------------------------

--
-- Structure de la table `passee_ajd`
--

DROP TABLE IF EXISTS `passee_ajd`;
CREATE TABLE IF NOT EXISTS `passee_ajd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `son` varchar(150) NOT NULL,
  `jour` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=558 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `passee_ajd`
--

INSERT INTO `passee_ajd` (`id`, `son`, `jour`) VALUES
(557, '0740.mp3', 285),
(556, '2  La fÃªte est finie .mp3', 285);

-- --------------------------------------------------------

--
-- Structure de la table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
CREATE TABLE IF NOT EXISTS `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `heuredebut` int(2) NOT NULL DEFAULT '0',
  `heurefin` int(2) NOT NULL DEFAULT '0',
  `jourdebut` int(1) NOT NULL,
  `jourfin` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `playlist`
--

INSERT INTO `playlist` (`id`, `nom`, `heuredebut`, `heurefin`, `jourdebut`, `jourfin`) VALUES
(1, 'truc', 22, 2, 3, 4),
(2, 'machin', 22, 3, 2, 3),
(3, 'chose', 21, 23, 3, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
