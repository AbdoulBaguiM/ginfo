-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 24 juil. 2022 à 16:27
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ginfo`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-06-06 13:48:46', '2021-06-06 13:48:46'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-06-06 13:48:46', '2021-06-06 13:48:46');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_produit`
--

DROP TABLE IF EXISTS `categorie_produit`;
CREATE TABLE IF NOT EXISTS `categorie_produit` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `produit_id` int UNSIGNED DEFAULT NULL,
  `categorie_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorie_produit_produit_id_foreign` (`produit_id`),
  KEY `categorie_produit_categorie_id_foreign` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie_produit`
--

INSERT INTO `categorie_produit` (`id`, `produit_id`, `categorie_id`, `created_at`, `updated_at`) VALUES
(16, 2, 1, '2021-06-16 23:46:36', '2021-06-16 23:46:36'),
(17, 3, 1, '2021-06-16 23:46:54', '2021-06-16 23:46:54'),
(20, 4, 6, '2021-06-22 14:01:48', '2021-06-22 14:01:48'),
(21, 4, 7, '2021-06-22 14:01:48', '2021-06-22 14:01:48'),
(28, 1, 1, '2021-06-28 09:59:07', '2021-06-28 09:59:07'),
(30, 7, 3, '2021-07-08 19:09:12', '2021-07-08 19:09:12'),
(31, 6, 2, '2021-07-08 19:10:46', '2021-07-08 19:10:46'),
(32, 6, 7, '2021-07-08 19:10:46', '2021-07-08 19:10:46'),
(37, 9, 6, '2021-07-08 19:17:59', '2021-07-08 19:17:59'),
(38, 8, 5, '2021-07-08 19:18:27', '2021-07-08 19:18:27'),
(39, 8, 6, '2021-07-08 19:18:27', '2021-07-08 19:18:27'),
(40, 8, 7, '2021-07-08 19:18:27', '2021-07-08 19:18:27'),
(41, 5, 7, '2021-07-08 19:18:38', '2021-07-08 19:18:38'),
(42, 10, 2, '2021-07-08 19:20:54', '2021-07-08 19:20:54'),
(43, 11, 2, '2021-07-08 19:22:52', '2021-07-08 19:22:52'),
(44, 12, 4, '2021-07-08 19:25:18', '2021-07-08 19:25:18'),
(45, 13, 4, '2021-07-08 19:27:36', '2021-07-08 19:27:36'),
(46, 14, 1, '2021-07-08 19:30:02', '2021-07-08 19:30:02'),
(47, 15, 1, '2021-07-08 19:32:16', '2021-07-08 19:32:16'),
(48, 15, 2, '2021-07-08 19:32:17', '2021-07-08 19:32:17'),
(49, 15, 7, '2021-07-08 19:32:17', '2021-07-08 19:32:17'),
(50, 16, 2, '2021-07-08 19:33:34', '2021-07-08 19:33:34'),
(51, 16, 7, '2021-07-08 19:33:34', '2021-07-08 19:33:34'),
(52, 17, 5, '2021-07-08 19:35:35', '2021-07-08 19:35:35'),
(53, 18, 7, '2021-07-08 19:37:32', '2021-07-08 19:37:32'),
(54, 19, 2, '2021-07-08 19:39:38', '2021-07-08 19:39:38'),
(55, 19, 7, '2021-07-08 19:39:38', '2021-07-08 19:39:38'),
(56, 20, 1, '2021-07-08 19:53:17', '2021-07-08 19:53:17');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_nom_unique` (`nom`),
  UNIQUE KEY `category_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `nom`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Laptops', 'laptops', '2021-06-06 14:21:03', '2021-06-06 14:21:03'),
(2, 'Desktops', 'desktops', '2021-06-06 14:21:33', '2021-06-06 14:21:33'),
(3, 'Caméras', 'cameras', '2021-06-06 14:21:44', '2021-06-06 14:21:44'),
(4, 'Imprimantes', 'imprimantes', '2021-06-06 14:21:50', '2021-06-06 14:21:50'),
(5, 'Tablettes', 'tablettes', '2021-06-06 14:21:59', '2021-06-06 14:21:59'),
(6, 'Téléphones', 'telephones', '2021-06-06 14:25:27', '2021-06-06 14:25:27'),
(7, 'Accessoires', 'accessoires', '2021-06-06 14:44:26', '2021-06-06 14:44:26');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `c_nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_adresse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_ville` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_zipcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_discount` int NOT NULL DEFAULT '0',
  `c_discountCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_subtotal` int NOT NULL,
  `c_taxe` int NOT NULL,
  `c_total` int NOT NULL,
  `c_payement` tinyint(1) DEFAULT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT '0',
  `erreur` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commandes_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `user_id`, `c_nom`, `c_prenom`, `c_email`, `c_adresse`, `c_ville`, `c_zipcode`, `c_telephone`, `c_discount`, `c_discountCode`, `c_subtotal`, `c_taxe`, `c_total`, `c_payement`, `statut`, `erreur`, `created_at`, `updated_at`) VALUES
(29, 4, 'Client 1', NULL, 'client1@gmail.com', '31 Rue Bamako Fès', 'Fès', '064012', '0610101010', 0, NULL, 291, 12, 318, 0, 1, NULL, '2021-05-25 14:54:31', '2021-07-08 20:10:10'),
(39, 4, 'Client 1', NULL, 'client1@gmail.com', '31 Rue Bamako Fès', 'Fès', '064012', '0610101010', 0, NULL, 3239, 130, 3384, 1, 1, NULL, '2021-06-27 17:11:31', '2021-07-08 20:10:16'),
(42, 4, 'Client 1', NULL, 'client1@gmail.com', '31 Rue Bamako Fès', 'Fès', '064012', '0610101010', 0, NULL, 1079, 43, 1137, 1, 0, 'Your card has expired.', '2021-06-27 17:15:41', '2021-07-08 20:09:58'),
(43, 5, 'Client 2', NULL, 'client2@gmail.com', '22 Rue Lagos', 'Kénitra', '30050', '0620202020', 0, NULL, 770, 31, 816, 0, 0, NULL, '2021-07-08 20:14:26', '2021-07-08 20:14:26'),
(44, 6, 'Client 3', NULL, 'client3@gmail.com', '31 Rue Lagos Casablanca', 'Casablanca', '60050', '0630303030', 0, NULL, 188, 8, 210, 1, 0, NULL, '2021-07-08 20:16:42', '2021-07-08 20:16:42'),
(45, 6, 'Client 3', NULL, 'client3@gmail.com', '31 Rue Lagos Casablanca', 'Casablanca', '60050', '0630303030', 500, 'ABC123', 2940, 118, 3073, 0, 0, NULL, '2021-07-08 20:23:51', '2021-07-08 20:23:51'),
(46, 10, 'Client 4', NULL, 'client4@gmail.com', '45 Rue Oran', 'Tanger', '45002', '0645154210', 118, 'DEF456', 472, 19, 506, 0, 0, NULL, '2021-07-08 20:26:55', '2021-07-08 20:26:55'),
(47, 12, 'Abdoul', 'Mohamadou', 'abdoul@gmail.com', '31 Rue Lagos', 'Fès', '30050', '0645978541', 500, 'ABC123', 2940, 118, 3073, 1, 0, NULL, '2021-07-08 21:56:51', '2021-07-08 21:56:51'),
(48, 13, 'ayoub', NULL, 'ayoub@gmail.com', '31 rue lagos', 'Kénitra', '654210', '0645785421', 0, NULL, 291, 12, 318, 1, 1, NULL, '2021-07-09 08:12:41', '2021-07-09 08:16:23'),
(49, 4, 'Client 1', NULL, 'client1@gmail.com', '31 Rue Bamako Fès', 'Fès', '064012', '0610101010', 0, NULL, 4318, 173, 4506, 0, 0, NULL, '2022-06-01 11:17:52', '2022-06-01 11:17:52');

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

DROP TABLE IF EXISTS `commande_produit`;
CREATE TABLE IF NOT EXISTS `commande_produit` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `commande_id` int UNSIGNED DEFAULT NULL,
  `produit_id` int UNSIGNED DEFAULT NULL,
  `quantite` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commande_produit_commande_id_foreign` (`commande_id`),
  KEY `commande_produit_produit_id_foreign` (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande_produit`
--

INSERT INTO `commande_produit` (`id`, `commande_id`, `produit_id`, `quantite`, `created_at`, `updated_at`) VALUES
(1, 29, 7, 1, '2021-06-25 14:54:31', '2021-06-25 14:54:31'),
(2, NULL, 1, 1, '2021-06-25 16:05:48', '2021-06-25 16:05:48'),
(3, NULL, 1, 1, '2021-06-25 16:52:40', '2021-06-25 16:52:40'),
(4, NULL, 1, 1, '2021-06-25 17:26:28', '2021-06-25 17:26:28'),
(5, NULL, 4, 1, '2021-06-26 15:56:08', '2021-06-26 15:56:08'),
(6, NULL, 1, 1, '2021-06-27 17:02:57', '2021-06-27 17:02:57'),
(7, NULL, 1, 1, '2021-06-27 17:07:47', '2021-06-27 17:07:47'),
(8, NULL, 1, 1, '2021-06-27 17:09:02', '2021-06-27 17:09:02'),
(9, NULL, 1, 1, '2021-06-27 17:09:37', '2021-06-27 17:09:37'),
(10, NULL, 1, 1, '2021-06-27 17:10:45', '2021-06-27 17:10:45'),
(11, 39, 1, 1, '2021-06-27 17:11:31', '2021-06-27 17:11:31'),
(12, NULL, 1, 1, '2021-06-27 17:12:17', '2021-06-27 17:12:17'),
(13, NULL, 4, 1, '2021-06-27 17:14:16', '2021-06-27 17:14:16'),
(14, 42, 4, 1, '2021-06-27 17:15:41', '2021-06-27 17:15:41'),
(15, 43, 7, 1, '2021-07-08 20:14:26', '2021-07-08 20:14:26'),
(16, 43, 8, 1, '2021-07-08 20:14:26', '2021-07-08 20:14:26'),
(17, 44, 15, 1, '2021-07-08 20:16:42', '2021-07-08 20:16:42'),
(18, 45, 9, 1, '2021-07-08 20:23:51', '2021-07-08 20:23:51'),
(19, 46, 12, 1, '2021-07-08 20:26:55', '2021-07-08 20:26:55'),
(20, 47, 9, 1, '2021-07-08 21:56:51', '2021-07-08 21:56:51'),
(21, 48, 7, 1, '2021-07-09 08:12:42', '2021-07-09 08:12:42'),
(22, 49, 1, 1, '2022-06-01 11:17:52', '2022-06-01 11:17:52'),
(23, 49, 4, 1, '2022-06-01 11:17:52', '2022-06-01 11:17:52');

-- --------------------------------------------------------

--
-- Structure de la table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
CREATE TABLE IF NOT EXISTS `contactus` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contactus`
--

INSERT INTO `contactus` (`id`, `name`, `email`, `message`, `created_at`, `updated_at`) VALUES
(4, 'Abdoussalam', 'abdel@gmail.com', 'Je suis satisfait du service', '2021-06-14 19:32:05', '2021-06-14 19:32:05'),
(6, 'Rachid', 'rachid@gmail.Com', 'J\'adore votre boutique', '2021-06-14 19:39:21', '2021-06-14 19:39:21'),
(10, 'Client 2', 'client2@gmail.com', 'Vous pourriez ajouter le paiment par paypal s\'il vous plait', '2021-06-23 16:23:48', '2021-06-23 16:23:48'),
(13, 'John', 'john@gmail.com', 'Super boutique', '2021-06-23 16:30:26', '2021-06-23 16:30:26');

-- --------------------------------------------------------

--
-- Structure de la table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int DEFAULT NULL,
  `percent_off` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `percent_off`, `created_at`, `updated_at`) VALUES
(1, 'ABC123', 'fixed', 500, NULL, '2021-06-06 14:26:00', '2021-06-06 14:26:00'),
(2, 'DEF456', 'percent', NULL, 20, '2021-06-06 14:26:21', '2021-06-06 14:26:21'),
(3, 'GHI789', 'fixed', 250, NULL, '2021-06-06 15:07:59', '2021-06-06 15:07:59');

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Nom', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Mot de passe', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Token de rappel', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Créé le', 0, 0, 0, 0, 0, 0, '{}', 7),
(7, 1, 'updated_at', 'timestamp', 'Mis à jour le', 0, 0, 0, 0, 0, 0, '{}', 8),
(8, 1, 'avatar', 'image', 'Avatar', 0, 0, 1, 1, 1, 1, '{}', 10),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Rôle', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 0, 0, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 13),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 14),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Nom', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Créé le', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Mis à jour le', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Nom', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Créé le', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Mis à jour le', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Nom d\'affichage', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Rôle', 0, 0, 0, 1, 1, 1, '{}', 11),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Ordre', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Nom', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Créé le', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Mis à jour le', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Auteur', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Catégorie', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Titre', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Extrait', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Corps', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Image de l\'article', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Mots-clés', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Statut', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Créé le', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Mis à jour le', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'Titre SEO', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Mis en avant', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Auteur', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Titre', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Extrait', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Corps', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Mots-clés', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Statut', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Créé le', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Mis à jour le', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Image de la page', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 8, 'id', 'hidden', 'ID', 1, 1, 1, 1, 1, 0, '{}', 1),
(57, 8, 'nom', 'text', 'Nom', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 8, 'slug', 'hidden', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"nom\",\"forceUpdate\":true}}', 3),
(59, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(60, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 9, 'id', 'hidden', 'ID', 1, 1, 1, 1, 1, 0, '{}', 1),
(62, 9, 'nom', 'text', 'Nom', 1, 1, 1, 1, 1, 1, '{}', 2),
(63, 9, 'slug', 'hidden', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"nom\",\"forceUpdate\":true}}', 3),
(64, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(65, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(66, 10, 'id', 'hidden', 'ID', 1, 1, 1, 1, 1, 0, '{}', 1),
(67, 10, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 2),
(68, 10, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"fixed\",\"options\":{\"fixed\":\"Esp\\u00e8ce\",\"percent\":\"Pourcentage\"}}', 3),
(69, 10, 'value', 'number', 'Valeur', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 4),
(70, 10, 'percent_off', 'number', 'Pourcentage', 0, 1, 1, 1, 1, 1, '{\"null\":\"\"}', 5),
(71, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
(72, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(73, 11, 'id', 'hidden', 'ID', 1, 1, 1, 1, 1, 0, '{}', 1),
(74, 11, 'nom', 'text', 'Nom', 1, 1, 1, 1, 1, 1, '{}', 3),
(75, 11, 'prix_ht', 'number', 'Prix HT', 1, 1, 1, 1, 1, 1, '{}', 4),
(76, 11, 'details', 'text', 'Details', 1, 1, 1, 1, 1, 1, '{}', 6),
(77, 11, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '{}', 7),
(78, 11, 'photo_principale', 'image', 'Photo Principale', 1, 1, 1, 1, 1, 1, '{}', 8),
(79, 11, 'featured', 'checkbox', 'Nouveauté', 1, 1, 1, 1, 1, 1, '{\"on\":\"Oui\",\"off\":\"Non\"}', 9),
(80, 11, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, '{}', 10),
(81, 11, 'quantite', 'number', 'Quantite', 1, 1, 1, 1, 1, 1, '{}', 11),
(82, 11, 'marque_id', 'hidden', 'Marque', 0, 0, 0, 1, 1, 1, '{}', 2),
(83, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 12),
(84, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(85, 11, 'produit_belongsto_marque_relationship', 'relationship', 'Marque', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Marque\",\"table\":\"marques\",\"type\":\"belongsTo\",\"column\":\"marque_id\",\"key\":\"id\",\"label\":\"nom\",\"pivot_table\":\"categorie_produit\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(86, 1, 'telephone', 'text', 'Telephone', 0, 1, 1, 1, 1, 1, '{}', 6),
(87, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 1, 1, 1, '{}', 9),
(88, 12, 'id', 'hidden', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(89, 12, 'user_id', 'text', 'Utilisateur', 0, 0, 0, 1, 1, 1, '{}', 2),
(90, 12, 'c_nom', 'text', 'Nom', 1, 0, 1, 1, 1, 1, '{}', 3),
(91, 12, 'c_prenom', 'text', 'Prenom', 0, 0, 1, 1, 1, 1, '{}', 4),
(92, 12, 'c_email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 5),
(93, 12, 'c_adresse', 'text', 'Adresse', 1, 1, 1, 1, 1, 1, '{}', 6),
(94, 12, 'c_ville', 'text', 'Ville', 1, 1, 1, 1, 1, 1, '{}', 7),
(95, 12, 'c_zipcode', 'text', 'Zipcode', 1, 0, 1, 1, 1, 1, '{}', 8),
(96, 12, 'c_telephone', 'text', 'Telephone', 1, 1, 1, 1, 1, 1, '{}', 9),
(97, 12, 'c_discount', 'checkbox', 'Coupon', 1, 1, 1, 1, 1, 1, '{\"on\":\"Oui\",\"off\":\"Non\"}', 10),
(98, 12, 'c_discountCode', 'text', 'Code Coupon', 0, 0, 1, 1, 1, 1, '{}', 11),
(99, 12, 'c_subtotal', 'number', 'Sous-Total', 1, 1, 1, 1, 1, 1, '{}', 12),
(100, 12, 'c_taxe', 'number', 'Taxe', 1, 0, 1, 0, 0, 0, '{}', 13),
(101, 12, 'c_total', 'number', 'Total', 1, 1, 1, 1, 1, 1, '{}', 14),
(102, 12, 'c_payement', 'checkbox', 'Paiement', 0, 1, 1, 1, 1, 1, '{\"on\":\"En Ligne\",\"off\":\"Cash\"}', 15),
(103, 12, 'statut', 'checkbox', 'Statut', 1, 1, 1, 1, 1, 1, '{\"on\":\"Livr\\u00e9\",\"off\":\"En Cours\"}', 16),
(104, 12, 'erreur', 'text', 'Erreur', 0, 0, 0, 0, 0, 0, '{}', 17),
(105, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 18),
(106, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19),
(107, 12, 'commande_belongstomany_produit_relationship', 'relationship', 'Produits', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Produit\",\"table\":\"produits\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nom\",\"pivot_table\":\"commande_produit\",\"pivot\":\"1\",\"taggable\":\"on\"}', 20),
(108, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(109, 13, 'name', 'text', 'Nom', 1, 1, 1, 0, 0, 1, '{}', 2),
(110, 13, 'email', 'text', 'Email', 1, 1, 1, 0, 0, 1, '{}', 3),
(111, 13, 'message', 'text', 'Message', 1, 1, 1, 0, 0, 1, '{}', 4),
(112, 13, 'created_at', 'timestamp', 'Date d\'envoi', 0, 1, 1, 0, 0, 1, '{}', 5),
(113, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(114, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(115, 14, 'user_id', 'text', 'User Id', 1, 0, 0, 0, 0, 0, '{}', 3),
(116, 14, 'produit_id', 'text', 'Produit Id', 1, 0, 0, 0, 0, 0, '{}', 4),
(117, 14, 'note', 'number', 'Note', 1, 1, 1, 0, 0, 1, '{}', 6),
(118, 14, 'message', 'text', 'Message', 0, 1, 1, 0, 0, 1, '{}', 7),
(119, 14, 'statut', 'checkbox', 'Statut', 1, 1, 1, 1, 1, 1, '{\"on\":\"Verifi\\u00e9\",\"off\":\"Non V\\u00e9rifi\\u00e9\"}', 8),
(120, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(121, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(122, 14, 'review_belongsto_produit_relationship', 'relationship', 'Produit', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\Models\\\\Produit\",\"table\":\"produits\",\"type\":\"belongsTo\",\"column\":\"produit_id\",\"key\":\"id\",\"label\":\"nom\",\"pivot_table\":\"categorie_produit\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(123, 14, 'review_belongsto_user_relationship', 'relationship', 'Utilisateur', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"categorie_produit\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(124, 12, 'commande_hasmany_commande_produit_relationship', 'relationship', 'Quantités', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\CommandeProduit\",\"table\":\"commande_produit\",\"type\":\"hasMany\",\"column\":\"commande_id\",\"key\":\"id\",\"label\":\"quantite\",\"pivot_table\":\"categorie_produit\",\"pivot\":\"0\",\"taggable\":\"0\"}', 21),
(125, 11, 'prix_reseller', 'number', 'Prix Revendeur', 0, 1, 1, 1, 1, 1, '{}', 5),
(126, 11, 'rating_count', 'text', 'Nombre de Votes', 0, 0, 1, 0, 0, 0, '{}', 14),
(127, 11, 'rating_cache', 'text', 'Note', 0, 0, 1, 0, 0, 0, '{}', 15),
(128, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(129, 20, 'percent_off', 'number', 'Pourcentage', 1, 1, 1, 1, 1, 1, '{}', 2),
(130, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(131, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(132, 11, 'produit_belongsto_promotion_relationship', 'relationship', 'Promotion', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Promotion\",\"table\":\"promotions\",\"type\":\"belongsTo\",\"column\":\"promotion_id\",\"key\":\"id\",\"label\":\"percent_off\",\"pivot_table\":\"categorie_produit\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(133, 11, 'promotion_id', 'hidden', 'Promotion Id', 0, 0, 0, 1, 1, 1, '{}', 3),
(134, 20, 'online', 'checkbox', 'Actif', 1, 1, 1, 1, 1, 1, '{\"on\":\"Oui\",\"off\":\"Non\"}', 3),
(135, 1, 'last_name', 'text', 'Prénom', 0, 0, 1, 1, 1, 1, '{}', 4),
(136, 1, 'adresse', 'text', 'Adresse', 0, 0, 1, 1, 1, 1, '{}', 8),
(137, 1, 'ville', 'text', 'Ville', 0, 0, 1, 1, 1, 1, '{}', 9),
(138, 1, 'zipcode', 'text', 'Code Postal', 0, 0, 1, 1, 1, 1, '{}', 10);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Utilisateur', 'Utilisateurs', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-06-06 13:48:35', '2021-06-27 16:30:53'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-06-06 13:48:35', '2021-06-06 13:48:35'),
(3, 'roles', 'roles', 'Rôle', 'Rôles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-06-06 13:48:35', '2021-06-06 13:48:35'),
(4, 'categories', 'categories', 'Catégorie', 'Catégories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-06-06 13:48:44', '2021-06-06 13:48:44'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-06-06 13:48:46', '2021-06-06 13:48:46'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-06-06 13:48:49', '2021-06-06 13:48:49'),
(8, 'category', 'category', 'Categorie', 'Categories', 'voyager-categories', 'App\\Models\\Categorie', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-06 13:52:17', '2021-06-06 14:50:36'),
(9, 'marques', 'marques', 'Marque', 'Marques', 'voyager-bookmark', 'App\\Models\\Marque', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-06 13:55:23', '2021-06-06 14:50:53'),
(10, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-ticket', 'App\\Models\\Coupon', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-06 14:08:12', '2021-06-06 14:51:03'),
(11, 'produits', 'produits', 'Produit', 'Produits', 'voyager-bag', 'App\\Models\\Produit', NULL, 'App\\Http\\Controllers\\Voyager\\ProduitsController', NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-06 14:14:41', '2021-06-16 22:59:38'),
(12, 'commandes', 'commandes', 'Commande', 'Commandes', 'voyager-basket', 'App\\Models\\Commande', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-06 16:39:18', '2021-06-15 17:28:05'),
(13, 'contactus', 'contactus', 'Contactu', 'Contactus', 'voyager-mail', 'App\\Models\\ContactUS', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-12 19:41:49', '2021-06-12 19:44:04'),
(14, 'reviews', 'reviews', 'Review', 'Reviews', 'voyager-star', 'App\\Models\\Review', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-12 19:48:06', '2021-06-12 20:13:40'),
(20, 'promotions', 'promotions', 'Promotion', 'Promotions', 'voyager-gift', 'App\\Models\\Promotion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-16 22:56:06', '2021-06-22 13:35:03');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marques`
--

DROP TABLE IF EXISTS `marques`;
CREATE TABLE IF NOT EXISTS `marques` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marques_nom_unique` (`nom`),
  UNIQUE KEY `marques_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `marques`
--

INSERT INTO `marques` (`id`, `nom`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'ASUS', 'asus', '2021-06-06 14:22:44', '2021-06-06 14:22:44'),
(2, 'HP', 'hp', '2021-06-06 14:22:52', '2021-06-06 14:22:52'),
(3, 'Acer', 'acer', '2021-06-06 14:22:59', '2021-06-06 14:22:59'),
(4, 'Samsung', 'samsung', '2021-06-06 14:23:06', '2021-06-06 14:23:06'),
(5, 'Huawei', 'huawei', '2021-06-06 14:23:12', '2021-06-06 14:23:12'),
(6, 'Apple', 'apple', '2021-06-06 14:23:17', '2021-06-06 14:23:17'),
(7, 'Lenovo', 'lenovo', '2021-06-06 14:37:52', '2021-06-06 14:37:52');

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-06-06 13:48:37', '2021-06-06 13:48:37'),
(2, 'navigation', '2021-06-22 12:05:57', '2021-06-22 12:05:57'),
(3, 'social_links', '2021-06-22 12:32:31', '2021-06-22 12:32:31'),
(4, 'Informations', '2021-06-22 14:42:59', '2021-06-22 14:42:59');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Tableau de bord', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-06-06 13:48:37', '2021-06-06 13:48:37', 'voyager.dashboard', NULL),
(2, 1, 'Médiathèque', '', '_self', 'voyager-images', NULL, NULL, 12, '2021-06-06 13:48:37', '2021-06-16 22:56:30', 'voyager.media.index', NULL),
(3, 1, 'Utilisateurs', '', '_self', 'voyager-person', NULL, NULL, 8, '2021-06-06 13:48:37', '2021-06-16 22:56:30', 'voyager.users.index', NULL),
(4, 1, 'Rôles', '', '_self', 'voyager-lock', NULL, NULL, 9, '2021-06-06 13:48:38', '2021-06-16 22:56:30', 'voyager.roles.index', NULL),
(5, 1, 'Outils', '', '_self', 'voyager-tools', NULL, NULL, 15, '2021-06-06 13:48:38', '2021-06-16 22:56:30', NULL, NULL),
(6, 1, 'Créateur de menus', '', '_self', 'voyager-list', NULL, 5, 1, '2021-06-06 13:48:38', '2021-06-06 13:52:30', 'voyager.menus.index', NULL),
(7, 1, 'Base de données', '', '_self', 'voyager-data', NULL, 5, 2, '2021-06-06 13:48:38', '2021-06-06 13:52:30', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2021-06-06 13:48:38', '2021-06-06 13:52:30', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2021-06-06 13:48:38', '2021-06-06 13:52:30', 'voyager.bread.index', NULL),
(10, 1, 'Paramètres', '', '_self', 'voyager-settings', NULL, NULL, 17, '2021-06-06 13:48:38', '2021-06-16 22:56:30', 'voyager.settings.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 13, '2021-06-06 13:48:47', '2021-06-16 22:56:30', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 14, '2021-06-06 13:48:50', '2021-06-16 22:56:30', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, NULL, 16, '2021-06-06 13:48:52', '2021-06-16 22:56:30', 'voyager.hooks', NULL),
(15, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 3, '2021-06-06 13:52:17', '2021-06-06 16:39:45', 'voyager.category.index', NULL),
(16, 1, 'Marques', '', '_self', 'voyager-bookmark', NULL, NULL, 4, '2021-06-06 13:55:23', '2021-06-06 16:39:46', 'voyager.marques.index', NULL),
(17, 1, 'Coupons', '', '_self', 'voyager-ticket', NULL, NULL, 7, '2021-06-06 14:08:12', '2021-06-16 22:56:32', 'voyager.coupons.index', NULL),
(18, 1, 'Produits', '', '_self', 'voyager-bag', NULL, NULL, 5, '2021-06-06 14:14:41', '2021-06-06 16:39:46', 'voyager.produits.index', NULL),
(19, 1, 'Commandes', '', '_self', 'voyager-basket', NULL, NULL, 2, '2021-06-06 16:39:19', '2021-06-06 16:39:45', 'voyager.commandes.index', NULL),
(20, 1, 'Messages', '', '_self', 'voyager-mail', '#000000', NULL, 10, '2021-06-12 19:41:49', '2021-06-16 22:56:30', 'voyager.contactus.index', 'null'),
(21, 1, 'Reviews', '', '_self', 'voyager-star', NULL, NULL, 11, '2021-06-12 19:48:06', '2021-06-16 22:56:30', 'voyager.reviews.index', NULL),
(24, 1, 'Promotions', '', '_self', 'voyager-gift', NULL, NULL, 6, '2021-06-16 22:56:06', '2021-06-16 22:56:32', 'voyager.promotions.index', NULL),
(25, 2, 'Boutique', '', '_self', NULL, '#000000', NULL, 4, '2021-06-22 12:09:59', '2021-06-27 16:36:09', 'voir_produits', NULL),
(28, 2, 'Promotions', '', '_self', NULL, '#000000', NULL, 3, '2021-06-22 12:20:19', '2021-07-07 08:42:43', 'voir_promotions', NULL),
(29, 2, 'Laptops', '/boutique?categorie=laptops', '_self', NULL, '#000000', NULL, 5, '2021-06-22 12:22:17', '2021-06-27 16:36:09', NULL, ''),
(30, 2, 'Desktops', '/boutique?categorie=desktops', '_self', NULL, '#000000', NULL, 6, '2021-06-22 12:25:00', '2021-06-27 16:36:09', NULL, ''),
(31, 2, 'Caméras', '/boutique?categorie=cameras', '_self', NULL, '#000000', NULL, 7, '2021-06-22 12:25:31', '2021-06-27 16:36:09', NULL, ''),
(32, 2, 'Accéssoires', '/boutique?categorie=accessoires', '_self', NULL, '#000000', NULL, 8, '2021-06-22 12:25:56', '2021-06-27 16:36:09', NULL, ''),
(33, 3, 'facebook', 'https://www.facebook.com/GINFO-215661988838670/', '_self', NULL, '#000000', NULL, 1, '2021-06-22 12:35:04', '2021-06-22 14:38:14', NULL, ''),
(34, 3, 'instagram', '', '_self', NULL, '#000000', NULL, 2, '2021-06-22 12:35:14', '2021-06-22 14:38:15', NULL, ''),
(35, 3, 'twitter', '', '_self', NULL, '#000000', NULL, 3, '2021-06-22 12:35:22', '2021-06-22 14:38:16', NULL, ''),
(36, 3, 'linkedin', '', '_self', NULL, '#000000', NULL, 4, '2021-06-22 12:35:41', '2021-06-22 14:38:16', NULL, ''),
(37, 2, 'Catégories', '', '_self', NULL, '#000000', NULL, 2, '2021-06-22 13:10:36', '2021-07-08 20:05:04', NULL, ''),
(38, 2, 'Acceuil', '/', '_self', NULL, '#000000', NULL, 1, '2021-06-22 13:12:00', '2021-07-08 20:05:04', NULL, ''),
(39, 4, 'Téléphone', '+212-662-158-998', '_self', NULL, '#000000', NULL, 1, '2021-06-22 14:44:03', '2021-07-08 20:49:50', NULL, ''),
(40, 4, 'Mail', 'ginfofes@gmail.com', '_self', NULL, '#000000', NULL, 2, '2021-06-22 14:44:12', '2021-07-08 20:49:50', NULL, ''),
(41, 4, '67, Hay Farah II, Rue Khalil - Fès', 'https://goo.gl/maps/Z789dpW5LTifagUz9', '_blank', NULL, '#000000', NULL, 3, '2021-06-22 14:44:20', '2021-06-27 16:35:32', NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2021_05_09_225250_create_produits_table', 1),
(29, '2021_05_18_154110_create_category_table', 1),
(30, '2021_05_18_163817_create_categorie_produit_table', 1),
(31, '2021_05_18_204844_create_coupons_table', 1),
(32, '2021_05_25_134735_create_marques_table', 1),
(33, '2021_05_25_151524_add_marque_id_to_produits', 1),
(34, '2021_05_26_142059_create_commandes_table', 1),
(35, '2021_05_26_143723_create_commande_produit_table', 1),
(36, '2021_06_07_130926_add_users_informations', 2),
(37, '2021_06_07_132229_add_users_informations', 3),
(38, '2021_06_08_150225_add_informations_user', 4),
(42, '2021_06_09_151850_add_infos_products', 6),
(43, '2021_06_09_112217_create_reviews_table', 7),
(44, '2021_06_12_201009_create_contact_us_table', 8),
(45, '2021_06_14_125535_create_notifications_table', 9),
(49, '2021_06_16_225701_create_promotions_table', 10),
(50, '2021_06_16_235013_add_promotion_to_produit', 10);

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0180b75f-8453-48ed-b4f4-68321e778025', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 2\",\"email\":\"client2@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 13:26:59', '2021-06-25 13:26:59'),
('021c882b-8427-4b33-944f-17e9cb0aae1a', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:16:45', '2021-07-08 20:16:45'),
('04d74740-b40f-4b80-b306-089aae53209d', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:20:50', '2021-06-25 01:20:50'),
('0f91d6db-cb7e-4241-b44f-b60c052cc6f4', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:45:28', '2021-06-25 01:45:28'),
('1020240a-c19e-4e89-99e5-4e2a8e08ba5f', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 16:05:52', '2021-06-25 16:05:52'),
('1299f478-0e6b-49fa-82b0-5caedec178a6', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 2, '{\"id\":1,\"name\":\"Client 5\",\"email\":\"client5@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:27:51', '2021-07-08 20:27:51'),
('17659794-ec0d-4ff7-b5f4-ab38a06d034c', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-27 17:12:19', '2021-06-27 17:12:19'),
('1c345024-53c3-4bef-8d9d-a8ed50ef817b', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-27 17:03:01', '2021-06-27 17:03:01'),
('1e077379-e880-4954-9e27-a87bbaceeed0', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-23 23:50:46', '2021-06-23 23:50:46'),
('1e307a85-442a-4587-9fa8-0536bfd07899', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"Client 2\",\"email\":\"client2@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:14:31', '2021-07-08 20:14:31'),
('223abe7c-857a-41ff-aa80-2d2988d55876', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2022-06-01 11:17:58', '2022-06-01 11:17:58'),
('24792ec8-f982-408a-a69d-3a531847675a', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:55:38', '2021-06-25 01:55:38'),
('2800ef6d-f84b-4ee3-aea2-b8103008e49e', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:14:36', '2021-06-25 01:14:36'),
('2d89e354-d46b-4068-937c-f3b2f87bd982', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:23:55', '2021-07-08 20:23:55'),
('30253bcb-08dc-41a0-9f24-2668c07604af', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 16:52:45', '2021-06-25 16:52:45'),
('313a7ed6-2fd0-4a75-9991-2f0d98ca086b', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-24 00:07:27', '2021-06-24 00:07:27'),
('32e89e6d-a448-4fb5-9821-4868a8a7aa92', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:32:14', '2021-06-25 01:32:14'),
('3abf42a7-5cc3-4604-9aa6-3f3a78f54a8a', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:24:29', '2021-06-25 01:24:29'),
('44534643-6e4f-47de-8925-fd07123abf1d', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:27:15', '2021-06-25 01:27:15'),
('44f46568-667f-44e9-a9a6-e2b429aced42', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 7, '{\"id\":1,\"name\":\"Client 5\",\"email\":\"client5@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:27:51', '2021-07-08 20:27:51'),
('455da91a-3ac2-4c61-b494-fbccc5232e3b', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"Client 4\",\"email\":\"client4@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:26:57', '2021-07-08 20:26:57'),
('471c5e22-55aa-4b0d-9896-4475ac9d8da9', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 2, '{\"id\":1,\"name\":\"Client 5\",\"email\":\"client5@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-26 15:09:57', '2021-06-26 15:09:57'),
('54133cba-b2d4-4d81-958e-b689ebaec12e', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 1, '{\"id\":1,\"name\":\"ayoub\",\"email\":\"ayoub@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-09 08:11:56', '2021-07-09 08:11:56'),
('57266306-a774-4d6d-acb2-6b6ebfb107d0', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:22:53', '2021-06-25 01:22:53'),
('594e5957-a133-4d7f-82f6-b6a9e089dc1b', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:23:55', '2021-07-08 20:23:55'),
('5d9d02a5-b035-4be1-a1e9-1a60c5246b79', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-26 15:56:13', '2021-06-26 15:56:13'),
('60a113b0-ef09-467c-aeaf-859dd14981dd', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-24 16:51:27', '2021-06-24 16:51:27'),
('64d95ed5-1b90-4751-9c6a-dcb1c77ec37e', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:47:24', '2021-06-25 01:47:24'),
('66a76a47-be94-4e33-a07c-ecb046846189', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 7, '{\"id\":1,\"name\":\"Client 5\",\"email\":\"client5@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-26 15:09:57', '2021-06-26 15:09:57'),
('6c20320c-6277-456b-b6a8-9334effd75f8', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 2, '{\"id\":1,\"name\":\"Client 5\",\"email\":\"client5@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-26 14:56:08', '2021-06-26 14:56:08'),
('715e92da-d95a-414c-aba7-4973944f85ea', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 7, '{\"id\":1,\"name\":\"ayoub\",\"email\":\"ayoub@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-09 08:11:56', '2021-07-09 08:11:56'),
('7ce95001-0853-4aee-885d-48a6afa22d56', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 7, '{\"id\":1,\"name\":\"Abdoul\",\"email\":\"abdoul@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 21:55:26', '2021-07-08 21:55:26'),
('81305b2f-08f3-47a8-80f6-f31c2b6860cf', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-27 17:12:20', '2021-06-27 17:12:20'),
('8ccfe0fd-86af-4507-8a23-fe3e3ccc8c55', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:16:45', '2021-07-08 20:16:45'),
('93758d46-45ef-4f51-97ff-f7c07e4f1d66', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 02:11:27', '2021-06-25 02:11:27'),
('94b7122a-fbcb-4b0f-b38d-4d6b19a34d8e', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 1, '{\"id\":1,\"name\":\"Abdoul\",\"email\":\"abdoul@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 21:55:26', '2021-07-08 21:55:26'),
('9e7e9a3b-3da8-4059-8c71-52f015c21e8a', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 02:03:47', '2021-06-25 02:03:47'),
('a648281d-93db-41f4-9a18-499535963f88', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 7, '{\"id\":1,\"name\":\"Client 5\",\"email\":\"client5@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-26 14:56:08', '2021-06-26 14:56:08'),
('a7761059-e55e-4df1-8def-121a7678bf55', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 1, '{\"id\":1,\"name\":\"Mohamadou\",\"email\":\"abdoulbaguimohamadou@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-10 11:12:42', '2021-07-10 11:12:42'),
('a847b7aa-67b4-4cae-8aa1-4b4996e462d5', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-23 21:51:50', '2021-06-23 21:51:50'),
('ad76a7c9-3eb9-426a-b487-56f4691d6e68', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 2, '{\"id\":1,\"name\":\"Client 4\",\"email\":\"client4@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:25:52', '2021-07-08 20:25:52'),
('ae57ecc9-2e31-4476-bb6e-de935542d278', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 7, '{\"id\":1,\"name\":\"Client 4\",\"email\":\"client4@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:25:52', '2021-07-08 20:25:52'),
('b5d8aff6-5f3f-4c5d-8450-fb17773815fe', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 1, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2022-06-01 11:17:58', '2022-06-01 11:17:58'),
('be0d8ce9-5711-450c-955a-b0db9ce86f4d', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 17:26:31', '2021-06-25 17:26:31'),
('bf07bccf-9f6f-4ce1-a2cf-8c98171728fc', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2022-06-01 11:17:58', '2022-06-01 11:17:58'),
('c278d912-6622-4078-ae74-8289718058f7', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 1, '{\"id\":2,\"name\":\"Abdoul\",\"email\":\"abdoul@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 21:56:54', '2021-07-08 21:56:54'),
('c672da53-0786-4c81-9851-9b26cdd70731', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 2, '{\"id\":1,\"name\":\"Abdoul\",\"email\":\"abdoul@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 21:55:26', '2021-07-08 21:55:26'),
('ca69dc6f-c53d-485b-9559-ba740ee967b6', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"ayoub\",\"email\":\"ayoub@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-09 08:12:45', '2021-07-09 08:12:45'),
('cb4fe92e-3347-4688-a974-3af264d3d333', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 2, '{\"id\":1,\"name\":\"ayoub\",\"email\":\"ayoub@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-09 08:11:56', '2021-07-09 08:11:56'),
('d5179db8-c5ac-46f4-88cf-13f7278022a8', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 2\",\"email\":\"client2@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 13:00:20', '2021-06-25 13:00:20'),
('d5e8c4ee-1c32-4cbb-96ef-dd281d7edb28', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 2\",\"email\":\"client2@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:14:31', '2021-07-08 20:14:31'),
('d8ba24d5-6096-498c-8fa7-047ca47660e2', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"ayoub\",\"email\":\"ayoub@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-09 08:12:45', '2021-07-09 08:12:45'),
('d9c86ced-f9d4-4403-a34b-9984c2051dff', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 2, '{\"id\":2,\"name\":\"Abdoul\",\"email\":\"abdoul@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 21:56:54', '2021-07-08 21:56:54'),
('daeb46c5-3bc0-4d16-b5a2-98bcf5c68499', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 4\",\"email\":\"client4@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 20:26:57', '2021-07-08 20:26:57'),
('dd004f9e-9cb2-4eb1-a07e-520179ac3bcb', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 01:26:49', '2021-06-25 01:26:49'),
('ed65fa36-6e8e-49c3-a594-fc41a53a9958', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 02:04:38', '2021-06-25 02:04:38'),
('ee82d9ac-9ac3-43b2-870e-a273e97c2d12', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-27 17:03:02', '2021-06-27 17:03:02'),
('ef508dac-da6b-48c8-8893-4c09e32cde82', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 3\",\"email\":\"client3@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-24 00:27:32', '2021-06-24 00:27:32'),
('f0512d30-794a-4ec7-be74-e1779ba3786a', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-26 15:56:13', '2021-06-26 15:56:13'),
('f0526ab9-cb21-4f0c-acdd-7d7ed4044eaf', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Client 1\",\"email\":\"client1@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-06-25 14:54:36', '2021-06-25 14:54:36'),
('f0d0261b-d4da-455d-aa8f-e1685384ba17', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 7, '{\"id\":1,\"name\":\"Mohamadou\",\"email\":\"abdoulbaguimohamadou@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-10 11:12:42', '2021-07-10 11:12:42'),
('f1e276b1-054d-4a32-a40c-5ac414a5c27f', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 1, '{\"id\":2,\"name\":\"ayoub\",\"email\":\"ayoub@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-09 08:12:46', '2021-07-09 08:12:46'),
('f1f9ed40-4649-4aee-84c1-92d3a5f7a951', 'App\\Notifications\\NewOrderNotification', 'App\\Models\\User', 7, '{\"id\":2,\"name\":\"Abdoul\",\"email\":\"abdoul@gmail.com\",\"title\":\"Nouvelle Commande\",\"message\":\"vient de commander\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-08 21:56:54', '2021-07-08 21:56:54'),
('f9935cfa-bab6-4529-890c-e9de1a731813', 'App\\Notifications\\NewUserNotification', 'App\\Models\\User', 2, '{\"id\":1,\"name\":\"Mohamadou\",\"email\":\"abdoulbaguimohamadou@gmail.com\",\"title\":\"Nouvel Utilisateur\",\"message\":\"vient de s\'inscrire\",\"image\":\"users\\/default.png\"}', NULL, '2021-07-10 11:12:42', '2021-07-10 11:12:42');

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-06-06 13:48:50', '2021-06-06 13:48:50');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('client1@gmail.com', '$2y$10$teUmUKP1j5kWRqf21qCVS.8lrS/W7S58zgMTcrJMY27tFljW6rjJy', '2021-06-29 17:41:10'),
('abdoulbaguimohamadou@gmail.com', '$2y$10$bwRYLC4ReeM8rXIFd36xcOC.e1E3/qIE/2D3pR36KavWHegoAKu4i', '2022-05-21 20:02:17');

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(2, 'browse_bread', NULL, '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(3, 'browse_database', NULL, '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(4, 'browse_media', NULL, '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(5, 'browse_compass', NULL, '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(6, 'browse_menus', 'menus', '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(7, 'read_menus', 'menus', '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(8, 'edit_menus', 'menus', '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(9, 'add_menus', 'menus', '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(10, 'delete_menus', 'menus', '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(11, 'browse_roles', 'roles', '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(12, 'read_roles', 'roles', '2021-06-06 13:48:39', '2021-06-06 13:48:39'),
(13, 'edit_roles', 'roles', '2021-06-06 13:48:40', '2021-06-06 13:48:40'),
(14, 'add_roles', 'roles', '2021-06-06 13:48:40', '2021-06-06 13:48:40'),
(15, 'delete_roles', 'roles', '2021-06-06 13:48:40', '2021-06-06 13:48:40'),
(16, 'browse_users', 'users', '2021-06-06 13:48:40', '2021-06-06 13:48:40'),
(17, 'read_users', 'users', '2021-06-06 13:48:40', '2021-06-06 13:48:40'),
(18, 'edit_users', 'users', '2021-06-06 13:48:40', '2021-06-06 13:48:40'),
(19, 'add_users', 'users', '2021-06-06 13:48:40', '2021-06-06 13:48:40'),
(20, 'delete_users', 'users', '2021-06-06 13:48:40', '2021-06-06 13:48:40'),
(21, 'browse_settings', 'settings', '2021-06-06 13:48:41', '2021-06-06 13:48:41'),
(22, 'read_settings', 'settings', '2021-06-06 13:48:41', '2021-06-06 13:48:41'),
(23, 'edit_settings', 'settings', '2021-06-06 13:48:41', '2021-06-06 13:48:41'),
(24, 'add_settings', 'settings', '2021-06-06 13:48:41', '2021-06-06 13:48:41'),
(25, 'delete_settings', 'settings', '2021-06-06 13:48:41', '2021-06-06 13:48:41'),
(26, 'browse_categories', 'categories', '2021-06-06 13:48:45', '2021-06-06 13:48:45'),
(27, 'read_categories', 'categories', '2021-06-06 13:48:45', '2021-06-06 13:48:45'),
(28, 'edit_categories', 'categories', '2021-06-06 13:48:45', '2021-06-06 13:48:45'),
(29, 'add_categories', 'categories', '2021-06-06 13:48:46', '2021-06-06 13:48:46'),
(30, 'delete_categories', 'categories', '2021-06-06 13:48:46', '2021-06-06 13:48:46'),
(31, 'browse_posts', 'posts', '2021-06-06 13:48:48', '2021-06-06 13:48:48'),
(32, 'read_posts', 'posts', '2021-06-06 13:48:48', '2021-06-06 13:48:48'),
(33, 'edit_posts', 'posts', '2021-06-06 13:48:48', '2021-06-06 13:48:48'),
(34, 'add_posts', 'posts', '2021-06-06 13:48:48', '2021-06-06 13:48:48'),
(35, 'delete_posts', 'posts', '2021-06-06 13:48:48', '2021-06-06 13:48:48'),
(36, 'browse_pages', 'pages', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(37, 'read_pages', 'pages', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(38, 'edit_pages', 'pages', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(39, 'add_pages', 'pages', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(40, 'delete_pages', 'pages', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(41, 'browse_hooks', NULL, '2021-06-06 13:48:52', '2021-06-06 13:48:52'),
(42, 'browse_category', 'category', '2021-06-06 13:52:17', '2021-06-06 13:52:17'),
(43, 'read_category', 'category', '2021-06-06 13:52:17', '2021-06-06 13:52:17'),
(44, 'edit_category', 'category', '2021-06-06 13:52:17', '2021-06-06 13:52:17'),
(45, 'add_category', 'category', '2021-06-06 13:52:17', '2021-06-06 13:52:17'),
(46, 'delete_category', 'category', '2021-06-06 13:52:17', '2021-06-06 13:52:17'),
(47, 'browse_marques', 'marques', '2021-06-06 13:55:23', '2021-06-06 13:55:23'),
(48, 'read_marques', 'marques', '2021-06-06 13:55:23', '2021-06-06 13:55:23'),
(49, 'edit_marques', 'marques', '2021-06-06 13:55:23', '2021-06-06 13:55:23'),
(50, 'add_marques', 'marques', '2021-06-06 13:55:23', '2021-06-06 13:55:23'),
(51, 'delete_marques', 'marques', '2021-06-06 13:55:23', '2021-06-06 13:55:23'),
(52, 'browse_coupons', 'coupons', '2021-06-06 14:08:12', '2021-06-06 14:08:12'),
(53, 'read_coupons', 'coupons', '2021-06-06 14:08:12', '2021-06-06 14:08:12'),
(54, 'edit_coupons', 'coupons', '2021-06-06 14:08:12', '2021-06-06 14:08:12'),
(55, 'add_coupons', 'coupons', '2021-06-06 14:08:12', '2021-06-06 14:08:12'),
(56, 'delete_coupons', 'coupons', '2021-06-06 14:08:12', '2021-06-06 14:08:12'),
(57, 'browse_produits', 'produits', '2021-06-06 14:14:41', '2021-06-06 14:14:41'),
(58, 'read_produits', 'produits', '2021-06-06 14:14:41', '2021-06-06 14:14:41'),
(59, 'edit_produits', 'produits', '2021-06-06 14:14:41', '2021-06-06 14:14:41'),
(60, 'add_produits', 'produits', '2021-06-06 14:14:41', '2021-06-06 14:14:41'),
(61, 'delete_produits', 'produits', '2021-06-06 14:14:41', '2021-06-06 14:14:41'),
(62, 'browse_commandes', 'commandes', '2021-06-06 16:39:19', '2021-06-06 16:39:19'),
(63, 'read_commandes', 'commandes', '2021-06-06 16:39:19', '2021-06-06 16:39:19'),
(64, 'edit_commandes', 'commandes', '2021-06-06 16:39:19', '2021-06-06 16:39:19'),
(65, 'add_commandes', 'commandes', '2021-06-06 16:39:19', '2021-06-06 16:39:19'),
(66, 'delete_commandes', 'commandes', '2021-06-06 16:39:19', '2021-06-06 16:39:19'),
(67, 'browse_contactus', 'contactus', '2021-06-12 19:41:49', '2021-06-12 19:41:49'),
(68, 'read_contactus', 'contactus', '2021-06-12 19:41:49', '2021-06-12 19:41:49'),
(69, 'edit_contactus', 'contactus', '2021-06-12 19:41:49', '2021-06-12 19:41:49'),
(70, 'add_contactus', 'contactus', '2021-06-12 19:41:49', '2021-06-12 19:41:49'),
(71, 'delete_contactus', 'contactus', '2021-06-12 19:41:49', '2021-06-12 19:41:49'),
(72, 'browse_reviews', 'reviews', '2021-06-12 19:48:06', '2021-06-12 19:48:06'),
(73, 'read_reviews', 'reviews', '2021-06-12 19:48:06', '2021-06-12 19:48:06'),
(74, 'edit_reviews', 'reviews', '2021-06-12 19:48:06', '2021-06-12 19:48:06'),
(75, 'add_reviews', 'reviews', '2021-06-12 19:48:06', '2021-06-12 19:48:06'),
(76, 'delete_reviews', 'reviews', '2021-06-12 19:48:06', '2021-06-12 19:48:06'),
(87, 'browse_promotions', 'promotions', '2021-06-16 22:56:06', '2021-06-16 22:56:06'),
(88, 'read_promotions', 'promotions', '2021-06-16 22:56:06', '2021-06-16 22:56:06'),
(89, 'edit_promotions', 'promotions', '2021-06-16 22:56:06', '2021-06-16 22:56:06'),
(90, 'add_promotions', 'promotions', '2021-06-16 22:56:06', '2021-06-16 22:56:06'),
(91, 'delete_promotions', 'promotions', '2021-06-16 22:56:06', '2021-06-16 22:56:06');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(6, 1),
(6, 3),
(6, 5),
(7, 1),
(7, 3),
(7, 5),
(8, 1),
(8, 3),
(8, 5),
(9, 5),
(10, 1),
(10, 3),
(10, 5),
(11, 5),
(12, 5),
(13, 5),
(14, 5),
(15, 5),
(16, 1),
(16, 5),
(17, 1),
(17, 5),
(18, 1),
(18, 5),
(19, 1),
(19, 5),
(20, 1),
(20, 5),
(21, 1),
(21, 3),
(21, 5),
(22, 1),
(22, 3),
(22, 5),
(23, 1),
(23, 3),
(23, 5),
(24, 5),
(25, 5),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 5),
(33, 5),
(34, 5),
(35, 5),
(36, 5),
(37, 5),
(38, 5),
(39, 5),
(40, 5),
(42, 1),
(42, 3),
(42, 5),
(43, 1),
(43, 3),
(43, 5),
(44, 1),
(44, 3),
(44, 5),
(45, 1),
(45, 3),
(45, 5),
(46, 1),
(46, 3),
(46, 5),
(47, 1),
(47, 3),
(47, 5),
(48, 1),
(48, 3),
(48, 5),
(49, 1),
(49, 3),
(49, 5),
(50, 1),
(50, 3),
(50, 5),
(51, 1),
(51, 3),
(51, 5),
(52, 1),
(52, 3),
(52, 5),
(53, 1),
(53, 3),
(53, 5),
(54, 1),
(54, 3),
(54, 5),
(55, 1),
(55, 3),
(55, 5),
(56, 1),
(56, 3),
(56, 5),
(57, 1),
(57, 3),
(57, 5),
(58, 1),
(58, 3),
(58, 5),
(59, 1),
(59, 3),
(59, 5),
(60, 1),
(60, 3),
(60, 5),
(61, 1),
(61, 3),
(61, 5),
(62, 1),
(62, 3),
(62, 5),
(63, 1),
(63, 3),
(63, 5),
(64, 1),
(64, 3),
(64, 5),
(65, 1),
(66, 1),
(66, 3),
(66, 5),
(67, 1),
(67, 3),
(67, 5),
(68, 1),
(68, 3),
(68, 5),
(71, 1),
(71, 3),
(71, 5),
(72, 1),
(72, 3),
(72, 5),
(73, 1),
(73, 3),
(73, 5),
(74, 1),
(74, 3),
(74, 5),
(76, 1),
(76, 3),
(76, 5),
(87, 1),
(87, 3),
(87, 5),
(88, 1),
(88, 3),
(88, 5),
(89, 1),
(89, 3),
(89, 5),
(90, 1),
(90, 3),
(90, 5),
(91, 1),
(91, 3),
(91, 5);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-06-06 13:48:48', '2021-06-06 13:48:48'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-06-06 13:48:48', '2021-06-06 13:48:48'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-06-06 13:48:48', '2021-06-06 13:48:48'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-06-06 13:48:49', '2021-06-06 13:48:49');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_ht` double(8,2) NOT NULL,
  `prix_reseller` float DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_principale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantite` int UNSIGNED NOT NULL DEFAULT '30',
  `rating_count` int UNSIGNED DEFAULT NULL,
  `rating_cache` double(8,2) DEFAULT NULL,
  `marque_id` int UNSIGNED DEFAULT NULL,
  `promotion_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `produits_nom_unique` (`nom`),
  UNIQUE KEY `produits_photo_principale_unique` (`photo_principale`),
  KEY `produits_marque_id_foreign` (`marque_id`),
  KEY `produits_promotion_id_foreign` (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `prix_ht`, `prix_reseller`, `details`, `description`, `photo_principale`, `featured`, `images`, `quantite`, `rating_count`, `rating_cache`, `marque_id`, `promotion_id`, `created_at`, `updated_at`) VALUES
(1, 'ASUS Notebook X543B', 3599.00, 3000, 'Asus pc portable X543B AMD A9-9425 15.6\"\" HD 4GO 1TO WIN 10', '<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px 0px 0cm; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: 13.5pt; vertical-align: baseline;\">Ecran&nbsp;15.6\" LED&nbsp;HD&nbsp;(1366 x 768px) - Processeur&nbsp;AMD A9-9225&nbsp;(2,6 GHz&nbsp;up to 3.0 Ghz Turbo,&nbsp;1 Mo&nbsp;de M&eacute;moire cache,&nbsp;Dual Core) -&nbsp;Syst&eacute;me d\'exploitation:&nbsp;Windows 10&nbsp;- M&eacute;moire RAM:&nbsp;4 Go&nbsp;DDR4&nbsp;1866 MHz -&nbsp;Disque Dur:&nbsp;1 To&nbsp;HDD&nbsp;(5400 tr/min)&nbsp;-&nbsp;Carte graphique:&nbsp;AMD&nbsp;HD Graphics,&nbsp;Clavier Chiclet avec touche Num isol&eacute;e&nbsp;avec USB 3.0, HDMI, Lecteur de Carte SD et Webcam - Couleur:&nbsp;Silver -&nbsp;Garantie:&nbsp;1 an&nbsp; &nbsp;&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px 0px 0cm; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: 13.5pt; vertical-align: baseline;\">X543B -Color: Silver Gradient -AMD A9 Series -A9-9425 Dual Core 3.10 GHz up to 3.70GHz -8GB DDR 4 -1TB 5400 rpm HDD&nbsp; -15.6 Inches 16:9 HD LED-backlit Display 1366 x 768 - Wi-Fi 5 (802.11ac); Dual-Band (2.4 &amp; 5 GHz) -Bluetooth 4.1 - 1 x USB Type-A (USB 3.1 / USB 3.2 Gen 1) 2 x USB Type-A (USB 2.0) -1 x HDMI 1.4</p>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&Eacute;tat:&nbsp;Nouveau produit</span></p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">CPU :&nbsp;AMD A9-9425 3.1 Ghz</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">RAM : 4 Go DDR4&nbsp;1866MHz (Max 16 Gb)</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Stockage : 1000 Go HDD</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&Eacute;cran : 15.6\" LED HD</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">OS : Windows 10 64Bit</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Garantie : 1 an</p>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 0px 18px; color: #111111; font-family: Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">Processeur AMD A9-9425 avec carte graphique Radeon R5 int&eacute;gr&eacute;e&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">&eacute;cran HD 15,6\" (1366 x 768)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">disque dur 1 To</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">&nbsp;m&eacute;moire RAM DDR4 4 Go.</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">&eacute;tui fin et compact id&eacute;al pour transporter des ordinateurs portables jusqu\'&agrave; 15,6\" sans encombrer</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">poches de rangement pour accessoires pour souris portable, iPod, t&eacute;l&eacute;phone portable et stylos.</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">Bandouli&egrave;re rembourr&eacute;e</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">dimensions int&eacute;rieures : 36,8 x 5,6 x 28 cm (L x l x H).</li>\r\n</ul>', 'produits\\June2021\\AjjwUTKleju6AZAhxrVd.jpg', 1, '[\"produits\\\\June2021\\\\kK6HyAjA2VY0EaEvs5Mx.jpg\"]', 5, 1, 3.00, 1, 1, '2021-06-06 14:33:11', '2022-06-01 11:17:52'),
(2, 'Acer Aspire 3', 6285.05, 6000, 'Acer Pc Portable Aspire 3 AC315 I5-8256U 4GB/1TO 15,6\" - Linux', '<p style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 8px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit;\"><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 640px; margin: 0px; padding: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none; height: auto;\" src=\"https://ma.jumia.is/cms/external/pet/AC008CL0D6L8ZNAFAMZ/77c79f7d9936b33d10846b803e93e89b.jpg\" alt=\"Aspire 3 A315-56-51SD\" width=\"600\" data-src=\"https://ma.jumia.is/cms/external/pet/AC008CL0D6L8ZNAFAMZ/77c79f7d9936b33d10846b803e93e89b.jpg\" data-lzled=\"true\" /></p>\r\n<h4 class=\"wm_h4 wm_mg20\" style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; font-weight: inherit; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 20px; line-height: inherit;\">Avantages Aspire 3 A315-56-51SD :</h4>\r\n<ul style=\"box-sizing: border-box; padding: 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Ecran 15,6\'\' HD 60Hz</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Processeur Intel Core i5-1035G1</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Stockage SSD 256 Go</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">RAM 8 Go</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Windows 10</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Couleur noir</li>\r\n</ul>\r\n<h4 class=\"wm_h4 wm_mg20\" style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; font-weight: inherit; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 20px; line-height: inherit;\">Acer Precision Touchpad :</h4>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit;\">Un Touchpad plus pr&eacute;cis et plus large afin d&rsquo;am&eacute;liorer votre exp&eacute;rience au quotidien : scroller une page internet, agrandir, utiliser un outil bureautique&hellip;</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 8px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit;\"><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 640px; margin: 0px; padding: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none; height: auto;\" src=\"https://ma.jumia.is/cms/external/pet/AC008CL0D6L8ZNAFAMZ/71e6de01534a2a37ffe72106d54071a4.jpg\" alt=\"Aspire 3 A315-56-51SD\" width=\"600\" data-src=\"https://ma.jumia.is/cms/external/pet/AC008CL0D6L8ZNAFAMZ/71e6de01534a2a37ffe72106d54071a4.jpg\" data-lzled=\"true\" /></p>\r\n<h4 class=\"wm_h4 wm_mg20\" style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; font-weight: inherit; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 20px; line-height: inherit;\">Inclinable 180&deg; :</h4>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit;\">S&rsquo;adapte &agrave; toutes les situations pour une prise en main des plus agr&eacute;able.</p>\r\n<h4 class=\"wm_h4 wm_mg20\" style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; font-weight: inherit; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 20px; line-height: inherit;\">&nbsp;</h4>\r\n<h4 class=\"wm_h4 wm_mg20\" style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; font-weight: inherit; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 20px; line-height: inherit;\">Ecran &amp; Vid&eacute;o :</h4>\r\n<ul class=\"wm_mg20\" style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Ecran 15.6\" Acer ComfyView LED LCD (Dalle Mate)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Ratio image 16:9</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">R&eacute;solution HD (1366 x 768)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Taux de rafra&icirc;chissement : 60Hz</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Acer BluelightShield&trade; (pour att&eacute;nuer la lumi&egrave;re bleue)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Webcam (r&eacute;solution 640 x 480)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">2 haut-parleurs st&eacute;r&eacute;o</li>\r\n</ul>\r\n<h4 class=\"wm_h4 wm_mg20\" style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; font-weight: inherit; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 20px; line-height: inherit;\">Connectivit&eacute;s :</h4>\r\n<ul style=\"box-sizing: border-box; padding: 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Carte d\'acc&egrave;s r&eacute;seau sans fil 802.11ac (1x1)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">1 x RJ-45</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Bluetooth&reg; 4.2</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">2 x USB 2.0, 1 x USB 3.1 Gen 1</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">1 jack combo Audio/micro compatible casque smartphone 3,5mm</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">1 x HDMI</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Microphone</li>\r\n</ul>\r\n<h4 class=\"wm_h4 wm_mg20\" style=\"box-sizing: border-box; padding: 0px; margin: 20px 0px; font-weight: inherit; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 20px; line-height: inherit;\">Batterie et adaptateur :</h4>\r\n<ul style=\"box-sizing: border-box; padding: 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Batterie Li-ion 36Wh</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Adaptateur AC 45W</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; list-style-type: none;\">Autonomie jusqu\'&agrave; 8,5 heures</li>\r\n</ul>', 'produits\\June2021\\EJHLVmqHqML8Y17Zg7qf.jpg', 1, '[\"produits\\\\June2021\\\\GnR4YbZCv69pvTP36iJ0.jpg\"]', 0, NULL, NULL, 3, NULL, '2021-06-06 14:35:13', '2021-06-24 16:51:22'),
(3, 'Lenovo Thinkpad', 15650.99, 15001, 'Lenovo Thinkpad x1 carbon 7th-14\" FHD-i7 8565u-RAM16GB-512G SSD-Win10Pro-Azerty-Garantie24Mois', '<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/BR621CL0CB38KNAFAMZ/60e74b8cc75c1e616075eb488ef5fd47.jpg\" alt=\"image\" /></p>\r\n<h2 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">O&ugrave; que vous alliez</h2>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">6 % plus fin que son pr&eacute;d&eacute;cesseur, le X1 Carbon Gen 7 mesure seulement 14,9 mm d&rsquo;&eacute;paisseur, et il p&egrave;se uniquement 1,09 kg. Ce format l&eacute;ger r&eacute;invente la portabilit&eacute; et vous lib&egrave;re du bureau. Avec 18,3 heures d&rsquo;autonomie, et la technologie RapidCharge lorsque vous avez besoin de plus de batterie, vous pouvez aller o&ugrave; la route&mdash;ou le ciel&mdash;vous m&egrave;ne.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/BR621CL0CB38KNAFAMZ/03a734368e73f2edd5559b8ccd82441e.jpg\" alt=\"Overhead shot of Lenovo ThinkPad X1 Carbon Gen 7 open 180 degrees.\" /></p>\r\n<h2 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Petit format, puissance maximale</h2>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&Eacute;quip&eacute; de processeurs Intel&reg; Core&trade; de 8e g&eacute;n&eacute;ration et d&rsquo;une m&eacute;moire allant jusqu&rsquo;&agrave; 16 Go, le ThinkPad X1 Carbon Gen 7 renferme un maximum de puissance. Le SSD PCIe offre des performances rapides qui vous permettront de gagner en productivit&eacute;.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/BR621CL0CB38KNAFAMZ/baf13f09985013171195a640dc845dcf.jpg\" alt=\"Lenovo ThinkPad X1 Carbon Gen 7 display split in two, showing Standard Dynamic Range on one side and Dolby Vision High Dynamic Range on the other side.\" /></p>\r\n<h2 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Un vrai r&eacute;gal pour les yeux</h2>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Que vous regardiez une vid&eacute;o, utilisiez Skype pour parler avec quelqu&rsquo;un &agrave; l&rsquo;autre bout du monde ou regardiez des illustrations, le X1 Carbon Gen 7 offre une qualit&eacute; d&rsquo;image exceptionnelle. Profitez de la dalle 4K Dolby Vision&trade; cin&eacute;matique avec la technologie HDR. Les d&eacute;tails complexes ressortent tandis que les zones sombres et les textures deviennent plus riches. Choisissez parmi plusieurs &eacute;crans, notamment un &eacute;cran tactile Full HD ou un &eacute;cran Full HD avec PrivacyGuard pour la s&eacute;curit&eacute; de l&rsquo;&eacute;cran.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/BR621CL0CB38KNAFAMZ/16d94e0ebed183c1a1c55b5c546b5a3d.jpg\" alt=\"image\" /></p>\r\n<h2 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Con&ccedil;u pour des conditions extr&ecirc;mes</h2>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Comme pour tous les portables ThinkPad, nous testons la conformit&eacute; du X1 Carbon&nbsp; Gen 7 &agrave; 12 normes de robustesse de niveau militaire et nous le soumettons &agrave; plus de 200 contr&ocirc;les qualit&eacute; pour nous assurer qu&rsquo;il fonctionne dans les conditions les plus extr&ecirc;mes. Des vastes &eacute;tendues de l&rsquo;Arctique aux temp&ecirc;tes de sable dans le d&eacute;sert, en passant par les vols en apesanteur, les chutes et les &eacute;coulements de liquide, vous pouvez compter sur ce portable pour r&eacute;sister &agrave; toutes les situations.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/BR621CL0CB38KNAFAMZ/8d9351241ef93c7f001cbfd676d27bda.jpg\" alt=\"image\" /></p>\r\n<h2 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Un portable aussi bien connect&eacute; que vous</h2>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Lorsque vous &ecirc;tes en d&eacute;placement, le X1 Carbon Gen 7 vous permet de rester connect&eacute; m&ecirc;me lorsqu&rsquo;aucune connexion WiFi n&rsquo;est disponible. En choisissant la carte LTE-A en option et la technologie WWAN, votre portable peut fonctionner comme un smartphone. Lorsqu&rsquo;un op&eacute;rateur est disponible, vous pouvez passer en ligne. Et vous pouvez avoir confiance dans la s&eacute;curit&eacute; de votre connexion.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/BR621CL0CB38KNAFAMZ/cd57baa4310c34774b381063880e5043.jpg\" alt=\"X1 Carbon Gen 7 - got your back-and your front\" /></p>\r\n<h2 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Vous &ecirc;tes couvert quoi qu&rsquo;il arrive</h2>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Prot&eacute;gez vos informations strat&eacute;giques et votre vie priv&eacute;e gr&acirc;ce &agrave; la suite compl&egrave;te de fonctions de s&eacute;curit&eacute; ThinkShield du portable X1 Carbon Gen 7. Son module dTPM (discrete Trusted Platform Module) chiffre les donn&eacute;es et fonctionne de concert avec les fonctionnalit&eacute;s de s&eacute;curit&eacute; de Windows 10 Pro. ThinkShutter, cache physique int&eacute;gr&eacute; &agrave; la cam&eacute;ra, bloque l&rsquo;objectif pour vous assurer d&rsquo;&ecirc;tre vu uniquement lorsque vous le souhaitez. De plus, le lecteur d&rsquo;empreinte digitale fait appel &agrave; la biom&eacute;trie pour vous connecter d&rsquo;un simple effleurement.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/BR621CL0CB38KNAFAMZ/7f607d6569d3aa8e8ded57b116a396ac.jpg\" alt=\"Lenovo ThinkPad X1 Carbon&nbsp;Gen&nbsp;7\" /></p>\r\n<ol style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Bouton de mise sous tension</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">USB-A 3.1 (Gen 1)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Emplacement pour c&acirc;ble de s&eacute;curit&eacute; Kensington</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">USB-C Thunderbolt&trade; 3 (toujours aliment&eacute;)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">USB-C Thunderbolt&trade; 3</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Extension r&eacute;seau pour station d&rsquo;accueil &agrave; connexion m&eacute;canique lat&eacute;rale/Ethernet</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">USB-A 3.1 (Gen 1)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">HDMI 1.4</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Connecteur mixte &eacute;couteurs/micro</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Emplacement WWAN</li>\r\n</ol>\r\n<h1 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Caracteristique techniques du produit:</strong></h1>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Model: Lenovo Thinkpad x1 carbon 7th&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Taille de l\'&eacute;cran : 14p Full HD de r&eacute;solution 1920 * 1080</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Processeur :&nbsp;&nbsp;Intel&reg; Core&trade;&nbsp;i7-8565u 1.80GHZ , 8MB cache, Turbo boost 4,60GHZ</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Ram : 16GB DDR4 2133MHz&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Disque dur : 512GB SSD 100% flash.</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Carte Graphique :&nbsp;Intel&reg;&nbsp;UHD Graphics 620</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Clavier : Azerty&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">OS : Windows 10 pro 64 Bits.</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Ports :&nbsp; USB 3.1 Gen 1 ; USB 3.1 Gen 1 (toujours activ&eacute;) ; 2 USB-C 3.1 Gen 2 (prend en charge Thunderbolt 3, DisplayPort Alt Mode) (Power Delivery) ; Prise combo casque / microphone ; HDMI ; Connecteur d\'extension Ethernet Lenovo</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Poids: 1,09Kg</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Dimensions &nbsp;(L&nbsp;x&nbsp;P&nbsp;x&nbsp;H):&nbsp;32,3 x 21,7&nbsp; x 1,49 cm</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Garantie 24 Mois pro support.</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Produit neuf .</li>\r\n</ul>', 'produits\\June2021\\eDB9oq8NGkWsL91DvH0t.jpg', 1, '[\"produits\\\\June2021\\\\f8eXy0Gli4FhnMRCeLc2.jpg\",\"produits\\\\June2021\\\\cUbC5Oxat89Lgtnb6mHp.jpg\",\"produits\\\\June2021\\\\hM6SEnmnpglSz4LaWYH1.jpg\"]', 0, NULL, NULL, 7, NULL, '2021-06-06 14:37:14', '2021-06-16 23:46:54'),
(4, 'Edifier W830BT', 1199.00, 1000, 'Edifier W830BT Casque supra-auriculaire sans fil, écouteur Bluetooth', '<div class=\"markup -mhm -pvl -oxa -sc\" style=\"box-sizing: border-box; overflow-x: auto; padding-top: 24px; padding-bottom: 24px; margin-right: 16px; margin-left: 16px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Edifier est l\'une des marques audios les plus c&eacute;l&egrave;bres de Chine. Nous nous d&eacute;finissons comme le pr&eacute;sentateur de la derni&egrave;re technologie audio.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Fond&eacute;e &agrave; P&eacute;kin en 1996, Edifier se sp&eacute;cialise dans les solutions audios haut de gamme qui mettent en valeur l\'innovation technologique et l\'&eacute;l&eacute;gance de la conception. Nous offrons une exp&eacute;rience sonore exceptionnelle gr&acirc;ce &agrave; une large gamme de syst&egrave;mes sonores pour le divertissement personnel et l\'excellence professionnelle.&nbsp;&nbsp;Profitez d\'un son exceptionnel gr&acirc;ce aux haut-parleurs de haute qualit&eacute;, aux &eacute;couteurs st&eacute;r&eacute;o vraiment sans fil &eacute;l&eacute;gants et aux casques d\'Edifier.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Pour plus de produits, veuillez consulter le magasin officiel d\'Edifier. Merci.</p>\r\n<img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #000000; font-family: verdana, geneva, sans-serif; font-size: 16px; opacity: 0.9; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/81fe8ff0690581bf4837d1c63ba37efd.jpg\" alt=\"P1\" /><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #000000; font-family: verdana, geneva, sans-serif; font-size: 16px; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/c9d42ac4351ffb4ca82ee141cf1f2752.jpg\" alt=\"P2\" /><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/192a7d90e4908eaab4e5d5cd8c8a747d.jpg\" alt=\"P0A\" /><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/b7b37f61a523449ad16dcf183744bb57.jpg\" alt=\"P0B\" /><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/df2f4a82ffe97d1c1e570d2ab4819a60.jpg\" alt=\"P3\" /><strong style=\"box-sizing: border-box;\">Description de l\'annonce:</strong>&nbsp;<strong style=\"box-sizing: border-box;\">Son de basse en plein essor</strong>Alors que le casque Bluetooth W830BT repose doucement sur votre t&ecirc;te, vous &eacute;couterez une basse riche et profonde qu\'Edifier est connue pour produire. Cela correspond bien &agrave; des genres tels que l\'EDM, le jazz, le hip hop et de nombreux grands genres qui tirent parti d\'un excellent son de basse. Ces fantastic&nbsp;&eacute;couteurs sans fil ont de bons hauts et de grands bas.&nbsp;<img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/d02b4a0d81a72312f6d0470eb91c3100.jpg\" alt=\"P6\" />&nbsp;&nbsp;<strong style=\"box-sizing: border-box;\">Coussinets ergonomiques extra doux</strong>Edifier est un expert du confort et du son. Les oreillettes W830BT sont fabriqu&eacute;es avec des coussinets extra doux qui ressemblent &agrave; un oreiller pos&eacute; sur votre t&ecirc;te. Les &eacute;couteurs sans fil Bluetooth W830BT d\'Edifier produisent un design ergonomique l&eacute;ger recouvert de cuir synth&eacute;tique, garantissant une exp&eacute;rience de port confortable toute la journ&eacute;e.<img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/47733340b98803d3f118c7bc7f07e430.jpg\" alt=\"P10\" />&nbsp;<strong style=\"box-sizing: border-box;\">Bandeau incroyablement durable</strong>Les &eacute;couteurs sans fil W830BT sont fabriqu&eacute;s avec un bandeau incroyablement durable. L\'acier inoxydable dans le bandeau est un acier flexible qui peut supporter n\'importe quelle quantit&eacute; de stress plac&eacute;e en dessous. La durabilit&eacute;, la fonctionnalit&eacute; et la conception de haute technologie du casque Bluetooth W830BT sont la configuration id&eacute;ale pour les audiophiles.<img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/d717d18f461f1dd6686d4ee5f65abbfc.jpg\" alt=\"P4\" />&nbsp;<strong style=\"box-sizing: border-box;\">Batterie longue dur&eacute;e</strong>95 heures de lecture audio ， 1500 heures en veille&nbsp;<img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/d0d34e074182438dce94816d89cf6825.jpg\" alt=\"P6\" />&nbsp;<strong style=\"box-sizing: border-box;\">V&eacute;ritable Bluetooth sans fil sans perte</strong>Il est maintenant temps de mettre &agrave; niveau votre casque actuel vers quelque chose de plus puissant. Faites l\'exp&eacute;rience d\'un v&eacute;ritable audio Bluetooth sans fil avec le codec Bluetooth v4.1 aptX. L\'audio sans fil sans perte est disponible du bout des doigts. Acc&eacute;dez &agrave; 95 heures de lecture audio sur une charge compl&egrave;te et &agrave; 1500 heures en veille. Connectez jusqu\'&agrave; 2 appareils en m&ecirc;me temps et connectez-vous rapidement avec le couplage NFC.<img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/9360c7ba1d10953299c1b06be3497dcb.jpg\" alt=\"P9\" />&nbsp;<strong style=\"box-sizing: border-box;\">Casque d\'&eacute;coute pliable adapt&eacute; aux voyages</strong>Les oreillettes des &eacute;couteurs Bluetooth W830BT sont con&ccedil;ues pour pivoter &agrave; 90 degr&eacute;s pour les poser &agrave; plat ou vous pouvez les replier elles-m&ecirc;mes pour les rendre plus compactes. Cela les rend plus faciles &agrave; ranger dans une mallette de transport.<img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/f20fe31dc022dad50a1ff50f714ec097.jpg\" alt=\"P5\" /><strong style=\"box-sizing: border-box;\">Le forfait Total</strong>Les &eacute;couteurs sans fil W830BT sont l\'ensemble. Durabilit&eacute;, confort et son tout en un. Avec un son sans fil et une autonomie active de pr&egrave;s de 4 jours. Vous ne trouverez nulle part ailleurs une meilleure paire d&rsquo;&eacute;couteurs.&nbsp;<img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/ec347a3d4292d37b2ec1762d54ab3fd7.jpg\" alt=\"P11\" /><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #000000;\" src=\"https://ma.jumia.is/cms/external/pet/ED845EA18IRTZNAFAMZ/a4d96af7b0aa189ec270aacf91491114.jpg\" alt=\"P0\" /></div>\r\n<p><iframe class=\"y-ifm\" style=\"box-sizing: border-box; border-width: 0px; border-style: initial; height: 384px; width: 872px; padding: 16px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" title=\"product_detail_youtube-title\" src=\"https://www.youtube.com/embed/BfzwoiW_BS4?enablejsapi=1\" allowfullscreen=\"\"></iframe></p>', 'produits\\June2021\\xSP3vplX07pH4SLau7pt.jpg', 0, '[\"produits\\\\June2021\\\\EqNwa68ExTmkokIP5WJx.jpg\",\"produits\\\\June2021\\\\SYTd7tIsLTnoPuZjaMgg.jpg\"]', 5, 2, 3.50, NULL, 1, '2021-06-06 14:46:56', '2022-06-01 11:17:52'),
(5, 'Apple Airpods', 1849.00, 1500.49, 'Apple Airpods 2 Avec Boitier De Charge, 2éme Génération, Original Sans Fil Bluetooth', '<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Marque : Apple</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Couleur : Blanc</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Technologie de connectivit&eacute; : Sans fil</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Nom de mod&egrave;le : AirPods</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Facteur de forme : Intra-Auriculaire</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Poids de l\'article : 4 Grammes</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Plus magiques que jamais. Temps de conversation augment&eacute;, activation vocale de Siri et nouveau bo&icirc;tier de charge sans fil. Les nouveaux AirPods sont des &eacute;couteurs sans fil, et sans commune mesure.</span></p>', 'produits\\June2021\\475oFW5TI2U59gpRQnZa.jpg', 0, '[\"produits\\\\June2021\\\\vQRQtB3dHAPHGLFJawNN.jpg\",\"produits\\\\June2021\\\\FRYQn1xRSz9TerQKGw4Y.jpg\"]', 12, 1, 3.00, 6, 2, '2021-06-06 14:48:39', '2021-07-08 19:18:38'),
(6, 'RUNMUS Gaming Headset', 199.99, 180.5, 'RUNMUS Gaming Headset Xbox One Headset with 7.1 Surround Sound Stereo, PS4 Headset with Noise Canceling Mic & LED Light, Compatible with PC, PS4, Xbox One Controller(Adapter Needed), Nintendo Switch', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; color: #0f1111; padding: 0px; font-family: \'Amazon Ember\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">50MM DRIVER DELIVERS SURROUND SOUND. Whether you\'re immersed in God of War or want to hear your enemies motion in Fortnite, PUBG or CS:GO, wearing a professional gaming headset does matters. With a 50mm driver, RUNMUS PS4 headset offers an incredibly surround sound for both games and music.</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">ERGONOMIC DESIGN &amp; PREMIUM MATERIAL. Gamers usually play games for many hours, so the comfort is also a key factor when choosing a Xbox one headset. We have tested our headsets for many years on hundreds of different heads, the retractable band and breathable ear pad make sure every player could enjoy the optimal wearing comfort.</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">MULTIPLE PLATFORM COMPATIBILITY. This gaming headset with a 3.5mm audio jack is compatible with PC, PS4 controller, Xbox One controller(Please note: newer models have a headphone jack, older ones require an adapter.), Nintendo Switch (audio), Nintendo New 3DS LL/3DS (audio), Nintendo 3DS LL/3DS (audio).</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">NOISE CANCELING MICROPHONE. This PS5 headset provides high-end noise cancellation to enable you to chat to your fellow players with crystal clarity. If you wanna enjoy your valuable me-time without communicating with other players, you could turn off the mic by flipping the switch.</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">24-HOUR CUSTOMER SUPPORT. Every RUNMUS customers\' using experience is highly valued. Any question or problem, just feel free to contact us! We are sure to make a reply within 24 hours and provide satisfying solutions.</span></li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<table class=\"a-normal a-spacing-micro\" style=\"border-collapse: collapse; width: 570.328px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; margin-bottom: 4px !important;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 3px 3px 0px; float: none !important; margin-right: 0px; width: 149.297px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; font-size: 14px !important; line-height: 20px !important;\">Brand</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 0px 3px 3px; float: none !important; margin-right: 0px; width: 421.031px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; font-size: 14px !important; line-height: 20px !important;\">RUNMUS</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 149.297px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; font-size: 14px !important; line-height: 20px !important;\">Color</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 421.031px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; font-size: 14px !important; line-height: 20px !important;\">Red</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 149.297px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; font-size: 14px !important; line-height: 20px !important;\">Connectivity Technology</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 421.031px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; font-size: 14px !important; line-height: 20px !important;\">Wired</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 149.297px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; font-size: 14px !important; line-height: 20px !important;\">Model Name</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 421.031px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; font-size: 14px !important; line-height: 20px !important;\">K2</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 0px 0px; float: none !important; margin-right: 0px; width: 149.297px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; font-size: 14px !important; line-height: 20px !important;\">Form Factor</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 0px 3px; float: none !important; margin-right: 0px; width: 421.031px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; font-size: 14px !important; line-height: 20px !important;\">Over Ear</span></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'produits\\July2021\\NI9iFOnNnrzwwuhxjrnh.jpg', 1, '[\"produits\\\\June2021\\\\E0YPGNnTSp17So6u9WLx.jpg\",\"produits\\\\June2021\\\\YvuMd2ZgGaF11TBjEMTs.jpg\"]', 2, NULL, NULL, NULL, NULL, '2021-06-16 22:02:08', '2021-07-08 19:10:46');
INSERT INTO `produits` (`id`, `nom`, `prix_ht`, `prix_reseller`, `details`, `description`, `photo_principale`, `featured`, `images`, `quantite`, `rating_count`, `rating_cache`, `marque_id`, `promotion_id`, `created_at`, `updated_at`) VALUES
(7, 'Imou 2021 Caméra', 290.99, 250.99, 'Imou 2021 Version Caméra Surveillance WiFi Intérieure Caméra 360° Connectée Smartphone 1080P avec Détection Humaine AI Suivi Intelligent Sirène Audio Bidirectionnel Compatible Alexa', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; color: #0f1111; padding: 0px; font-family: \'Amazon Ember\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">【FHD 1080P &amp; Pan/Tilt &amp; 360&deg; Couverture】Imou cam&eacute;ra surveillance wifi sans fil est &eacute;quip&eacute;e d\'un objectif large HD de 3.6 mm et de 2mp avec un angle de vision de 118&deg;, rotation horizontale de 355&deg; et verticale de 80&deg;, aucune zone de couverture d\'angle mort. La cam&eacute;ra surveillance infrarouge peut fournir une distance de vision nocturne de 10 m et peut enregistrer une vid&eacute;o panoramique en temps r&eacute;el Full HD 1080p, m&ecirc;me dans une nuit noire. (La cam&eacute;ra wifi ne prend en charge que le WiFi 2.4G)</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">【D&eacute;tection Humaine AI et Alarmes】Imou cam&eacute;ra de surveillance int&eacute;rieur sans fil peut marquer des zones sp&eacute;cifiques, suivre et enregistrer automatiquement l\'activit&eacute; et elle dispose d\'une alarme int&eacute;gr&eacute;e pour effrayer les &eacute;trangers ind&eacute;sirables. La D&Eacute;TECTION HUMAINE AI d\'Imou peut identifier avec pr&eacute;cision les humains en mouvement et envoyer imm&eacute;diatement des notifications au smartphone, vous permettant de surveiller les notifications importantes sans recevoir de fausses alarmes ennuyeuses.</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">【Audio Bidirectionnel &amp; D&eacute;tection de Son Anormal】Le microphone et les haut-parleurs int&eacute;gr&eacute;s vous permettent de communiquer de mani&egrave;re fluide et claire avec votre famille lorsque vous &ecirc;tes absent. Lorsque les pleurs d\'un b&eacute;b&eacute;, les aboiements de chien ou d\'autres sons anormaux sont d&eacute;tect&eacute;s, la cam&eacute;ra wifi interieur sans fil enverra une alerte instantan&eacute;e &agrave; votre t&eacute;l&eacute;phone, afin que vous puissiez apaiser ses &eacute;motions et savoir ce qui se passe &agrave; la maison.</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">【Suivi Intelligent et Fonctionne avec Alexa】La cam&eacute;ra video surveillance interieur suivra et enregistrera intelligemment la trajectoire du mouvement. Vous pouvez clairement voir le mouvement des personnes ou des animaux &agrave; moins de 5M. Compatible avec Alexa et Google Home, demandez &agrave; Alexa de montrer votre cuisine, votre salon, ou votre chambre de b&eacute;b&eacute; avec la cam&eacute;ra Imou.</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">【Mode Priv&eacute;e et Stockage Flexible】Vous pouvez enregistrer des vid&eacute;os sur une carte SD jusqu\'&agrave; 256 Go (non incluse) ou sur Imou Cloud (30 jours d\'essai gratuit avec 7 jours de cycle pour l\'enregistrement) pour vous assurer de pouvoir lire les vid&eacute;o &agrave; tout moment. Un seul clic sur la mode priv&eacute;e de l\'App Imou Life pour couvrir physiquement l\'objectif de la cam&eacute;ra, prot&eacute;geant ainsi votre vie priv&eacute;e lorsque vous &ecirc;tes &agrave; la maison.</span></li>\r\n</ul>', 'produits\\July2021\\ys1zD0R8Nn6Q66fiRwSp.jpg', 1, '[\"produits\\\\June2021\\\\xan6224FPgPr80WoIGee.jpg\",\"produits\\\\June2021\\\\URYmFlV0AbouwrEiej99.jpg\"]', 2, NULL, NULL, NULL, NULL, '2021-06-25 13:52:12', '2021-07-09 08:12:42'),
(8, 'Huawei band 6', 479.00, 420.99, 'Huawei band 6 Exercise Heart Rate Monitor sleep 1.47 inches', '<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Use TruRelax&trade; stress monitor to track your stress throughout the day. When the stress is too high, use the built-in breathing training guide to restore yourself to a state of relaxation and concentration. Start with a life that reduces stress.</span><br style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" /><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Keep in touch with the body. With HUAWEI Band 6, you can easily record your menstrual1 cycle and receive timely reminders to remind you that your menstruation is coming. A caring, helpful friend on your wrist.</span><br style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" /><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Activate your day by setting 3 daily activity goals-steps. Exercise time and wake up time. The adjustment intensity is too high. Huawei Band 6 will automatically track your progress through colorful, eye-catching rings. After reaching the goal, get motivating reminders and notifications. Always feel it. It will be better after making money.</span><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/11907a2becacadea6f853712b58bf522.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/3e0541c5853f328ffc24a683fa772708.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/edb3cbbf501fe2326f052e6af9e43106.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/e0ae99862c017f9428bb1b70afbf7e48.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/39162023967f6589bdab222d040832c5.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/d315f84702587252cf34548d6c934336.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/ece799496820193690e74834953e47e4.jpg\" alt=\"image\" /></p>\r\n<p style=\"box-sizing: border-box; padding: 0px 0px 0px 0em; margin: 0px 0px 12px; color: #282828; font-size: 20px; line-height: 28px; font-weight: 900; font-family: OpenSans; white-space: pre-wrap;\"><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/aef91bfe25c4c8004dfaf0542288a7e3.jpg\" alt=\"image\" /></p>\r\n<p style=\"box-sizing: border-box; padding: 0px 0px 0px 0em; margin: 0px 0px 12px; color: #282828; font-size: 20px; line-height: 28px; font-weight: 900; font-family: OpenSans; white-space: pre-wrap;\">&nbsp;</p>\r\n<p><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/98fe5b35acb9bb95f0bece99321a981f.jpg\" alt=\"image\" /></p>\r\n<p style=\"box-sizing: border-box; padding: 0px 0px 0px 0em; margin: 0px 0px 12px; color: #282828; font-size: 20px; line-height: 28px; font-weight: 900; font-family: OpenSans; white-space: pre-wrap;\">&nbsp;</p>\r\n<p><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/434311fe8609e565b8fff9b2a57e22a4.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/5cc371f135a2e044d57e10393ca57909.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/a1fa108b0c7af7f31bc7dbb22582a246.jpg\" alt=\"image\" /><br style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; margin: 0px;\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; padding: 0px; vertical-align: middle;\" src=\"https://ma.jumia.is/cms/external/pet/HU830EA0961YENAFAMZ/492d7e4d12b89dc4c0e2e1f32047e58f.jpg\" alt=\"image\" /></p>', 'produits\\July2021\\dNLTMfS8ybeSsVnRSqyP.jpg', 0, '[\"produits\\\\July2021\\\\fz9cRs3gG1m2KzSsWWoC.jpg\"]', 8, NULL, NULL, 5, NULL, '2021-07-08 19:13:31', '2021-07-08 20:14:26'),
(9, 'Samsung Galaxy A52', 3440.00, 3000.99, 'Samsung Galaxy A52 6.5\" (8Go, 128Go) 64MP+12MP+5MP+5MP/32MP Android - Violet', '<h2 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Affichage magnifique de 6.5\"</h2>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Avec sa forme pens&eacute;e, le Galaxy A52 offre pas seulement fonctionnalit&eacute;, mais aussi tr&egrave;s bon style. Que vous visualisez vos vid&eacute;os favoris, v&eacute;rifiez votre&nbsp;courriel ou naviquez sur les r&eacute;seaux sociaux, vous serez r&eacute;gal&eacute; par cet &eacute;cran de 6.5 pouces.</p>\r\n<p><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" src=\"https://ma.jumia.is/cms/external/pet/SA024MP170JLPNAFAMZ/fe1fdf39a9d36964de5999d554f5aa40.jpg\" alt=\"GALAXY a52 PRIX MAROC\" width=\"600\" /></p>\r\n<h2 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Cam&eacute;ra de 64 MP</h2>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Immortalisez vos moments&nbsp;favoris avec une cam&eacute;ra &agrave; 64MP&nbsp;ou 32MP(avant) et stockez le&nbsp;tout sur une memoire interne de 128Go ou&nbsp;une carte&nbsp;micro-sd permettant de stocker jusqu\'&agrave;&nbsp;1To.</p>\r\n<p><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" src=\"https://ma.jumia.is/cms/external/pet/SA024MP170JLPNAFAMZ/b81b3239a103261e826cbbe1f314d872.jpg\" alt=\"GALAXY a52 PRIX MAROC\" width=\"600\" /></p>\r\n<h2 style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Effectuez vos t&acirc;ches avec fluidit&eacute;</h2>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Avec un processeur Octa-core de 2,3 Ghz, le Galaxy A52&nbsp;vous permet de faire beaucoup de t&acirc;ches rapidement et simultan&eacute;ment ! Profitez de l\'internet mobile, de la musique, des apps et plus! si vous choisissez de voir vos videos favoris, jouer les jeux graphiques les plus nouveaux, ou faire plusieurs t&acirc;ches en m&ecirc;me temps, votre smartphone ne vas pas vous d&eacute;cevoir.</p>\r\n<p><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" src=\"https://ma.jumia.is/cms/external/pet/SA024MP170JLPNAFAMZ/11e90df164737e6e5feea79280c406c1.jpg\" alt=\"GALAXY a52 PRIX MAROC\" width=\"600\" /></p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Fiche technique :</strong></p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Ecran :</strong></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">6.5&rdquo; Infinity-O Display</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">FHD+ Super AMOLED, 90 Hz (Refresh rate)</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Cam&eacute;ra&nbsp;</strong>:</p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Principale : 64 MP AF</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Ultra Wide : 12 MP FF</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Depth : 5 MP FF</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Macro : 5 MP FF</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Frontale : 32 MP</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Processeur :</strong></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">SDM720G</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Octa-core, Up to 2.3GHz</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">M&eacute;moire&nbsp;</strong>:</p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">RAM: 8 GB</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Stockage: 128 GB</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">microSD Card: jusqu\'&agrave; 1 TB</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Batterie&nbsp;</strong>:</p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">4,500 mAh (Typical)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">25W Fast Charging</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Autres&nbsp;</strong>:</p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">R&eacute;sistance &agrave; l\'eau&nbsp;(IP67)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Haut-parleurs st&eacute;r&eacute;o</li>\r\n</ul>', 'produits\\July2021\\4R5HIM68qdzLd5lK6sFI.jpg', 1, '[\"produits\\\\July2021\\\\NpxM8utne6nGOdkpO0fP.jpg\"]', 1, NULL, NULL, 4, NULL, '2021-07-08 19:17:20', '2021-07-08 21:56:51'),
(10, 'Hp ProDesk 600 G', 2000.56, 1840.5, 'Hp ProDesk 600 G2 Mini Core i3 -6ème Gene 3,2Ghz-8Go DDR4 -120go SSD - Remis à Neuf', '<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Mini-ordinateur HP ProDesk 600 G2 MT</span><br style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" /><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Ce PC professionnel est aussi puissant que petit. Dans son cadre 7 \"x7\" se trouve un disque avec beaucoup de place pour les fichiers volumineux et complexes, ainsi qu\'un processeur quadric&oelig;ur qui vous permet d\'effectuer plusieurs t&acirc;ches sans retard notable.&nbsp;</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Marque :&nbsp;HP</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Nom du produit :&nbsp;Ordinateur bureau HP ProDesk 600 G2 MT&nbsp;</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Processeur / Chipset</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Caract&eacute;ristiques principales du processeur : Technologie Intel Turbo Boost&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">CPU : Intel Core i5 (6&egrave;me g&eacute;n&eacute;ration) 6100T/ 3.2 GHz</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Vitesse maximale en mode Turbo : 3.2 GHz</li>\r\n</ul>\r\n<p><br style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" /><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">RAM</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Taille install&eacute;e : 8 Go&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Technologie : DDR4 SDRAM - non ECC</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Emplacements : 2 (Totale) / 1 (vide)</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Disque dur</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Capacit&eacute; : 120 Go</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Type d\'interface : SATA 6Gb/s</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Caract&eacute;ristiques : SSD</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Contr&ocirc;leur de stockage</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Type : 1 x SATA</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Type d\'interface du contr&ocirc;leur : SATA 6Gb/s</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Contr&ocirc;leur graphique</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Processeur graphique : Intel HD Graphics 530&nbsp;</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Extension/connectivit&eacute;</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Interfaces : 6 x USB 3.0 (2 &agrave; l\'avant, 4 &agrave; l\'arri&egrave;re)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 x casque (1 &agrave; l\'avant)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 x casque/microphone (1 &agrave; l\'avant)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 x VGA</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">2 x DisplayPort</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 x LAN (Gigabit Ethernet)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 x USB-C 3.0 (1 &agrave; l\'avant)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Emplacements : 1 (total) / 0 (libre) x CPU</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">2 (total) / 1 (libre) x SO-DIMM 260 broches</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 (total) / 0 (libre) x M.2 Card (mode x 1)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 (total) / 1 (libre) x M.2 Card (mode x4)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Baies 1 (total) / 0 (libre) x interne 2.5\"</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Alimentation</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Type de p&eacute;riph&eacute;rique : Adaptateur secteur</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Tension nominale : CA 120/230 V (50/60 Hz)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Correction du facteur de puissance : Oui (actif)</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Syst&egrave;me d\'exploitation</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Syst&egrave;me d\'exploitation&nbsp; : Microsoft Windows 10 Professionnel Edition 64 bits&nbsp;</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Dimensions et poids</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Largeur : 17.5 cm</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Profondeur : 17.7 cm</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Hauteur : 3.4 cm</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Poids : 1.3 kg</li>\r\n</ul>', 'produits\\July2021\\ntSSqTiqIDAHY6LRx122.jpg', 0, '[\"produits\\\\July2021\\\\mokBnkwd5AC8tgurUf5h.jpg\"]', 12, NULL, NULL, 2, NULL, '2021-07-08 19:20:53', '2021-07-08 19:20:53'),
(11, 'Hp Pc Complet 600', 1690.00, 1500, 'Hp Pc Complet 600 G2 SFF - 8Go RAM - 500Go HDD avec Écran 20\" - Remis à Neuf', '<h1 class=\"product_title entry-title\" style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 15px; font-weight: 400; text-align: center; font-family: Roboto, sans-serif; line-height: 1.3; color: #333e48; clear: none; text-transform: capitalize;\">HP Prodesk 600 G2 Sff</h1>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">D&eacute;veloppez votre entreprise avec l\'ordinateur de bureau HP ProDesk 600 G2 &eacute;quip&eacute; avec les outils dont vous avez besoin pour vos activit&eacute;s professionnelles. Cet ordinateur est livr&eacute; avec la version Pro de Windows&nbsp; 10. Avec un processeur Intel Pentium G4400 (6eme G&eacute;n&eacute;ration), 8 Go de m&eacute;moire DDR et une capacit&eacute; de stockage de 500 GB, cet ordinateur est pr&ecirc;t pour vous offrir une informatique souple au quotidien</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Marque : HP</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">S&eacute;ries : 600 g2 sff</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Processeur :&nbsp; Intel Pentium G4400 (3.30 GHz, 3 Mo de cache, 2 c&oelig;ur)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Nombre de processeurs : 1</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">RAM : 8 Go DDR3 SDRAM</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Disque dur : Disque dur de 500 Go&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Lecteur optique : DVD&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Coprocesseur graphique : Intel HD</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Syst&egrave;me op&eacute;rateur : Windows 10 Professionnel</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Couleur : Noir</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Nombre de ports USB 2.0 :&nbsp; 2</li>\r\n</ul>\r\n<p><strong style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">ECRAN HP 20\"</strong><strong style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><br style=\"box-sizing: border-box;\" /></strong><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Profitez d&rsquo;une qualit&eacute; d&rsquo;image HD &eacute;poustouflante, d&rsquo;une actualisation ultra-rapide de la carte graphique et de couleurs &eacute;clatantes gr&acirc;ce &agrave; la connexion DisplayPort qui prend &eacute;galement en charge plusieurs connexions d&rsquo;&eacute;cran &agrave; partir d&rsquo;un seul ordinateur. Profitez d&rsquo;une compatibilit&eacute; avec les p&eacute;riph&eacute;riques h&eacute;rit&eacute;s via le connecteur VGA.</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Type : TFT TNT</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Taille de l\'ecran : 20 pouces&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">D&eacute;finition / Fr&eacute;quence : 1600 x 900 &agrave; 60Hz</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Entr&eacute;es video : VGA&nbsp;</li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Accessoires livr&egrave;s avec l\'appareil</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Clavier&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Souris&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Cable alimentation x1</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Cable VGA x1</li>\r\n</ul>', 'produits\\July2021\\2q3JpuPrUcKsTtU8Twxq.jpg', 0, '[\"produits\\\\July2021\\\\Rr3pdeZOysoex8mj0Yzr.jpg\"]', 20, NULL, NULL, 2, NULL, '2021-07-08 19:22:52', '2021-07-08 19:22:52'),
(12, 'Hp Imprimante', 590.00, 550.99, 'Hp Imprimante multifonction Jet d’encre 3en1 DeskJet 2710', '<p>Toutes les bases, d&eacute;sormais avec des fonctionnalit&eacute;s faciles &agrave; utiliser.&nbsp;Imprimez, num&eacute;risez et copiez des documents de tous les jours et b&eacute;n&eacute;ficiez d\'une connexion sans fil sans souci.&nbsp;<a class=\"sup_linked sup_ovw\" style=\"box-sizing: border-box; background-color: rgba(0, 0, 0, 0); display: inline-block; text-decoration-line: underline; color: #007dba; font-weight: bold; outline: 0px;\">1</a>&nbsp;Une configuration simple avec l\'application HP Smart signifie que vous &ecirc;tes pr&ecirc;t sur n\'importe quel appareil.&nbsp;<a class=\"sup_linked sup_ovw\" style=\"box-sizing: border-box; background-color: rgba(0, 0, 0, 0); display: inline-block; text-decoration-line: underline; color: #007dba; font-weight: bold; outline: 0px;\">2</a>Cette imprimante utilise une s&eacute;curit&eacute; dynamique, qui peut &ecirc;tre mise &agrave; jour p&eacute;riodiquement par des mises &agrave; jour du micrologiciel.&nbsp;L\'imprimante est con&ccedil;ue pour &ecirc;tre utilis&eacute;e uniquement avec des cartouches utilisant uniquement des circuits &eacute;lectroniques HP d\'origine.&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">FICHE TECHNIQUE</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Fonctions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Impression, copie, num&eacute;risation</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Technologie d\'impression&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Impression jet d\'encre thermique HP</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Cartouches d\'impression&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 Cartouches (1 noir, 1 couleur : cyan, magenta, jaune)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Vitesse d\'impression noir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (A4, ISO) : Jusqu\'&agrave; 7,5 ppm ; &eacute;conomie sombres (A4) : Jusqu\'&agrave; 20 ppm</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Vitesse d\'impression couleur&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (A4, ISO) : Jusqu\'&agrave; 5,5 ppm ; &eacute;conomie couleur (A4) : Jusqu\'&agrave; 16 ppm</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Qualit&eacute; d\'impression noire&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jusqu\'&agrave; 1 200 x 1 200 ppp</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Qualit&eacute; d\'impression couleur&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jusqu\'&agrave; 4800 x 1200 ppp optimis&eacute;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">&Eacute;cran LCD &agrave; ic&ocirc;nes, 7 boutons (Alimentation, Annuler, Reprendre, Wi-Fi, Info, Copie couleur et Copie noire), 5 voyants LED (Alimentation, Encre, Reprendre, Wi-Fi et Info)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Cycle d\'utilisation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jusqu\'&agrave; 1000 pages</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Volume de pages mensuel recommand&eacute;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 50 &agrave; 100 pages/mois</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Connectivit&eacute;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 port USB 2.0 haut d&eacute;bit ; Wi-Fi 802.11 a/b/g/n int&eacute;gr&eacute;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Impression recto/verso Manuelle (prise en charge des pilotes fournie)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Impression sans bordure&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Non</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Capacit&eacute; bac papier&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jusqu\'&agrave; 60 feuilles</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Formats de supports pris en charge&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A4 ; B5 ; A6 ; Enveloppe DL</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Types de support pris en charge&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Papier ordinaire, papier photo, papier pour brochure</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Dimensions (l x p x h)&nbsp;&nbsp;&nbsp;&nbsp; Dimensions maximales (L x P x H) : 425 x 546 x 250 mm (extension de sortie compl&egrave;te)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Dimensions minimales (L x P x H) : 425 x 304 x 154 mm</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Poids net&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,42 kg - Poids du carton/paquet : 4,48 kg</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">M&eacute;moire install&eacute;e&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 86 Mo</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Cartouches compatibles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cartouche d&rsquo;encre noire authentique HP 305 (rendement environ 120 pages) 3YM61AE</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Cartouche d\'encre noire &agrave; grande capacit&eacute; HP 305XL (rendement environ 240 pages) 3YM62AE</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Cartouche d\'encre originale trois couleurs HP 305 (rendement environ 100 pages) 3YM60AE</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Cartouche d&rsquo;encre trois couleurs grande capacit&eacute; HP 305XL (rendement environ 200 pages) 3YM63AE.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Le rendement r&eacute;el peut varier consid&eacute;rablement en fonction du contenu des pages &agrave; imprimer et d&rsquo;autres facteurs.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Syst&egrave;mes d\'exploitation compatibles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Windows 10, 7 ; MacOS Sierra v10.12 (pr&eacute;c&eacute;demment OS X), macOS High Sierra v10.13, macOS Mojave v10.14, macOS Catalina v10.15</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Contenu de la bo&icirc;te&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Imprimante tout-en-un HP DeskJet 2710</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Cartouche de d&eacute;marrage HP 305, noire</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Cartouche de d&eacute;marrage HP 305, trois couleurs</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Brochure sur les r&eacute;glementations</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Guide d\'installation</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Guide de r&eacute;f&eacute;rence</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Cordon d&rsquo;alimentation.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">C&acirc;ble fourni&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Non, acheter un c&acirc;ble USB s&eacute;par&eacute;ment.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Photocopieur&nbsp;&nbsp;&nbsp;&nbsp; Param&egrave;tres du photocopieur : Agrandis automatique R&eacute;solution de la copie (images noir et blanc) : Jusqu\'&agrave; 300 x 300 ppp</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">R&eacute;solution de la copie (texte en couleur et graphiques) : Jusqu\'&agrave; 300 x 300 ppp</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Scanner&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &Agrave; plat</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Logiciels inclus&nbsp;&nbsp; Logiciel de l&rsquo;imprimante HP, disponible en ligne</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">Poids du support recommand&eacute;&nbsp; A4 : 60 &agrave; 90 g/m&sup2; ; enveloppes HP : 75 &agrave; 90 g/m&sup2; ; cartes HP : jusqu\'&agrave; 200 g/m&sup2; ; papier photo HP 10 x 15 cm : jusqu\'&agrave; 300 g/m&sup2;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px;\">&nbsp;</p>', 'produits\\July2021\\WgfFyF0zZOPgQB7sFRqy.jpg', 1, '[\"produits\\\\July2021\\\\P7dGmF5UCbrXdZToPRe2.jpg\"]', 8, NULL, NULL, 2, NULL, '2021-07-08 19:25:17', '2021-07-08 20:26:55');
INSERT INTO `produits` (`id`, `nom`, `prix_ht`, `prix_reseller`, `details`, `description`, `photo_principale`, `featured`, `images`, `quantite`, `rating_count`, `rating_cache`, `marque_id`, `promotion_id`, `created_at`, `updated_at`) VALUES
(13, 'Hp Imprimante All-In-One', 2500.99, 2200.5, 'Boutique Officielle Hp Imprimante All-In-One LaserJet Pro MFP M130nw Monochrome', '<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; text-align: center;\"><strong style=\"box-sizing: border-box;\">Imprimantes LaserJet Pro MFP M130nw All-In-One Monochrome</strong></p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">UNE MULTIFONCTION LASER SANS FIL SIMPLE ET COMPACTE.</strong></p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">L&rsquo;imprimante multifonction HP LaserJet Pro M130nw combine vitesse, haute r&eacute;solution et praticit&eacute;. Avec une vitesse de 22 ppm, une r&eacute;solution maximale de 1200 x 1200 dpi et une connectivit&eacute; &eacute;tendue (USB, Ethernet et sans fil), elle sera un atout de votre productivit&eacute;. Compacte, elle trouvera facilement sa place pour vous permettre d&rsquo;imprimer, de copier et de num&eacute;riser</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">IMPRIMEZ FACILEMENT DEPUIS N\'IMPORTE O&Ugrave;</strong></p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Travaillez en toute simplicit&eacute; avec l\'imprimante multifonction LaserJet la plus petite de HP&ndash; optimis&eacute;e par des toners Jet Intelligence. Imprimez des documents de qualit&eacute; professionnelle &agrave; partir d&rsquo;une large gamme de p&eacute;riph&eacute;riques portables, et num&eacute;risez, copiez tout en &eacute;conomisant de l&rsquo;&eacute;nergie gr&acirc;ce &agrave; une imprimante multifonction sans fil con&ccedil;ue pour une efficacit&eacute; optimale.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; text-indent: -18pt;\">&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Imprimez, num&eacute;risez et copiez gr&acirc;ce &agrave; l\'imprimante multifonction LaserJet la plus petite de HP con&ccedil;ue pour s&rsquo;adapter aux espaces r&eacute;duits.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; text-indent: -18pt;\">&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attendez moins ! Imprimez jusqu\'&agrave; 22 pages par minute avec une sortie des premi&egrave;res pages en 7,3 secondes seulement.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; text-indent: -18pt;\">&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Imprimez depuis votre iPhone et iPad avec AirPrint, qui adapte automatiquement les t&acirc;ches d\'impression &agrave; la taille de papier correcte.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; text-indent: -18pt;\">&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Imprimez en envoyant un simple e-mail directement depuis un smartphone, une tablette ou un ordinateur portable gr&acirc;ce &agrave; HP ePrint.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; text-indent: -18pt;\">&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Imprimez directement &agrave; partir de votre p&eacute;riph&eacute;rique portable vers votre imprimante Wi-Fi Direct, sans acc&eacute;der au r&eacute;seau d\'entreprise.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; text-indent: -18pt;\">&middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Envoyez des t&acirc;ches depuis votre smartphone, tablette ou ordinateur vers n&rsquo;importe quelle imprimante professionnelle &agrave; l&rsquo;aide de Google Cloud Print 2.0.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">FICHE TECHNIQUE</strong></p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Fonctions : Impression, copie et scan</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Technologie d\'impression&nbsp;: Laser</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Cartouches d\'impression :1 Cartouche de toner (noire)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Vitesse d\'impression noir : Jusqu\'&agrave; 22 ppm</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Qualit&eacute; d\'impression noire : Jusqu&rsquo;&agrave; 600 x 600 DPI (ppp)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&Eacute;cran : LCD 2 lignes (texte)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Cycle d\'utilisation&nbsp;: Jusqu\'&agrave; 10.000 pages/mois (mensuel, A4)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Volume de pages mensuel recommand&eacute;&nbsp;: 150 &agrave; 1500 pages/mois</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Connectivit&eacute;&nbsp;: 1 port USB 2.0, Ethernet int&eacute;gr&eacute;, Wi-Fi 802.11b/g/n</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Impression recto/verso Manuelle</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Capacit&eacute; bac papier : Bac d\'alimentation de 150 feuilles</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Formats de supports pris en charge : A4 , A5 , A6, B5 (JIS)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Types de support pris en charge&nbsp;: Papier (laser, ordinaire, photo, r&eacute;sistant, vellum), enveloppes, &eacute;tiquettes, papier cartonn&eacute;, cartes postales</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Dimensions (l x p x h) : 398 x 482 x 387,9 mm</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Poids net&nbsp;: 9.1 kg</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">M&eacute;moire install&eacute;e : 256 Mo</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Cartouches compatibles : HP 17A toner LaserJet noir con&ccedil;u par HP CF217A (1 600 pages)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">HP 19A tambour d\'imagerie LaserJet con&ccedil;u par HP CF219A (12 000 pages)</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Syst&egrave;mes d\'exploitation compatibles&nbsp;: Windows&reg; 10, 8.1, 8, 7 : 32 bits/64 bits - Windows Vista&reg; : 32 bits uniquement - Apple&reg; OS X EI Capitan (v10.11), OS X Yosemite (v10.10), OS X Mavericks (v10.9), Linux USB</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Contenu de la bo&icirc;te&nbsp;: Imprimante multifonctions HP LaserJet Pro M130nw /Toner noir de d&eacute;marrage HP LaserJet (700 pages) / Tambour d\'imagerie HP LaserJet (12 000 pages) /Cordon d\'alimentation / Guide de mise en route, Poster d\'installation, Brochure d\'assistance, Documentation et logiciels de l\'imprimante sur CD-ROM</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Photocopieur&nbsp;: Vitesse de copie (normale): Noir :Jusqu\'&agrave; 22 cpm - R&eacute;solution de la copie (texte noir): Jusqu\'&agrave; 400 x 600 ppp - Param&egrave;tres de r&eacute;duction/ agrandissement de copies: 25 &agrave; 400 % - Copies, maximum: Jusqu\'&agrave; 99 copies</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Scanner : Type de scanner: &Agrave; plat - Formats de fichiers pour la num&eacute;risation: JPEG, PDF, PNG - R&eacute;solution de num&eacute;risation, optique: Jusqu\'&agrave; 600 ppp (couleur, &agrave; plat); Jusqu\'&agrave; 1 200 ppp (monochrome, &agrave; plat) - Taille de num&eacute;risation (scanner &agrave; plat) maximale: 215,9 x 297 mm - Volume de num&eacute;risation mensuel recommand&eacute;: 150 &agrave; 1 500</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; text-indent: -18pt;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Poids du support recommand&eacute; : 60 &agrave; 163 g/m&sup2;</p>', 'produits\\July2021\\EQl01gR7RfHtxLjfGZA1.jpg', 1, '[\"produits\\\\July2021\\\\EXiww9r2HZRtUfRl4Uey.jpg\",\"produits\\\\July2021\\\\I66sTIzamrlEijZuWuwY.jpg\"]', 5, NULL, NULL, 2, NULL, '2021-07-08 19:27:13', '2021-07-08 19:27:13'),
(14, 'Asus x540uv i3', 4500.99, 4150.99, 'Asus PC Portable X509J i3-1005G1 4GB/ 1T', '<div class=\"card aim -mtm\" style=\"box-sizing: border-box; border-radius: 4px; position: relative; box-shadow: rgba(0, 0, 0, 0.05) 0px 2px 5px 0px; margin-top: 16px;\">\r\n<div class=\"markup -mhm -pvl -oxa -sc\" style=\"box-sizing: border-box; overflow-x: auto; padding-top: 24px; padding-bottom: 24px; margin-right: 16px; margin-left: 16px;\">\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828;\">PC Portable X509J Processeur Intel&reg; Core &trade; i3-1005G1 1,2 GHz (4 Mo de cache, jusqu&rsquo;&agrave; 3,4 GHz), M&eacute;moire 4 Go de DRAM DDR 4, Afficher 15,6&Prime; Full HD 1920 x 1080 16: 9 antireflet ultra fin, 200 nits, Disque dur 1TB SATA 5400 tr/min, Clavier Cl&eacute;s de l&rsquo;&icirc;le Chiclet, l&rsquo;audio Haut-parleur int&eacute;gr&eacute; Microphone int&eacute;gr&eacute; Audio par ICEpower&reg; Sonic Master, Syst&egrave;me op&eacute;rateur Windows 10 HomeD&eacute;couvrez la puissance d&rsquo;un classique de tous les joursL&rsquo;un des plus petits ordinateurs portables 15 pouces polyvalents au mondeQue ce soit pour travailler ou jouer, ASUS X509 est l&rsquo;ordinateur portable d&rsquo;entr&eacute;e de gamme qui offre des performances puissantes et des visuels immersifs. Son &eacute;cran NanoEdge offre de larges angles de vision de 178 &deg; et un rev&ecirc;tement antireflet mat pour une exp&eacute;rience vraiment engageante. &Agrave; l&rsquo;int&eacute;rieur, il est aliment&eacute; par un processeur Intel&reg; Core &trade; i3 de 10e g&eacute;n&eacute;ration avec jusqu&rsquo;&agrave; 4 Go de RAM. Une conception &agrave; double stockage avec&nbsp; 1 To de disque dur vous offre la combinaison parfaite d&rsquo;une grande capacit&eacute; de stockage et de vitesses de lecture / &eacute;criture de donn&eacute;es rapides. Il existe m&ecirc;me une m&eacute;moire Intel Optane &trade;1 pour acc&eacute;l&eacute;rer les choses.Efficacit&eacute;Rapide et efficaceAvec son processeur Intel&reg; Core &trade; de 10e g&eacute;n&eacute;ration, ASUS X509 vous aide &agrave; accomplir vos t&acirc;ches rapidement et efficacement.Double stockageStockez plus, faites plusASUS X509 a une conception &agrave; double stockage pour vous offrir les avantages de performances de donn&eacute;es ultra-rapides et d&rsquo;une grande capacit&eacute; de stockage. Installez des applications sur le SSD pour une r&eacute;ponse et des temps de chargement plus rapides, et utilisez le disque dur pour stocker des fichiers volumineux tels que des films, des biblioth&egrave;ques musicales et des albums photo. L&rsquo;ASUS X509 est &eacute;galement dot&eacute; de la technologie de m&eacute;moire Intel&reg; Optane &trade;1 pour que les applications se chargent plus rapidement et que le multit&acirc;che soit plus fluideAffichage&nbsp;NanoEdgeObtenez une vision plus large du mondeL&rsquo;&eacute;cran NanoEdge offre &agrave; l&rsquo;ASUS X509 une vaste zone d&rsquo;&eacute;cran pour une exp&eacute;rience visuelle immersive pour le travail et les loisirs. Son panneau FHD &agrave; grande visibilit&eacute; est dot&eacute; d&rsquo;un rev&ecirc;tement antireflet pour r&eacute;duire les distractions ind&eacute;sirables dues aux reflets et aux reflets irritants, afin que vous puissiez vraiment vous concentrer sur ce qui se trouve devant vous</ul>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">PROCESSEUR: Processeur Intel&reg; Core &trade; i3 1005G7 de 10e g&eacute;n&eacute;ration.</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">RAM: 4 Go de m&eacute;moire DDR4,&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">STOCKAGE: Disque dur SATA 1 To&nbsp;</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Interface:</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 x prise audio COMBO</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 port USB 3.0 de type C (USB 3.1 Gen 1)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">1 port USB 3.0 de type A (USB 3.1 Gen 1)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">2 x port (s) USB 2.0</li>\r\n</ul>\r\n</div>\r\n<iframe class=\"y-ifm\" style=\"box-sizing: border-box; border-width: 0px; border-style: initial; height: 384px; width: 872px; padding: 16px;\" title=\"product_detail_youtube-title\" src=\"https://www.youtube.com/embed/https://www.youtube.com/watch?v=?enablejsapi=1\" allowfullscreen=\"\" data-dashlane-frameid=\"236\"></iframe></div>\r\n<section class=\"card aim -mtm -fs16\" style=\"box-sizing: border-box; border-radius: 4px; position: relative; box-shadow: rgba(0, 0, 0, 0.05) 0px 2px 5px 0px; margin-top: 16px; font-size: 1rem;\">\r\n<div id=\"specifications\" class=\"hook\" style=\"box-sizing: border-box; visibility: hidden; position: absolute; height: 614px; top: -88px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;</div>\r\n<header class=\"-pvs -bb\" style=\"box-sizing: border-box; border-bottom: 1px solid #ededed; padding-top: 8px; padding-bottom: 8px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"></header></section>', 'produits\\July2021\\c0IRlHYTI5iW14hxTFUy.jpg', 1, NULL, 6, NULL, NULL, 1, 1, '2021-07-08 19:29:36', '2021-07-08 19:29:36'),
(15, 'Pack Combo Gaming', 187.64, 150, 'Pack Combo Gaming Clavier + Souris 7D USB RGB', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 0px 18px; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; color: #0f1111;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">FRAPPE PR&Eacute;CISE. Le clavier gamer du Combo Zinc vous garantit une frappe r&eacute;active, pr&eacute;cise et silencieuse en toutes circonstances. Vous serez plus rapide que jamais peu importe le jeu ! Profitez de l&rsquo;anti-ghosting 6 touches afin d&rsquo;&eacute;viter les conflits et actions non d&eacute;sir&eacute;es. Le clavier propose aussi 12 touches raccourcis multim&eacute;dias pour les fonctionnalit&eacute;s de base de votre PC. Le mode gaming vous permet de bloquer la touche Windows en jeu pour &eacute;viter les retours bureau accidentels.</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">R&Eacute;ACTIVIT&Eacute; MAXIMALE. Le Combo Zinc propose &eacute;galement une souris gamer avec 7 boutons. Son capteur optique ultra pr&eacute;cis vous permet d&rsquo;ajuster la sensibilit&eacute; jusqu&rsquo;&agrave; 2400 DPI selon 4 paliers. Dot&eacute;e d&rsquo;un taux de rafra&icirc;chissement de 125 Hz, cette souris vous assure une r&eacute;activit&eacute; sans faille dans tous les jeux. Avec 8G d&rsquo;acc&eacute;l&eacute;ration maximale, cette souris vous garantit de parfaitement retranscrire tous vos mouvements les plus rapides. La souris se branche en USB sans driver &agrave; installer.</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">R&Eacute;TRO-&Eacute;CLAIRAGE MULTICOLORE. Illuminez votre bureau gr&acirc;ce au Combo Zinc et son r&eacute;tro-&eacute;clairage ultra lumineux. De jour comme de nuit, vous appr&eacute;cierez l&rsquo;&eacute;clairage fixe multicolore du clavier. Il est possible de modifier la luminosit&eacute; des LED ou de d&eacute;sactiver les lumi&egrave;res si vous le souhaitez. L&rsquo;effet &ldquo;Breathing&rdquo; donne la sensation que le clavier respire en couleurs ! La souris propose elle un r&eacute;tro&eacute;clairage intense 7 couleurs automatique&amp;&eacute;\"\'&sup2; pour animer votre set up gaming.</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px; list-style: disc; overflow-wrap: break-word;\">ERGONOMIQUE + R&Eacute;SISTANT. L&rsquo;ergonomie et la durabilit&eacute; du Combo Zinc ont &eacute;t&eacute; au coeur de sa conception. Le clavier est tr&egrave;s r&eacute;sistant et parfaitement stable. Il p&egrave;se 520g et ne bougera pas d&rsquo;un centim&egrave;tre pendant que vous jouez. La souris vous assure une prise en main parfaite et confortable peu importe la taille de vos mains. Elle est ultra l&eacute;g&egrave;re et ne p&egrave;se que 130g. Les c&acirc;bles sont tress&eacute;s et particuli&egrave;rement r&eacute;sistants &agrave; l&rsquo;usure.</li>\r\n</ul>\r\n<p><br style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" src=\"https://ma.jumia.is/cms/external/pet/IM722EA1B430JNAFAMZ/a7d36dc769200d103599ca1c3afb101e.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" src=\"https://ma.jumia.is/cms/external/pet/IM722EA1B430JNAFAMZ/d4aaeb3593f292d4575016cff3776e59.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" src=\"https://ma.jumia.is/cms/external/pet/IM722EA1B430JNAFAMZ/7fee8ffe032c1c52c4cba6a036ea90b2.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" src=\"https://ma.jumia.is/cms/external/pet/IM722EA1B430JNAFAMZ/f41be90e4ecc77620c292f52734ed58c.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" src=\"https://ma.jumia.is/cms/external/pet/IM722EA1B430JNAFAMZ/7199877b70da09ea4fd1033b283b9a36.jpg\" alt=\"image\" /><img class=\"detail-desc-decorate-image\" style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\" src=\"https://ma.jumia.is/cms/external/pet/IM722EA1B430JNAFAMZ/323ebbcbfee94856b0df0c9ff60b6598.jpg\" alt=\"image\" /></p>\r\n<p>&nbsp;</p>', 'produits\\July2021\\e7lgVJwZmj3ciqPcAM2T.jpg', 1, '[\"produits\\\\July2021\\\\lA6pcEni9pe7hzsryabA.jpg\"]', 5, NULL, NULL, NULL, NULL, '2021-07-08 19:32:16', '2021-07-08 20:16:43'),
(16, 'Tapis de souris gamer', 85.99, 75.65, 'Grande Tapis de souris gamer gaming mousepad', '<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;la taille de ce tapis de souris &eacute;tendu est de 900 &times; 300 &times; 3 mm&nbsp; ce qui convient &agrave; tous les claviers et souris, et garde votre bureau propre et bien rang&eacute;. le clavier et la souris de glisser, cela contribue &agrave; am&eacute;liorer l\'efficacit&eacute; du travail et l\'exp&eacute;rience de jeu. Parfait pour les ordinateurs portables Windows Mac, MacBook, PC, ordinateur, bureau.Surface lisse: la surface du tapis de souris est en tissu de haute qualit&eacute;, la surface lisse rend le mouvement de la souris plus pr&eacute;cis.Il est optimis&eacute; pour un mouvement rapide tout en conservant une excellente pr&eacute;cision et un contr&ocirc;le pendant le travail et les jeux.Mat&eacute;riau durable et bords cousus: le tapis de souris est fait de caoutchouc naturel et des bords cousus durables, ce qui peut assurer une utilisation &agrave; long terme sans usure, d&eacute;formation et d&eacute;gommage. Cela vous procurera une exp&eacute;rience confortable.Rev&ecirc;tement imperm&eacute;able et facile &agrave; nettoyer: il a un rev&ecirc;tement imperm&eacute;able pour &eacute;viter les dommages caus&eacute;s par l\'eau ou les boissons renvers&eacute;es. Lorsque du liquide &eacute;clabousse la surface du tapis de souris, il se forme en gouttes d\'eau et glisse vers le bas. Il est facile &agrave; nettoyer et il suffit de l&rsquo;essuyer avec un chiffon. Si n&eacute;cessaire, vous pouvez laver le tapis de souris pour garder votre ordinateur en ordre. Base en caoutchouc antid&eacute;rapante: la base en caoutchouc antid&eacute;rapante peut saisir fermement le bureau pour emp&ecirc;cher le clavier et la souris de bouger. Le mat&eacute;riau souple de qualit&eacute; sup&eacute;rieure peut vous offrir un confort et un contr&ocirc;le pr&eacute;cis de la souris.</span></p>', 'produits\\July2021\\pFSRK3YKP4Kz2zT0zjPR.jpg', 1, '[\"produits\\\\July2021\\\\MV6Y4kENtyFmQcFCxO8m.jpg\"]', 9, NULL, NULL, NULL, NULL, '2021-07-08 19:33:33', '2021-07-08 19:33:33'),
(17, 'Apple Ipad 7th', 3500.45, 3200, 'Apple Ipad 7th generation 32Go WIFI REMIS à NEUF', '<p><strong style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><span style=\"box-sizing: border-box; font-size: large;\">Ipad&nbsp;7th generation&nbsp;</span></strong><span style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; font-size: large;\">&nbsp;</span><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;</span><strong style=\"box-sizing: border-box; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><span style=\"box-sizing: border-box; font-size: large;\">REMIS &agrave; NEUF</span></strong><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;&nbsp; &nbsp;</span></p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\"><strong style=\"box-sizing: border-box;\">Display : 10.2 inch Retina display</strong></li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\"><strong style=\"box-sizing: border-box;\">Capacit&eacute; : 32GB</strong></li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\"><strong style=\"box-sizing: border-box;\">Face/Touch ID : Touch ID</strong></li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\"><strong style=\"box-sizing: border-box;\">Chip : A10 Fusion chip</strong></li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\"><strong style=\"box-sizing: border-box;\">Camera : 8MP photos</strong></li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\"><strong style=\"box-sizing: border-box;\">Video : 1080p HD video recording</strong></li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\"><strong style=\"box-sizing: border-box;\">Remis &agrave; Neuf</strong></li>\r\n</ul>\r\n<p><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;</span><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; vertical-align: top;\" src=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/e6b5ac4ac159783141a59b77502cd4df.jpg\" alt=\"iPad   Larger 10.2-inch Retina Display    Now supports the Smart Keyboard\" data-a-hires=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/e6b5ac4ac159783141a59b77502cd4df.jpg\" /><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; vertical-align: top;\" src=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/cd0651706e48e30115ee8782ce835472.jpg\" alt=\"10.2-inch Retina display   More display. More space to multitask.\" data-a-hires=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/cd0651706e48e30115ee8782ce835472.jpg\" /><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; vertical-align: top;\" src=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/3d3192c6ef04ceb15216a7ae4638e78f.jpg\" alt=\"Smart Keyboard  A full-size keyboard when you need it. A cover when you don\'t.\" data-a-hires=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/3d3192c6ef04ceb15216a7ae4638e78f.jpg\" /><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; vertical-align: top;\" src=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/d6c06af57a255490593b5a6d3068ae51.jpg\" alt=\"Apple Pencil   Take notes, draw, and jot down ideas with pixel-perfect perfection.\" data-a-hires=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/d6c06af57a255490593b5a6d3068ae51.jpg\" /><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; vertical-align: top;\" src=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/0953f0ee1ffe0151221ac84b29253da0.jpg\" alt=\"A10 Fusion chip   Engineered for performance and responsiveness. Win win.\" data-a-hires=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/0953f0ee1ffe0151221ac84b29253da0.jpg\" /><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; vertical-align: top;\" src=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/b974ed36c708b6e092ce69bc15946d4e.jpg\" alt=\"Built in cameras.  Connect with FaceTime. Shoot in HD. Play in AR.\" data-a-hires=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/b974ed36c708b6e092ce69bc15946d4e.jpg\" /><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; vertical-align: top;\" src=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/ea681cd4b5952509e4ac05193e45ed29.jpg\" alt=\"Portability  Your ideas go where you go.\" data-a-hires=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/ea681cd4b5952509e4ac05193e45ed29.jpg\" /><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; vertical-align: top;\" src=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/67bb1848e38a88d38be500f77129f02f.jpg\" alt=\"image 1\" data-a-hires=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/67bb1848e38a88d38be500f77129f02f.jpg\" /><img style=\"box-sizing: border-box; border: 0px; display: block; max-width: 100%; margin: 0px auto; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; vertical-align: top;\" src=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/2149e9f4ad56d1b9759b97e0b1d13aa2.jpg\" alt=\"Touch ID  Unlock, log in, or pay with just a touch.\" data-a-hires=\"https://ma.jumia.is/cms/external/pet/AP009MP0WNXHDNAFAMZ/2149e9f4ad56d1b9759b97e0b1d13aa2.jpg\" /><span style=\"color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;</span></p>', 'produits\\July2021\\nj9LPAuqFsDGmWjTxiXt.jpg', 0, '[\"produits\\\\July2021\\\\Nw1LCrsq57opipCbR9RB.jpg\"]', 4, NULL, NULL, 6, NULL, '2021-07-08 19:35:35', '2021-07-08 19:35:35'),
(18, 'Samsung RAM 8 Go', 579.00, 540, 'Samsung RAM 8 Go de Memoire DDR3 PC3L-12800S Pour PC Portable', '<p>&nbsp;</p>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 0px 18px; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: #111111;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">8 Go - 1.35 V</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Technologie : DDR3L SDRAM</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Vitesse : 1600 MHz (PC3L-12800)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Temps de latence : CL11 (11-11-11)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">Non ECC</li>\r\n</ul>', 'produits\\July2021\\uOqTUpE4BVdGKxZHPBUg.jpg', 0, '[\"produits\\\\July2021\\\\4SdrxSszSleaYIIq1KtN.jpg\"]', 45, NULL, NULL, 4, NULL, '2021-07-08 19:37:31', '2021-07-08 19:37:31'),
(19, 'tenda Routeur AC23', 999.50, 850.99, 'tenda Routeur AC23 WiFi Gigabit double bande AC2100, 7 Antennes 6 dBi, Vitesse jusqu\'à 2033 Mbps', '<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Le routeur AC23&nbsp; &eacute;quip&eacute; d\'un processeur 28 nm cadenc&eacute; &agrave; 1 GHz, et d\'un coprocesseur cadenc&eacute; &agrave; 500 MHz. Ce processeur&nbsp;de conception double c&oelig;ur, apporte une vitesse de traitement plus rapide et un fonctionnement optimis&eacute;.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" />L\'AC23 prend en charge le protocole IPv6, si bien qu\'il peut r&eacute;duire le temps de transmission des donn&eacute;es et minimiser le d&eacute;calage. Il vous fournit donc une meilleure exp&eacute;rience de jeu.</p>\r\n<h4 style=\"box-sizing: border-box; padding: 0px; margin: 0px; font-weight: 400; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">WI-FI AC2100 DUAL BAND MU-MIMO</h4>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Le&nbsp;routeur AC23&nbsp;de&nbsp;Tenda&nbsp;dispose de sept antennes 6&nbsp;dBi omnidirectionnelle pour un signal Wi-Fi optimal dans toutes les directions. Combin&eacute;&nbsp;avec la technologie 4X4 MU-MIMO de la bande 5 GHz, l\'AC23 offre une couverture Wi-Fi plus large et une vitesse Wi-Fi plus rapide que les routeurs ordinaires avec la technologie 3X3 MU-MIMO. Il peut communiquer avec plusieurs appareils &agrave; la fois, r&eacute;duisant ainsi la latence et augmentant le nombre d\'appareils connect&eacute;s simultan&eacute;ment. Enfin, Tenda Wi-Fi app vous permet de mettre &agrave; niveau en ligne, de g&eacute;rer votre r&eacute;seau et vos p&eacute;riph&eacute;riques &agrave; distance.</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/TE037EA0ODJ6VNAFAMZ/8056180675cebdd915a3f2c919264d0b.jpg\" alt=\"AC23\" width=\"989\" height=\"724\" /></p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/TE037EA0ODJ6VNAFAMZ/b32202ff8c672e1ae18e3fd2a34b6ccd.jpg\" alt=\"AC23\" width=\"1192\" height=\"800\" /></p>', 'produits\\July2021\\udakWt0sWBLrdTvpq2uV.jpg', 0, '[\"produits\\\\July2021\\\\wqSeYxnd8igHe86AgfQP.jpg\",\"produits\\\\July2021\\\\vPILynfeIMc8YvDk6cHQ.jpg\"]', 6, NULL, NULL, NULL, NULL, '2021-07-08 19:39:38', '2021-07-08 19:39:38'),
(20, 'DELL Latitude E5540', 2599.00, 2250.99, 'DELL Latitude E5540 core i3 4ème Gén, 15,6\" Ram 4GB, HDD 320Go -Remis à Neuf', '<h1 style=\"box-sizing: border-box; padding: 0px 0px 10px; margin: -3px 0px 20px; font-weight: 400; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: 24px; color: #000000; font-size: 20px; border: 0px; outline: 0px; vertical-align: top; font-family: Oswald; text-transform: uppercase; text-align: center;\">DELL LATITUDE E5540 CORE I3-4030U 4EME GENERATION 1,90GHZ&nbsp;</h1>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\"><img style=\"box-sizing: border-box; border-style: none; display: block; max-width: 100%; margin: 0px auto;\" src=\"https://ma.jumia.is/cms/external/pet/DE014CL1HJA3YNAFAMZ/5cc2c1a738080e9e7e83c1bd3266efb5.jpg\" alt=\"DELL LATITUDE E5480 - INTEL I7-7820HQ QUAD CORE: Amazon.fr: High-tech\" /></p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">Fiabilit&eacute;, solidit&eacute; et performance&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">ell nous propose ici cet ordinateur portable 15.6 pouces agr&eacute;ment&eacute; d\'une bonne configuration mat&eacute;rielle. Achetez ce portable pas cher pour vous permettre d\'utiliser tous vos logiciels sans vous ruiner. Le dell e5540 est l\'ordinateur portable Windows 10 professionnel pr&eacute;install&eacute; qu\'il vous faut au quotidien. - Remis &agrave; Neuf-</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0cm 0cm 0.0001pt 13.5pt; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0cm 0cm 0.0001pt 13.5pt; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">PC Portable DELL Latitude E5540</p>\r\n<p style=\"box-sizing: border-box; padding: 8px 0px; margin: 0cm 0cm 0.0001pt 13.5pt; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">&nbsp;</p>\r\n<ul style=\"box-sizing: border-box; padding: 0px 0px 0px 16px; margin: 0px; color: #282828; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, sans-serif;\">\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; Processeur&nbsp;: Intel Core i3-4030U (1.90 Ghz, 2C/4T, 3 Mo Cache)</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; Stockage&nbsp;: disque dur 320 Go,</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; M&eacute;moire&nbsp;: RAM 4 Go</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; Carte Graphique : Intel HD Graphics Family</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; Ecran 15.6\'\' HD &ndash; LED &ndash; MAT Antireflets</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; 1366&times;768</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; Webcam</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; Wifi</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; Clavier&nbsp;: AZRTY avec pav&eacute; num&eacute;rique</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; port(s) HDMI; 2 port(s) USB 2.0; 2 port(s) USB 3.0; 1 port(s) Ethernet; 1 prise(s) jack</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; Poids&nbsp;: 2.4 Kg</li>\r\n<li style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">&nbsp; &nbsp; &nbsp; Dimentions : Hauteur : 2.97 cm &ndash; Largeur : 37.9 cm &ndash; Profondeur : 15</li>\r\n</ul>', 'produits\\July2021\\79aqO7WqhlemhVccX1bf.jpg', 1, '[\"produits\\\\July2021\\\\6OdnrIdkb0uTnu8CD5uC.jpg\",\"produits\\\\July2021\\\\DIypcbB0wFY6g8LwN0J8.jpg\"]', 6, 1, 4.00, NULL, NULL, '2021-07-08 19:53:17', '2021-07-08 21:59:00');

-- --------------------------------------------------------

--
-- Structure de la table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
CREATE TABLE IF NOT EXISTS `promotions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `percent_off` int NOT NULL,
  `online` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `promotions`
--

INSERT INTO `promotions` (`id`, `percent_off`, `online`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '2021-06-16 22:57:38', '2021-06-22 14:20:59'),
(2, 15, 1, '2021-06-22 14:04:58', '2021-06-22 14:20:16'),
(3, 20, 0, '2021-07-08 20:11:02', '2021-07-08 20:11:02'),
(4, 30, 1, '2021-07-08 20:11:07', '2021-07-08 20:11:23'),
(5, 40, 0, '2021-07-08 20:11:13', '2021-07-08 20:11:13'),
(6, 50, 0, '2021-07-08 20:11:17', '2021-07-08 20:11:17');

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `produit_id` int UNSIGNED NOT NULL,
  `note` int NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_produit_id_foreign` (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `produit_id`, `note`, `message`, `statut`, `created_at`, `updated_at`) VALUES
(4, 4, 4, 3, 'Super produit, je recommande', 1, '2021-06-22 17:55:41', '2021-06-22 17:57:38'),
(5, 6, 4, 4, 'Très bon rapport qualité prix', 1, '2021-06-22 17:56:50', '2021-07-08 09:47:58'),
(6, 4, 1, 3, 'Super', 0, '2021-06-27 19:36:47', '2021-06-27 19:36:47'),
(8, 12, 20, 4, 'Super rapport qualité prix', 0, '2021-07-08 21:59:00', '2021-07-08 21:59:00'),
(9, 13, 5, 3, 'Super', 0, '2021-07-09 08:13:58', '2021-07-09 08:13:58');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrateur', '2021-06-06 13:44:34', '2021-06-06 14:55:41'),
(2, 'user', 'Utilisateur standard', '2021-06-06 13:48:38', '2021-06-06 13:48:38'),
(3, 'superUser', 'Super Utilisateur', '2021-06-06 14:57:04', '2021-06-06 14:57:04'),
(4, 'reseller', 'Revendeur', '2021-06-16 21:37:44', '2021-06-16 21:37:44'),
(5, 'webmaster', '', '2021-06-08 15:04:47', '2021-06-22 13:35:33');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Titre du site', 'GINFO : Vente Matériel Informatique', '', 'text', 1, 'Site'),
(3, 'site.logo', 'Logo du site', 'settings\\June2021\\MdWjphS8PXLanefJ1aJj.png', '', 'image', 4, 'Site'),
(5, 'admin.bg_image', 'Image de fond de l\'espace admin', 'settings\\June2021\\7A6zpWYeTz19fv8QyytR.png', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Titre de l\'espace admin', 'Administration', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Description de l\'espace admin', 'Panneau d\'administration', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Chargement de l\'espace admin', 'settings\\June2021\\eGiJFFFL9Kp1DhyYXoKh.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Icône de l\'espace admin', 'settings\\June2021\\wzc1PfjLyHRSEHR1Lc5t.png', '', 'image', 4, 'Admin'),
(12, 'site.stock_level', 'Niveau de Stock', '5', NULL, 'text', 7, 'Site'),
(14, 'site.tax', 'Taxe', '4', NULL, 'text', 8, 'Site'),
(15, 'site.about_us', 'About Us', 'N\'hésitez pas à nous contacter, nos agents seront ravis de répondre à vos préoccupations.', NULL, 'text', 10, 'Site'),
(21, 'site.promotional_date', 'Date Limite Promotions (Y-m-dTH:m:s)', '2022-10-17T14:00:00', NULL, 'text', 16, 'Site'),
(22, 'site.label_promotions', 'Label Promotions', 'Jusqu\'à -50% de réductions', NULL, 'text', 18, 'Site'),
(23, 'site.favicon', 'Icône du site', 'settings\\June2021\\00FtLZ6PAZY52V02RgK7.png', NULL, 'image', 3, 'Site'),
(24, 'site.work_time', 'Horaires', 'Lundi - Samedi : 9h - 20h', NULL, 'text', 14, 'Site'),
(26, 'site.terms_conditions', 'Termes & Conditions', '<h2 class=\"cgv-title\" style=\"box-sizing: inherit; line-height: 1.1; font-size: 16px; margin-top: 2.25rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase; background-image: url(\'../web/images/cgv_icon.gif\'); background-position: left top; background-size: initial; background-repeat: no-repeat; background-attachment: scroll; background-origin: initial; background-clip: initial; padding: 7px 0px 17px 64px; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; text-align: center;\">CONDITIONS GENERALES DE VENTES</h2>\r\n<div class=\"box-s2\" style=\"box-sizing: inherit; padding-left: 15px; color: #666666; font-family: \'Open Sans\', \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 12px;\">\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem; text-align: center;\">Vous venez de vous connecter sur le site&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>&nbsp;&eacute;dit&eacute; par la Societe GEANT COMPUTER<span style=\"box-sizing: inherit; font-weight: bold;\"><em style=\"box-sizing: inherit;\">.</em></span></p>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem; text-align: center;\">Vous devez lire attentivement les dispositions qui vont suivre car elles constituent un contact &eacute;tablissant les conditions g&eacute;n&eacute;rales des produits de la boutique &eacute;lectronique de la Soci&eacute;t&eacute; GEANT COMPUTER. Le &laquo; clic &raquo; que vous ex&eacute;cuterez apr&egrave;s avoir rempli votre bon de commande constitue la validation de votre commande et vaudra acceptation irr&eacute;vocable des pr&eacute;sentes conditions g&eacute;n&eacute;rales.</p>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem; text-align: center;\">En cons&eacute;quences, vous ne pouvez commander de produits ou services que si vous acceptez les conditions pr&eacute;vues ci-dessous.</p>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem; text-align: left;\">&nbsp;</p>\r\n<div id=\"1\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">&nbsp;</div>\r\n<div id=\"15\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<div id=\"1\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">1 - PRODUITS :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Les conditions g&eacute;n&eacute;rales de vente suivantes r&eacute;gissent l\'ensemble des transactions &eacute;tablies sur le catalogue web de&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>. Toute commande pass&eacute;e sur ce site suppose du client son acceptation inconditionnelle et irr&eacute;vocable de ces conditions.</p>\r\n</div>\r\n<div id=\"2\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">2 - OBJET :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Le pr&eacute;sent contrat est un contrat &agrave; distance qui a pour objet de d&eacute;finir les droits et obligations des parties dans le cadre de la vente des produits de la soci&eacute;t&eacute; GEANT COMPUTER&nbsp;sur Internet.<br style=\"box-sizing: inherit;\" /><span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>&nbsp;est un service de la societ&eacute; GEANT COMPUTER&nbsp;au capital de&nbsp;GEANT COMPUTER dirhams immatricul&eacute;e au Registre du Commerce de Casablanca sous le num&eacute;ro 21889.</p>\r\n</div>\r\n<div id=\"3\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">3 - D&Eacute;FINITIONS :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Dans la suite du contrat, chacune des expressions mentionn&eacute;es ci-dessus s&rsquo;entendra au sens de sa d&eacute;finition, &agrave; savoir :</p>\r\n<ul style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 2.25rem;\">\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\"><span style=\"box-sizing: inherit; font-weight: bold;\">&laquo; Contrat &agrave; distance &raquo;</span>&nbsp;: tout contrat concernant des biens ou services entrela Soci&eacute;t&eacute; GEANT COMPUTER&nbsp;et un Client dans le cadre d&rsquo;un syst&egrave;me de vente ou de prestations de service &agrave; distance organis&eacute; par la Soci&eacute;t&eacute; GEANT COMPUTER&nbsp;qui, pour ce contrat, utilise exclusivement le r&eacute;seau Internet jusqu&rsquo;&agrave; la conclusion du contrat, y compris la conclusion du contrat elle-m&ecirc;me.</li>\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\"><span style=\"box-sizing: inherit; font-weight: bold;\">&laquo; Client &raquo;</span>&nbsp;: toute personne physique qui, dans le pr&eacute;sent contrat, agit &agrave; des fins qui n&rsquo;entrent pas dans le cadre de son activit&eacute; professionnelle.</li>\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\"><span style=\"box-sizing: inherit; font-weight: bold;\">&laquo; Bon de commande &raquo;</span>&nbsp;: document qui indique les caract&eacute;ristiques des Produits command&eacute;s par le Client et qui doit &ecirc;tre sign&eacute; de lui par &laquo; double clic &raquo; pour l&rsquo;engager.</li>\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\"><span style=\"box-sizing: inherit; font-weight: bold;\">&laquo; Commande &raquo;</span>&nbsp;: acte par lequel le Client s&rsquo;engage &agrave; acheter des Produits et la Soci&eacute;t&eacute; GEANT COMPUTER&nbsp;&agrave; les livrer.</li>\r\n</ul>\r\n</div>\r\n<div id=\"4\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">4 - PRODUITS :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Tous les produits pr&eacute;sents dans le catalogue sont commercialis&eacute;s jusqu\'&agrave; &eacute;puisement des stocks.<br style=\"box-sizing: inherit;\" />La soci&eacute;t&eacute; GEANT COMPUTER&nbsp;se r&eacute;serve le droit de retirer du catalogue un article, et ceci sans pr&eacute;avis, elle ne peut en aucun cas &ecirc;tre tenu de d&eacute;dommager ou d\'annuler une commande suite &agrave; l\'impossibilit&eacute; d\'utiliser le produit achet&eacute; pour une raison d\'incompatibilit&eacute; avec le mat&eacute;riel d&eacute;j&agrave; poss&eacute;d&eacute; par l\'acheteur.</p>\r\n</div>\r\n<div id=\"5\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">5 - PASSER UNE COMMANDE :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Apr&egrave;s avoir trouver le ou les produits qui vous int&eacute;resse, cliquer sur le bouton &lsquo;&rsquo;commander&rsquo;&rsquo;, le produit est alors ajout&eacute; dans votre bon de commande.<br style=\"box-sizing: inherit;\" />Vous pouvez &agrave; tout instant modifier votre bon de commande et vous pouvez retourner au catalogue en appuyant sur poursuivre les achats.<br style=\"box-sizing: inherit;\" />Lorsque vous avez termin&eacute; vos achats, valider votre commande en cliquant sur le bouton de commande &lsquo;&rsquo; payer&rsquo;&rsquo;.<br style=\"box-sizing: inherit;\" />En cas d&rsquo;erreur de votre part, au moment de votre saisie sur le bon de commande, nous vous conseillons de nous adresser dans les 24 h une demande d&rsquo;annulation par e-mail ; Apr&egrave;s annulation de la commande par GEANT COMPUTER, vous pouvez commander &agrave; nouveau.</p>\r\n</div>\r\n<div id=\"6\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">6 - PRIX :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Les prix sont indiqu&eacute;s en Dirham marocain ils tiennent compte d\'&eacute;ventuelles r&eacute;ductions accord&eacute;es par&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>&nbsp;ainsi que de la TVA applicable au jour de la commande Les prix indiqu&eacute;s sont garantis dans la limite des stocks disponibles, sauf modifications importantes des charges et notamment de la TVA, et sauf erreur de typographie ou omission. Les prix indiqu&eacute;s ne tiennent pas compte des frais de livraison qui seront factur&eacute;s en sus et seront pr&eacute;cis&eacute;s au CLIENT lors de la validation d&eacute;finitive de sa commande.&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>&nbsp;se r&eacute;serve le droit de modifier ses prix &agrave; tout moment mais les articles seront factur&eacute;s sur la base des tarifs en vigueur au moment de l\'enregistrement de la commande, sous r&eacute;serve n&eacute;anmoins de la disponibilit&eacute; desdits articles. Lorsqu\'une commande valid&eacute;e comporte un ou plusieurs &eacute;l&eacute;ments erron&eacute;s (prix, descriptif, photo, &hellip;),&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>&nbsp;se r&eacute;serve le droit de l\'annuler et de proc&eacute;der au remboursement de la commande &agrave; sa seule discr&eacute;tion sans que le CLIENT ne puisse contester la solution retenue ou ne puisse engager la responsabilit&eacute; de GEANT COMPUTER&nbsp;en vue de r&eacute;clamer une indemnisation pour le pr&eacute;judice subi.</p>\r\n</div>\r\n<div id=\"7\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">7 - EX&Eacute;CUTION DE LA COMMANDE :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">La commande sera ex&eacute;cut&eacute;e au plus tard dans un d&eacute;lai de 7 jours &agrave; compter du jour suivant celui o&ugrave; le Client a pass&eacute; sa commande.<br style=\"box-sizing: inherit;\" />En cas d&rsquo;indisponibilit&eacute; du Produit command&eacute;, le Client en sera inform&eacute; au plus t&ocirc;t et aura la possibilit&eacute; d&rsquo;annuler sa commande.<br style=\"box-sizing: inherit;\" />Il aura alors le choix de demander soit le remboursement des sommes vers&eacute;es dans les trente jours au plus tard de leur versement, soit l&rsquo;&eacute;change du Produit.</p>\r\n</div>\r\n<div id=\"8\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">8 - LIVRAISON :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">La livraison n&rsquo;est pas assur&eacute;e par&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\"><em style=\"box-sizing: inherit;\">www.geantcomputer.com</em></span>&nbsp;, le client r&eacute;cup&egrave;rera sa marchandise dans l&rsquo;adresse de livraison indiqu&eacute; sur son Bon de commande.<br style=\"box-sizing: inherit;\" />Les Produits sont livr&eacute;s &agrave; l&rsquo;adresse indiqu&eacute;e par le Client sur le Bon de commande. Le Client est tenu de v&eacute;rifier l&rsquo;emballage de la marchandise &agrave; la livraison et de signaler les dommages dus au transporteur sur le bon de livraison ainsi qu&rsquo;&agrave; la Soci&eacute;t&eacute; GEANT COMPUTER&nbsp;dans un d&eacute;lai d&rsquo;un jour.<br style=\"box-sizing: inherit;\" />Le Client peut, &agrave; sa demande, obtenir l&rsquo;envoi d&rsquo;une facture &agrave; l&rsquo;adresse de livraison en validant l&rsquo;option pr&eacute;vue &agrave; cet effet sur le Bon de commande.</p>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\"><span style=\"box-sizing: inherit; font-weight: bold;\">Combien co&ucirc;te la livraison ?</span></p>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Les frais de transport sont &agrave; la charge de l\'acheteur,</p>\r\n<ul style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 2.25rem;\">\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Au Maroc, ils sont bas&eacute;s sur les tarifs de AMANA en envoi recommand&eacute;.</li>\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Nos tarifs s\'entendent TTC et sont calcul&eacute;s sur la base du poids des produits.</li>\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Le co&ucirc;t du transport de votre livraison est indiqu&eacute; sur votre facture.</li>\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Les frais de livraison sont offerts seulement en periode de promotion et offres speciales.</li>\r\n</ul>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\"><span style=\"box-sizing: inherit; font-weight: bold;\">Quels sont les d&eacute;lais de livraison ?</span></p>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Votre commande est exp&eacute;di&eacute;e dans les 48 heures, sous r&eacute;serve de stock disponible, apr&egrave;s la r&eacute;ception de votre r&egrave;glement.<br style=\"box-sizing: inherit;\" />Au Maroc, les articles vous seront envoy&eacute;s par poste en recommand&eacute;.<br style=\"box-sizing: inherit;\" />Les &eacute;ventuels retards ne sauraient donner lieu ni &agrave; des dommages et int&eacute;r&ecirc;ts, ni &agrave; annulation de commande, ni refus de prendre la livraison.</p>\r\n</div>\r\n<div id=\"9\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">9 - MODE DE PAIEMENT :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Pour r&eacute;gler votre commande vous choisissez l\'un des moyens de paiement parmi ceux propos&eacute;s par&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>&nbsp;au niveau du Bon de commande :</p>\r\n<ul style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 2.25rem;\">\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">R&egrave;glement Par carte bancaire.</li>\r\n<li style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">R&egrave;glement par virement ou versement sur notre compte</li>\r\n</ul>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Le Client garantit la Soci&eacute;t&eacute; GEANT COMPUTERqu&rsquo;il dispose des autorisations &eacute;ventuellement n&eacute;cessaires pour utiliser le mode de paiement choisi par lui, lors de la validation du Bon de commande.</p>\r\n</div>\r\n<div id=\"10\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">10 - CONFIDENTIALIT&Eacute; DES DONN&Eacute;ES :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Les informations qui vous sont demand&eacute;es sont n&eacute;cessaires au traitement de votre commande et elles sont trait&eacute;es de mani&egrave;re confidentielle.<br style=\"box-sizing: inherit;\" />Vous disposez d&rsquo;un droit de rectification relatif aux donn&eacute;es vous concernant.<br style=\"box-sizing: inherit;\" />Vous pouvez &ecirc;tre amen&eacute;s &agrave; recevoir des publicit&eacute;s de la part de&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>&nbsp;sauf si vous avez stipul&eacute; que vous refusiez l&rsquo;utilisation de vos donn&eacute;es nominatives &agrave; ses fins.</p>\r\n</div>\r\n<div id=\"11\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">11 - DROIT DE R&Eacute;TRACTATION ET RETOUR :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">A compter de la date de livraison de votre commande, vous disposez d\'un d&eacute;lais de 7 jours pour faire valoir votre droit de r&eacute;tractation, et &ecirc;tre int&eacute;gralement rembours&eacute;. Les frais de renvoi des marchandises restant &agrave; votre charge. Cependant, seules les marchandises retourn&eacute;es en parfait &eacute;tat de revente, compl&egrave;tes et dans leur emballage d\'origine (non-ouvert) pourront &ecirc;tre rembours&eacute;es.</p>\r\n</div>\r\n<div id=\"12\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">12 - PREUVE DES TRANSACTIONS PAY&Eacute;S PAR CARTE BANCAIRE :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Les donn&eacute;es enregistr&eacute;es par Maroc Telecommerce S.A sur la plate-forme MarocTelecommerce pour le compte de&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>&nbsp;constituent la preuve de l&rsquo;ensemble des transactions commerciales pass&eacute;es entre vous et la soci&eacute;t&eacute; GEANT COMPUTER.</p>\r\n</div>\r\n<div id=\"13\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">13 - FORCE MAJEURE :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\"><span style=\"box-sizing: inherit; font-weight: bold;\">www.geantcomputer.com</span>&nbsp;n&rsquo;est tenu pour l&rsquo;ex&eacute;cution de ses obligations que dans la mesure o&ugrave; aucun &eacute;v&eacute;nement de force majeure ne vient les entraver.</p>\r\n</div>\r\n<div id=\"14\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">14 - MENTIONS L&Eacute;GALES :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Editeur du Site GEANT COMPUTER. Soci&eacute;t&eacute; A Responsabilit&eacute; Limit&eacute; au capital de 800 000 dirhams immatricul&eacute;e au Registre du Commerce de Casablanca sous le num&eacute;ro 21889, Patente 46295353, identifiant Fiscal 06506564, CNSS 7153274 | Directeur de la Publication : LAMMAYSY Mouhssine . Pour toute demande de renseignement, toute information relative aux conditions de vente sur le Site ou toute autre question d\'ordre technique, il est possible de prendre contact avec la soci&eacute;t&eacute;&nbsp;<span style=\"box-sizing: inherit; font-weight: bold;\"><em style=\"box-sizing: inherit;\">GEANT COMPUTER</em></span>&nbsp;en appelant le&nbsp;<span style=\"box-sizing: inherit;\">05243-94343</span>&nbsp;( prix d&rsquo;un appel local).</p>\r\n</div>\r\n<div id=\"15\" class=\"item\" style=\"box-sizing: inherit; overflow: hidden; margin-bottom: 15px;\">\r\n<h4 style=\"box-sizing: inherit; line-height: 1.1; font-size: 1.3rem; margin-top: 1.8rem; margin-bottom: 1.8rem; color: #a28f66; text-transform: uppercase;\">15 - DROIT APPLICABLE &ndash; JURIDICTION COMP&Eacute;TENTE :</h4>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">Les CGV sont r&eacute;gies par le droit marocain. Tout litige auquel les CGV pourraient donner lieu sera port&eacute; devant le Tribunal de Commerce de Casablanca.</p>\r\n</div>\r\n</div>\r\n<p style=\"box-sizing: inherit; margin-top: 0rem; margin-bottom: 0.9rem;\">&nbsp;</p>\r\n</div>', NULL, 'rich_text_box', 20, 'Site'),
(27, 'site.aboutUs', 'Qui sommes nous ?', '<p style=\"text-align: center;\">Nous sommes une <strong>entreprise</strong> de vente de mat&eacute;riel informatique tr&egrave;s r&eacute;put&eacute;e &agrave; F&egrave;s</p>', NULL, 'rich_text_box', 19, 'Site'),
(28, 'site.livraison_price', 'Prix de Livraison', '15', NULL, 'text', 9, 'Site'),
(30, 'site.cities', 'Villes', 'Casablanca, Fès, Kénitra, Marrackech, Meknès, Mohammédia, Oujda, Rabat, Tanger', NULL, 'text', 15, 'Site');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-06-06 13:48:50', '2021-06-06 13:48:50'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-06-06 13:48:51', '2021-06-06 13:48:51'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-06-06 13:48:51', '2021-06-06 13:48:51');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `last_name`, `email`, `avatar`, `telephone`, `adresse`, `ville`, `zipcode`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(0, 5, 'webmaster', NULL, 'webmaster@gmail.com', 'users/default.png', NULL, NULL, NULL, NULL, NULL, '$2y$10$nqybNOTYNLSVTXB04SX4F.2jl00ilIo/4uSMru6MelT1HVjyJEwIu', NULL, '{\"locale\":\"fr\"}', '2021-06-01 15:07:42', '2021-06-01 15:07:42'),
(1, 1, 'Administrateur', NULL, 'admin@admin.com', 'users/default.png', NULL, NULL, NULL, NULL, NULL, '$2y$10$x5slA9SVG1qR.Bs2Che7ku9ctpvW2jWBvAiBLUdpniey0L5skv/O2', NULL, '{\"locale\":\"fr\"}', '2021-06-06 13:44:33', '2021-06-26 14:05:23'),
(2, 3, 'Employé 1', NULL, 'super1@gmail.com', 'users/default.png', NULL, NULL, NULL, NULL, NULL, '$2y$10$ld2iRwC53PVoLyWnIISQEe4HhuHdTlhI6qh1DR5VC3Cqqm.xtj6AW', NULL, '{\"locale\":\"fr\"}', '2021-06-22 16:53:47', '2021-06-23 16:29:22'),
(4, 2, 'Client 1', NULL, 'client1@gmail.com', 'users/default.png', '0610101010', '31 Rue Bamako Fès', 'Fès', '064012', NULL, '$2y$10$M9IGo6dMkfxLrOFM0lcsvO.4PIl5UH/MXidVuRDUntn5XADyAM/ty', NULL, NULL, '2021-06-22 17:00:28', '2021-06-22 17:24:46'),
(5, 2, 'Client 2', NULL, 'client2@gmail.com', 'users/default.png', '0620202020', '22 Rue Lagos', 'Kénitra', '30050', NULL, '$2y$10$1eFPfIevqAErEH7xZH3mLeCm5WvlS4tLgQZ0F/U37GHhKNQZ6gYyC', NULL, NULL, '2021-06-22 17:25:49', '2021-06-22 17:26:21'),
(6, 2, 'Client 3', NULL, 'client3@gmail.com', 'users/default.png', '0630303030', '31 Rue Lagos Casablanca', 'Casablanca', '60050', NULL, '$2y$10$dD/mzPk8H2XAx2s1Ted12ebIpRLEV2l8vyWcx2JpOskD7zHVNpNiG', NULL, NULL, '2021-06-22 17:56:20', '2021-06-23 21:51:42'),
(7, 3, 'Employé 2', NULL, 'super2@gmail.com', 'users/default.png', NULL, NULL, NULL, NULL, NULL, '$2y$10$mak959DOoAoR4MjFrT128uTyVUkxnEKKJkAGzgh880NUkSkWXyCki', NULL, '{\"locale\":\"fr\"}', '2021-06-23 16:28:58', '2021-06-23 16:28:58'),
(10, 2, 'Client 4', NULL, 'client4@gmail.com', 'users/default.png', '0645154210', '45 Rue Oran', 'Tanger', '45002', NULL, '$2y$10$6z8JecTV5TTtA9PWZ8G7Je1qgP2MC4v6mNe1DYgfWBaFy/Qy113n2', NULL, NULL, '2021-07-08 20:25:52', '2021-07-08 20:26:54'),
(11, 2, 'Client 5', NULL, 'client5@gmail.com', 'users/default.png', '0654154287', 'Cité internationnale', 'Fès', '20045', NULL, '$2y$10$qB7rdKb7gOrdNqCMlQvg7Op43vbF0j6IXbQEJf2ZVKrUWWYAUUE22', NULL, NULL, '2021-07-08 20:27:51', '2021-07-08 20:28:42'),
(12, 2, 'Abdoul', 'Mohamadou', 'abdoul@gmail.com', 'users/default.png', '0645978541', '31 Rue Lagos', 'Fès', '30050', NULL, '$2y$10$JrGSwmJQDMIbF6JL9se05eYeuV5Zs3BiMQtdKKJ07pFowWgM24BvG', NULL, NULL, '2021-07-08 21:55:25', '2021-07-08 21:56:49'),
(13, 2, 'ayoub', NULL, 'ayoub@gmail.com', 'users/default.png', '0645785421', '31 rue lagos', 'Kénitra', '654210', NULL, '$2y$10$7SPwIhZpA/kBFRFrEuxYD.0J/.UAoz/epgbQ2P8I0jSJ4tFcHXp82', NULL, NULL, '2021-07-09 08:11:55', '2021-07-09 08:12:40'),
(14, 2, 'Mohamadou', NULL, 'abdoulbaguimohamadou@gmail.com', 'users/default.png', '0640141070', NULL, NULL, NULL, NULL, '$2y$10$jMHgN8RpfYhBe3OrOISbDewXj0IioP5CZyPzvsDyoYzrwKDGJdku2', NULL, NULL, '2021-07-10 11:12:41', '2021-07-10 11:12:41');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `categorie_produit`
--
ALTER TABLE `categorie_produit`
  ADD CONSTRAINT `categorie_produit_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorie_produit_produit_id_foreign` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `commande_produit_commande_id_foreign` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_produit_produit_id_foreign` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_marque_id_foreign` FOREIGN KEY (`marque_id`) REFERENCES `marques` (`id`),
  ADD CONSTRAINT `produits_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`);

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_produit_id_foreign` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
