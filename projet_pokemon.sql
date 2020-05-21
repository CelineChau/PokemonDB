DROP DATABASE IF EXISTS pokemon_bdd;
CREATE DATABASE pokemon_bdd;
USE pokemon_bdd;

DROP TABLE IF EXISTS `Region`;
CREATE TABLE `Region`
(
    `id_region`   INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nom_region`  VARCHAR(20) NOT NULL,
    `demographie` INT         NULL,
    `maire`       VARCHAR(20) NULL
);

DROP TABLE IF EXISTS `Dresseur`;
CREATE TABLE `Dresseur`
(
    `id_dresseur`  INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nom_dresseur` VARCHAR(20) NOT NULL,
    `age_dresseur` INT NOT NULL,
    `specialite`   VARCHAR(20) NULL,
    `id_equipe`    INT         NOT NULL
);

DROP TABLE IF EXISTS `Equipe`;
CREATE TABLE `Equipe`
(
    `id_equipe`  INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nom_equipe` VARCHAR(20) NOT NULL,
    `id_arene`   INT         NULL
);

DROP TABLE IF EXISTS `Possede`;
CREATE TABLE `Possede`
(
    `id_pokemon` INT NOT NULL,
    `id_attaque` INT NOT NULL,
    CONSTRAINT pk_Possede PRIMARY KEY (`id_pokemon`, `id_attaque`)
);

DROP TABLE IF EXISTS `Participe`;
CREATE TABLE `Participe`
(
    `id_combat`    INT NOT NULL,
    `id_dresseur1` INT NOT NULL,
    `id_dresseur2` INT NOT NULL,
    CONSTRAINT pk_Participe PRIMARY KEY (`id_combat`, `id_dresseur1`, `id_dresseur2`)
);

DROP TABLE IF EXISTS `Element`;
CREATE TABLE `Element`
(
    `id_element`     INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nom_element`    VARCHAR(20) NOT NULL,
    `id_elem_faible`    INT      NULL,
    `id_elem_resistant` INT      NULL
);

DROP TABLE IF EXISTS `Attaque`;
CREATE TABLE `Attaque`
(
    `id_attaque`  INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nom_attaque` VARCHAR(20) NOT NULL,
    `type`        INT         NULL,
    `id_element`  INT         NOT NULL
);

DROP TABLE IF EXISTS `Combat`;
CREATE TABLE `Combat`
(
    `id_combat`      INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `id_competition` INT NOT NULL,
    `date_combat` 	INT NULL
);

DROP TABLE IF EXISTS `Pokemon`;
CREATE TABLE `Pokemon`
(
    `id_pokemon`  INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nom_pokemon` VARCHAR(20) NOT NULL,
    `pv`          INT         NOT NULL,
    `id_espece`   INT         NOT NULL,
    `id_dresseur` INT         NULL
);

DROP TABLE IF EXISTS `Competition`;
CREATE TABLE `Competition`
(
    `id_competition` INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `id_arene`       INT          NOT NULL,
    `id_gagnant`     INT          NULL,
    `recompense`     VARCHAR(255) NOT NULL,
    `debut_competition`     INT NOT NULL,
    `fin_competition`     INT NOT NULL
);

DROP TABLE IF EXISTS `Arene`;
CREATE TABLE `Arene`
(
    `id_arene`  INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nom_arene` VARCHAR(255) NOT NULL,
    `id_chef`   INT          NULL,
    `id_region` INT          NOT NULL
);

DROP TABLE IF EXISTS `Espece`;
CREATE TABLE `Espece`
(
    `id_espece`    INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nom_espece`   VARCHAR(20) NOT NULL,
    `taille`       INT         NULL,
    `poids`        INT         NULL,
    `id_element`   INT         NOT NULL,
    `id_evolution` INT         NULL,
    `id_ancetre`   INT         NULL
);

ALTER TABLE `Dresseur`
    ADD CONSTRAINT `id_equipe_Dresseur`
        FOREIGN KEY (`id_equipe`) REFERENCES `Equipe` (`id_equipe`)
        ON DELETE CASCADE;

ALTER TABLE `Possede`
    ADD CONSTRAINT `id_pokemon_Possede`
        FOREIGN KEY (`id_pokemon`) REFERENCES `Pokemon` (`id_pokemon`),
    ADD CONSTRAINT `id_attaque_Possede`
        FOREIGN KEY (`id_attaque`) REFERENCES `Attaque` (`id_attaque`);

ALTER TABLE `Participe`
    ADD CONSTRAINT `id_combat_Participe`
        FOREIGN KEY (`id_combat`) REFERENCES `Combat` (`id_combat`),
    ADD CONSTRAINT `id_dresseur1_Participe`
        FOREIGN KEY (`id_dresseur1`) REFERENCES `Dresseur` (`id_dresseur`),
    ADD CONSTRAINT `id_dresseur2_Participe`
        FOREIGN KEY (`id_dresseur2`) REFERENCES `Dresseur` (`id_dresseur`);

ALTER TABLE `Element`
ADD CONSTRAINT `id_elem_faible_element` FOREIGN KEY (`id_elem_faible`)
        REFERENCES `Element` (`id_element`),
ADD CONSTRAINT `id_elem_fort_element` FOREIGN KEY (`id_elem_resistant`)
        REFERENCES `Element` (`id_element`);

ALTER TABLE `Attaque`
    ADD CONSTRAINT `id_element_Attaque`
        FOREIGN KEY (`id_element`) REFERENCES `Element` (`id_element`);

ALTER TABLE `Equipe`
    ADD CONSTRAINT `id_arene_Equipe`
        FOREIGN KEY (`id_arene`) REFERENCES `Arene` (`id_arene`);

ALTER TABLE `Combat`
    ADD CONSTRAINT `id_competition_Combat`
        FOREIGN KEY (`id_competition`) REFERENCES `Competition` (`id_competition`);

ALTER TABLE `Pokemon`
    ADD CONSTRAINT `id_espece_pokemon`
        FOREIGN KEY (`id_espece`) REFERENCES `Espece` (`id_espece`),
    ADD CONSTRAINT `id_dresseur_pokemon`
        FOREIGN KEY (`id_dresseur`) REFERENCES `Dresseur` (`id_dresseur`);

ALTER TABLE `Competition`
    ADD CONSTRAINT `id_gagnant_Competition`
        FOREIGN KEY (`id_gagnant`) REFERENCES `Dresseur` (`id_dresseur`),
    ADD CONSTRAINT `id_arene_Competition`
        FOREIGN KEY (`id_arene`) REFERENCES `Arene` (`id_arene`);

ALTER TABLE `Arene`
    ADD CONSTRAINT `id_chef_Arene`
        FOREIGN KEY (`id_chef`) REFERENCES `Dresseur` (`id_dresseur`),
    ADD CONSTRAINT `id_region_Arene`
        FOREIGN KEY (`id_region`) REFERENCES `Region` (`id_region`);

ALTER TABLE `Espece`
    ADD CONSTRAINT `id_element_Espece`
        FOREIGN KEY (`id_element`) REFERENCES `Element` (`id_element`),
    ADD CONSTRAINT `id_ancetre_Espece`
        FOREIGN KEY (`id_ancetre`) REFERENCES `Espece` (`id_espece`),
    ADD CONSTRAINT `id_evolution_Espece`
        FOREIGN KEY (`id_evolution`) REFERENCES `Espece` (`id_espece`);