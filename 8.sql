-- #############################################################################
-- #                                                                           #
-- #                            8. Requêtes SQL                                #
-- #                                                                           #
-- #############################################################################


-- a) Quels sont les noms et prénoms de tous les conducteurs ?
SELECT c_nom, c_prenom
FROM conducteur ;

-- b) Quels sont les noms et prénoms du conducteur numéro 456 ?
SELECT c_nom, c_prenom
FROM conducteur
NATURAL JOIN liaison
WHERE t_num=456 ;

-- c) Quels sont les numéros et localités d’origine des trains TGV ou TER ?
SELECT t_num, t_localite
FROM train
WHERE t_type=TER OR t_type=TGV ;

-- d) Quel est l’ensemble des villes de départ ?
SELECT t_localite
FROM train ;

-- e) Quels sont les numéros des trains qui possèdent un wagon-lit ?
SELECT t_num
FROM train
WHERE wagon_l="oui" ;

-- f) Quel est le numéro de train assurant la liaison numéro 626 ?
SELECT t_num
FROM liaison
WHERE l_num=626 ;

-- g) Quels sont les numéros des conducteurs qui partent de Bordeaux entre 14h et 15h ?
SELECT c_num
FROM liaison
WHERE ville_d="Bordeaux"
AND heure_d BETWEEN 14 AND 15 ;

-- h) Quels sont les numéros des trains à destination de Loudun ?
SELECT t_num
FROM liaison
WHERE ville_a="Loudun" ;

-- i) D’où part le train qui assure la liaison numéro 323 ?
SELECT ville_d
FROM liaison
WHERE l_num=323 ;

-- j) De quelle ville est originaire le conducteur 46545 ?
SELECT c_ville
FROM conducteur
WHERE c_num=46545 ;

-- k) Quels sont les trains qui sont soit TGV soit Corail ?
SELECT t_num
FROM train
WHERE t_type="TGV" OR t_type="Corail" ;

-- l) Quels sont les trains qui sont soit TGV avec wagon-restaurant sans wagon lit, soit Corail avec wagon-lit mais sans wagon restaurant
SELECT t_num
FROM train
WHERE (
  t_type="TGV"
  AND wagon_r="oui"
  AND wagon_l="non" ) OR (
  t_type="Corail"
  AND wagon_r="non"
  AND wagon_l="oui" )
