--zad1a

CALL insert_osoba(p_ime=>'Danilo',p_prezime=>'Sormaz',p_tel=>NULL,p_status=>NULL,p_clan=>1,p_god_izbora=>'21/11/1994');
CALL insert_osoba(p_ime=>'Danilo',p_prezime=>'Sormaz',p_tel=>NULL,p_status=>NULL,p_clan=>0,p_god_izbora=>'21/11/1994');
CALL insert_osoba(p_ime=>'Danilo',p_prezime=>'Sormaz',p_tel=>NULL,p_status=>NULL,p_clan=>1,p_god_izbora=>'21/02/1204');
CALL insert_osoba(p_ime=>'Danilo',p_prezime=>'Sormaz',p_tel=>NULL,p_status=>NULL,p_clan=>0,p_god_izbora=>'29/02/1204');

--zad1b

CALL insert_sjednica('adresa1','dvorana1','21/11/2001','naslov1','obavijest1');
CALL insert_sjednica('adresa2','dvorana2','21/11/2002','naslov2','obavijest2');

--zad1b

CALL insert_tocka(1,'naslov 1.tocke',1);
CALL insert_tocka(1,'naslov 2tocke',2);
CALL insert_tocka(1,'naslov 3.tocke',3);

--zad1b

CALL insert_dokumentacija(1,'dokument1');
CALL insert_dokumentacija(2,'dokument2');
CALL insert_dokumentacija(3,'dokument3');

--zad1c

CALL insert_glas_clana(1,1,'za');
CALL insert_glas_clana(1,2,'za');
CALL insert_glas_clana(1,3,'za');
CALL insert_glas_clana(3,1,'protiv');
CALL insert_glas_clana(3,2,'protiv');
CALL insert_glas_clana(3,3,'za');


--zad1d

CALL insert_nazocnost(2,1);
CALL insert_nazocnost(2,2);

--zad1d

CALL insert_isprika(4,1,'isprika broj 1');
CALL insert_isprika(4,2,'isprika broj 2');

