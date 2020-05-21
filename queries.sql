-- Groupement --------------------------

-- 1/ Récupérer les dresseurs ayant au moins 3 pokemons
SELECT d.id_dresseur, d.nom_dresseur
FROM Dresseur d, Pokemon p,
WHERE d.id_dresseur = p.id_dresseur
GROUP BY d.id_dresseur
HAVING COUNT(p.id_pokemon) > 2;


-- Differences --------------------------

-- 2/ Pokemons ayant une espèce de type feu
SELECT *
FROM Pokemon
WHERE id_espece IN (
	SELECT e.id_espece
	FROM espece e, element el
	WHERE e.id_element = el.id_element
	AND el.nom_element = "feu"
);

-- 3/ Pokemons ayant une espèce de type eau n'ayant pas d'attaque de type air
SELECT *
FROM Pokemon
WHERE id_espece IN (
    SELECT e.id_espece
    FROM Espece e, Element el
    WHERE e.id_element = el.id_element
    AND el.nom_element = 'eau'
)
AND id_pokemon NOT IN (
    SELECT id_pokemon 
    FROM Possede p, Attaque a, Element el
    WHERE a.id_element = el.id_element
    AND p.id_attaque = a.id_attaque
    AND el.nom_element = "air"
);

-- Divisions --------------------------


-- 4/ Dresseurs ayant participer à toutes les compétitions de l'arène AZURIA
SELECT id_dresseur, nom_dresseur
FROM Dresseur d
WHERE NOT EXISTS (
	SELECT *
	FROM Competiton c, Arene a 
	WHERE c.id_arene = a.id_arene
	AND a.nom_arene = "AZURIA"
	AND NOT EXISTS (
		Select * 
		FROM Participe p, Combat cb
		WHERE p.id_combat = cb.id_combat
		AND (p.id_dresseur1 = d.id_dresseur
		OR p.id_dresseur2 = d.id_dresseur)
		AND cb.id_competition = c.id_competition
	)
);


-- 5/ Regions possédant des arènes n'ayant jamais eu de compétition
SELECT *
FROM Region r
WHERE NOT EXISTS ( 
	Select id_region
	FROM Arene
	WHERE NOT EXISTS (
		Select *
		FROM Arene a, Competiton c
		WHERE c.id_arene = a.id_arene
	)
);


-- Aggregation --------------------------

-- 6/ Nombre de combats dans l'arène ARGENTA


-- Imbrications --------------------------


-- Jointures --------------------------



