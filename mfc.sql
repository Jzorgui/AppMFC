-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 24 Février 2016 à 15:32
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `mfc`
--

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE IF NOT EXISTS `entreprise` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nomEntreprise` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `formateur`
--

CREATE TABLE IF NOT EXISTS `formateur` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `specialite` varchar(55) DEFAULT NULL,
  `ID_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_formateur_ID_personne` (`ID_personne`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `formateur`
--

INSERT INTO `formateur` (`ID`, `specialite`, `ID_personne`) VALUES
(1, '', 5),
(2, '', 6);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE IF NOT EXISTS `formation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `intituleFormation` varchar(255) NOT NULL,
  `niveauFormation` int(11) NOT NULL,
  `ID_salle` int(11) DEFAULT NULL,
  `ID_formateur` int(11) DEFAULT NULL,
  `prixFormation` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_formation_ID_salle` (`ID_salle`),
  KEY `FK_formation_ID_formateur` (`ID_formateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`ID`, `intituleFormation`, `niveauFormation`, `ID_salle`, `ID_formateur`, `prixFormation`) VALUES
(1, 'Cursus Adminstrateur de Réseaux', 3, 3, 2, 15000),
(2, 'Cursus certifiant Administrateur de réseaux CISCO', 2, 2, 2, 17000),
(3, 'Introduction compléte à la téléphonie d entreprise', 1, 8, 2, 3000),
(4, 'TCP/IP', 2, 8, 2, 1600),
(5, 'Cursus Développeur Web microsoft.net', 3, 5, 1, 12000),
(6, 'Développer vos applications avec Androïd', 3, 2, 1, 2200),
(7, 'Programmez en Php 5', 2, 6, 1, 1800),
(8, 'Créer des sites et applications web avec HTML5 et CSS3', 1, 7, 1, 2700);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE IF NOT EXISTS `materiel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nomMateriel` varchar(255) NOT NULL,
  `ID_salle` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_materiel_ID_salle` (`ID_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(25) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `dateNaissance` date NOT NULL,
  `sexe` enum('M','F') NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(55) NOT NULL,
  `CP` varchar(11) NOT NULL,
  `pays` varchar(55) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `pseudo` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`ID`, `prenom`, `nom`, `dateNaissance`, `sexe`, `adresse`, `ville`, `CP`, `pays`, `mail`, `pseudo`, `password`) VALUES
(1, 'Secrétaire', 'MFC', '2000-01-01', '', '', '', '', '', '', 'admin', 'admin'),
(2, 'Julien', 'Hernandez', '1993-11-08', 'M', 'Villa les Chênes Plain de Peri', 'Mezzavia', '20167', 'France', 'julien.hernandezbarragan@gmail.com', 'HernandezJu', 'stagiaire'),
(3, 'Florian', 'Prieux', '1992-01-24', 'M', '', 'Chatillon', '', 'France', 'florianprieux@bbox.com', 'PrieuxFl', 'stagiaire'),
(4, 'Antoine', 'Targa', '1994-05-01', 'M', '', 'Paris', '', 'France', '', 'TargaAn', 'stagiaire'),
(5, 'Musiliu', 'Shiro', '1965-07-18', 'M', '', '', '', 'France', '', 'ShiroMu', 'stagiaire'),
(6, 'Hervé', 'Pierron-Vialard', '1970-09-24', 'M', '', '', '', 'France', '', 'Pierron-VialardHe', 'stagiaire'),
(7, 'Wesley', 'Adonis', '1993-06-12', 'M', '', '', '', 'France', '', 'AdonisWe', 'stagiaire'),
(8, 'Antoine', 'Gilabert', '1991-01-01', 'M', '', 'Paris', '', 'France', '', 'GilabertAn', 'stagiaire'),
(9, 'Louis', 'Oliveira', '1988-11-28', 'M', '', 'Paris', '', 'France', '', 'OliveiraLo', 'stagiaire'),
(10, 'Elliot', 'Namer', '1994-05-18', 'M', '', 'Paris', '', 'France', '', 'NamerEl', 'stagiaire'),
(11, 'Teddy', 'MBote', '1993-02-01', 'M', '', '', '', 'France', '', 'MBoteTe', 'stagiaire'),
(12, 'Eric', 'Malezieux', '1996-09-01', 'M', '', '', '', 'France', '', 'MalezieuxEr', 'stagiaire'),
(13, 'Florian', 'Pompey', '1996-04-11', 'M', '', '', '', 'France', '', 'PompeyFl', 'stagiaire');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `intituleSalle` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`ID`, `intituleSalle`) VALUES
(1, 'Salle Steve Jobs'),
(2, 'Salle Bill Gates'),
(3, 'Salle Alan Turing'),
(4, 'Salle Steve Wozniack'),
(5, 'Salle Larry Page'),
(6, 'Salle Jack Kilby'),
(7, 'Salle Tim Berners-Lee'),
(8, 'Salle Ray Tomlinson');

-- --------------------------------------------------------

--
-- Structure de la table `secretaire`
--

CREATE TABLE IF NOT EXISTS `secretaire` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_secretaire_ID_personne` (`ID_personne`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `secretaire`
--

INSERT INTO `secretaire` (`ID`, `ID_personne`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `ID_formation` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_session_ID_formation` (`ID_formation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `session`
--

INSERT INTO `session` (`ID`, `dateDebut`, `dateFin`, `ID_formation`) VALUES
(1, '2016-01-05', '2016-01-08', 7),
(2, '2016-02-01', '2016-02-04', 7),
(3, '2016-01-01', '2016-01-31', 1),
(4, '2000-01-01', '2000-01-06', 8),
(5, '2000-01-20', '2000-01-25', 8);

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire`
--

CREATE TABLE IF NOT EXISTS `stagiaire` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_personne` int(11) DEFAULT NULL,
  `ID_entreprise` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_stagiaire_ID_personne` (`ID_personne`),
  KEY `FK_stagiaire_ID_entreprise` (`ID_entreprise`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `stagiaire`
--

INSERT INTO `stagiaire` (`ID`, `ID_personne`, `ID_entreprise`) VALUES
(1, 2, NULL),
(2, 3, NULL),
(3, 4, NULL),
(4, 7, NULL),
(5, 8, NULL),
(6, 9, NULL),
(7, 10, NULL),
(8, 11, NULL),
(9, 12, NULL),
(10, 13, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

CREATE TABLE IF NOT EXISTS `suivre` (
  `ID_stagiaire` int(11) NOT NULL,
  `ID_session` int(11) NOT NULL,
  PRIMARY KEY (`ID_stagiaire`,`ID_session`),
  KEY `FK_suivre_ID_session` (`ID_session`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `suivre`
--

INSERT INTO `suivre` (`ID_stagiaire`, `ID_session`) VALUES
(1, 1),
(2, 1),
(5, 1),
(8, 2),
(4, 3),
(9, 3),
(10, 3),
(3, 5),
(7, 5);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `formateur`
--
ALTER TABLE `formateur`
  ADD CONSTRAINT `FK_formateur_ID_personne` FOREIGN KEY (`ID_personne`) REFERENCES `personne` (`ID`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_formation_ID_formateur` FOREIGN KEY (`ID_formateur`) REFERENCES `formateur` (`ID`),
  ADD CONSTRAINT `FK_formation_ID_salle` FOREIGN KEY (`ID_salle`) REFERENCES `salle` (`ID`);

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `FK_materiel_ID_salle` FOREIGN KEY (`ID_salle`) REFERENCES `salle` (`ID`);

--
-- Contraintes pour la table `secretaire`
--
ALTER TABLE `secretaire`
  ADD CONSTRAINT `FK_secretaire_ID_personne` FOREIGN KEY (`ID_personne`) REFERENCES `personne` (`ID`);

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `FK_session_ID_formation` FOREIGN KEY (`ID_formation`) REFERENCES `formation` (`ID`);

--
-- Contraintes pour la table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD CONSTRAINT `FK_stagiaire_ID_entreprise` FOREIGN KEY (`ID_entreprise`) REFERENCES `entreprise` (`ID`),
  ADD CONSTRAINT `FK_stagiaire_ID_personne` FOREIGN KEY (`ID_personne`) REFERENCES `personne` (`ID`);

--
-- Contraintes pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD CONSTRAINT `FK_suivre_ID_session` FOREIGN KEY (`ID_session`) REFERENCES `session` (`ID`),
  ADD CONSTRAINT `FK_suivre_ID` FOREIGN KEY (`ID_stagiaire`) REFERENCES `stagiaire` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
