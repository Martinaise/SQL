--  Requettes avec mysql et workbench avce une bdd donée par le formateur

--  taper cette commande  sur le terminbal pour que mon sql fonctionne sur mon mac
sudo find / -name "*sql*"\n

-- Exo 1 Nom et année de naissance des artistes nés avant 1950.  
SELECT nom, annéeNaiss
FROM artiste WHERE annéeNaiss< 1950;

-- Exo 2 Titre de tous les drames. 
SELECT titre FROM film WHERE genre = 'Drame';

-- Exo 3 Quels rôles a joué Bruce Willis. 
SELECT  nomRôle 
FROM role r,artiste a 
WHERE a.idArtiste = r.idActeur AND a.nom="Willis" AND a.prénom="Bruce";

-- Films artistes roles notes

-- Exo 4 Qui est le réalisateur de Memento. 


-- Exo 5 Quelles sont les notes obtenues par le film Fargo 

-- Exo 6 Qui a joué le rôle de Chewbacca?  

-- Exo 7 Dans quels films Bruce Willis a-t-il joué le rôle de John McClane? 

-- Exo 8 Nom des acteurs de 'Sueurs froides' 

-- Exo 9 Quelles sont les films notés par l'internaute Prénom 0 Nom0 

-- Exo 10 Films dont le réalisateur est Tim Burton, et l’un des acteurs
-- Johnny Depp. 

-- Exo 11 Titre des films dans lesquels a joué ́Woody Allen. Donner aussi
-- le rôle.
-- Exo 12 Quel metteur en scène a tourné dans ses propres films ? Donner
-- le nom, le rôle et le titre des films.
-- Exo 13 Titre des films de Quentin Tarantino dans lesquels il n’a pas
-- joué
-- Exo 14 Quel metteur en scène a tourné ́en tant qu’acteur ? Donner le
-- nom, le rôle et le titre des films dans lesquels cet artiste a joué.
-- Exo 15 Donnez les films de Hitchcock sans James Stewart
-- Exo 16 Dans quels films le réalisateur a-t-il le même prénom que l’un
-- des interprètes ? (titre, nom du réalisateur, nom de l’interprète). Le
-- réalisateur et l’interprète ne doivent pas être la même personne.
-- Exo 17 Les films sans rôle
-- Exo 18 Quelles sont les films non notés par l'internaute Prénom1 Nom1
-- Exo 19 Quels acteurs n’ont jamais réalisé de film ?
-- Exo 20 Quelle est la moyenne des notes de Memento
-- Exo 21 id, nom et prénom des réalisateurs, et nombre de films qu’ils
-- ont tournés.
-- Exo 22 Nom et prénom des réalisateurs qui ont tourné au moins deux
-- films.
-- Exo 23 Quels films ont une moyenne des notes supérieure à 7

