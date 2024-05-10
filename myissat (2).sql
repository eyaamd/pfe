-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 10 mai 2024 à 20:32
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
(444, 'wael kfoury', 'waelkfoury@gmail.com', 'wael', 'Homme', 'Professeur', 'Big Data'),
(6666, 'Tamer Hosny', 'tamerhosny@gmail.com', 'tamer', 'Homme', 'Assistant', 'Web'),
(7777, 'mohamed hamaki', 'hamaki@gmail.com', 'hamaki', 'Homme', 'PTC', 'TCP/ IP et applicatifs');

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
(22255, 130, 'Moussa', 'groupe 1', 1, 0x89504e470d0a1a0a0000000d49484452000000870000008701030000000629d84900000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b000001ad494441544889ddd531aeab301005d0412edce10d58f236dc794b6403c46c00b6e48e6d586203d0b940ccbf2679d1fb9527ed43114a4e11f0dc199be8af5e867961b77b3725c59c85d2939a353d52364945124bd8a664c943b6a57c2151e7276f3b7d2733a4d821a82f84f08597ff57d114d467f6dbebf3a958532a26dbb1dafdaf385a628a5bd6f359dcacf9d25928dd8a7b3685baf45ea9440c3bac740e6a0f885e2abd3f0d6f17c4e335482a1ad9b918108aed5f751688611ad096582cba254985f01318d451eca3c88506b25d81b8f80a4320bd767b389f2bba855f4f970882c0e0f4880f2522a998e4a63b8b831d17b1ac34066481c2beb390487f67876646fafc9ea6b6744c63dd46ce416fd32a150aee58e9c9ea0af691c4a2f3e8313b6ed7f837928a77519f08023bc9f1d32d4de9ea3da3cd9684fa48a5eeab858fface9f696a0b853c6210ee2c7eead3165338fa7b5435bf772481d410c95d9a27ce9823a1e09da3aeb3b3fbcf0cb6a59e1764078dcecc7d100bce8b155960a57cd11782ad7bd4b64b5bf4241714670f2a86f3f3f4b6e0bc5891053dead64a42b9cf0bb419aa8a23230be56f5eff001f48206b5f8376690000000049454e44ae426082, 'moussa@gmail.com', 'Homme'),
(22256, 32, 'eya', 'groupe 1', 1, 0x89504e470d0a1a0a0000000d49484452000000870000008701030000000629d84900000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b000001af494441544889ddd5318eeb201006e0b128e8e002485c838e2bc51788f1059c2bd1f91a485cc0ee28acccfeec4bf66dc7a4ddc8529caf8861fe614cf4573f96f9c1fe086a6d8ab908c590da34dd42dd4825124bac6b7653764b568ff681245deed1affc996c10f2297e22841bde424de1ff2e8682fae0e7bfeba76243e9981d69a2f82b8e91d8e61ffb75efcbe6a72e4221ed6c2e265e37f267938ae57a04de6259f6ca592cd9cd7b7d46386e482886786dbed71351beea3c96a95d06f16975b23ab3542ca38d694689d06c4d2a26b8a9394282fa958544509fa4af3b1513d4e35db1a14c8de6562c23447590546c6f4b1c559ab1d326958ec8a27f5fe667d92331daa7e037ac59c38b50ecee6ec1f7cdeabab25470e2ce9e853f779ab3542cf73850d2143052482884fb88d071765efd2c9129f7f816c6c5e72e159beb417c44872cde67672c8860610c554c12ec572af81f9c9d2d200b7e4d24817ca37f6a467ca8955030eb924683618cd477878fa5bf2f9085ae1826268a05c7932fbbe3d1fca40f2485820989563181e482b37368c6d4babf9f3e16bc2f7a166aeb3d4042e9efdc86aa5e4b662c43287ff3f305b31e180a490aa09f0000000049454e44ae426082, 'amdounieya@gmail.com', 'Femme'),
(22257, 111, 'zahra', 'groupe 1', 1, 0x89504e470d0a1a0a0000000d49484452000000870000008701030000000629d84900000006504c5445ffffff00000055c2d37e000000097048597300000ec400000ec401952b0e1b000001b0494441544889dd9531ae842010868758d0c90548b8061d575a2fb0ea05f44a745c63122ea01d85d979bfee6edeeb76b67d84423e230e333fff10fdd7e144160a4bece6524558497aea162b5ba25bec26529354d75c67f1b758d7f60d69dca7b0d9ee2b32e3c1d2df7d3e13c2e764c4d39f537c24677e627dcedf8c7d22e7487e946e4aefa582b82c533c10f0836878eeac207df22687bdd429d2d048495ceba4d18daa143f663529bea7ba223f0987d5123ad515f6ccf7c8ee991f05e9cfc963f67de4e1fabb86900d4b928d909fb0363d6153bc136f04fad4129721ad63c89d946e49ac24a630c5208d8772c6af2458ce572d1ed69ba62546c8b4ba58bc7ad542435c0e0f0bb530c4b959561222c8926fa9eec263212db16116d402f9096bd6923efa413c543db43a253d095b3cfa446309db550b0d7119e5c3490fc8ec19b38610d585e84e757fdf1d15b108e0ba3bb16e9195c4159400a53f4c930769c915366309ff71a225f0bab99c776787b0af9835e4ea17fe9ee0fc8c0db5e4ec1707cc44b2bc7a938e4ce86809f6c57dfc82cce79581d7c94b2d1a82984fcf87271ca426c8cf0aaf6b486c580b2bc9ff1c3f4f7201f048f837d10000000049454e44ae426082, 'Zahraghaieb@gmail.com', 'Femme'),
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
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `role` enum('Admin','Enseignant','','') NOT NULL,
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`mot_de_passe`, `role`, `id`, `email`) VALUES
('moussa', 'Enseignant', 1234, 'moussa@gmail.com'),
('admin', 'Admin', 321, 'admin@gmail.com');

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

-- --------------------------------------------------------

--
-- Structure de la table `utlisateur`
--

CREATE TABLE `utlisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `sexe` enum('Homme','Femme','','') NOT NULL,
  `grade` enum('Professeur','Maître de Conférence','Maître Assistant','Assistant','PTC','Autre') NOT NULL,
  `role` enum('Enseignant','Admin','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utlisateur`
--

INSERT INTO `utlisateur` (`id`, `nom`, `email`, `mot_de_passe`, `sexe`, `grade`, `role`) VALUES
(321, 'admin', 'admin@gmail.com', 'admin', 'Homme', '', 'Admin'),
(1234, 'Moussa', 'moussa@gmail.com', 'moussa', 'Homme', 'Maître Assistant', 'Enseignant');

--
-- Index pour les tables déchargées
--

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
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_matiere` (`matiere`);

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
  ADD KEY `fk_identif` (`id`),
  ADD KEY `fk_email` (`email`);

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
-- Index pour la table `utlisateur`
--
ALTER TABLE `utlisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

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
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `fk_matiere` FOREIGN KEY (`matiere`) REFERENCES `enseignant_matiere` (`nom_matiere`);

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
  ADD CONSTRAINT `fk_enseignant` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignant` (`id`),
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
-- Contraintes pour la table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_email` FOREIGN KEY (`email`) REFERENCES `utlisateur` (`email`),
  ADD CONSTRAINT `fk_identif` FOREIGN KEY (`id`) REFERENCES `utlisateur` (`id`);

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
