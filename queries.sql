-- Groupement --------------------------

-- 1/ Récupérer les dresseurs ayant au moins 3 pokemons
SELECT d.id_dresseur, d.nom_dresseur
FROM Dresseur d, Pokemon p
WHERE d.id_dresseur = p.id_dresseur
GROUP BY d.id_dresseur
HAVING COUNT(p.id_pokemon) > 2;


-- Differences --------------------------

-- 2/ Pokemons ayant une espèce de type eau n'ayant pas d'attaque de type air
SELECT *
FROM Pokemon
WHERE id_espece IN (
    SELECT e.id_espece
    FROM Espece e, Element el
    WHERE e.id_element = el.id_element
    AND el.nom_element = 'eau'
)
AND id_pokemon NOT IN (
    SELECT p.id_pokemon 
    FROM Possede p, Attaque a, Element el
    WHERE a.id_element = el.id_element
    AND p.id_attaque = a.id_attaque
    AND el.nom_element = 'vol'
)
ORDER BY nom_pokemon;

-- Divisions --------------------------


-- 3/ Dresseurs ayant participer à toutes les compétitions de l'arène AZURIA
SELECT id_dresseur, nom_dresseur
FROM Dresseur d
WHERE NOT EXISTS (
	SELECT *
	FROM Competition c, Arene a 
	WHERE c.id_arene = a.id_arene
	AND a.nom_arene = 'AZURIA'
	AND NOT EXISTS (
		Select * 
		FROM Participe p, Combat cb
		WHERE p.id_combat = cb.id_combat
		AND (p.id_dresseur1 = d.id_dresseur
		OR p.id_dresseur2 = d.id_dresseur)
		AND cb.id_competition = c.id_competition
	)
);


-- 4/ Regions possédant des arènes n'ayant jamais eu de compétition
SELECT *
FROM Region r
WHERE r.id_region IN ( 
  Select id_region
	FROM Arene
	WHERE id_arene NOT IN (
		Select a.id_arene
		FROM Arene a, Competition c
		WHERE c.id_arene = a.id_arene
	)
);



-- Aggregation --------------------------

-- 5/ Nombre de combats dans l'arène Azuria
SELECT Count(id_combat)
FROM Combat
WHERE id_competition IN (
	Select c.id_competition
	FROM Competition c, Arene a
	WHERE c.id_arene = a.id_arene
	AND a.nom_arene = 'Azuria'
);

-- TODO ayant uniquement des pokemons sans evolution
-- 6/ Nombre de dresseurs, dont le nom commence par "M", ayant au moins un pokemon sans evolution
SELECT DISTINCT d.*
FROM Dresseur d
	INNER JOIN Pokemon p 
	ON d.id_dresseur = p.id_dresseur
	INNER JOIN Espece e
	ON e.id_espece = p.id_espece
WHERE d.nom_dresseur LIKE 'M%'
AND e.id_evolution IS NULL;

-- 7/ Moyenne d'âge des dresseurs ayant participer à au moins une compétition ces 90 derniers jours
SELECT AVG(DISTINCT d.age)
FROM Dresseur d, Participe p, Combat c, Competition cp
WHERE d.id_dresseur = p.id_dresseur1
OR d.id_dresseur = p.id_dresseur2
AND c.id_competition = cp.id_competition
AND c.id_combat = p.id_combat
AND c.date < DATE_SUB(NOW(), INTERVAL 90 DAY);


-- 8/ Dresseurs ayant le plus de pokemons
SELECT d.nom_dresseur, COUNT(*) AS nbPokemons
FROM Dresseur d inner join Pokemon p
    ON d.id_dresseur = p.id_dresseur
GROUP BY d.id_dresseur
ORDER BY nbPokemons DESC LIMIT 1;

-- 9/ Dresseur ayant participé aux combats qui se sont déroulés entre le 1 mars et le 1 juillet
SELECT d.*
FROM Dresseur d, (SELECT id_dresseur1
     FROM Participe
     WHERE id_combat IN (
         SELECT id_combat
         FROM Combat
         WHERE date BETWEEN '2020-03-01' AND '2020-07-01'
     )
    UNION
    (SELECT id_dresseur2
     FROM Participe
     WHERE id_combat IN (
         SELECT id_combat
         FROM Combat
         WHERE date BETWEEN '2020-03-01' AND '2020-07-01'
     ))) AS U
WHERE U.id_dresseur1 = d.id_dresseur;

-- Auto-jointures --------------------------

-- 10/ Compétitions se déroulant dans la même région (Affichage par région)
SELECT DISTINCT c1.nom_competition, r.nom_region
FROM Competition c1, Competition c2, Arene a, Region r
WHERE c1.id_arene = a.id_arene
AND c2.id_arene = a.id_arene
AND a.id_region = r.id_region
AND c1.id_arene = c2.id_arene
ORDER BY r.nom_region;








