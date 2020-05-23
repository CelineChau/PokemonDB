CREATE DATABASE IF NOT EXISTS `pokemon_bdd`;
USE `pokemon_bdd`;

DROP TABLE IF EXISTS `Arene`;
CREATE TABLE `Arene` (
  `id_arene` int(11) NOT NULL,
  `nom_arene` varchar(255) NOT NULL,
  `id_chef` int(11) DEFAULT NULL,
  `id_region` int(11) NOT NULL
);

INSERT INTO `Arene` (`id_arene`, `nom_arene`, `id_chef`, `id_region`) VALUES
(1, 'Argenta', 1, 1),
(2, 'Azuria', 2, 1),
(3, 'Celadopole', 3, 1),
(4, 'Safrania', 4, 1),
(5, 'Doublonville', 5, 2),
(6, 'Rosalia', 6, 2),
(7, 'Oliville', 7, 2),
(8, 'Ebenelle', 8, 2),
(9, 'Vermilava', 9, 3),
(10, 'Lavandia', 10, 3),
(11, 'Algatia', 11, 3),
(12, 'Atalanopolis', 12, 3);

DROP TABLE IF EXISTS `Attaque`;
CREATE TABLE `Attaque` (
  `id_attaque` int(11) NOT NULL,
  `nom_attaque` varchar(20) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `id_element` int(11) NOT NULL
);

INSERT INTO `Attaque` (`id_attaque`, `nom_attaque`, `type`, `id_element`) VALUES
(1, 'Tomberoche', 'offensive', 1),
(2, 'Pistolet à O', 'offensive', 2),
(3, 'Vol-vie', 'offensive', 3),
(4, 'Choc mental', 'offensive', 4),
(5, 'Ecrasement', 'offensive', 5),
(6, 'Ball Ombre', 'offensive', 6),
(7, 'Queue de Fer', 'offensive', 7),
(8, 'Dracochoc', 'offensive', 8),
(9, 'Canicule', 'offensive', 9),
(10, 'Tonnerre', 'offensive', 10),
(11, 'Lame d\'Air', 'offensive', 12),
(12, 'Hydrocanon', 'offensive', 2),
(13, 'Armure', 'defensive', 5),
(14, 'Malédiction', 'defensive', 6),
(15, 'Tempete de Sable', 'defensive', 1),
(16, 'Seduction', 'defensive', 5),
(17, 'Para-Spore', 'defensive', 3),
(18, 'Danse Pluie', 'defensive', 2);

DROP TABLE IF EXISTS `Combat`;
CREATE TABLE `Combat` (
  `id_combat` int(11) NOT NULL,
  `id_competition` int(11) DEFAULT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
);

INSERT INTO `Combat` (`id_combat`, `id_competition`, `date`) VALUES
(1, 1, '2020-05-05'),
(2, 1, '2020-05-09'),
(3, 2, '2020-05-04'),
(4, 2, '2020-05-04'),
(5, 3, '2020-03-11'),
(6, 3, '2020-03-12'),
(7, 4, '2019-12-11'),
(8, 4, '2019-12-18'),
(9, 5, '2020-08-12'),
(10, 5, '2020-08-19'),
(11, 6, '2020-06-17'),
(12, 6, '2020-06-22'),
(13, 7, '2020-11-19'),
(14, 7, '2020-11-25');

DROP TABLE IF EXISTS `Competition`;
CREATE TABLE `Competition` (
  `id_competition` int(11) NOT NULL,
  `id_arene` int(11) NOT NULL,
  `id_gagnant` int(11) DEFAULT NULL,
  `recompense` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `nom_competition` varchar(255) NOT NULL
);

INSERT INTO `Competition` (`id_competition`, `id_arene`, `id_gagnant`, `recompense`, `date_debut`, `date_fin`, `nom_competition`) VALUES
(1, 2, 13, '100', '2020-05-04', '2020-05-09', 'Free 2020'),
(2, 3, 3, '75', '2020-05-03', '2020-05-05', 'Challenge 2020'),
(3, 4, 14, '150', '2020-03-10', '2020-03-14', 'Friendly 2020'),
(4, 1, 8, '2000', '2019-12-09', '2019-12-19', 'Extreme 2019'),
(5, 11, 15, '500', '2020-08-10', '2020-08-26', 'Brutal 2020'),
(6, 12, 12, '1250', '2020-06-08', '2020-06-23', 'Hard 2020'),
(7, 2, 2, '550', '2020-11-16', '2020-11-26', 'EXS 2020\n');

DROP TABLE IF EXISTS `Dresseur`;
CREATE TABLE `Dresseur` (
  `id_dresseur` int(11) NOT NULL,
  `nom_dresseur` varchar(20) NOT NULL,
  `specialite` varchar(20) DEFAULT NULL,
  `sexe` varchar(20) NOT NULL,
  `age` int(11) NOT NULL
);

INSERT INTO `Dresseur` (`id_dresseur`, `nom_dresseur`, `specialite`, `sexe`, `age`) VALUES
(1, 'Pierre', NULL, 'M', 42),
(2, 'Ondine', NULL, 'F', 11),
(3, 'Erika', NULL, 'F', 16),
(4, 'Morgane', NULL, 'M', 19),
(5, 'Blanche', NULL, 'F', 17),
(6, 'Mortimer', NULL, 'M', 23),
(7, 'Jasmine', NULL, 'F', 22),
(8, 'Sandra', NULL, 'M', 31),
(9, 'Adriane', NULL, 'M', 35),
(10, 'Voltere', NULL, 'M', 43),
(11, 'Levy Tatia', NULL, 'F', 7),
(12, 'Juan', NULL, 'M', 22),
(13, 'MKD', NULL, 'M', 21),
(14, 'Soreiyu', NULL, 'F', 21),
(15, 'Ariana', NULL, '?', 25);

DROP TABLE IF EXISTS `Element`;
CREATE TABLE `Element` (
  `id_element` int(11) NOT NULL,
  `nom_element` varchar(20) NOT NULL,
  `id_elem_faible` int(11) DEFAULT NULL,
  `id_elem_resistant` int(11) DEFAULT NULL
);

INSERT INTO `Element` (`id_element`, `nom_element`, `id_elem_faible`, `id_elem_resistant`) VALUES
(1, 'Roche', 2, 9),
(2, 'Eau', 3, 9),
(3, 'Plante', 9, 2),
(4, 'Psy', 6, 11),
(5, 'Normal', 11, NULL),
(6, 'Spectre', 6, 5),
(7, 'Acier', 9, 3),
(8, 'Dragon', 8, 9),
(9, 'Feu', 2, 3),
(10, 'Electrik', 1, 10),
(11, 'Combat', 4, 1),
(12, 'Vol', 10, 3);

DROP TABLE IF EXISTS `Espece`;
CREATE TABLE `Espece` (
  `id_espece` int(11) NOT NULL,
  `nom_espece` varchar(20) NOT NULL,
  `taille` int(11) DEFAULT NULL,
  `poids` int(11) DEFAULT NULL,
  `id_element` int(11) NOT NULL,
  `id_evolution` int(11) DEFAULT NULL,
  `id_ancetre` int(11) DEFAULT NULL
);

INSERT INTO `Espece` (`id_espece`, `nom_espece`, `taille`, `poids`, `id_element`, `id_evolution`, `id_ancetre`) VALUES
(1, 'Onix', 880, 210, 1, 7, NULL),
(2, 'Staross', NULL, NULL, 2, NULL, 16),
(3, 'Saquedeneu', NULL, NULL, 3, NULL, NULL),
(4, 'M.Mime', NULL, NULL, 4, NULL, NULL),
(5, 'Ecremeuh', NULL, NULL, 5, NULL, NULL),
(6, 'Ténéfix', NULL, NULL, 6, NULL, NULL),
(7, 'Steelix', NULL, NULL, 7, NULL, 1),
(8, 'Altaria', NULL, NULL, 8, NULL, 17),
(9, 'Chartor', NULL, NULL, 9, NULL, NULL),
(10, 'Raichu', NULL, NULL, 10, NULL, 18),
(11, 'Xatu', NULL, NULL, 4, NULL, 19),
(12, 'Relicanth', NULL, NULL, 2, NULL, NULL),
(13, 'Lucario', NULL, NULL, 11, NULL, NULL),
(14, 'Pichu', NULL, NULL, 10, 18, NULL),
(15, 'Dracaufeu', NULL, NULL, 9, NULL, 21),
(16, 'Stari', NULL, NULL, 2, 2, NULL),
(17, 'Tylton', NULL, NULL, 12, 8, NULL),
(18, 'Pikachu', NULL, NULL, 10, 10, 14),
(19, 'Natu', NULL, NULL, 4, 11, NULL),
(20, 'Salameche', NULL, NULL, 9, 21, NULL),
(21, 'Reptincel', NULL, NULL, 9, 15, 20);

DROP TABLE IF EXISTS `Participe`;
CREATE TABLE `Participe` (
  `id_combat` int(11) NOT NULL,
  `id_dresseur1` int(11) NOT NULL,
  `id_dresseur2` int(11) NOT NULL,
  `id_pokemon1` int(11) NOT NULL,
  `id_pokemon2` int(11) NOT NULL
);

INSERT INTO `Participe` (`id_combat`, `id_dresseur1`, `id_dresseur2`, `id_pokemon1`, `id_pokemon2`) VALUES
(1, 13, 14, 13, 14),
(2, 2, 13, 17, 13),
(3, 15, 3, 15, 3),
(4, 3, 14, 3, 14),
(5, 14, 15, 14, 15),
(6, 14, 6, 14, 6),
(7, 8, 13, 8, 13),
(8, 15, 8, 15, 8),
(9, 15, 13, 15, 13),
(10, 11, 15, 11, 15),
(11, 14, 12, 14, 12),
(12, 12, 15, 12, 15),
(13, 13, 2, 13, 17),
(14, 1, 2, 16, 17);

DROP TABLE IF EXISTS `Pokemon`;
CREATE TABLE `Pokemon` (
  `id_pokemon` int(11) NOT NULL,
  `nom_pokemon` varchar(20) NOT NULL,
  `pv` int(11) NOT NULL,
  `id_espece` int(11) NOT NULL,
  `id_dresseur` int(11) DEFAULT NULL
);

INSERT INTO `Pokemon` (`id_pokemon`, `nom_pokemon`, `pv`, `id_espece`, `id_dresseur`) VALUES
(1, 'Oneex', 50, 1, 13),
(2, 'Stareau', 78, 2, 13),
(3, 'Saquedenux', 34, 3, 3),
(4, 'Mimeee', 65, 4, 4),
(5, 'Ecremeuuuuh', 90, 5, 5),
(6, 'TénéfX', 63, 6, 6),
(7, 'SteelX', 99, 7, 7),
(8, 'Altair', 114, 8, 8),
(9, 'Chartorartora', 96, 9, 9),
(10, 'Raieeeechu', 87, 10, 10),
(11, 'XatuX', 91, 11, 11),
(12, 'Relicunt', 67, 12, 12),
(13, 'LeBG', 150, 13, 13),
(14, 'Kawaii', 33, 14, 14),
(15, 'Terpotri', 140, 15, 15),
(16, 'Xino', 55, 1, 1),
(17, 'Star', 67, 2, 2);

DROP TABLE IF EXISTS `Possede`;
CREATE TABLE `Possede` (
  `id_pokemon` int(11) NOT NULL,
  `id_attaque` int(11) NOT NULL
);

INSERT INTO `Possede` (`id_pokemon`, `id_attaque`) VALUES
(1, 1),
(1, 16),
(2, 2),
(2, 11),
(3, 3),
(3, 17),
(4, 4),
(5, 5),
(5, 16),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(12, 18),
(13, 13),
(14, 14),
(15, 15);

DROP TABLE IF EXISTS `Region`;
CREATE TABLE `Region` (
  `id_region` int(11) NOT NULL,
  `nom_region` varchar(20) NOT NULL,
  `population` int(11) DEFAULT NULL,
  `maire` varchar(20) DEFAULT NULL
);

INSERT INTO `Region` (`id_region`, `nom_region`, `population`, `maire`) VALUES
(1, 'Kanto', 1782, 'Samuel'),
(2, 'Johto', 4846, 'Orme'),
(3, 'Hoenn', 6644, 'Seko');

ALTER TABLE `Arene`
  ADD PRIMARY KEY (`id_arene`),
  ADD KEY `id_chef_Arene` (`id_chef`),
  ADD KEY `id_region_Arene` (`id_region`);

ALTER TABLE `Attaque`
  ADD PRIMARY KEY (`id_attaque`),
  ADD KEY `id_element_Attaque` (`id_element`);

ALTER TABLE `Combat`
  ADD PRIMARY KEY (`id_combat`),
  ADD KEY `id_competition_Combat` (`id_competition`);

ALTER TABLE `Competition`
  ADD PRIMARY KEY (`id_competition`),
  ADD KEY `id_gagnant_Competition` (`id_gagnant`),
  ADD KEY `id_arene_Competition` (`id_arene`);

ALTER TABLE `Dresseur`
  ADD PRIMARY KEY (`id_dresseur`);

ALTER TABLE `Element`
  ADD PRIMARY KEY (`id_element`),
  ADD KEY `id_elem_faible_element` (`id_elem_faible`),
  ADD KEY `id_elem_fort_element` (`id_elem_resistant`);

ALTER TABLE `Espece`
  ADD PRIMARY KEY (`id_espece`),
  ADD KEY `id_element_Espece` (`id_element`),
  ADD KEY `id_ancetre_Espece` (`id_ancetre`),
  ADD KEY `id_evolution_Espece` (`id_evolution`);

ALTER TABLE `Participe`
  ADD PRIMARY KEY (`id_combat`,`id_dresseur1`,`id_dresseur2`,`id_pokemon1`,`id_pokemon2`),
  ADD KEY `id_dresseur1_Participe` (`id_dresseur1`),
  ADD KEY `id_dresseur2_Participe` (`id_dresseur2`),
  ADD KEY `id_pokemon1` (`id_pokemon1`),
  ADD KEY `id_pokemon2` (`id_pokemon2`);

ALTER TABLE `Pokemon`
  ADD PRIMARY KEY (`id_pokemon`),
  ADD KEY `id_espece_pokemon` (`id_espece`),
  ADD KEY `id_dresseur_pokemon` (`id_dresseur`);

ALTER TABLE `Possede`
  ADD PRIMARY KEY (`id_pokemon`,`id_attaque`),
  ADD KEY `id_attaque_Possede` (`id_attaque`);

ALTER TABLE `Region`
  ADD PRIMARY KEY (`id_region`);

ALTER TABLE `Arene`
  MODIFY `id_arene` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `Attaque`
  MODIFY `id_attaque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

ALTER TABLE `Combat`
  MODIFY `id_combat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

ALTER TABLE `Competition`
  MODIFY `id_competition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `Dresseur`
  MODIFY `id_dresseur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `Element`
  MODIFY `id_element` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `Espece`
  MODIFY `id_espece` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `Pokemon`
  MODIFY `id_pokemon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `Region`
  MODIFY `id_region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `Arene`
  ADD CONSTRAINT `id_chef_Arene` FOREIGN KEY (`id_chef`) REFERENCES `Dresseur` (`id_dresseur`),
  ADD CONSTRAINT `id_region_Arene` FOREIGN KEY (`id_region`) REFERENCES `Region` (`id_region`);

ALTER TABLE `Attaque`
  ADD CONSTRAINT `id_element_Attaque` FOREIGN KEY (`id_element`) REFERENCES `Element` (`id_element`);

ALTER TABLE `Combat`
  ADD CONSTRAINT `id_competition_Combat` FOREIGN KEY (`id_competition`) REFERENCES `Competition` (`id_competition`);

ALTER TABLE `Competition`
  ADD CONSTRAINT `id_arene_Competition` FOREIGN KEY (`id_arene`) REFERENCES `Arene` (`id_arene`),
  ADD CONSTRAINT `id_gagnant_Competition` FOREIGN KEY (`id_gagnant`) REFERENCES `Dresseur` (`id_dresseur`);

ALTER TABLE `Element`
  ADD CONSTRAINT `id_elem_faible_element` FOREIGN KEY (`id_elem_faible`) REFERENCES `Element` (`id_element`),
  ADD CONSTRAINT `id_elem_fort_element` FOREIGN KEY (`id_elem_resistant`) REFERENCES `Element` (`id_element`);

ALTER TABLE `Espece`
  ADD CONSTRAINT `id_ancetre_Espece` FOREIGN KEY (`id_ancetre`) REFERENCES `Espece` (`id_espece`),
  ADD CONSTRAINT `id_element_Espece` FOREIGN KEY (`id_element`) REFERENCES `Element` (`id_element`),
  ADD CONSTRAINT `id_evolution_Espece` FOREIGN KEY (`id_evolution`) REFERENCES `Espece` (`id_espece`);

ALTER TABLE `Participe`
  ADD CONSTRAINT `id_combat_Participe` FOREIGN KEY (`id_combat`) REFERENCES `Combat` (`id_combat`),
  ADD CONSTRAINT `id_dresseur1_Participe` FOREIGN KEY (`id_dresseur1`) REFERENCES `Dresseur` (`id_dresseur`),
  ADD CONSTRAINT `id_dresseur2_Participe` FOREIGN KEY (`id_dresseur2`) REFERENCES `Dresseur` (`id_dresseur`),
  ADD CONSTRAINT `id_pokemon1_Partictipe` FOREIGN KEY (`id_pokemon1`) REFERENCES `Pokemon` (`id_pokemon`),
  ADD CONSTRAINT `id_pokemon2_Partictipe` FOREIGN KEY (`id_pokemon2`) REFERENCES `Pokemon` (`id_pokemon`);

ALTER TABLE `Pokemon`
  ADD CONSTRAINT `id_dresseur_pokemon` FOREIGN KEY (`id_dresseur`) REFERENCES `Dresseur` (`id_dresseur`),
  ADD CONSTRAINT `id_espece_pokemon` FOREIGN KEY (`id_espece`) REFERENCES `Espece` (`id_espece`);

ALTER TABLE `Possede`
  ADD CONSTRAINT `id_attaque_Possede` FOREIGN KEY (`id_attaque`) REFERENCES `Attaque` (`id_attaque`),
  ADD CONSTRAINT `id_pokemon_Possede` FOREIGN KEY (`id_pokemon`) REFERENCES `Pokemon` (`id_pokemon`);
  
ALTER TABLE `Dresseur` ADD UNIQUE(`nom_dresseur`);
ALTER TABLE `Attaque` ADD UNIQUE(`nom_attaque`);
ALTER TABLE `Pokemon` ADD UNIQUE(`nom_pokemon`);
ALTER TABLE `Element` ADD UNIQUE(`nom_element`);
COMMIT;
