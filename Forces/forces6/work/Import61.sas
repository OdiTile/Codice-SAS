*--- Captor System data import procedure for SAS release V8 ------------;
*--- import61.sas            senza format    ---------------------------;
*--- Coerenza dei titoli universitari ------------------------07-07-06--;
/* Campioneforces B8 B8_before B8T0R C1A C2 -C2B- CDE CDE1 CDE1_A CDE1_C CDE1_D CDE1_E */
/* CDE1_F CDE1_G CDE2_I FAC J1 J10 J11 J12 J13 J14 J2 J22 J3 J4 J5 J6 J7 J8 J9  */

* LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces6\work\sas';  
* LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces6\work\sas';  
* FILENAME QBase '\\Kaos\Lan\Users\Mario\forces6\source\RBase070706.mdb';  

* LIBNAME LIB 'C:\Documents and Settings\barney\dati\lav\forces5\work\sas'; 
* LIBNAME LIBRARY 'C:\Documents and Settings\barney\dati\lav\forces5\work\sas'; 
* FILENAME QBase 'C:\Documents and Settings\barney\dati\lav\forces5\source\RBase.mdb'; 

* LIBNAME LIB 'C:\Documents and Settings\herman\dati\lav\forces5\work\sas'; 
* LIBNAME LIBRARY 'C:\Documents and Settings\herman\dati\lav\forces5\work\sas'; 
* FILENAME QBase 'C:\Documents and Settings\herman\dati\lav\forces5\source\RBase.mdb';

 LIBNAME LIB 'C:\dati\lav\forces6\work\sas'; 
 LIBNAME LIBRARY 'C:\dati\lav\forces6\work\sas'; 
 FILENAME QBase 'C:\dati\lav\forces6\source\RBase070706.mdb';
 
options nocenter;

* LIBNAME LIB '..\Sas';
* LIBNAME LIBRARY '..\Sas';
* FILENAME QBase '..\Mdb\RBase.mdb';

PROC IMPORT OUT=campioneforces DATATABLE='campioneforces' DBMS=ACCESS2000 REPLACE;
  DATABASE=QBase; run;  /* importa la tabella campioneforces nel dataset campioneforces */
PROC SORT data=campioneforces out=campioneforces; BY uid;  /* BY matricola; */  run;

DATA LIB.campioneforces;
SET campioneforces;
* tolgo variabili non utilizzate ;
drop uid1 facolta corsodilaurea Name Residenza Diploma uidbis ;
* LABEL campioneforces='campione forces completo';
RUN;


PROC IMPORT OUT=B8 DATATABLE='B8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=B8    out=B8 ; BY UID TID Block;

/* PROC FORMAT LIBRARY=LIB;
VALUE B8F
1 = 'LAVORA'
2 = '(non svolge attività lavorativa)<br>Ora STUDIA (anche DOTTorato di ricerca o SCUOLA di SPECialità o TIROCINIO/PRATICANTATO)<br>o svolge servizio di LEVA/civile<br>o CERCA LAVORO'
3 = 'NON lavora  NON studia  NON svolge servizio di leva  NE  cerca lavoro'
;  */
DATA LIB.B8;
SET B8; 
* LABEL B8='Che cosa fa ora ?  <br>LAVORA  STUDIA (anche PRATICANTATO  TIROCINIO o DOTTORATO)  CERCA lavoro  svolge servizio di LEVA/CIVILE  o cos altro?';
* FORMAT B8 B8F. ;
RUN;  

PROC IMPORT OUT=B8_before DATATABLE='B8_before' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=B8_before    out=B8_before ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE CosafaF
1 = 'Ora LAVORA'
2 = 'Ora STUDIA (anche DOTTorato di ricerca o SCUOLA di specialità o TIROCINIO)  o è in CERCA di LAVORO  o svolge servizio di LEVA/CIVILE'
; */
DATA LIB.B8_before;
SET B8_before;
* LABEL B8_before='Che cosa fa ora ?  <br>LAVORA  STUDIA (anche PRATICANTATO  TIROCINIO o DOTTORATO)  CERCA lavoro  svolge servizio di LEVA/CIVILE  o cos altro?';
* FORMAT B8_before CosafaF. ;
RUN;


PROC IMPORT OUT=B8T0R DATATABLE='B8T0R' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=B8T0R    out=B8T0R ; BY UID TID Block;
/*PROC FORMAT LIBRARY=LIB;
VALUE B8_T0F
1 = 'LAVORAVA'
2 = 'STUDIAVA o CERCAVA LAVORO'
3 = 'NON LAVORAVA NE  studiava  NE  cercava lavoro'
; */
DATA LIB.B8T0R;
SET B8T0R;
* LABEL B8T0R='Cosa faceva AL MOMENTO del conseguimento del titolo?';
* FORMAT B8T0R B8_T0F. ;
RUN;


PROC IMPORT OUT=C1A DATATABLE='C1A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=C1A  out=C1A ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE RetribuzF
1 = 'No  solo lavoro non retribuito'
2 = 'Sì'
; */
DATA LIB.C1A;
SET C1A;
* LABEL C1A='L attività lavorativa è retribuita?';
* FORMAT C1A RetribuzF. ;
RUN;


PROC IMPORT OUT=C2 DATATABLE='C2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=C2  out=C2 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE AttivF
1 = 'L attività lavorativa è del tutto NUOVA'
2 = 'Svolge anche un attività lavorativa NUOVA e questa gli dà  MAGGIOR  reddito della precedente (Che svolge ancora)'
3 = 'Svolge anche un attività lavorativa NUOVA  però la precedente (Che SVOLGE ANCORA) gli dà un reddito maggiore della nuova'
4 = 'L attività lavorativa (principale) è la STESSA'
; */
DATA LIB.C2;
SET C2;
* LABEL C2='ORA  svolge la  STESSA  attività (eventualmente con nuove mansioni ) o ha CAMBIATO attività principale  nel senso che una nuova attività le garantisce un maggior reddito?';
* FORMAT C2 AttivF. ;
RUN;

PROC IMPORT OUT=C2B DATATABLE='C2B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=C2B  out=C2B ; BY UID TID Block;

DATA LIB.C2B;
SET C2B;
* LABEL C2B='Attualmente lei svolge esattamente e solo le stesse mansioni?';
RUN;

PROC IMPORT OUT=CDE DATATABLE='CDE' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE  out=CDE ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE Luogo2F
1 = 'Nel comune di RESIDENZA'
2 = 'In altro comune della PROVincia di RESIDENZA'
3 = 'In Veneto'
4 = 'In altra regione italiana'
5 = 'All estero'
; */
DATA LIB.CDE;
SET CDE;
* LABEL CDE='In quale COMUNE italiano o in quale Paese diverso dall Italia lavora?';
* FORMAT CDE Luogo2F. ;
RUN;
PROC IMPORT OUT=CDE_A DATATABLE='CDE_A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE_A  out=CDE_A ; BY UID TID Block;
DATA LIB.CDE_A;
SET CDE_A;

RUN;

PROC IMPORT OUT=CDE1 DATATABLE='CDE1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE1  out=CDE1 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE MiglPegF
1 = 'Ha ottenuto sia promozioni (ha cambiato posizione professionale o contrattuali) sia miglioramenti economici'
2 = 'Ha ottenuto solo miglioramenti economici'
3 = 'Stessa posizione professionale  stesso reddito e stesso contratto'
4 = 'Ha perso delle posizioni di carriera'
; */
DATA LIB.CDE1;
SET CDE1;
* LABEL CDE1='Ha ottenuto PROMOZIONI o miglioramenti ECONOMICI o CONTRATTUALI dall ultima rilevazione  oppure sono successe delle cose negative da questo punto di vista?';
* FORMAT CDE1 MiglPegF. ;
RUN;

PROC IMPORT OUT=CDE1_A DATATABLE='CDE1_A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE1_A  out=CDE1_A ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE ConsTitF
1 = 'Sì (diretto o indiretto)'
2 = 'No'
3 = 'Non so'
; */
DATA LIB.CDE1_A;
SET CDE1_A;
* LABEL CDE1_A='I miglioramenti conseguiti sono CONSEGUENZA del TITOLO DI STUDIO acquisito?';
* FORMAT CDE1_A ConsTitF. ;
RUN;

PROC IMPORT OUT=CDE1_C DATATABLE='CDE1_C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE1_C  out=CDE1_C ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE ContrF
2 = 'SI  con CONTRATTO di lavoro'
1 = 'NO  senza contratto'
; */
DATA LIB.CDE1_C;
SET CDE1_C;
* LABEL CDE1_C='Siamo interessati a conoscere il tipo di CONTRATTO di lavoro con cui svolge ora l attività. Innanzitutto  ha un contratto di lavoro di qualche tipo o lavora senza contratto  in nero  tanto per capirci? Con noi può parlare liberamente.';
* FORMAT CDE1_C ContrF. ;
RUN;

PROC IMPORT OUT=CDE1_D DATATABLE='CDE1_D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE1_D  out=CDE1_D ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE TipoLavF
1 = 'Lavoro DIPENDENTE'
2 = 'Lavoro AUTONOMO'
3 = 'Contratto atipico/parasubordinato'
; */
DATA LIB.CDE1_D;
SET CDE1_D;
* LABEL CDE1_D='Lavora come DIPendente  come AUTONnomo o in POSIZione ATIPICA  cioè in parte dipendente ed in parte autonoma?';
* FORMAT CDE1_D TipoLavF. ;
RUN;

PROC IMPORT OUT=CDE1_E DATATABLE='CDE1_E' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE1_E  out=CDE1_E ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE TemplavoF
1 = 'Lavoro a tempo INDeterminato e tempo PIENO'
2 = 'Lavoro a tempo INDeterminato ma a tempo parziale (part-time)'
3 = 'Lavoro a tempo DETerminato ma PIENO'
4 = 'Lavoro a tempo DETerminato ma parziale'
5 = 'CFL-Contratti di formazione e lavoro'
6 = 'Apprendistato'
7 = 'Altro'
; */
DATA LIB.CDE1_E;
SET CDE1_E;
* LABEL CDE1_E='Il lavoro è a tempo DETerminato o INDETerminato e  nell uno e nell altro caso  è a TEMPO PIENO o PARZIALE  oppure si tratta di un contratto d ingresso nel mondo del lavoro  tipo CFL o apprendistato?';
* FORMAT CDE1_E TemplavoF. ;
RUN;

PROC IMPORT OUT=CDE1_F DATATABLE='CDE1_F' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE1_F  out=CDE1_F ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE Posiz2F
1 = 'Dirigente (anche professore universitario  magistrato  ecc.)'
2 = 'Funzionario direttivo  quadro'
3 = 'Insegnante di scuola dell infanzia  di base (elementare e media) o superiore'
4 = 'Impiegato  intermedio'
5 = 'Ricercatore  anche universitario'
6 = 'Operaio  apprendista  lavorante a domicilio  subalterno e assimilati'
7 = 'Socio di cooperativa  studio associato (dove presta opera)'
; */
DATA LIB.CDE1_F;
SET CDE1_F;
* LABEL CDE1_F='In quale POSIZIONE svolge l attività?';
* FORMAT CDE1_F Posiz2F. ;
RUN;

PROC IMPORT OUT=CDE1_G DATATABLE='CDE1_G' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE1_G  out=CDE1_G ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE PosizAutF
1 = 'IMPRENDITORE(agricoltura industria e servizi)'
2 = 'ARTIGIANO (dell industria e dei servizi  anche azienda di famiglia)'
3 = 'COMMERCIANTE (anche azienda di famiglia)'
4 = 'COLTIVATORE IN PROPRIO (anche azienda di famiglia)'
5 = 'LIBERO PROFESSIONISTA'
6 = 'CREATO UNO STUDIO PROFessionale o società di servizi professionali'
7 = 'ENTRATO IN UNO STUDIO PROFessionale o società già avviata'
8 = 'APERTO PARTITA IVA per attività professionale in proprio'
9 = 'ALTRO '
; */
DATA LIB.CDE1_G;
SET CDE1_G;
* LABEL CDE1_G='In quale POSIZIONE svolge l attività di lavoro autonomo?';
* FORMAT CDE1_G PosizAutF. ;
RUN;


PROC IMPORT OUT=CDE2_G DATATABLE='CDE2_G' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE2_G  out=CDE2_G ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE RetrmensF
1 = 'Meno di 250 Euro  '
2 = 'Da  250 a 380 Euro'
3 = 'Da 380.1 a 500'
4 = 'Da 500.1 a 550 Euro'
5 = 'Da 550.1 a 600 Euro'
6 = 'Da 600.1 a 650 Euro'
7 = 'Da 650.1 a 700 Euro'
8 = 'Da 700.1 a 750 Euro'
9 = 'Da 750.1 a 800 euro'
10 = 'Da 800.1 a 850 Euro'
11 = 'Da 850.1 a 900 Euro'
12 = 'Da 900.1 a 950 Euro'
13 = 'Da 950.1 a 1000 Euro'
14 = 'Da 1000.1 a 1050 Euro'
15 = 'Da 1050.1 a 1100 Euro'
16 = 'Da 1100.1 a 1150 Euro'
17 = 'Da 1150.1 a 1200 Euro'
18 = 'Da 1200.1 a 1250 Euro'
19 = 'Da 1250.1 a 1300 Euro'
20 = 'Da 1300.1 a 1400 Euro'
21 = 'Da 1400.1 a 1600 Euro'
22 = 'Da 1600.1 a 1800 Euro'
23 = 'Da 1800.1 a 2000 Euro'
24 = 'Da 2000.1 a 2600 Euro'
25 = 'Da 2600.1 a 3600 Euro'
26 = 'Oltre 3600 Euro al mese'
27 = 'Non ricorda  non vuole rispondere'
28 = 'Altro'
; */
DATA LIB.CDE2_G;
SET CDE2_G;
* LABEL CDE2_G='Mi può INDICARE qual è la sua RETRIBUZIONE mensile (al NETTO delle trattenute) per questa attività (se in dubbio  fare riferimento all ultimo anno)?  ';
* FORMAT CDE2_G RetrmensF. ;
RUN;


PROC IMPORT OUT=CDE2_I DATATABLE='CDE2_I' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=CDE2_I  out=CDE2_I ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE NaddettiF
1 = 'Fino a 9'
2 = '10-19'
3 = '20-50'
4 = '51-100'
5 = '101-250'
6 = '251-1000'
7 = 'oltre 1000'
8 = 'Non ho proprio idea'
; */
DATA LIB.CDE2_I;
SET CDE2_I;
* LABEL CDE2_I='Qual è il numero approssimato di ADDETTI dell azienda/ente in cui opera (se l azienda/ente ha più unità locali  cioè stabilimenti  edifici  ecc.  riferirsi all unità locale in cui la persona opera)?';
* FORMAT CDE2_I NaddettiF. ;
RUN;


PROC IMPORT OUT=FAC DATATABLE='FAC' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=FAC  out=FAC ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE $FacoltaF
'fac01' = 'Agraria'
'fac02' = 'Economia'
'fac03' = 'Farmacia'
'fac04' = 'Giurisprudenza'
'fac05' = 'Ingegneria'
'fac06' = 'Lettere e Filosofia'
'fac07' = 'Medicina e Chirurgia'
'fac08' = 'Medicina Veterinaria'
'fac09' = 'Psicologia'
'fac10' = 'Scienze della Formazione'
'fac11' = 'Scienze Matematiche  Fisiche e Naturali'
'fac12' = 'Scienze Politiche'
'fac13' = 'Scienze Statistiche'
; */
DATA LIB.FAC;
SET FAC;
* LABEL FAC='Facolta';
* FORMAT FAC FacoltaF. ;
RUN;
PROC IMPORT OUT=I1 DATATABLE='I1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=I1  out=I1 ; BY UID TID Block;
DATA LIB.I1;
SET I1;  RUN;
PROC IMPORT OUT=I1C DATATABLE='I1C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=I1C  out=I1C ; BY UID TID Block;
DATA LIB.I1C;
SET I1C;  RUN;

PROC IMPORT OUT=J1 DATATABLE='J1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J1  out=J1 ; BY UID TID Block;
/*PROC FORMAT LIBRARY=LIB;
VALUE scalaF
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
7 = '7'
8 = '8'
9 = '9'
10 = '10'
; */
DATA LIB.J1;
SET J1;
* LABEL J1='Su una scala da 1 (minimo) a 10 (massimo)  quanto è SODDISFATTO del Suo LAVORO attuale?';
* FORMAT J1 scalaF. ;
RUN;


PROC IMPORT OUT=J10 DATATABLE='J10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J10  out=J10 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE NieMol1F
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
; */
DATA LIB.J10;
SET J10;
* LABEL J10='Quanto  nello svolgimento del suo lavoro  riesce a VALORIZZARE la Sue capacità professionali  per niente  poco  abbastanza o molto?';
* FORMAT J10 NieMol1F. ;
RUN;


PROC IMPORT OUT=J11 DATATABLE='J11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J11  out=J11 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE altriF
1 = 'Può essere svolta da altri laureati'
2 = 'La laurea non è necessaria  sarebbe sufficiente un titolo inferiore'
3 = 'Ci vuole il titolo di studio che possiede'
; */
DATA LIB.J11;
SET J11;
* LABEL J11='Pensa che la sua attività di lavoro attuale possa essere svolta-- con esiti di poco differenti --da laureati di altre discipline  oppure è un attività per la quale il suo titolo di studio è specifico?';
* FORMAT J11 altriF. ;
RUN;


PROC IMPORT OUT=J12 DATATABLE='J12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J12  out=J12 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE J12F
1 = 'SI  anche un diplomato (maturità)'
2 = 'SI  anche meno che diplomato'
3 = 'NO  ci vuole il titolo universitario'
; */
DATA LIB.J12;
SET J12;
* LABEL J12='L attività lavorativa che svolge potrebbe essere svolta-- con esiti di poco differenti --da un diplomato di scuola superiore o anche meno qualificato?';
* FORMAT J12 J12F. ;
RUN;

PROC IMPORT OUT=J13 DATATABLE='J13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J13  out=j13 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE scalaF
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
7 = '7'
8 = '8'
9 = '9'
10 = '10'
; */
DATA LIB.J13;
SET J13;
* LABEL J13='Su una scala da 1 a 10  QUANTO sente essere ADEGUATA la preparazione professionale conseguita all Università rispetto al tipo di lavoro che svolge?';
* FORMAT J13 scalaF. ;
RUN;


PROC IMPORT OUT=J14 DATATABLE='J14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J14  out=J14 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE preparF
1 = 'Poco specialistica'
2 = 'Adeguata'
3 = 'Troppo specialistica'
; */
DATA LIB.J14;
SET J14;
* LABEL J14='Lei sente che la PREPARAZIONE  PROFESSIONALE conseguita all università-- rispetto al tipo di lavoro che svolge-- è POCO specialistico  TROPPO specialistico o ADEGUATA?';
* FORMAT J14 preparF. ;
RUN;


PROC IMPORT OUT=J2 DATATABLE='J2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J2  out=J2 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
; */
DATA LIB.J2;
SET J2;
* LABEL J2='Quanto-- nello svolgimento delle Sue mansioni  --si avvale di FORMA  MENTIS ossia della cultura professionale generale (IMPOSTAZIONE MENTALE) derivante dalla formazione universitaria  per niente  poco  abbastanza o molto?';
* FORMAT J2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=J22 DATATABLE='J22' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J22  out=J22 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE cambiamF
1 = 'Pochi o nulli cambiamenti'
2 = 'Miglioramenti economici'
3 = 'Peggioramenti economici'
4 = 'Progressione di carriera'
5 = 'Problemi nella carriera'
6 = 'Allargamento dell ambito operativo della propria professione'
7 = 'Problemi per l ambito operativo della professione esecitata'
8 = 'Istituzionalizzazione della professione (albo  ordine  ecc.)'
9 = 'Maggiore riconoscimento sociale della professione'
10 = 'Altro'
; */
DATA LIB.J22;
SET J22;
* LABEL J22='Cosa s aspetta per il Suo FUTURO  PROFESsionale  diciamo di qui a due anni avanti. Si aspetta dei cambiamenti  e se sì  di che tipo?';
* FORMAT J22 cambiamF. ;
RUN;


PROC IMPORT OUT=J3 DATATABLE='J3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J3  out=J3 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
; */
DATA LIB.J3;
SET J3;
* LABEL J3='Quanto-- nello svolgimento del Suo lavoro --utilizza METODI e TECNICHE utili a  saper fare  acquisiti durante gli studi universitari  per niente  poco  abbastanza  o molto?';
* FORMAT J3 NieMoltoF. ;
RUN;


PROC IMPORT OUT=J4 DATATABLE='J4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J4  out=J4 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE nesUnaF
1 = 'Nessuna'
2 = 'Almeno una'
; */
DATA LIB.J4;
SET J4;
* LABEL J4='Nello svolgimento della Sua attività lavorativa  utilizza abilità (COMPETENZE) ACQUISITE durante gli studi universitari (indicare solo quelle acquisite durante gli studi universitari)?';
* FORMAT J4 nesUnaF. ;
RUN;

PROC IMPORT OUT=J5 DATATABLE='J5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J5  out=J5 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE nesUnaF
1 = 'Nessuna'
2 = 'Almeno una'
; */
DATA LIB.J5;
SET J5;
* LABEL J5='Vi sono abilità (COMPETENZE) utili per lo svolgimento della Sua attività lavorativa di cui sente maggiormente la MANCANZA non avendole acquisite durante gli studi universitari?';
* FORMAT J5 nesUnaF. ;
RUN;

PROC IMPORT OUT=J6 DATATABLE='J6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J6  out=J6 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE scalaF
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
7 = '7'
8 = '8'
9 = '9'
10 = '10'
; */
DATA LIB.J6;
SET J6;
* LABEL J6='Nello svolgimento della Sua attività lavorativa  quanto sono importanti gli insegnamenti di BASE  ossia quelli di tipo PROPEDEUTICO? Mi dica qual è l importanza con un voto tra 1 e 10  dove 1 è il minimo e 10 il massimo.';
* FORMAT J6 scalaF. ;
RUN;


PROC IMPORT OUT=J7 DATATABLE='J7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J7  out=J7 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE scalaF
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
7 = '7'
8 = '8'
9 = '9'
10 = '10'
; */
DATA LIB.J7;
SET J7;
* LABEL J7='Nello svolgimento della Sua attività lavorativa  quanto sono importanti gli insegnamenti di tipo PROFESSIONALIZZANTE  ossia di fine percorso  che Lei ha seguito? Mi dica qual è l importanza con un voto tra 1 e 10  dove 1 è il minimo e 10 il massimo.';
* FORMAT J7 scalaF. ;
RUN;


PROC IMPORT OUT=J8 DATATABLE='J8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J8  out=J8 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE scalaF
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
7 = '7'
8 = '8'
9 = '9'
10 = '10'
; */
DATA LIB.J8;
SET J8;
* LABEL J8='(SE SI E  LAUREATO CON UNA TESI DI TIPO APPLICATIVO O SPERIMENTALE) SE SI= Su una scala da 1 (MINimo) a 10 (MASsimo)  come valuta l ESPERIENZA della TESI nella sua FORMAZione PROFessionale?';
* FORMAT J8 scalaF. ;
RUN;


PROC IMPORT OUT=J9 DATATABLE='J9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=J9  out=J9 ; BY UID TID Block;
/* PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
; */
DATA LIB.J9;
SET J9;
* LABEL J9='Nel complesso  l attività lavorativa che svolge è COERENTE  con ciò che ha appreso durante gli studi universitari  per niente  poco abbastanza o molto?';
* FORMAT J9 NieMoltoF. ;
RUN;

/* Importazione variabile tirocinio-stage da almalaurea
1 importazione di tabella excel in un nuovo database access temporaneo bonam
2 copia tabella campioneforces da RBase070706 in database bonam
3 query inner join bonam - campioneforces su  uid uid1 per ricostruire uid forces
4 esportazione query qrytir2 come tabella nel database RBase070706
5 query di inserimenti TID="T4" per riferimento a 24 mesi dal conseguimento */
PROC IMPORT OUT=tirocin DATATABLE='tirocin' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT data=tirocin  out=tirocin ; BY UID TID ;

DATA LIB.tirocin;
SET tirocin;

RUN;

