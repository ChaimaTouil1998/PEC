-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 22 fév. 2024 à 14:27
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ms_memia`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `nom`, `email`, `mp`) VALUES
(1, 'admin11', 'admin11@gmail.com', '4a7d1ed414474e4033ac29ccb8653d9b'),
(2, 'amin', 'admin@yahoo.fr', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `createur` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`, `description`, `createur`, `date_creation`, `date_modification`) VALUES
(35, 'cat4', 'cat4', 1, '2023-08-18', '0000-00-00'),
(37, 'cat4444', 'ddd', 17, '2023-09-20', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 0,
  `total` float NOT NULL,
  `panier` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `produit`, `quantite`, `total`, `panier`, `date_creation`, `date_modification`) VALUES
(0, 0, 0, 0, 3, '2023-06-19', '2023-06-19'),
(0, 0, 0, 0, 3, '2023-06-19', '2023-06-19'),
(0, 0, 2, 0, 3, '2023-06-19', '2023-06-19'),
(0, 0, 0, 0, 3, '2023-06-19', '2023-06-19'),
(0, 0, 0, 0, 4, '2023-06-19', '2023-06-19'),
(0, 0, 0, 0, 4, '2023-06-19', '2023-06-19'),
(0, 0, 2, 0, 4, '2023-06-19', '2023-06-19'),
(0, 0, 0, 0, 4, '2023-06-19', '2023-06-19'),
(0, 12, 12, 18, 5, '2023-06-19', '2023-06-19'),
(0, 13, 1236, 2101.2, 5, '2023-06-19', '2023-06-19'),
(0, 12, 12, 18, 6, '2023-06-19', '2023-06-19'),
(0, 13, 1236, 2101.2, 6, '2023-06-19', '2023-06-19'),
(0, 13, 12, 20.4, 6, '2023-06-19', '2023-06-19'),
(0, 12, 14, 21, 7, '2023-06-19', '2023-06-19'),
(0, 13, 15, 25.5, 7, '2023-06-19', '2023-06-19'),
(0, 16, 2555, 314265, 8, '2023-09-20', '2023-09-20'),
(0, 15, 15, 29.85, 8, '2023-09-20', '2023-09-20');

-- --------------------------------------------------------

--
-- Structure de la table `paniers`
--

CREATE TABLE `paniers` (
  `id` int(11) NOT NULL,
  `visiteur` int(11) NOT NULL,
  `total` float NOT NULL,
  `etat` varchar(255) NOT NULL DEFAULT 'en cours',
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paniers`
--

INSERT INTO `paniers` (`id`, `visiteur`, `total`, `etat`, `date_creation`, `date_modification`) VALUES
(2, 0, 0, 'en cours', '2023-06-19', '0000-00-00'),
(3, 15, 2119.2, 'livraison terminée ', '2023-06-19', '0000-00-00'),
(4, 15, 2119.2, 'en livraison', '2023-06-19', '0000-00-00'),
(5, 15, 2119.2, 'en cours', '2023-06-19', '0000-00-00'),
(6, 15, 2139.6, 'livraison terminée ', '2023-06-19', '0000-00-00'),
(7, 16, 46.5, 'livraison terminée ', '2023-06-19', '0000-00-00'),
(8, 17, 314295, 'livraison terminée ', '2023-09-20', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `prix` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `categorie` int(11) NOT NULL,
  `createur` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `image`, `categorie`, `createur`, `date_creation`, `date_modification`) VALUES
(12, 'prod1', 'en stock dd  ', 1.5, '', 17, 0, '2023-06-19', '2023-11-06'),
(13, 'prod2', 'en stock', 1.7, '4.jpg', 17, 0, '2023-06-19', '0000-00-00'),
(14, 'prod3', 'en stock', 1.2, '5.jpg', 17, 0, '2023-06-19', '0000-00-00'),
(15, 'prod 4', 'en stock', 1.99, '3.jpg', 17, 0, '2023-06-19', '0000-00-00'),
(16, 'test prod', 'description', 123, '450x400-n.jpg', 35, 0, '2023-09-20', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `createur` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stocks`
--

INSERT INTO `stocks` (`id`, `produit`, `quantite`, `createur`, `date_creation`, `date_modification`) VALUES
(1, 11, 14, 0, '2023-06-19', '0000-00-00'),
(2, 12, 0, 0, '2023-06-19', '0000-00-00'),
(3, 13, 14, 0, '2023-06-19', '0000-00-00'),
(4, 14, 12, 0, '2023-06-19', '0000-00-00'),
(5, 15, 123, 0, '2023-06-19', '0000-00-00'),
(6, 16, 101, 0, '2023-09-20', '0000-00-00'),
(7, 17, 3, 0, '2024-01-02', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `visiteurs`
--

CREATE TABLE `visiteurs` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mp` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `etat` int(11) DEFAULT 0,
  `adresse` varchar(255) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL,
  `telephone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `visiteurs`
--

INSERT INTO `visiteurs` (`id`, `email`, `mp`, `nom`, `prenom`, `etat`, `adresse`, `date_creation`, `date_modification`, `telephone`) VALUES
(1, 'chaima@gmail.com', '66', 'ff', 'gg', 1, '66666', '0000-00-00', '0000-00-00', '66666'),
(2, 'jawher@gmail.com', '55', 'ben jabeur', 'jawher', 1, 'vcdfghn,;:!', '0000-00-00', '0000-00-00', '5555555'),
(3, '', '', 'ddd', '', 1, '', '0000-00-00', '0000-00-00', ''),
(4, 'dorrasarah03@gmail.com', 'ff', 'ddd', 'e', 1, 'f', '0000-00-00', '0000-00-00', 'ff'),
(5, 'dorrasarah03@gmail.com', 'ff', 'ddd', 'e', 1, 'f', '0000-00-00', '0000-00-00', 'ff'),
(6, 'chaima@gmail.com', 't', '', 't', 1, 't', '0000-00-00', '0000-00-00', 'tt'),
(7, 'chaima@gmail.com', 't', '', 't', 1, 't', '0000-00-00', '0000-00-00', 'tt'),
(8, 'chaima@gmail.com', '44', 'ff', 'a', 1, '44', '0000-00-00', '0000-00-00', '44'),
(9, 'chaima@gmail.com', '44', 'ff', 'a', 1, '44', '0000-00-00', '0000-00-00', '44'),
(10, 'chaima@gmail.com', 'f', 'ben jabeur', 'k', 1, 'fsd', '0000-00-00', '0000-00-00', '5555555'),
(11, 'uuu@gmail.com', '56', 'eee', 'jawher', 1, 'ssss', '0000-00-00', '0000-00-00', '5656565'),
(12, 'chaima@gmail.com', 'ii', 'ddd', 'iii', 1, 'dddd', '0000-00-00', '0000-00-00', '65698989'),
(13, 'test@gmail.com', '4a7d1ed414474e4033ac29ccb8653d9b', 'test', 'test', 1, 'fgghjklcxb,;', '0000-00-00', '0000-00-00', '5555555'),
(14, 'test1@gmail.com', '4a7d1ed414474e4033ac29ccb8653d9b', 'test', 'test1', 1, '0000kljhgfxdw', '0000-00-00', '0000-00-00', '5555555'),
(15, 'ch@gmail.com', 'b4b147bc522828731f1a016bfa72c073', 'TOUIL', 'chaima', 1, 'ben arous', '0000-00-00', '0000-00-00', '25654956'),
(16, 'New@gmail.com', '4a7d1ed414474e4033ac29ccb8653d9b', 'New', 'New', 1, 'megrine', '0000-00-00', '0000-00-00', '55555555'),
(17, 'user@gmail.com', '4a7d1ed414474e4033ac29ccb8653d9b', 'user', 'user1', 1, 'useradresse', '0000-00-00', '0000-00-00', '5555555');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `paniers`
--
ALTER TABLE `paniers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `visiteurs`
--
ALTER TABLE `visiteurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `paniers`
--
ALTER TABLE `paniers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `visiteurs`
--
ALTER TABLE `visiteurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
