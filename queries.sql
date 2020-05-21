-- Groupement --------------------------

-- 1/ Récupérer les dresseurs ayant au moins 3 pokemons
SELECT d.id_dresseur, d.nom_dresseur
FROM Dresseur d, Pokemon p,
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
    AND el.nom_element = "air"
)
ORDER BY nom_pokemon;

-- Divisions --------------------------


-- 3/ Dresseurs ayant participer à toutes les compétitions de l'arène AZURIA
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


-- 4/ Regions possédant des arènes n'ayant jamais eu de compétition
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

-- 5/ Nombre de combats dans l'arène ARGENTA
SELECT COUNT(id_combat)
FROM Combat
WHERE id_competition IN (
	Select c.id_competition
	FROM Competiton c, Arene a
	WHERE c.id_arene = a.id_arene
)
GROUP BY id_combat;

-- 6/ Nombre de dresseurs ayant uniquement des pokemons sans evolution 

-- 7/ Espèces de pokemons présentes dans les compétitions 

-- 8/ Dresseurs ayant le plus de pokemons

-- 9/ Pokemons ayant le même element

-- 10/ Pokemons ayant la même espece


-- Auto-jointures --------------------------

-- 11/ Compétitions se déroulant dans la même région


