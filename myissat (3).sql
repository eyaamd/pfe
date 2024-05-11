-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 11 mai 2024 à 16:01
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `myissat`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `nom`, `email`, `mot_de_passe`) VALUES
(130, 'nassif', 'nassif@gmail.com', 'nassif');

-- --------------------------------------------------------

--
-- Structure de la table `branche`
--

CREATE TABLE `branche` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `branche`
--

INSERT INTO `branche` (`id`, `nom`) VALUES
(1, 'TIC'),
(2, 'EEA');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id`, `nom`) VALUES
(1, 'STIC'),
(2, 'BIO');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `sexe` enum('Homme','Femme','','') DEFAULT NULL,
  `grade` enum('Professeur','Maître de Conférence','Maître Assistant','Assistant','PTC','Autre') NOT NULL,
  `matiere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id`, `nom`, `email`, `mot_de_passe`, `sexe`, `grade`, `matiere`) VALUES
(111, 'moussa', 'moussa@gmail.com', 'moussa', 'Homme', 'Maître de Conférence', '');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_branche`
--

CREATE TABLE `enseignant_branche` (
  `enseignant_id` int(11) NOT NULL,
  `branche_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_departement`
--

CREATE TABLE `enseignant_departement` (
  `id` int(11) NOT NULL,
  `enseignant_id` int(11) DEFAULT NULL,
  `departement_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_groupe`
--

CREATE TABLE `enseignant_groupe` (
  `enseignant_id` int(11) DEFAULT NULL,
  `groupe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignant_groupe`
--

INSERT INTO `enseignant_groupe` (`enseignant_id`, `groupe_id`) VALUES
(111, 7);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_matiere`
--

CREATE TABLE `enseignant_matiere` (
  `enseignant_id` int(11) NOT NULL,
  `matiere_id` int(11) NOT NULL,
  `nom_matiere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignant_matiere`
--

INSERT INTO `enseignant_matiere` (`enseignant_id`, `matiere_id`, `nom_matiere`) VALUES
(111, 169920413, 'Big Data'),
(7777, 573506414, 'TCP/ IP et applicatifs'),
(6666, 573506413, 'Web');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_niveau`
--

CREATE TABLE `enseignant_niveau` (
  `id` int(11) NOT NULL,
  `enseignant_id` int(11) DEFAULT NULL,
  `niveau_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `student_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `groupe_nom` varchar(255) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `qr_code` longblob DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `sexe` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`student_id`, `id`, `nom`, `groupe_nom`, `id_niveau`, `qr_code`, `email`, `sexe`) VALUES
(22256, 32, 'eya', 'groupe 1', 1, 0x89504e470d0a1a0a0000000d49484452000000870000008701030000000629d84900000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b000001af494441544889ddd5318eeb201006e0b128e8e002485c838e2bc51788f1059c2bd1f91a485cc0ee28acccfeec4bf66dc7a4ddc8529caf8861fe614cf4573f96f9c1fe086a6d8ab908c590da34dd42dd4825124bac6b7653764b568ff681245deed1affc996c10f2297e22841bde424de1ff2e8682fae0e7bfeba76243e9981d69a2f82b8e91d8e61ffb75efcbe6a72e4221ed6c2e265e37f267938ae57a04de6259f6ca592cd9cd7b7d46386e482886786dbed71351beea3c96a95d06f16975b23ab3542ca38d694689d06c4d2a26b8a9394282fa958544509fa4af3b1513d4e35db1a14c8de6562c23447590546c6f4b1c559ab1d326958ec8a27f5fe667d92331daa7e037ac59c38b50ecee6ec1f7cdeabab25470e2ce9e853f779ab3542cf73850d2143052482884fb88d071765efd2c9129f7f816c6c5e72e159beb417c44872cde67672c8860610c554c12ec572af81f9c9d2d200b7e4d24817ca37f6a467ca8955030eb924683618cd477878fa5bf2f9085ae1826268a05c7932fbbe3d1fca40f2485820989563181e482b37368c6d4babf9f3e16bc2f7a166aeb3d4042e9efdc86aa5e4b662c43287ff3f305b31e180a490aa09f0000000049454e44ae426082, 'amdounieya@gmail.com', 'Femme'),
(22258, 222, 'linda', 'groupe 1', 1, 0x89504e470d0a1a0a0000000d49484452000000870000008701030000000629d84900000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b000001ab494441544889dd95b18d843010453f2270060d58721bcedc1234b04003d09233b761c90d2c9903c4dc0cbbabbb6c87f4ac0d9627318cffff1e03ff75f5442bdc96ca920a5156920eed6a68af187c3b434d42d96259c80ebe6cf50e913fee69da5b64a9b991af971b04fc3afa7ae0cf2ebe12d1c797d7ef57b16f4456b08f60113e8f0ad2479afd01d0098cafca1a52f300b77ac063ac5013c73bed5028d9296ac9f5ba388850a49a92185ac8516d4f9ffb973e0ad2b13260076de7f3787d5d43fa5ad6407b2c27a479256912c6245e34c49d6b49675e5e384aed7a99a821086ca25b4dd9136b0b25e1641227937b36b6a96a1224ffe2857f7ba1229e2bb833d889dad9642dc1d1f191f1124bd64a4960dc46f4948cb93d6a096b3211675226c91cb44424f54743f961dc336425e9c0e9722bec54edf4dec57782e096ebececc9f6514dfcd1cb847433cbebb392f449bcd879dc451e0b5a726d36379ce4f039830ac2b36e365ca1f0f1d9ae9e3544ee0b890a7b91b9a096c8e43fc6783c40efbb494766b89d688b79f037087b3148c6e89d1f0de19ef97e915977404d589f4d92ccb786db535692ffb97e0066acfbded1691efb0000000049454e44ae426082, 'linda@gmail.com', 'Femme');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `id_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom`, `id_niveau`) VALUES
(1, 'groupe 1', 1),
(2, 'groupe 2', 1),
(3, 'groupe 3', 1),
(4, 'groupe 1', 2),
(5, 'groupe 2', 2),
(6, 'groupe 1', 3),
(7, 'groupe 2', 3);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `role` enum('Admin','Enseignant','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id`, `email`, `mot_de_passe`, `role`) VALUES
(111, '', 'moussa', 'Enseignant'),
(130, '', 'nassif', 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `code_EE` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `Code_Ue` varchar(255) DEFAULT NULL,
  `id_semestre` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`code_EE`, `libelle`, `Code_Ue`, `id_semestre`, `id_niveau`) VALUES
(53254, 'Algorithmique et programmation', '53252', 1, 1),
(53255, 'Architecture des ordinateurs	', '53252', 1, 1),
(53272, 'Système d\'exploitation', '53258', 2, 1),
(53273, 'Bases de données	', '53258', 2, 1),
(169920413, 'Big Data', '9999874780', 1, 3),
(169920414, 'CAO', '9999874780', 1, 3),
(573506413, 'Web', '573506420', 2, 2),
(573506414, 'TCP/ IP et applicatifs', '573506420', 2, 2),
(573506511, 'Traitement d\'image', '573506510', 1, 3),
(573506512, 'analyse d\'image', '573506510', 1, 3),
(573506513, 'Architecture et programmation des cartes programmables', '573506520', 1, 3),
(573506514, 'Optoélectronique et réseaux fibres optiques	', '573506520', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id`, `nom`) VALUES
(1, '1ere année'),
(2, '2éme année'),
(3, '3éme année');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `etudiant_id` int(11) NOT NULL,
  `note` decimal(5,2) DEFAULT NULL,
  `type_exam_nom` varchar(255) NOT NULL,
  `matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

CREATE TABLE `programme` (
  `Code_Ue` varchar(255) NOT NULL,
  `Libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `programme`
--

INSERT INTO `programme` (`Code_Ue`, `Libelle`) VALUES
('53251', 'Physique 1	'),
('53252', 'Informatique 1	'),
('53258', 'Informatique 2	'),
('573506310', 'Automatique 1'),
('573506420', 'Internet	'),
('573506510', 'Traitement et analyse d\'image'),
('573506520', 'FSPEC-TIC -5'),
('9999874780', 'Unité Optionnelle');

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

CREATE TABLE `semestre` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `id_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `semestre`
--

INSERT INTO `semestre` (`id`, `nom`, `id_niveau`) VALUES
(1, 'Semestre 1', 0),
(2, 'Semestre 2', 0);

-- --------------------------------------------------------

--
-- Structure de la table `type_exam`
--

CREATE TABLE `type_exam` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_exam`
--

INSERT INTO `type_exam` (`id`, `nom`) VALUES
(1, 'DS'),
(2, 'EXAMEN'),
(5, 'ORALE'),
(4, 'TEST'),
(3, 'TP');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `branche`
--
ALTER TABLE `branche`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `enseignant_branche`
--
ALTER TABLE `enseignant_branche`
  ADD PRIMARY KEY (`enseignant_id`,`branche_id`),
  ADD KEY `branche_id` (`branche_id`);

--
-- Index pour la table `enseignant_departement`
--
ALTER TABLE `enseignant_departement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departement_id` (`departement_id`);

--
-- Index pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  ADD PRIMARY KEY (`enseignant_id`,`matiere_id`),
  ADD KEY `matiere_id` (`matiere_id`),
  ADD KEY `fk_n_matiere` (`nom_matiere`);

--
-- Index pour la table `enseignant_niveau`
--
ALTER TABLE `enseignant_niveau`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enseignant_id` (`enseignant_id`),
  ADD KEY `niveau_id` (`niveau_id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_niveau_id` (`id_niveau`),
  ADD KEY `fk_nom_groupe` (`groupe_nom`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_niv_groupe` (`id_niveau`),
  ADD KEY `nom` (`nom`) USING BTREE;

--
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`code_EE`),
  ADD KEY `fk_prog` (`Code_Ue`),
  ADD KEY `fk_niveau` (`id_niveau`),
  ADD KEY `fk_semestre` (`id_semestre`),
  ADD KEY `libelle` (`libelle`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD KEY `fk_etud` (`etudiant_id`),
  ADD KEY `fk_mat` (`matiere`);

--
-- Index pour la table `programme`
--
ALTER TABLE `programme`
  ADD PRIMARY KEY (`Code_Ue`);

--
-- Index pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_niv` (`id_niveau`);

--
-- Index pour la table `type_exam`
--
ALTER TABLE `type_exam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `branche`
--
ALTER TABLE `branche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22259;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseignant_branche`
--
ALTER TABLE `enseignant_branche`
  ADD CONSTRAINT `enseignant_branche_ibfk_2` FOREIGN KEY (`branche_id`) REFERENCES `branche` (`id`);

--
-- Contraintes pour la table `enseignant_departement`
--
ALTER TABLE `enseignant_departement`
  ADD CONSTRAINT `enseignant_departement_ibfk_2` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`id`);

--
-- Contraintes pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  ADD CONSTRAINT `enseignant_matiere_ibfk_2` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`code_EE`),
  ADD CONSTRAINT `fk_n_matiere` FOREIGN KEY (`nom_matiere`) REFERENCES `matiere` (`libelle`);

--
-- Contraintes pour la table `enseignant_niveau`
--
ALTER TABLE `enseignant_niveau`
  ADD CONSTRAINT `enseignant_niveau_ibfk_2` FOREIGN KEY (`niveau_id`) REFERENCES `niveau` (`id`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_niveau_id` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id`),
  ADD CONSTRAINT `fk_nom_groupe` FOREIGN KEY (`groupe_nom`) REFERENCES `groupe` (`nom`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `fk_niv_groupe` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `fk_niveau` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id`),
  ADD CONSTRAINT `fk_prog` FOREIGN KEY (`Code_Ue`) REFERENCES `programme` (`Code_Ue`),
  ADD CONSTRAINT `fk_semestre` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `fk_etud` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `fk_mat` FOREIGN KEY (`matiere`) REFERENCES `matiere` (`code_EE`);

--
-- Contraintes pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `fk_niv` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
