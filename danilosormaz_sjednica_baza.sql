DROP TABLE glas_clana;
DROP TABLE isprika;
DROP TABLE gost_nazocnost;
DROP TABLE dokumentacija;
DROP TABLE dnevni_red;
DROP TABLE clanovi_vijeca;
DROP TABLE sjednica;
DROP TABLE osoba;


CREATE TABLE sjednica(
red_br_sjednice INTEGER CONSTRAINT red_br_sjednice_pk PRIMARY KEY,
red_br_ak_sjednice INTEGER NOT NULL,
mjesto_adresa VARCHAR2(50) NOT NULL,
mjesto_dvorana VARCHAR2(15),
vrijeme DATE NOT NULL,
naslov VARCHAR2(20),
obavijest VARCHAR2(20)
);

CREATE TABLE osoba(
mat_br INTEGER CONSTRAINT mat_br_pk PRIMARY KEY,
ime VARCHAR2(16) NOT NULL,
prezime VARCHAR2(20) NOT NULL,
email VARCHAR2(22),
tel VARCHAR2(15),
status VARCHAR2(40)
);

CREATE TABLE clanovi_vijeca(
mat_br INTEGER 
CONSTRAINT mat_br_fk
REFERENCES osoba(mat_br)
CONSTRAINT mat_br_vijece_pk
PRIMARY KEY,
status_vijecnika VARCHAR2(15),
god_izbora DATE NOT NULL
);

CREATE TABLE dnevni_red(
red_br_sjednice INTEGER
CONSTRAINT red_br_sjednice_fk
REFERENCES sjednica(red_br_sjednice),
tocka_id INTEGER CONSTRAINT tocka_id_pk PRIMARY KEY,
br_tocke_sjednice INTEGER NOT NULL,
naslov_tocke VARCHAR2(200) NOT NULL
);

CREATE TABLE dokumentacija(
tocka_id INTEGER 
CONSTRAINT tocka_id_fk
REFERENCES dnevni_red(tocka_id),
dokument VARCHAR2(100),
CONSTRAINT dokumentacija_pk PRIMARY KEY (tocka_id,dokument)
);

CREATE TABLE gost_nazocnost(
mat_br INTEGER
CONSTRAINT gost_mat_br_fk
REFERENCES osoba(mat_br),
red_br_sjednice INTEGER
CONSTRAINT gost_red_br_sjednice
REFERENCES sjednica(red_br_sjednice),
CONSTRAINT nazocnost_pk PRIMARY KEY (mat_br,red_br_sjednice)
);

CREATE TABLE isprika(
mat_br INTEGER 
CONSTRAINT isprika_mat_br_fk
REFERENCES osoba(mat_br),
red_br_sjednice INTEGER
CONSTRAINT red_br_sjed_isprika_fk
REFERENCES sjednica(red_br_sjednice),
isprika VARCHAR2(100),
CONSTRAINT isprika_pk PRIMARY KEY (mat_br,red_br_sjednice)
);

CREATE TABLE glas_clana(
mat_br INTEGER
CONSTRAINT glas_mat_br_fk
REFERENCES clanovi_vijeca(mat_br),
tocka_id INTEGER
CONSTRAINT glas_tocka_fk
REFERENCES dnevni_red(tocka_id),
vrsta_glasa VARCHAR2(10)NOT NULL,
CONSTRAINT glas_clana_pk PRIMARY KEY (mat_br,tocka_id)
);





INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(1,'Mirta','Benšiæ','mirta@mathos.hr',NULL,'prof. dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(2,'Krešmir','Burazin','kburazin@mathos.hr',NULL,'izv. prof. dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(3,'Josip','Cveniæ','jcvenic@mathos.hr',NULL,'dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(4,'Danijel','Grahovac','dgrahova@mathos.hr',NULL,'doc. dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(5,'Dragana','Jankov Mašireviæ','djankov@mathos.hr',NULL,'doc. dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(6,'Slobodan','Jeliæ','sjelic@mathos.hr',NULL,'doc. dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(7,'Dragan','Jukiæ','jukicd@mathos.hr',NULL,'prof. dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(8,'Mirela','Jukiæ Bokun','mirela@mathos.hr',NULL,'doc. dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(9,'Domagoj','Matijeviæ','domagoj@mathos.hr',NULL,'izv. prof. dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(10,'Kristian','Sabo','ksabo@mathos.hr',NULL,'prof. dr. sc.');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(11,'Danilo','Šormaz','dsormaz@mathos.hr',NULL,'student');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(12,'Martina','Šariæ','msaric1@mathos.hr',NULL,'student');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(13,'Milan','Milinèeviæ','mmilince@mathos.hr',NULL,'student');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(14,'Slaven','Viljevac','sviljevac@mathos.hr',NULL,'student');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(15,'Nikola','Živkoviæ','nzivkovi@mathos.hr',NULL,'student');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(16,'Domagoj','Suhiæ','dsuhic@mathos.hr',NULL,'student');
INSERT INTO osoba(mat_br,ime,prezime,email,tel,status)
VALUES(17,'Ivan','Milièiæ','imilicic@mathos.hr',NULL,'student');

INSERT INTO sjednica(red_br_sjednice,red_br_ak_sjednice,mjesto_adresa,mjesto_dvorana,vrijeme,naslov,obavijest)
VALUES (1 ,1,'Osijek,Odjel za matematiku','Dvorana 2','01/11/2015 12:00','naslov1',NULL);
INSERT INTO sjednica(red_br_sjednice,red_br_ak_sjednice,mjesto_adresa,mjesto_dvorana,vrijeme,naslov,obavijest)
VALUES (2 ,2,'Osijek,Odjel za matematiku','Dvorana 2','01/12/2015 13:00','naslov2',NULL);
INSERT INTO sjednica(red_br_sjednice,red_br_ak_sjednice,mjesto_adresa,mjesto_dvorana,vrijeme,naslov,obavijest)
VALUES (3 ,3,'Osijek,Odjel za matematiku','Dvorana 2','01/05/2016 12:00','naslov3',NULL);
INSERT INTO sjednica(red_br_sjednice,red_br_ak_sjednice,mjesto_adresa,mjesto_dvorana,vrijeme,naslov,obavijest)
VALUES (4 ,4,'Osijek,Odjel za matematiku','Dvorana 2','08/07/2016 10:00','naslov4',NULL);
INSERT INTO sjednica(red_br_sjednice,red_br_ak_sjednice,mjesto_adresa,mjesto_dvorana,vrijeme,naslov,obavijest)
VALUES (5 ,1,'Osijek,Odjel za matematiku','Dvorana 2','01/11/2016 10:30','naslov5',NULL);
INSERT INTO sjednica(red_br_sjednice,red_br_ak_sjednice,mjesto_adresa,mjesto_dvorana,vrijeme,naslov,obavijest)
VALUES (6 ,2,'Osijek,Odjel za matematiku','Dvorana 2','20/12/2016 12:30','naslov6',NULL);
INSERT INTO sjednica(red_br_sjednice,red_br_ak_sjednice,mjesto_adresa,mjesto_dvorana,vrijeme,naslov,obavijest)
VALUES (7 ,3,'Osijek,Odjel za matematiku','Dvorana 2','16/02/2017 12:00','naslov7',NULL);
INSERT INTO sjednica(red_br_sjednice,red_br_ak_sjednice,mjesto_adresa,mjesto_dvorana,vrijeme,naslov,obavijest)
VALUES (8 ,4,'Osijek,Odjel za matematiku','Dvorana 2','10/04/2017 10:00','naslov8',NULL);



INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(1,1,1,'Izbor u znanstvena zvanja');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(1,2,2,'Izbor jednog zaposlenika/zaposlenice u suradnièkom zvanju asistenta i suradnièkom radnom mjestu asistenta iz znanstvenog podruèja prirodnih znanosti');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(1,3,3,'Razno');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(2,4,1,'Usvajanje zapisnika s 1. sjednice Vijeæa Odjela od 01. prosinca 2015. godine');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(2,5,2,'Izbor u znanstvena zvanja');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(2,6,3,'Izbor u znanstvena zvanja');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(2,7,4,'Razno');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(3,8,1,'Usvajanje zapisnika s 2. sjednice Vijeæa Odjela od 01. prosinca 2015. godine');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(3,9,2,'Dodjela pohvala studentima za uspješnost u studiranju i izvannastavne aktivnosti');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(3,10,3,'Razno');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(4,11,1,'Usvajanje zapisnika s 3. sjednice Vijeæa Odjela od 21. travanj 2016. godine');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(4,12,2,'Izbor u znanstvena zvanja');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(4,13,3,'Razno');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(5,14,1,'Usvajanje zapisnika s 4. sjednice Vijeæa Odjela od 20. svibnja 2016. godine');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(5,15,2,'Izbor u znanstvena zvanja');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(5,16,3,'Razno');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(6,17,1,'Usvajanje zapisnika s 5. sjednice Vijeæa Odjela od 29. studenog 2016. godine');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(6,18,2,'Izbor jednog zaposlenika/zaposlenice u suradnièkom zvanju asistenta i suradnièkom radnom mjestu asistenta iz znanstvenog podruèja prirodnih znanosti');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(6,19,3,'Dodjela pohvala studentima za uspješnost u studiranju i izvannastavne aktivnosti ');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(7,20,1,'Usvajanje zapisnika s 6. sjednice Vijeæa Odjela od 21.sijeènja 2017. godine');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(7,21,2,'Razno.');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(8,22,1,'Izbor u znanstvena zvanja');
INSERT INTO dnevni_red(red_br_sjednice,tocka_id,br_tocke_sjednice,naslov_tocke)
VALUES(8,23,2,'Razno');



INSERT INTO clanovi_vijeca(mat_br,status_vijecnika,god_izbora)
VALUES(1,NULL,'01/12/2015');
INSERT INTO clanovi_vijeca(mat_br,status_vijecnika,god_izbora)
VALUES(2,NULL,'01/12/2015');
INSERT INTO clanovi_vijeca(mat_br,status_vijecnika,god_izbora)
VALUES(3,NULL,'01/12/2016');
INSERT INTO clanovi_vijeca(mat_br,status_vijecnika,god_izbora)
VALUES(4,NULL,'01/12/2016');
INSERT INTO clanovi_vijeca(mat_br,status_vijecnika,god_izbora)
VALUES(5,NULL,'01/12/2017');


INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(6,1);
INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(10,1);
INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(11,2);
INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(12,3);
INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(6,4);
INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(6,5);
INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(6,6);
INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(10,6);
INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(6,7);
INSERT INTO gost_nazocnost(mat_br,red_br_sjednice)
VALUES(6,8);

INSERT INTO isprika(mat_br,red_br_sjednice,isprika)
VALUES(12,1,'da');
INSERT INTO isprika(mat_br,red_br_sjednice,isprika)
VALUES(6,2,NULL);
INSERT INTO isprika(mat_br,red_br_sjednice,isprika)
VALUES(6,3,'da');
INSERT INTO isprika(mat_br,red_br_sjednice,isprika)
VALUES(10,5,'da');
INSERT INTO isprika(mat_br,red_br_sjednice,isprika)
VALUES(13,7,'da');
INSERT INTO isprika(mat_br,red_br_sjednice,isprika)
VALUES(7,8,NULL);


INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,1,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,2,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,3,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,4,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,5,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,6,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,7,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,8,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,9,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,10,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,11,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,12,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,13,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,14,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,15,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,16,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,17,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,18,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,19,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,20,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,21,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,22,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(1,23,'protiv');

INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,1,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,2,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,3,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,4,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,5,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,6,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,7,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,8,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,9,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,10,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,11,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,12,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,13,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,14,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,15,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,16,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,17,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,18,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,19,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,20,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,21,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,22,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(2,23,'za');

INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,1,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,2,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,3,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,4,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,5,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,6,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,7,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,8,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,9,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,10,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,11,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,12,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,13,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,14,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,15,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,16,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,17,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,18,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,19,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,20,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,21,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,22,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(3,23,'protiv');

INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,1,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,2,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,3,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,4,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,5,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,6,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,7,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,8,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,9,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,10,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,11,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,12,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,13,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,14,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,15,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,16,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,17,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,18,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,19,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,20,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,21,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,22,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(4,23,'za');

INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,1,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,2,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,3,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,4,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,5,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,6,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,7,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,8,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,9,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,10,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,11,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,12,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,13,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,14,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,15,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,16,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,17,'protiv');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,18,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,19,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,20,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,21,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,22,'za');
INSERT INTO glas_clana(mat_br,tocka_id,vrsta_glasa)
VALUES(5,23,'protiv');




