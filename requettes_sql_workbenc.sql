--  Requettes avec mysql et workbench avce une bdd donée par le formateur

--  taper cette commande  sur le terminbal pour que mon sql fonctionne sur mon mac
sudo find / -name "*sql*"\n

-- Exo 1 Nom et année de naissance des artistes nés avant 1950.  
SELECT nom, annéeNaiss
FROM artiste
 WHERE annéeNaiss< 1950;

-- Exo 2 Titre de tous les drames. 
SELECT titre FROM film
 WHERE genre = 'Drame';

-- Exo 3 Quels rôles a joué Bruce Willis. 
SELECT  nomRôle 
FROM role r,artiste a 
WHERE a.idArtiste = r.idActeur 
AND a.nom="Willis" 
AND a.prénom="Bruce";

-a

-- Exo 4 Qui est le réalisateur de Memento. 
SELECT artiste.nom,artiste.prénom  
FROM artiste,film  
WHERE  film.idRéalisateur = artiste.idArtiste
 AND film.titre="Momento"

-- Exo 5 Quelles sont les notes obtenues par le film Fargo 
SELECT  note
 FROM notation, film 
 WHERE film.idFilm= notation.idFilm 
 AND film.titre="Fargo"

-- Exo 6 Qui a joué le rôle de Chewbacca?
SELECT  nom,prénom 
FROM artiste,role 
WHERE  artiste.idArtiste = role.idActeur 
AND nomRôle="Chewbacca"

-- Exo 7 Dans quels films Bruce Willis a-t-il joué le rôle de John McClane? 
SELECT  film.titre 
FROM film , role, artiste
 WHERE role.idFilm =film.idFilm
 AND role.nomRôle="John McClane"
 AND role.idActeur=artiste.idArtiste 
 AND artiste.nom="Willis" 
 AND artiste.prénom="Bruce";


-- Exo 8 Nom des acteurs de 'Sueurs froides' 
SELECT artiste.nom,artiste.prénom 
FROM artiste,film
WHERE artiste.idArtiste=film.idRéalisateur  
 AND film.titre="Sueurs froides";


-- Exo 9 Quelles sont les films notés par l'internaute Prénom0 Nom0 
SELECT titre FROM film,notation,internaute
WHERE film.idFilm=notation.idFilm
AND internaute.nom="Nom0"
AND notation.email=internaute.email
AND internaute.prénom="Prénom0";


-- Exo 10 Films dont le réalisateur est Tim Burton, et l’un des acteurs
-- Johnny Depp. 
select titre from role,artiste,film
WHERE role.idActeur = artiste.idArtiste
AND artiste.nom="Depp"
AND artiste.prénom="johnny"
AND film.idFilm = role.idFilm
AND titre IN(
select titre from film,artiste
WHERE film.idRéalisateur = artiste.idArtiste
AND artiste.nom="Burton"
AND artiste.prénom="Tim"
);

-- Exo 11 Titre des films dans lesquels a joué ́Woody Allen. Donner aussi
-- le rôle.

SELECT titre,role.nomRôle FROM film,artiste,role
WHERE  artiste.idArtiste=role.idActeur
AND film.idFilm=role.idFilm
AND artiste.nom="allen"
AND artiste.prénom="Woody";

-- Exo 12 Quel metteur en scène a tourné dans ses propres films ? Donner
-- le nom, le rôle et le titre des films.
SELECT titre, artiste.nom,artiste.prénom,role.nomRôle FROM film,artiste,role
WHERE film.idFilm=role.idFilm
AND film.idRéalisateur=role.idActeur
AND film.idRéalisateur=artiste.idArtiste;

-- Exo 13 Titre des films de Quentin Tarantino dans lesquels il n’a pas
-- joué



-- Exo 14 Quel metteur en scène a tourné ́en tant qu’acteur ? Donner le
-- nom, le rôle et le titre des films dans lesquels cet artiste a joué.

select  nomRôle ,artiste.nom,artiste.prénom,titre 
from film,artiste,role
 where film.idRéalisateur = artiste.idArtiste
 AND artiste.idArtiste=role.idActeur
 AND  artiste.idArtiste IN (
SELECT artiste.idArtiste from artiste,film,role
WHERE artiste.idArtiste = role.idActeur
AND role.idFilm = film.idFilm
 );

-- Exo 15 Donnez les films de Hitchcock sans James Stewart
-- Exo 16 Dans quels films le réalisateur a-t-il le même prénom que l’un
-- des interprètes ? (titre, nom du réalisateur, nom de l’interprète). Le
-- réalisateur et l’interprète ne doivent pas être la même personne.

-- Exo 17 Les films sans rôle
select titre from film,role
where role.idFilm=film.idFilm
AND role.idActeur=NULL;


-- Exo 18 Quelles sont les films non notés par l'internaute Prénom1 Nom1
SELECT titre  FROM film,notation,internaute
WHERE notation.idFilm=film.idFilm
AND internaute.email=notation.email
AND internaut.prénom="Prénom1"
AND internaut.nom="Nom1"
AND film.idFilm NOT IN (select idFilm from film);


-- Exo 19 Quels acteurs n’ont jamais réalisé de film ?
SELECT artiste.idArtiste, nom,prénom FROM artiste 
WHERE artiste.idArtiste NOT IN(SELECT role.idActeur FROM role)  ;


-- Exo 20 Quelle est la moyenne des notes de Memento
SELECT  avg(note) FROM notation,film
WHERE notation.idFilm=film.idFilm
AND film.titre="Momento"
GROUP BY film.titre;

-- Exo 21 id, nom et prénom des réalisateurs, et nombre de films qu’ils
-- ont tournés.
SELECT  COUNT(*) as "nombres de films" ,artiste.idArtiste ,artiste.nom,artiste.prénom 
FROM film,artiste
WHERE artiste.idArtiste=film.idRéalisateur
GROUP BY artiste.idArtiste,artiste.nom,artiste.prénom ;

-- Exo 22 Nom et prénom des réalisateurs qui ont tourné au moins deux
-- films.
SELECT  artiste.nom,artiste.prénom  FROM film,artiste
WHERE film.idRéalisateur=artiste.idArtiste
GROUP BY artiste.idArtiste,artiste.nom,artiste.prénom
HAVING COUNT(*) >=2;

-- Exo 23 Quels films ont une moyenne des notes supérieure à 7
SELECT  titre
FROM film,notation
WHERE film.idFilm = notation.idFilm
GROUP BY titre
HAVING AVG(note) > 7;
