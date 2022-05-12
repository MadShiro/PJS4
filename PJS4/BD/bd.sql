-- ??????????????????????????????????????
-- clés étrangères de messages dans personnes
-- Pb amis dans les 2 sens
-- Liste des participants doivent exister
-- Participe à : Même fonctionnement que pour les amis ???
-- Messages suppr


-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 03 Octobre 2019 à 12:58
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;



-- Base de données :  `PJS4`
--

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Evenement`(
                                          `IdEvent` int(10) AUTO_INCREMENT PRIMARY KEY,
                                          `NomEvent` VARCHAR(50) COLLATE utf8_bin NOT NULL,
                                          `Adresse` VARCHAR(50) COLLATE utf8_bin NOT NULL,
                                          `NbPersonnes` int(10) NOT NULL,
                                          `DateEvent` DATE NOT NULL,
                                          `HeureDebut` TIME NOT NULL,
                                          `HeureFin` TIME NOT NULL,
                                          `PhotoEvent` VARCHAR(50) COLLATE utf8_bin NOT NULL,
                                          `Createur` int(10) NOT NULL
);


CREATE TABLE IF NOT EXISTS `Personne`(
                                         `IdPersonne`int(10) AUTO_INCREMENT PRIMARY KEY,
                                         `Pseudo` VARCHAR(50) COLLATE utf8_bin NOT NULL, -- Contrainte Unique
                                         `PhotoPersonne` VARCHAR(50) COLLATE utf8_bin NOT NULL,
                                         `NomPersonne` VARCHAR(50) COLLATE utf8_bin NOT NULL,
                                         `PrenomPersonne` VARCHAR(50) COLLATE utf8_bin NOT NULL,
                                         `DateNaissance` DATE NOT NULL,
                                         `Genre` VARCHAR(50) COLLATE utf8_bin NOT NULL,
                                         `NumTel` int(20),
                                         `Email` VARCHAR(50) COLLATE utf8_bin NOT NULL,
                                         `Mdp` VARCHAR(50) COLLATE utf8_bin NOT NULL,
                                         `DescriptionPersonne` longtext COLLATE utf8_bin
);

CREATE TABLE IF NOT EXISTS `Forum` (
                                       `IdForum` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                       `Messages` longtext COLLATE utf8_bin NOT NULL COMMENT '(DC2Type:json)',
                                       `IdPersonne1` int(10),
                                       `IdPersonne2` int(10)
);


CREATE TABLE `participeA` (
  `IdEvent` int(10) NOT NULL,
  `Participants` int(11) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `Amis`(
                                     `PersonneA` int(10),
                                     `PersonneB` int(10)
);

-- Amis
ALTER TABLE `Amis`
    ADD CONSTRAINT `FK_PersonneA` FOREIGN KEY (`PersonneA`) REFERENCES `Personne` (`IdPersonne`) ON DELETE CASCADE,
    ADD CONSTRAINT `FK_PersonneB` FOREIGN KEY (`PersonneB`) REFERENCES `Personne` (`IdPersonne`) ON DELETE CASCADE,
    ADD UNIQUE KEY (`PersonneA`,`PersonneB`);

-- Event
ALTER TABLE `Evenement`
    ADD UNIQUE KEY (`NomEvent`, `Adresse`, `DateEvent`, `HeureDebut`, `HeureFin`),
    ADD CONSTRAINT `CK_Heure` CHECK (HeureFin > HeureDebut),
    ADD CONSTRAINT `FK_Createur` FOREIGN KEY (`Createur`) REFERENCES `Personne` (`IdPersonne`) ON DELETE CASCADE;

-- Personne
ALTER TABLE `Personne`
    ADD UNIQUE KEY (`Pseudo`),
    ADD CONSTRAINT `CK_Date` CHECK(DATEDIFF(SYSDATE(), DateNaissance) > 6570);

-- Forum
ALTER TABLE `Forum`
    ADD CONSTRAINT `FK_Personne1` FOREIGN KEY (`IdPersonne1`) REFERENCES `Personne` (`IdPersonne`) ON DELETE CASCADE,
    ADD CONSTRAINT `FK_Personne2` FOREIGN KEY (`IdPersonne2`) REFERENCES `Personne` (`IdPersonne`) ON DELETE CASCADE;

-- Participe à
ALTER TABLE `participe_à`
  ADD UNIQUE KEY `IdEvent` (`IdEvent`,`Participants`);
