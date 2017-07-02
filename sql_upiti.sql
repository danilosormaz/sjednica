--zad1

SELECT os.ime ,os.prezime,os.email,os.status
FROM osoba os INNER JOIN clanovi_vijeca cv
USING(mat_br)
WHERE TO_CHAR(cv.god_izbora,'YYYY')>'2015';


--zad2

SELECT dnr.naslov_tocke
FROM sjednica sj INNER JOIN dnevni_red dnr
USING(red_br_sjednice)
WHERE red_br_ak_sjednice=2 AND vrijeme BETWEEN '01/10/15' AND '30/09/16' ;

--zad3

SELECT naslov_tocke,vrsta_glasa,broj_glasova
FROM (
SELECT tocka_id,vrsta_glasa,COUNT(vrsta_glasa) AS BROJ_GLASOVA
FROM sjednica  INNER JOIN dnevni_red 
USING(red_br_sjednice)
INNER JOIN glas_clana 
USING(tocka_id)
WHERE red_br_ak_sjednice=2 AND vrijeme BETWEEN '01/10/15' AND '30/09/16'
GROUP BY vrsta_glasa,tocka_id
ORDER BY tocka_id)
INNER JOIN dnevni_red
USING(tocka_id);

--zad4 

SELECT sj.naslov AS NASLOV_SJEDNICE, TO_CHAR(sj.vrijeme,'DD/MM/YYYY') AS DATUM
FROM sjednica sj INNER JOIN dnevni_red dnr
USING(red_br_sjednice)
WHERE dnr.naslov_tocke LIKE '%znanstven%zvanj%';

--zad5

SELECT TO_CHAR(sj.vrijeme,'DD/MM/YY') AS DATUM,sj.naslov AS NASLOV_SJEDNICE,dnr.naslov_tocke,gc.vrsta_glasa
FROM sjednica sj,dnevni_red dnr,glas_clana gc
WHERE sj.red_br_sjednice=dnr.red_br_sjednice AND dnr.tocka_id=gc.tocka_id AND gc.mat_br=2;

--zad6

SELECT naslov,TO_CHAR(vrijeme ,'DD/MM/YYYY') AS DATUM
FROM sjednica
WHERE vrijeme BETWEEN '01/01/2016' AND '31/12/2016';


--zad7

SELECT TO_CHAR(vrijeme,'YYYY') AS GODINA, COUNT(red_br_sjednice) AS BROJ_SJEDNICA
FROM sjednica
GROUP BY TO_CHAR(vrijeme,'YYYY');

--zad8

SELECT ime,prezime,redovitost
FROM 
(SELECT mat_br,SUM(prisutnost) REDOVITOST
FROM
(SELECT mat_br,red_br_sjednice,1 AS PRISUTNOST
FROM gost_nazocnost  INNER JOIN osoba 
USING (mat_br)
UNION
SELECT mat_br ,red_br_sjednice, COUNT(DISTINCT mat_br) AS PRISUTNOST
FROM glas_clana INNER JOIN clanovi_vijeca
USING(mat_br)
INNER JOIN dnevni_red
USING(tocka_id)
INNER JOIN sjednica
USING(red_br_sjednice)
INNER JOIN osoba
USING(mat_br)
WHERE vrijeme BETWEEN '01/01/16' AND '31/12/16'
GROUP BY mat_br,red_br_sjednice)
GROUP BY mat_br)
INNER JOIN osoba
USING(mat_br)
WHERE ROWNUM <= 10
ORDER BY redovitost DESC;

--zad9

SELECT ime,prezime,redovitost
FROM 
(SELECT mat_br,SUM(prisutnost) REDOVITOST
FROM
(SELECT mat_br,red_br_sjednice,1 AS PRISUTNOST
FROM gost_nazocnost  INNER JOIN osoba 
USING (mat_br)
UNION
SELECT mat_br ,red_br_sjednice, COUNT(DISTINCT mat_br) AS PRISUTNOST
FROM glas_clana INNER JOIN clanovi_vijeca
USING(mat_br)
INNER JOIN dnevni_red
USING(tocka_id)
INNER JOIN sjednica
USING(red_br_sjednice)
INNER JOIN osoba
USING(mat_br)
WHERE vrijeme BETWEEN '01/01/16' AND '31/12/16'
GROUP BY mat_br,red_br_sjednice)
GROUP BY mat_br)
INNER JOIN osoba
USING(mat_br)
WHERE ROWNUM <= 10
ORDER BY redovitost,prezime;

--zad10
--opet je crklo,probati kasnije!!!
