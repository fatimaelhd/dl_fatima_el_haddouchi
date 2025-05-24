-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : sam. 24 mai 2025 à 12:38
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
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `utilisateur_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `annotateur`
--

CREATE TABLE `annotateur` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `supprime` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `annotateur`
--

INSERT INTO `annotateur` (`id`, `utilisateur_id`, `supprime`) VALUES
(4, 5, b'0'),
(5, 6, b'0'),
(6, 7, b'0'),
(9, 10, b'1'),
(12, 13, b'0');

-- --------------------------------------------------------

--
-- Structure de la table `annotation`
--

CREATE TABLE `annotation` (
  `id` bigint(20) NOT NULL,
  `classe_Choisie` varchar(100) DEFAULT NULL,
  `id_Couple_Texte` bigint(20) DEFAULT NULL,
  `id_Annotateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `annotation`
--

INSERT INTO `annotation` (`id`, `classe_Choisie`, `id_Couple_Texte`, `id_Annotateur`) VALUES
(1, 'similaire', 442, 4),
(2, 'non similaire', 443, 4),
(3, 'similaire', 444, 4),
(4, 'non similaire', 445, 4),
(5, 'non similaire', 446, 4),
(6, 'similaire', 447, 5),
(7, 'non similaire', 448, 5),
(8, 'similaire', 449, 5),
(9, 'non similaire', 450, 5),
(10, 'similaire', 451, 5);

-- --------------------------------------------------------

--
-- Structure de la table `classe_possible`
--

CREATE TABLE `classe_possible` (
  `id` bigint(20) NOT NULL,
  `nom_Classe` varchar(100) NOT NULL,
  `dataset_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `classe_possible`
--

INSERT INTO `classe_possible` (`id`, `nom_Classe`, `dataset_id`) VALUES
(3, 'positif', 7),
(4, 'négatif', 7),
(5, 'similaire', 8),
(6, 'non simailire', 8),
(7, 'similaire', 9),
(8, 'non simailire', 9),
(11, 'similaire', 11),
(12, 'non similaire', 11);

-- --------------------------------------------------------

--
-- Structure de la table `couple_texte`
--

CREATE TABLE `couple_texte` (
  `id` bigint(20) NOT NULL,
  `texte1` text NOT NULL,
  `texte2` text NOT NULL,
  `dataset_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `couple_texte`
--

INSERT INTO `couple_texte` (`id`, `texte1`, `texte2`, `dataset_id`) VALUES
(121, 'La réunion a été stressante et épuisante.', 'Il fait froid et sombre dehors.', 7),
(122, 'Il fait froid et sombre dehors.', 'Il fait froid et sombre dehors.', 7),
(123, 'Le dîner était délicieux et relaxant.', 'J\'ai eu une excellente journée au travail.', 7),
(124, 'Il fait froid et sombre dehors.', 'Le dîner était délicieux et relaxant.', 7),
(125, 'Il fait froid et sombre dehors.', 'Je suis déçu par les résultats.', 7),
(126, 'Il fait froid et sombre dehors.', 'Le dîner était délicieux et relaxant.', 7),
(127, 'Le soleil brille et les oiseaux chantent.', 'Je me sens seul et ignoré.', 7),
(128, 'Je suis déçu par les résultats.', 'Félicitations pour ta promotion !', 7),
(129, 'Il fait froid et sombre dehors.', 'Le soleil brille et les oiseaux chantent.', 7),
(130, 'Il fait froid et sombre dehors.', 'Félicitations pour ta promotion !', 7),
(131, 'La journée a été longue et fatigante.', 'Félicitations pour ta promotion !', 7),
(132, 'Le dîner était délicieux et relaxant.', 'Le soleil brille et les oiseaux chantent.', 7),
(133, 'Il fait froid et sombre dehors.', 'J\'ai eu une excellente journée au travail.', 7),
(134, 'La journée a été longue et fatigante.', 'Félicitations pour ta promotion !', 7),
(135, 'Tu es une personne incroyable et aimée.', 'J\'ai eu une excellente journée au travail.', 7),
(136, 'Il fait froid et sombre dehors.', 'Félicitations pour ta promotion !', 7),
(137, 'Le dîner était délicieux et relaxant.', 'J\'ai eu une excellente journée au travail.', 7),
(138, 'Félicitations pour ta promotion !', 'Je me sens seul et ignoré.', 7),
(139, 'Le soleil brille et les oiseaux chantent.', 'Je me sens seul et ignoré.', 7),
(140, 'Tu es une personne incroyable et aimée.', 'Le soleil brille et les oiseaux chantent.', 7),
(141, 'Il fait froid et sombre dehors.', 'J\'ai eu une excellente journée au travail.', 7),
(142, 'Le soleil brille et les oiseaux chantent.', 'La journée a été longue et fatigante.', 7),
(143, 'Le soleil brille et les oiseaux chantent.', 'Le dîner était délicieux et relaxant.', 7),
(144, 'Le soleil brille et les oiseaux chantent.', 'Je suis déçu par les résultats.', 7),
(145, 'J\'ai eu une excellente journée au travail.', 'Tu es une personne incroyable et aimée.', 7),
(146, 'Je suis déçu par les résultats.', 'Félicitations pour ta promotion !', 7),
(147, 'Tu es une personne incroyable et aimée.', 'Je suis déçu par les résultats.', 7),
(148, 'La réunion a été stressante et épuisante.', 'Je me sens seul et ignoré.', 7),
(149, 'J\'ai eu une excellente journée au travail.', 'J\'ai eu une excellente journée au travail.', 7),
(150, 'J\'ai eu une excellente journée au travail.', 'Le dîner était délicieux et relaxant.', 7),
(151, 'Je suis déçu par les résultats.', 'Je me sens seul et ignoré.', 7),
(152, 'Tu es une personne incroyable et aimée.', 'J\'ai eu une excellente journée au travail.', 7),
(153, 'La réunion a été stressante et épuisante.', 'La réunion a été stressante et épuisante.', 7),
(154, 'Tu es une personne incroyable et aimée.', 'Je me sens seul et ignoré.', 7),
(155, 'La journée a été longue et fatigante.', 'Le soleil brille et les oiseaux chantent.', 7),
(156, 'Je me sens seul et ignoré.', 'La journée a été longue et fatigante.', 7),
(157, 'La réunion a été stressante et épuisante.', 'Le dîner était délicieux et relaxant.', 7),
(158, 'Je me sens seul et ignoré.', 'J\'ai eu une excellente journée au travail.', 7),
(159, 'J\'ai eu une excellente journée au travail.', 'Je suis déçu par les résultats.', 7),
(160, 'Je me sens seul et ignoré.', 'Je me sens seul et ignoré.', 7),
(161, 'Tu es une personne incroyable et aimée.', 'Le soleil brille et les oiseaux chantent.', 7),
(162, 'Je me sens seul et ignoré.', 'Le dîner était délicieux et relaxant.', 7),
(163, 'La journée a été longue et fatigante.', 'J\'ai eu une excellente journée au travail.', 7),
(164, 'Tu es une personne incroyable et aimée.', 'Félicitations pour ta promotion !', 7),
(165, 'J\'ai eu une excellente journée au travail.', 'Le dîner était délicieux et relaxant.', 7),
(166, 'Félicitations pour ta promotion !', 'La journée a été longue et fatigante.', 7),
(167, 'Tu es une personne incroyable et aimée.', 'La réunion a été stressante et épuisante.', 7),
(168, 'Je me sens seul et ignoré.', 'Je suis déçu par les résultats.', 7),
(169, 'Tu es une personne incroyable et aimée.', 'Félicitations pour ta promotion !', 7),
(170, 'Le soleil brille et les oiseaux chantent.', 'Je me sens seul et ignoré.', 7),
(171, 'La réunion a été stressante et épuisante.', 'Félicitations pour ta promotion !', 7),
(172, 'J\'ai eu une excellente journée au travail.', 'Le dîner était délicieux et relaxant.', 7),
(173, 'Le dîner était délicieux et relaxant.', 'Je suis déçu par les résultats.', 7),
(174, 'La journée a été longue et fatigante.', 'J\'ai eu une excellente journée au travail.', 7),
(175, 'Je suis déçu par les résultats.', 'Tu es une personne incroyable et aimée.', 7),
(176, 'Il fait froid et sombre dehors.', 'Le dîner était délicieux et relaxant.', 7),
(177, 'Je suis déçu par les résultats.', 'Félicitations pour ta promotion !', 7),
(178, 'Je me sens seul et ignoré.', 'Félicitations pour ta promotion !', 7),
(179, 'Il fait froid et sombre dehors.', 'Le dîner était délicieux et relaxant.', 7),
(180, 'J\'ai eu une excellente journée au travail.', 'Le soleil brille et les oiseaux chantent.', 7),
(181, 'La réunion a été stressante et épuisante.', 'Tu es une personne incroyable et aimée.', 7),
(182, 'Il fait froid et sombre dehors.', 'La réunion a été stressante et épuisante.', 7),
(183, 'Je me sens seul et ignoré.', 'Tu es une personne incroyable et aimée.', 7),
(184, 'Le soleil brille et les oiseaux chantent.', 'Le soleil brille et les oiseaux chantent.', 7),
(185, 'Je me sens seul et ignoré.', 'La journée a été longue et fatigante.', 7),
(186, 'Je suis déçu par les résultats.', 'J\'ai eu une excellente journée au travail.', 7),
(187, 'Félicitations pour ta promotion !', 'Le soleil brille et les oiseaux chantent.', 7),
(188, 'Le soleil brille et les oiseaux chantent.', 'Le soleil brille et les oiseaux chantent.', 7),
(189, 'Le dîner était délicieux et relaxant.', 'Félicitations pour ta promotion !', 7),
(190, 'Le soleil brille et les oiseaux chantent.', 'Félicitations pour ta promotion !', 7),
(191, 'Félicitations pour ta promotion !', 'Il fait froid et sombre dehors.', 7),
(192, 'Félicitations pour ta promotion !', 'J\'ai eu une excellente journée au travail.', 7),
(193, 'La journée a été longue et fatigante.', 'Je suis déçu par les résultats.', 7),
(194, 'J\'ai eu une excellente journée au travail.', 'Le dîner était délicieux et relaxant.', 7),
(195, 'Je me sens seul et ignoré.', 'J\'ai eu une excellente journée au travail.', 7),
(196, 'Il fait froid et sombre dehors.', 'Félicitations pour ta promotion !', 7),
(197, 'Je suis déçu par les résultats.', 'La journée a été longue et fatigante.', 7),
(198, 'Je me sens seul et ignoré.', 'La réunion a été stressante et épuisante.', 7),
(199, 'Je me sens seul et ignoré.', 'Félicitations pour ta promotion !', 7),
(200, 'Le soleil brille et les oiseaux chantent.', 'Je suis déçu par les résultats.', 7),
(201, 'Il fait froid et sombre dehors.', 'Il fait froid et sombre dehors.', 7),
(202, 'J\'ai eu une excellente journée au travail.', 'Je me sens seul et ignoré.', 7),
(203, 'J\'ai eu une excellente journée au travail.', 'La réunion a été stressante et épuisante.', 7),
(204, 'Le dîner était délicieux et relaxant.', 'J\'ai eu une excellente journée au travail.', 7),
(205, 'La journée a été longue et fatigante.', 'Le soleil brille et les oiseaux chantent.', 7),
(206, 'J\'ai eu une excellente journée au travail.', 'Le soleil brille et les oiseaux chantent.', 7),
(207, 'Je suis déçu par les résultats.', 'Tu es une personne incroyable et aimée.', 7),
(208, 'Le dîner était délicieux et relaxant.', 'Je me sens seul et ignoré.', 7),
(209, 'Tu es une personne incroyable et aimée.', 'La journée a été longue et fatigante.', 7),
(210, 'J\'ai eu une excellente journée au travail.', 'La réunion a été stressante et épuisante.', 7),
(211, 'La journée a été longue et fatigante.', 'Je suis déçu par les résultats.', 7),
(212, 'La journée a été longue et fatigante.', 'Je me sens seul et ignoré.', 7),
(213, 'Le dîner était délicieux et relaxant.', 'La journée a été longue et fatigante.', 7),
(214, 'La réunion a été stressante et épuisante.', 'Je suis déçu par les résultats.', 7),
(215, 'Le dîner était délicieux et relaxant.', 'Je suis déçu par les résultats.', 7),
(216, 'Je me sens seul et ignoré.', 'J\'ai eu une excellente journée au travail.', 7),
(217, 'Il fait froid et sombre dehors.', 'Tu es une personne incroyable et aimée.', 7),
(218, 'Je me sens seul et ignoré.', 'Tu es une personne incroyable et aimée.', 7),
(219, 'Le dîner était délicieux et relaxant.', 'Il fait froid et sombre dehors.', 7),
(220, 'Je suis déçu par les résultats.', 'Je me sens seul et ignoré.', 7),
(221, 'La réunion a été stressante et épuisante.', 'La réunion a été stressante et épuisante.', 7),
(222, 'J\'ai eu une excellente journée au travail.', 'Félicitations pour ta promotion !', 7),
(223, 'Le dîner était délicieux et relaxant.', 'La journée a été longue et fatigante.', 7),
(224, 'Il fait froid et sombre dehors.', 'Félicitations pour ta promotion !', 7),
(225, 'Je me sens seul et ignoré.', 'Le dîner était délicieux et relaxant.', 7),
(226, 'La journée a été longue et fatigante.', 'Je me sens seul et ignoré.', 7),
(227, 'La journée a été longue et fatigante.', 'Je suis déçu par les résultats.', 7),
(228, 'Le soleil brille et les oiseaux chantent.', 'Tu es une personne incroyable et aimée.', 7),
(229, 'Le dîner était délicieux et relaxant.', 'Le soleil brille et les oiseaux chantent.', 7),
(230, 'La journée a été longue et fatigante.', 'Je me sens seul et ignoré.', 7),
(231, 'Il fait froid et sombre dehors.', 'Le soleil brille et les oiseaux chantent.', 7),
(232, 'Il fait froid et sombre dehors.', 'Il fait froid et sombre dehors.', 7),
(233, 'Je me sens seul et ignoré.', 'Le soleil brille et les oiseaux chantent.', 7),
(234, 'Il fait froid et sombre dehors.', 'Il fait froid et sombre dehors.', 7),
(235, 'Le soleil brille et les oiseaux chantent.', 'Je me sens seul et ignoré.', 7),
(236, 'La réunion a été stressante et épuisante.', 'La réunion a été stressante et épuisante.', 7),
(237, 'Félicitations pour ta promotion !', 'Le soleil brille et les oiseaux chantent.', 7),
(238, 'Il fait froid et sombre dehors.', 'Le dîner était délicieux et relaxant.', 7),
(239, 'Je suis déçu par les résultats.', 'Je me sens seul et ignoré.', 7),
(240, 'Le soleil brille et les oiseaux chantent.', 'Je suis déçu par les résultats.', 7),
(241, 'Le dîner était délicieux et relaxant.', 'Le dîner était délicieux et relaxant.', 7),
(242, 'Le soleil brille et les oiseaux chantent.', 'Félicitations pour ta promotion !', 7),
(243, 'Je me sens seul et ignoré.', 'La journée a été longue et fatigante.', 7),
(244, 'Tu es une personne incroyable et aimée.', 'La réunion a été stressante et épuisante.', 7),
(245, 'Je suis déçu par les résultats.', 'Le soleil brille et les oiseaux chantent.', 7),
(246, 'Le soleil brille et les oiseaux chantent.', 'Il fait froid et sombre dehors.', 7),
(247, 'La journée a été longue et fatigante.', 'Tu es une personne incroyable et aimée.', 7),
(248, 'Le soleil brille et les oiseaux chantent.', 'Le soleil brille et les oiseaux chantent.', 7),
(249, 'Félicitations pour ta promotion !', 'Le soleil brille et les oiseaux chantent.', 7),
(250, 'Le soleil brille et les oiseaux chantent.', 'Félicitations pour ta promotion !', 7),
(251, 'La journée a été longue et fatigante.', 'La journée a été longue et fatigante.', 7),
(252, 'Il fait froid et sombre dehors.', 'Le dîner était délicieux et relaxant.', 7),
(253, 'Je me sens seul et ignoré.', 'La réunion a été stressante et épuisante.', 7),
(254, 'La journée a été longue et fatigante.', 'Tu es une personne incroyable et aimée.', 7),
(255, 'Félicitations pour ta promotion !', 'J\'ai eu une excellente journée au travail.', 7),
(256, 'J\'ai eu une excellente journée au travail.', 'La réunion a été stressante et épuisante.', 7),
(257, 'J\'ai eu une excellente journée au travail.', 'Tu es une personne incroyable et aimée.', 7),
(258, 'Le soleil brille et les oiseaux chantent.', 'Le dîner était délicieux et relaxant.', 7),
(259, 'Je me sens seul et ignoré.', 'Tu es une personne incroyable et aimée.', 7),
(260, 'Il fait froid et sombre dehors.', 'Félicitations pour ta promotion !', 7),
(261, 'Il fait froid et sombre dehors.', 'Je me sens seul et ignoré.', 7),
(262, 'Le soleil brille et les oiseaux chantent.', 'Tu es une personne incroyable et aimée.', 7),
(263, 'Il fait froid et sombre dehors.', 'Je me sens seul et ignoré.', 7),
(264, 'La journée a été longue et fatigante.', 'J\'ai eu une excellente journée au travail.', 7),
(265, 'Il fait froid et sombre dehors.', 'Je suis déçu par les résultats.', 7),
(266, 'Félicitations pour ta promotion !', 'La journée a été longue et fatigante.', 7),
(267, 'Je suis déçu par les résultats.', 'Je suis déçu par les résultats.', 7),
(268, 'Je me sens seul et ignoré.', 'Tu es une personne incroyable et aimée.', 7),
(269, 'Le soleil brille et les oiseaux chantent.', 'La journée a été longue et fatigante.', 7),
(270, 'Le dîner était délicieux et relaxant.', 'Le soleil brille et les oiseaux chantent.', 7),
(271, 'Le chat dort sur le canapé.', 'Le canapé est rouge.', 8),
(272, 'Il va pleuvoir demain.', 'N\'oublie pas ton parapluie.', 8),
(273, 'La conférence commence à 9h.', 'Elle se tiendra en salle B.', 8),
(274, 'La pizza était excellente.', 'J\'ai tout mangé.', 8),
(275, 'Les élèves ont réussi l\'examen.', 'Ils ont bien révisé.', 8),
(276, 'Le match a été annulé.', 'Il pleuvait trop.', 8),
(277, 'Le train part à midi.', 'Il arrive à 14h.', 8),
(278, 'Mon téléphone ne marche plus.', 'Je dois en acheter un autre.', 8),
(279, 'Il a terminé le projet en avance.', 'Il a travaillé dur.', 8),
(280, 'Elle aime lire des romans.', 'Son auteur préféré est Hugo.', 8),
(281, 'La voiture est en panne.', 'Je dois appeler un mécanicien.', 8),
(282, 'Le ciel est bleu.', 'Il n\'y a aucun nuage.', 8),
(283, 'Nous partons en vacances demain.', 'Les valises sont prêtes.', 8),
(284, 'Le café est trop chaud.', 'Je vais attendre un peu.', 8),
(285, 'Elle est médecin.', 'Elle travaille à l\'hôpital.', 8),
(286, 'Le chien aboie fort.', 'Il a vu un chat.', 8),
(287, 'L\'ordinateur est lent.', 'Je dois le redémarrer.', 8),
(288, 'Il fait très froid aujourd\'hui.', 'Porte un manteau.', 8),
(289, 'La bibliothèque est fermée.', 'C\'est dimanche.', 8),
(290, 'Je vais au supermarché.', 'Il faut acheter du lait.', 8),
(291, 'Le bus est en retard.', 'Il y a des embouteillages.', 8),
(292, 'Elle a acheté une nouvelle robe.', 'Elle est bleue.', 8),
(293, 'Le film était ennuyeux.', 'Je me suis endormi.', 8),
(294, 'Il joue du piano.', 'Il prend des cours.', 8),
(295, 'Nous avons un rendez-vous à 15h.', 'Ne sois pas en retard.', 8),
(296, 'La fenêtre est ouverte.', 'Il fait frais.', 8),
(297, 'Je lis un livre intéressant.', 'C\'est un polar.', 8),
(298, 'Le restaurant est complet.', 'Il faut réserver.', 8),
(299, 'L\'eau bout à 100°C.', 'C\'est une propriété physique.', 8),
(300, 'Il adore le chocolat.', 'Il en mange tous les jours.', 8),
(301, 'Le soleil se lève à l\'est.', 'C\'est une loi naturelle.', 8),
(302, 'Mon frère joue au foot.', 'Il est gardien de but.', 8),
(303, 'Elle parle trois langues.', 'Français, anglais et espagnol.', 8),
(304, 'Le pain est frais.', 'Il vient de la boulangerie.', 8),
(305, 'Il a gagné la course.', 'Il s\'est beaucoup entraîné.', 8),
(306, 'Je suis fatigué.', 'Je vais dormir.', 8),
(307, 'La lampe est cassée.', 'Elle ne s’allume plus.', 8),
(308, 'L’ascenseur est en panne.', 'Prenons les escaliers.', 8),
(309, 'Les fleurs sont jolies.', 'Elles sentent bon.', 8),
(310, 'Le bébé pleure.', 'Il a faim.', 8),
(311, 'La neige tombe.', 'Tout est blanc.', 8),
(312, 'J’ai perdu mes clés.', 'Je ne peux pas rentrer.', 8),
(313, 'Elle est en retard.', 'Le métro était bondé.', 8),
(314, 'Le parc est fermé.', 'Il est trop tard.', 8),
(315, 'Il a une guitare.', 'Il joue souvent.', 8),
(316, 'Je regarde un film.', 'Il est très drôle.', 8),
(317, 'Les enfants jouent.', 'Ils rient fort.', 8),
(318, 'La mer est calme.', 'Pas de vent aujourd’hui.', 8),
(319, 'Il lit le journal.', 'Il aime les actualités.', 8),
(320, 'J’adore ce tableau.', 'C’est un Monet.', 8),
(321, 'Le train est rapide.', 'C’est un TGV.', 8),
(322, 'Il fait nuit.', 'Allume la lumière.', 8),
(323, 'Elle cuisine bien.', 'Tout le monde aime ses plats.', 8),
(324, 'Le téléphone sonne.', 'Réponds vite.', 8),
(325, 'La pluie tombe fort.', 'Le sol est trempé.', 8),
(326, 'Il dort déjà.', 'Il est fatigué.', 8),
(327, 'Elle court vite.', 'C’est une athlète.', 8),
(328, 'Le thé est prêt.', 'Sers-toi.', 8),
(329, 'Je cherche mon livre.', 'Il est sur la table.', 8),
(330, 'La musique est forte.', 'Baisse le volume.', 8),
(331, 'Il fait beau.', 'Allons nous promener.', 8),
(332, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(333, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(334, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(335, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(336, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(337, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(338, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(339, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(340, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(341, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(342, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(343, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(344, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(345, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(346, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(347, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(348, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(349, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(350, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(351, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(352, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(353, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(354, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(355, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(356, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(357, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(358, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(359, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(360, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(361, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(362, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(363, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(364, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(365, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(366, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(367, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(368, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(369, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(370, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(371, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(372, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(373, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(374, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(375, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(376, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(377, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(378, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(379, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(380, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(381, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(382, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(383, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(384, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(385, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(386, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(387, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(388, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(389, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(390, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(391, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(392, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(393, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(394, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(395, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(396, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(397, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(398, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(399, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(400, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(401, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(402, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(403, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(404, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(405, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(406, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(407, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(408, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(409, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(410, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(411, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(412, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(413, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(414, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(415, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(416, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(417, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(418, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(419, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(420, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(421, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(422, 'L\'intelligence artificielle transforme le monde de la technologie.', 'Les machines deviennent de plus en plus intelligentes.', 9),
(423, 'Les océans couvrent plus de 70 % de la surface de la Terre.', 'Ils abritent une incroyable diversité de vie marine.', 9),
(424, 'L\'énergie solaire est une source d\'énergie renouvelable.', 'Elle peut être utilisée pour produire de l\'électricité.', 9),
(425, 'Les pyramides d\'Égypte sont parmi les structures les plus anciennes du monde.', 'Elles témoignent des compétences architecturales de l\'Égypte antique.', 9),
(426, 'La tour Eiffel est un symbole emblématique de la France.', 'Elle a été construite pour l\'Exposition universelle de 1889.', 9),
(427, 'Les voitures électriques sont de plus en plus populaires.', 'Elles sont plus respectueuses de l\'environnement que les voitures à essence.', 9),
(428, 'La révolution industrielle a changé le monde au 19e siècle.', 'Elle a marqué le passage à la production mécanisée.', 9),
(429, 'Les forêts tropicales abritent une grande variété d\'espèces.', 'Elles jouent un rôle crucial dans la régulation du climat mondial.', 9),
(430, 'Les réseaux sociaux ont transformé la communication moderne.', 'Ils permettent de rester en contact avec des amis partout dans le monde.', 9),
(431, 'Les ordinateurs quantiques promettent des avancées révolutionnaires.', 'Ils fonctionnent différemment des ordinateurs classiques.', 9),
(442, 'Le chat dort sur le canapé.', 'Un félin est en train de faire la sieste sur le sofa.', 11),
(443, 'Le soleil brille dans le ciel.', 'Il pleut beaucoup aujourd’hui.', 11),
(444, 'Le train part à 8 heures.', 'Le départ du train est prévu à 8h00.', 11),
(445, 'J’ai mangé des pâtes au déjeuner.', 'Ce midi, j’ai pris du riz.', 11),
(446, 'Elle adore les romans policiers.', 'Elle lit souvent des livres de détectives.', 11),
(447, 'La voiture rouge est rapide.', 'L’ordinateur portable est performant.', 11),
(448, 'Il travaille à Paris depuis 5 ans.', 'Il est employé à Paris depuis cinq années.', 11),
(449, 'Les enfants jouent dans le jardin.', 'Des adultes assistent à une réunion.', 11),
(450, 'La température a chuté cette nuit.', 'Il a fait très froid cette nuit.', 11),
(451, 'Je regarde un film ce soir.', 'Je vais au cinéma ce soir.', 11);

-- --------------------------------------------------------

--
-- Structure de la table `dataset`
--

CREATE TABLE `dataset` (
  `id` bigint(20) NOT NULL,
  `nom_Dataset` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dataset`
--

INSERT INTO `dataset` (`id`, `nom_Dataset`, `description`) VALUES
(7, 'dataset_2', 'dataset a annoter par positif ou négatif'),
(8, 'dataset_3', 'dataset de couples pour l\'annotation'),
(9, 'dataset_1', 'dataset a annoter avec simailire et non simailire'),
(11, 'dataset_4', 'dataset bon');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `nom_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `nom_role`) VALUES
(1, 'ADMIN_ROLE'),
(2, 'USER_ROLE');

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE `tache` (
  `id` bigint(20) NOT NULL,
  `date_Limite` date DEFAULT NULL,
  `id_Annotateur` int(11) DEFAULT NULL,
  `id_Dataset` bigint(20) DEFAULT NULL,
  `supprime` bit(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tache`
--

INSERT INTO `tache` (`id`, `date_Limite`, `id_Annotateur`, `id_Dataset`, `supprime`) VALUES
(18, '2025-05-31', 4, 11, b'00000000000'),
(19, '2025-05-31', 5, 11, b'00000000000');

-- --------------------------------------------------------

--
-- Structure de la table `tache_couple_texte`
--

CREATE TABLE `tache_couple_texte` (
  `tache_id` bigint(20) NOT NULL,
  `couple_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tache_couple_texte`
--

INSERT INTO `tache_couple_texte` (`tache_id`, `couple_id`) VALUES
(18, 442),
(18, 443),
(18, 444),
(18, 445),
(18, 446),
(19, 449),
(19, 450),
(19, 451);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `login`, `password`, `role_id`) VALUES
(1, 'admin', 'system', 'admin', '$2a$10$Jd4MJ50DyAjMR698pabIBOo810LjyifbwR0EngMmFLP0tjGVNBiD6', 1),
(5, 'fatima', 'el haddouchi', 'fatima', '$2a$10$ilcLvtedWnsgV0ARQVdeFuRMg5j4f9Q18o0tHzc/c1kS2KCWcP0I6', 2),
(6, 'kawtar ', 'morabit', 'kawtar', '$2a$10$msW0IjSSgbxihuRoax3RVOJp6MsF.HOk2YSlDaET9IgWZMjr6rz.O', 2),
(7, 'sayf', 'eddine', 'sayf', '$2a$10$3Uze2NrNOVv1STbAwsjnAOa3KoNyiWK2uQ7q3X0IA3ns1x4WxwBQu', 2),
(10, 'wisal', 'el', 'wisal', '$2a$10$0TEWkbBA6gktOogtlF8zNu5/JjxEZl.IoQrPvjDwI5ZO5AupnqrFu', 2),
(13, 'salma', 'el', 'salma', '$2a$10$H2w8yXGq3wGgu6HLg/hmGOO5HJivsqt7JDHIZCP8W.KKTM8vXWONi', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `annotateur`
--
ALTER TABLE `annotateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `annotation`
--
ALTER TABLE `annotation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idCoupleTexte` (`id_Couple_Texte`),
  ADD KEY `idAnnotateur` (`id_Annotateur`);

--
-- Index pour la table `classe_possible`
--
ALTER TABLE `classe_possible`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dataset_id` (`dataset_id`);

--
-- Index pour la table `couple_texte`
--
ALTER TABLE `couple_texte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dataset_id` (`dataset_id`);

--
-- Index pour la table `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAnnotateur` (`id_Annotateur`),
  ADD KEY `idDataset` (`id_Dataset`);

--
-- Index pour la table `tache_couple_texte`
--
ALTER TABLE `tache_couple_texte`
  ADD PRIMARY KEY (`tache_id`,`couple_id`),
  ADD KEY `couple_id` (`couple_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `annotateur`
--
ALTER TABLE `annotateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `annotation`
--
ALTER TABLE `annotation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `classe_possible`
--
ALTER TABLE `classe_possible`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `couple_texte`
--
ALTER TABLE `couple_texte`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=464;

--
-- AUTO_INCREMENT pour la table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `tache`
--
ALTER TABLE `tache`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `administrateur_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `annotateur`
--
ALTER TABLE `annotateur`
  ADD CONSTRAINT `annotateur_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `annotation`
--
ALTER TABLE `annotation`
  ADD CONSTRAINT `annotation_ibfk_1` FOREIGN KEY (`id_Couple_Texte`) REFERENCES `couple_texte` (`id`),
  ADD CONSTRAINT `annotation_ibfk_2` FOREIGN KEY (`id_Annotateur`) REFERENCES `annotateur` (`id`);

--
-- Contraintes pour la table `classe_possible`
--
ALTER TABLE `classe_possible`
  ADD CONSTRAINT `classe_possible_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `couple_texte`
--
ALTER TABLE `couple_texte`
  ADD CONSTRAINT `couple_texte_ibfk_1` FOREIGN KEY (`dataset_id`) REFERENCES `dataset` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `tache_ibfk_1` FOREIGN KEY (`id_Annotateur`) REFERENCES `annotateur` (`id`),
  ADD CONSTRAINT `tache_ibfk_2` FOREIGN KEY (`id_Dataset`) REFERENCES `dataset` (`id`);

--
-- Contraintes pour la table `tache_couple_texte`
--
ALTER TABLE `tache_couple_texte`
  ADD CONSTRAINT `tache_couple_texte_ibfk_1` FOREIGN KEY (`tache_id`) REFERENCES `tache` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tache_couple_texte_ibfk_2` FOREIGN KEY (`couple_id`) REFERENCES `couple_texte` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
