*--- Captor System data import procedure for SAS release V8 ------------;
*--- Coerenza dei titoli universitari ------------------------07-07-06--;
/* Import02 + F4 G3 H4 +                                                            */
/* I1D I1D_alt3_T2 I1E I1E_alt3_T2 I1F I1F_alt3_T2 I1G I1G_alt3_T2 I1H I1H_alt3_T2  */

* LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces5\work\sas';  
* LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces5\work\sas';  
* FILENAME QBase '\\Kaos\Lan\Users\Mario\forces5\source\RBase.mdb';  

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

PROC IMPORT OUT=A0 DATATABLE='A0' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AperturaF
6 = 'Risponde persona diversa da quella designata'
7 = 'Risponde segreteria telefonica'
8 = 'Risponde la persona designata'
;
DATA LIB.A0;
SET A0;
LABEL A0='Buongiorno...';
FORMAT A0 AperturaF. ;
RUN;

PROC IMPORT OUT=B0A DATATABLE='B0A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B0A;
SET B0A;
LABEL B0A='Con quanto si è laureato/a diplomato/a? (Qual è il suo voto di laurea/diploma?) ';
RUN;

PROC IMPORT OUT=B0B DATATABLE='B0B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.B0B;
SET B0B;
LABEL B0B='Ha avuto anche la lode?';
FORMAT B0B SiNoF. ;
RUN;

PROC IMPORT OUT=B0C DATATABLE='B0C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B0C;
SET B0C;
LABEL B0C='Mi può dire il titolo della sua tesi di laurea/diploma?';
RUN;

PROC IMPORT OUT=B1 DATATABLE='B1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B1;
SET B1;
LABEL B1='Comune';
RUN;

PROC IMPORT OUT=B1A DATATABLE='B1A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B1A;
SET B1A;
LABEL B1A='Indirizzo di casa';
RUN;

PROC IMPORT OUT=B1B DATATABLE='B1B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B1B;
SET B1B;
LABEL B1B='Telefono fisso';
RUN;

PROC IMPORT OUT=B1C DATATABLE='B1C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B1C;
SET B1C;
LABEL B1C='Cellulare';
RUN;

PROC IMPORT OUT=B1D DATATABLE='B1D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B1D;
SET B1D;
LABEL B1D='Indirizzo e_mail';
RUN;

PROC IMPORT OUT=B2A DATATABLE='B2A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B2A;
SET B2A;
LABEL B2A='Telefono lavoro';
RUN;

PROC IMPORT OUT=B3A DATATABLE='B3A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B3A;
SET B3A;
LABEL B3A='NOME e COGNOME della persona di riferimento';
RUN;

PROC IMPORT OUT=B3B DATATABLE='B3B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B3B;
SET B3B;
LABEL B3B='Telefono della persona di riferimento';
RUN;

PROC IMPORT OUT=B3C DATATABLE='B3C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B3C;
SET B3C;
LABEL B3C='Cellulare della persona di riferimento';
RUN;

PROC IMPORT OUT=B3D DATATABLE='B3D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B3D;
SET B3D;
LABEL B3D='Indirizzo e_mail della persona di riferimento';
RUN;

PROC IMPORT OUT=B4 DATATABLE='B4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE b4F
1 = 'Si'
2 = 'no'
;
DATA LIB.B4;
SET B4;
LABEL B4='Vuole fare dei cambiamenti o integrare i dati che noi abbiamo....';
FORMAT B4 b4F. ;
RUN;

PROC IMPORT OUT=B7 DATATABLE='B7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Telev1F
1 = 'SI'
2 = 'NO  non dispone di Televideo  non funziona bene'
3 = 'NO  non vuole comunicare via Televideo'
;
DATA LIB.B7;
SET B7;
LABEL B7='Ha la possibilità di utilizzare un TELEVIDEO funzionante? Glielo chiediamo perchè intendiamo fare un esperimento di comunicazione via Televideo e telefono.';
FORMAT B7 Telev1F. ;
RUN;

PROC IMPORT OUT=B7A DATATABLE='B7A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE B7AF
1 = 'Maturità scientifica'
2 = 'Maturità classica'
3 = 'Maturità tecnica industriale'
4 = 'Maturità tecnica per geometri'
5 = 'Maturità tecnica comerciale e per perito aziendale'
6 = 'altra Maturità tecnica'
7 = 'Maturità magistrale'
8 = 'Maturità linguistica'
9 = 'Maturità professionale'
10 = 'Maturità artistica'
11 = 'Altro (Specificare'
;
DATA LIB.B7A;
SET B7A;
LABEL B7A='Ci è stata  chiesta una informazione aggiuntiva sul suo CURRICULUM SCOLASTICO. Qual è il suo DIPLOMA DI SCUOLA SECONDARIA SUPERIORE?';
FORMAT B7A B7AF. ;
RUN;

PROC IMPORT OUT=B7A1 DATATABLE='B7A1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B7A1;
SET B7A1;
LABEL B7A1='Qual è il nome dell ISTITUTO?';
RUN;

PROC IMPORT OUT=B7Abis DATATABLE='B7Abis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B7Abis;
SET B7Abis;
LABEL B7Abis='ALTRO SPECIFICARE';
RUN;

PROC IMPORT OUT=B7B DATATABLE='B7B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.B7B;
SET B7B;
LABEL B7B='Dall ultimo contatto  è CAMBIATO il suo STATO  CIVILE?';
FORMAT B7B SiNoF. ;
RUN;

PROC IMPORT OUT=B7B1 DATATABLE='B7B1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.B7B1;
SET B7B1;
LABEL B7B1='VIVE CON i genitori o comunque NELLA famiglia di origine?';
FORMAT B7B1 SiNoF. ;
RUN;

PROC IMPORT OUT=B7Bbis DATATABLE='B7Bbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE civileF
1 = 'Nubile (donna)'
2 = 'Celibe (uomo)'
0 = 'Coniugato'
;
DATA LIB.B7Bbis;
SET B7Bbis;
LABEL B7Bbis='ATTualmente  il suo STATO CIVILE è:';
FORMAT B7Bbis civileF. ;
RUN;

PROC IMPORT OUT=B7C DATATABLE='B7C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.B7C;
SET B7C;
LABEL B7C='Ha lo stesso numero di FIGLI (viventi) di sei mesi fa?';
FORMAT B7C SiNoF. ;
RUN;

PROC IMPORT OUT=B7Cbis DATATABLE='B7Cbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B7Cbis;
SET B7Cbis;
LABEL B7Cbis='Qual è il  NUMERO  dei suoi figli viventi?';
RUN;

PROC IMPORT OUT=B7D DATATABLE='B7D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B7D;
SET B7D;
LABEL B7D='Quanti dei suoi figli hanno MENO di sei anni?';
RUN;

PROC IMPORT OUT=B8 DATATABLE='B8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE B8F
1 = 'LAVORA'
2 = '(non svolge attività lavorativa)<br>Ora STUDIA (anche DOTTorato di ricerca o SCUOLA di SPECialità o TIROCINIO/PRATICANTATO)<br>o svolge servizio di LEVA/civile<br>o CERCA LAVORO'
3 = 'NON lavora  NON studia  NON svolge servizio di leva  NE  cerca lavoro'
;
DATA LIB.B8;
SET B8;
LABEL B8='Che cosa fa ora ?  <br>LAVORA  STUDIA (anche PRATICANTATO  TIROCINIO o DOTTORATO)  CERCA lavoro  svolge servizio di LEVA/CIVILE  o cos altro?';
FORMAT B8 B8F. ;
RUN;

PROC IMPORT OUT=B8_before DATATABLE='B8_before' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE CosafaF
1 = 'Ora LAVORA'
2 = 'Ora STUDIA (anche DOTTorato di ricerca o SCUOLA di specialità o TIROCINIO)  o è in CERCA di LAVORO  o svolge servizio di LEVA/CIVILE'
;
DATA LIB.B8_before;
SET B8_before;
LABEL B8_before='Che cosa fa ora ?  <br>LAVORA  STUDIA (anche PRATICANTATO  TIROCINIO o DOTTORATO)  CERCA lavoro  svolge servizio di LEVA/CIVILE  o cos altro?';
FORMAT B8_before CosafaF. ;
RUN;

PROC IMPORT OUT=B8ATT0R DATATABLE='B8ATT0R' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.B8ATT0R;
SET B8ATT0R;
LABEL B8ATT0R='Quale attività svolgeva al MOMENTO del CONSEGUIMENTO DEL TITOLO?';
RUN;

PROC IMPORT OUT=B8CIR DATATABLE='B8CIR' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.B8CIR;
SET B8CIR;
LABEL B8CIR='Al momento della laurea era iscritto presso i centri per l impiego?';
FORMAT B8CIR SiNoF. ;
RUN;

PROC IMPORT OUT=B8T0R DATATABLE='B8T0R' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE B8_T0F
1 = 'LAVORAVA'
2 = 'STUDIAVA o CERCAVA LAVORO'
3 = 'NON LAVORAVA NE  studiava  NE  cercava lavoro'
;
DATA LIB.B8T0R;
SET B8T0R;
LABEL B8T0R='Cosa faceva AL MOMENTO del conseguimento del titolo?';
FORMAT B8T0R B8_T0F. ;
RUN;

PROC IMPORT OUT=C1 DATATABLE='C1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE numAttF
1 = 'Una sola'
2 = 'Più d una'
;
DATA LIB.C1;
SET C1;
LABEL C1='Svolge UNA sola attività lavorativa o PIU  d una?';
FORMAT C1 numAttF. ;
RUN;

PROC IMPORT OUT=C1A DATATABLE='C1A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE RetribuzF
1 = 'No  solo lavoro non retribuito'
2 = 'Sì'
;
DATA LIB.C1A;
SET C1A;
LABEL C1A='L attività lavorativa è retribuita?';
FORMAT C1A RetribuzF. ;
RUN;

PROC IMPORT OUT=C1B DATATABLE='C1B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Retrib2F
1 = 'NO  solo lavoro NON retribuito'
2 = 'SI  una'
3 = 'SI  più d una'
;
DATA LIB.C1B;
SET C1B;
LABEL C1B='ALMENO UNA di queste attività è retribuita?';
FORMAT C1B Retrib2F. ;
RUN;

PROC IMPORT OUT=C2 DATATABLE='C2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AttivF
1 = 'L attività lavorativa è del tutto NUOVA'
2 = 'Svolge anche un attività lavorativa NUOVA e questa gli dà  MAGGIOR  reddito della precedente (Che svolge ancora)'
3 = 'Svolge anche un attività lavorativa NUOVA  però la precedente (Che SVOLGE ANCORA) gli dà un reddito maggiore della nuova'
4 = 'L attività lavorativa (principale) è la STESSA'
;
DATA LIB.C2;
SET C2;
LABEL C2='ORA  svolge la  STESSA  attività (eventualmente con nuove mansioni ) o ha CAMBIATO attività principale  nel senso che una nuova attività le garantisce un maggior reddito?';
FORMAT C2 AttivF. ;
RUN;

PROC IMPORT OUT=C2_alt1_T2 DATATABLE='C2_alt1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.C2_alt1_T2;
SET C2_alt1_T2;
LABEL C2_alt1_T2='ATTUALMENTE qual è la sua attività principale?';
RUN;

PROC IMPORT OUT=C3 DATATABLE='C3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE StesAzLuF
1 = 'Cambiato  AZIENDA/ENTE (NON comune)'
2 = 'Cambiato COMUNE di lavoro  (NON azienda/ente)'
3 = 'Cambiato AZIENDA e COMUNE'
4 = 'STESSA azienda e comune '
;
DATA LIB.C3;
SET C3;
LABEL C3='Nello svolgimento dell attività lavorativa (principale)  opera nella stessa AZIENDA e nello stesso LUOGO di lavoro?';
FORMAT C3 StesAzLuF. ;
RUN;

PROC IMPORT OUT=C4I_alt_T2 DATATABLE='C4I_alt_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.C4I_alt_T2;
SET C4I_alt_T2;
LABEL C4I_alt_T2='Lavorava da [SOLO O EQUIPE] anche in occasione della scorsa intervista?';
FORMAT C4I_alt_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=C4I_old DATATABLE='C4I_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.C4I_old;
SET C4I_old;
LABEL C4I_old='L altra volta ci ha detto che nello svolgimento delle Sue attività di lavoro (nel suo ufficio)  opera da SOLO.   E  cambiato qualcosa dalla volta precedente?';
FORMAT C4I_old SiNoF. ;
RUN;

PROC IMPORT OUT=C7 DATATABLE='C7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Attiv2F
1 = 'La/e stessa/e della volta precedente'
2 = 'Nessun altra attività'
3 = 'Nuove attività'
;
DATA LIB.C7;
SET C7;
LABEL C7='Ci ha detto che svolge anche altre attività retribuite  oltre a quella di cui abbiamo parlato. Di quale o quali attività si tratta?';
FORMAT C7 Attiv2F. ;
RUN;

PROC IMPORT OUT=C7bis_T1 DATATABLE='C7bis_T1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.C7bis_T1;
SET C7bis_T1;
LABEL C7bis_T1='Di quale  o quali  attività NON retribuite si tratta?';
RUN;

PROC IMPORT OUT=C8_T1 DATATABLE='C8_T1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE LuogoA1F
;
DATA LIB.C8_T1;
SET C8_T1;
LABEL C8_T1='In quale comune italiano o in quale Paese (estero) svolge l attività principale?';
FORMAT C8_T1 LuogoA1F. ;
RUN;

PROC IMPORT OUT=C9 DATATABLE='C9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.C9;
SET C9;
LABEL C9='Negli ULTIMI SEI MESI  ha cercato nuovi lavori  pur lavorando già?';
FORMAT C9 SiNoF. ;
RUN;

PROC IMPORT OUT=CDE DATATABLE='CDE' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Luogo2F
1 = 'Nel comune di RESIDENZA'
2 = 'In altro comune della PROVincia di RESIDENZA'
3 = 'In Veneto'
4 = 'In altra regione italiana'
5 = 'All estero'
;
DATA LIB.CDE;
SET CDE;
LABEL CDE='In quale COMUNE italiano o in quale Paese diverso dall Italia lavora?';
FORMAT CDE Luogo2F. ;
RUN;

PROC IMPORT OUT=CDE_A DATATABLE='CDE_A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE settoreF
1 = 'Settore PUBBLICO'
2 = 'Settore PRIVATO (aziende  compreso studio professionale proprio o di soci)'
3 = 'Settore PRIVATO  SOCIALE (terzo settore  non profit)'
4 = 'Azienda a partecipazione statale o municipalizzata'
5 = 'SCUOLA'
;
DATA LIB.CDE_A;
SET CDE_A;
LABEL CDE_A='Lavora prevalentemente nel SETTORE pubblico o privato?';
FORMAT CDE_A settoreF. ;
RUN;

PROC IMPORT OUT=CDE_B DATATABLE='CDE_B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE RamoAttF
1 = 'Alimentare'
2 = 'Carta'
3 = 'Chimico e petrolchimico'
4 = 'Edilizia e costruzioni'
5 = 'Elettronico'
6 = 'Elettromeccanico'
7 = 'Estrattivo'
8 = 'Farmaceutico'
9 = 'Foto-cine  ottica'
10 = 'Giocattoli'
11 = 'Grafica ed editoria'
12 = 'High Tech'
13 = 'Impiantistica'
14 = 'Meccanico'
15 = 'Mobili  industria del legno'
16 = 'Pelli  cuoio  calzature'
17 = 'Petrolifero'
18 = 'Siderurgico  metallurgico'
19 = 'Telecomunicazioni'
20 = 'Tessile e abbigliamento'
21 = 'Altra industria'
22 = 'Bancario (credito)  assicurazioni  servizi finanziari'
23 = 'Commercio  pubblici esercizi  distribuzione organizzata'
24 = 'Consulenza e servizi alle imprese'
25 = 'Informatica  servizi connessi alla Information Technology'
26 = 'Insegnamento'
27 = 'Pubblica amministrazione'
28 = 'Sanitario'
29 = 'Servizi vari di ingegneria'
30 = 'Telecomunicazioni'
31 = 'Trasporti  comunicazioni'
32 = 'Altri servizi'
;
DATA LIB.CDE_B;
SET CDE_B;
LABEL CDE_B='(SE Facoltà di ECONOMIA o INGEGNIERIA).  In quale ramo di attività economica svolge principalmente la Sua attività?';
FORMAT CDE_B RamoAttF. ;
RUN;

PROC IMPORT OUT=CDE_Bbis DATATABLE='CDE_Bbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE_Bbis;
SET CDE_Bbis;
LABEL CDE_Bbis='SPECIFICARE ALTRA INDUSTRIA O SERVIZI';
RUN;

PROC IMPORT OUT=CDE_C DATATABLE='CDE_C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE TipolavoF
1 = 'DIPENDENTE'
2 = 'AUTONOMO'
3 = 'AMBEDUE le direzioni (dipendente e autonomo)'
99 = 'NON ho cercato o mi hanno CONTATTATO (o entro stessa azienda)'
;
DATA LIB.CDE_C;
SET CDE_C;
LABEL CDE_C='Ci può aiutare a capire come si è mosso per la RICERCA di lavoro...ossia si è orientato verso il lavoro .....';
FORMAT CDE_C TipolavoF. ;
RUN;

PROC IMPORT OUT=CDE_cinq DATATABLE='CDE_cinq' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE_cinq;
SET CDE_cinq;
LABEL CDE_cinq='Quale stato prevalentemente?';
RUN;

PROC IMPORT OUT=CDE_D DATATABLE='CDE_D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE motsceltF
1 = 'Non è una mia scelta  mi ci hanno mandato  terminato il precedente contratto  licenziato'
2 = 'Possibilità di guadagno  di carriera  di ascesa sociale'
3 = 'Maggiore stabilità  sicurezza del posto'
4 = 'Acquisizione di professionalità  di responsabilità'
5 = 'Maggiore coerenza con gli studi seguiti'
6 = 'Rispondenza ad interessi culturali  ideali  lavorare in contatto con la gente'
7 = 'Indipendenza e autonomia professionale (di compiti  di ruoli)'
8 = 'Prossimità a domicilio'
9 = 'Solo voglia di cambiare'
10 = 'Altro'
11 = 'Il caso  è stato il primo lavoro che mi hanno offerto'
12 = 'Orario flessibile  part-time'
;
DATA LIB.CDE_D;
SET CDE_D;
LABEL CDE_D='Quale ASPETTO prevalente l ha indotta a scegliere questo lavoro?  (RILEVATORE:  NON  leggere le modalità di risposta)';
FORMAT CDE_D motsceltF. ;
PROC TRANSPOSE OUT=LIB.CDE_D_MCOLS PREFIX=CDE_D_ ;
BY UID TID Block;
VAR CDE_D;
ID CDE_D;
RUN;

PROC IMPORT OUT=CDE_Dbis DATATABLE='CDE_Dbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE_Dbis;
SET CDE_Dbis;
LABEL CDE_Dbis='SPECIFICA  ALTRO';
RUN;

PROC IMPORT OUT=CDE_due DATATABLE='CDE_due' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE_due;
SET CDE_due;
LABEL CDE_due='Quale comune prevalentemente?';
RUN;

PROC IMPORT OUT=CDE_quat DATATABLE='CDE_quat' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE_quat;
SET CDE_quat;
LABEL CDE_quat='Quale regione prevalentemente?';
RUN;

PROC IMPORT OUT=CDE_tre DATATABLE='CDE_tre' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE_tre;
SET CDE_tre;
LABEL CDE_tre='Quale provincia prevalentemente?';
RUN;

PROC IMPORT OUT=CDE1 DATATABLE='CDE1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiglPegF
1 = 'Ha ottenuto sia promozioni (ha cambiato posizione professionale o contrattuali) sia miglioramenti economici'
2 = 'Ha ottenuto solo miglioramenti economici'
3 = 'Stessa posizione professionale  stesso reddito e stesso contratto'
4 = 'Ha perso delle posizioni di carriera'
;
DATA LIB.CDE1;
SET CDE1;
LABEL CDE1='Ha ottenuto PROMOZIONI o miglioramenti ECONOMICI o CONTRATTUALI dall ultima rilevazione  oppure sono successe delle cose negative da questo punto di vista?';
FORMAT CDE1 MiglPegF. ;
RUN;

PROC IMPORT OUT=CDE1_A DATATABLE='CDE1_A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ConsTitF
1 = 'Sì (diretto o indiretto)'
2 = 'No'
3 = 'Non so'
;
DATA LIB.CDE1_A;
SET CDE1_A;
LABEL CDE1_A='I miglioramenti conseguiti sono CONSEGUENZA del TITOLO DI STUDIO acquisito?';
FORMAT CDE1_A ConsTitF. ;
RUN;

PROC IMPORT OUT=CDE1_B DATATABLE='CDE1_B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE1_B;
SET CDE1_B;
LABEL CDE1_B='Per quali motivi ha perso posizioni nella carriera?';
RUN;

PROC IMPORT OUT=CDE1_C DATATABLE='CDE1_C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ContrF
2 = 'SI  con CONTRATTO di lavoro'
1 = 'NO  senza contratto'
;
DATA LIB.CDE1_C;
SET CDE1_C;
LABEL CDE1_C='Siamo interessati a conoscere il tipo di CONTRATTO di lavoro con cui svolge ora l attività. Innanzitutto  ha un contratto di lavoro di qualche tipo o lavora senza contratto  in nero  tanto per capirci? Con noi può parlare liberamente.';
FORMAT CDE1_C ContrF. ;
RUN;

PROC IMPORT OUT=CDE1_D DATATABLE='CDE1_D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE TipoLavF
1 = 'Lavoro DIPENDENTE'
2 = 'Lavoro AUTONOMO'
3 = 'Contratto atipico/parasubordinato'
;
DATA LIB.CDE1_D;
SET CDE1_D;
LABEL CDE1_D='Lavora come DIPendente  come AUTONnomo o in POSIZione ATIPICA  cioè in parte dipendente ed in parte autonoma?';
FORMAT CDE1_D TipoLavF. ;
RUN;

PROC IMPORT OUT=CDE1_E DATATABLE='CDE1_E' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE TemplavoF
1 = 'Lavoro a tempo INDeterminato e tempo PIENO'
2 = 'Lavoro a tempo INDeterminato ma a tempo parziale (part-time)'
3 = 'Lavoro a tempo DETerminato ma PIENO'
4 = 'Lavoro a tempo DETerminato ma parziale'
5 = 'CFL-Contratti di formazione e lavoro'
6 = 'Apprendistato'
7 = 'Altro'
;
DATA LIB.CDE1_E;
SET CDE1_E;
LABEL CDE1_E='Il lavoro è a tempo DETerminato o INDETerminato e  nell uno e nell altro caso  è a TEMPO PIENO o PARZIALE  oppure si tratta di un contratto d ingresso nel mondo del lavoro  tipo CFL o apprendistato?';
FORMAT CDE1_E TemplavoF. ;
RUN;

PROC IMPORT OUT=CDE1_Ebis DATATABLE='CDE1_Ebis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE1_Ebis;
SET CDE1_Ebis;
LABEL CDE1_Ebis='Specificare altro';
RUN;

PROC IMPORT OUT=CDE1_F DATATABLE='CDE1_F' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Posiz2F
1 = 'Dirigente (anche professore universitario  magistrato  ecc.)'
2 = 'Funzionario direttivo  quadro'
3 = 'Insegnante di scuola dell infanzia  di base (elementare e media) o superiore'
4 = 'Impiegato  intermedio'
5 = 'Ricercatore  anche universitario'
6 = 'Operaio  apprendista  lavorante a domicilio  subalterno e assimilati'
7 = 'Socio di cooperativa  studio associato (dove presta opera)'
;
DATA LIB.CDE1_F;
SET CDE1_F;
LABEL CDE1_F='In quale POSIZIONE svolge l attività?';
FORMAT CDE1_F Posiz2F. ;
RUN;

PROC IMPORT OUT=CDE1_G DATATABLE='CDE1_G' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.CDE1_G;
SET CDE1_G;
LABEL CDE1_G='In quale POSIZIONE svolge l attività di lavoro autonomo?';
FORMAT CDE1_G PosizAutF. ;
RUN;

PROC IMPORT OUT=CDE1_Gbis DATATABLE='CDE1_Gbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE1_Gbis;
SET CDE1_Gbis;
LABEL CDE1_Gbis='SPECIFICARE:';
RUN;

PROC IMPORT OUT=CDE1_Gold DATATABLE='CDE1_Gold' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE PosizAut1F
;
DATA LIB.CDE1_Gold;
SET CDE1_Gold;
LABEL CDE1_Gold='In quale POSIZIONE svolge l attività di lavoro autonomo?';
FORMAT CDE1_Gold PosizAut1F. ;
RUN;

PROC IMPORT OUT=CDE1_H DATATABLE='CDE1_H' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE PagasCF
1 = 'Regolarmente lo stesso'
2 = 'Di quando in quando'
3 = 'Alla fine della commessa'
4 = 'Altro'
;
DATA LIB.CDE1_H;
SET CDE1_H;
LABEL CDE1_H='Se non ha alcun tipo di contratto  come la pagano?';
FORMAT CDE1_H PagasCF. ;
RUN;

PROC IMPORT OUT=CDE1_Hbis DATATABLE='CDE1_Hbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE1_Hbis;
SET CDE1_Hbis;
LABEL CDE1_Hbis='Può specificare?';
RUN;

PROC IMPORT OUT=CDE1_I DATATABLE='CDE1_I' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE atipicoF
1 = 'Prestazione OCCASIONALE  lavoro su commessa'
2 = 'Collaborazione COOrdinata e CONTinuativa senza vincolo di subordinazione (prestazione di lavoro autonomo che dura nel tempo)'
3 = 'Contratto di AGENZIA (come  agente )'
4 = 'Socio di cooperativa  studio associato impresa (dove lavora)'
5 = 'Lavoro INTERinale'
6 = 'Telelavoro'
7 = 'Collaborazione retribuita a ricerche  indagini  prospezioni  valutazioni  ecc.'
8 = 'Collaborazione retribuita con enti assistenziali  opere caritatevoli  ecc'
11 = 'Piani d INSERimento professionale (P.I.P.)'
12 = 'Altra posizione'
;
DATA LIB.CDE1_I;
SET CDE1_I;
LABEL CDE1_I='Di quale contratto ATIpico si tratta?';
FORMAT CDE1_I atipicoF. ;
RUN;

PROC IMPORT OUT=CDE1_Ibis DATATABLE='CDE1_Ibis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE1_Ibis;
SET CDE1_Ibis;
LABEL CDE1_Ibis='Quale?';
RUN;

PROC IMPORT OUT=CDE2 DATATABLE='CDE2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Equipe2F
1 = 'Da SOLO  praticamente (escludere segretarie e simili)'
2 = 'In équipe di esperti con le STESSE competenze'
3 = 'In équipe d esperti con DIVERSE competenze'
;
DATA LIB.CDE2;
SET CDE2;
LABEL CDE2='Nello svolgimento delle Sue attività di lavoro (nel Suo ufficio)  opera da SOLO o in EQUIPE di esperti con competenze diverse?';
FORMAT CDE2 Equipe2F. ;
RUN;

PROC IMPORT OUT=CDE2_A DATATABLE='CDE2_A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE difficF
1 = 'SI  difficoltà particolari'
2 = 'NO  difficoltà normali'
;
DATA LIB.CDE2_A;
SET CDE2_A;
LABEL CDE2_A='Lavorando praticamente da SOLO  trova difficoltà particolari a gestire le Sue attività  oppure si tratta di difficoltà normali nel lavoro?';
FORMAT CDE2_A difficF. ;
RUN;

PROC IMPORT OUT=CDE2_ALIAS DATATABLE='CDE2_ALIAS' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE2_ALIAS;
SET CDE2_ALIAS;
LABEL CDE2_ALIAS='L altra volta ci ha detto che nello svolgimento desse Sue attività di lavoro (nel Suo ufficio)  opera...';
RUN;

PROC IMPORT OUT=CDE2_B DATATABLE='CDE2_B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE TitStuEqF
1 = 'Prevalentemente LAUREATI'
2 = 'Più o meno  META  laureati e metà diplomati'
3 = 'Prevalentemente DIPLOMATI'
4 = 'Prevalentemente NON diplomati'
;
DATA LIB.CDE2_B;
SET CDE2_B;
LABEL CDE2_B='Quali TITOLI di studio hanno i colleghi dell équipe?';
FORMAT CDE2_B TitStuEqF. ;
RUN;

PROC IMPORT OUT=CDE2_B1 DATATABLE='CDE2_B1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE2_B1;
SET CDE2_B1;
LABEL CDE2_B1='Ci può dire con QUANTE altre persone lavora [-1 SE NON SA]?';
RUN;

PROC IMPORT OUT=CDE2_C DATATABLE='CDE2_C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE diffic2F
1 = 'SI  difficoltà'
2 = 'NO  normale'
;
DATA LIB.CDE2_C;
SET CDE2_C;
LABEL CDE2_C='Trova difficoltà a lavorare in GRUPPO (per esmpio  a causa di RAPPORTI con colleghi o capi particolarmente difficili  rallentamenti importanti nell azione  ecc.) o rientra tutto nella norma del lavorare in un contesto complesso?';
FORMAT CDE2_C diffic2F. ;
RUN;

PROC IMPORT OUT=CDE2_D DATATABLE='CDE2_D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE FacilitF
1 = 'Facilita lo svolgimento dei compiti'
2 = 'Potrebbe svolgerli da solo'
;
DATA LIB.CDE2_D;
SET CDE2_D;
LABEL CDE2_D='Il lavorare in gruppo facilita i suoi compiti o potrebbe svolgerli tranquillamente da solo?';
FORMAT CDE2_D FacilitF. ;
RUN;

PROC IMPORT OUT=CDE2_E DATATABLE='CDE2_E' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.CDE2_E;
SET CDE2_E;
LABEL CDE2_E='Ha delle persone alle sue dipendenze?';
FORMAT CDE2_E SiNoF. ;
RUN;

PROC IMPORT OUT=CDE2_Ebis DATATABLE='CDE2_Ebis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE2_Ebis;
SET CDE2_Ebis;
LABEL CDE2_Ebis='Quante?';
RUN;

PROC IMPORT OUT=CDE2_F DATATABLE='CDE2_F' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE2_F;
SET CDE2_F;
LABEL CDE2_F='Quante ORE (retribuite) alla settimana le occupa la Sua nuova attività?';
RUN;

PROC IMPORT OUT=CDE2_G DATATABLE='CDE2_G' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.CDE2_G;
SET CDE2_G;
LABEL CDE2_G='Mi può INDICARE qual è la sua RETRIBUZIONE mensile (al NETTO delle trattenute) per questa attività (se in dubbio  fare riferimento all ultimo anno)?  ';
FORMAT CDE2_G RetrmensF. ;
RUN;

PROC IMPORT OUT=CDE2_Gbis DATATABLE='CDE2_Gbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE2_Gbis;
SET CDE2_Gbis;
LABEL CDE2_Gbis='Può specificare?';
RUN;

PROC IMPORT OUT=CDE2_I DATATABLE='CDE2_I' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NaddettiF
1 = 'Fino a 9'
2 = '10-19'
3 = '20-50'
4 = '51-100'
5 = '101-250'
6 = '251-1000'
7 = 'oltre 1000'
8 = 'Non ho proprio idea'
;
DATA LIB.CDE2_I;
SET CDE2_I;
LABEL CDE2_I='Qual è il numero approssimato di ADDETTI dell azienda/ente in cui opera (se l azienda/ente ha più unità locali  cioè stabilimenti  edifici  ecc.  riferirsi all unità locale in cui la persona opera)?';
FORMAT CDE2_I NaddettiF. ;
RUN;

PROC IMPORT OUT=CDE3 DATATABLE='CDE3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Attiv2F
1 = 'La/e stessa/e della volta precedente'
2 = 'Nessun altra attività'
3 = 'Nuove attività'
;
DATA LIB.CDE3;
SET CDE3;
LABEL CDE3='Ci ha detto che svolge anche altre attività retribuite  oltre a quella di cui abbiamo parlato. Di quale o quali attività si tratta?';
FORMAT CDE3 Attiv2F. ;
RUN;

PROC IMPORT OUT=CDE3_A DATATABLE='CDE3_A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.CDE3_A;
SET CDE3_A;
LABEL CDE3_A='Svolge anche ALTRE attività di lavoro oltre a quella sopra descritta?';
FORMAT CDE3_A SiNoF. ;
RUN;

PROC IMPORT OUT=CDE3_B DATATABLE='CDE3_B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ContrF
2 = 'SI  con CONTRATTO di lavoro'
1 = 'NO  senza contratto'
;
DATA LIB.CDE3_B;
SET CDE3_B;
LABEL CDE3_B='Siamo interessati a conoscere il tipo di CONTRATTO di lavoro con cui svolge ora l attività.   Innanzitutto  per questa seconda attività ha un contratto di lavoro di qualche tipo o lavora senza contratto?';
FORMAT CDE3_B ContrF. ;
RUN;

PROC IMPORT OUT=CDE3_C DATATABLE='CDE3_C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE c7cF
1 = 'Lavoro dipendente'
2 = 'Lavoro autonomo'
3 = 'Contratto atipico/subordinato'
;
DATA LIB.CDE3_C;
SET CDE3_C;
LABEL CDE3_C='Lavora come dipendente  come autonomo o in posizione atipica  cioè in parte dipendente e in parte autonoma?';
FORMAT CDE3_C c7cF. ;
RUN;

PROC IMPORT OUT=CDE3_D DATATABLE='CDE3_D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE TemplavF
;
DATA LIB.CDE3_D;
SET CDE3_D;
LABEL CDE3_D='Il lavoro è a tempo indeterminato  a tempo determinato e  nell uno e nell altro caso  a tempo pieno o tempo parziale  oppure si tratta di contratti d ingresso nel mondo del lavoro  tipo CFL o apprendistato?';
FORMAT CDE3_D TemplavF. ;
RUN;

PROC IMPORT OUT=CDE3_Dbis DATATABLE='CDE3_Dbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE3_Dbis;
SET CDE3_Dbis;
LABEL CDE3_Dbis='Specificare ALTRO';
RUN;

PROC IMPORT OUT=CDE3_E DATATABLE='CDE3_E' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Posiz2F
1 = 'Dirigente (anche professore universitario  magistrato  ecc.)'
2 = 'Funzionario direttivo  quadro'
3 = 'Insegnante di scuola dell infanzia  di base (elementare e media) o superiore'
4 = 'Impiegato  intermedio'
5 = 'Ricercatore  anche universitario'
6 = 'Operaio  apprendista  lavorante a domicilio  subalterno e assimilati'
7 = 'Socio di cooperativa  studio associato (dove presta opera)'
;
DATA LIB.CDE3_E;
SET CDE3_E;
LABEL CDE3_E='In quale POSIZIONE svolge l attività?';
FORMAT CDE3_E Posiz2F. ;
RUN;

PROC IMPORT OUT=CDE3_F DATATABLE='CDE3_F' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.CDE3_F;
SET CDE3_F;
LABEL CDE3_F='In quale POSIZIONE svolge l attività?';
FORMAT CDE3_F PosizAutF. ;
RUN;

PROC IMPORT OUT=CDE3_Fbis DATATABLE='CDE3_Fbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE3_Fbis;
SET CDE3_Fbis;
LABEL CDE3_Fbis='SPECIFICARE ALTRO:';
RUN;

PROC IMPORT OUT=CDE3_Fold DATATABLE='CDE3_Fold' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE PosizAut1F
;
DATA LIB.CDE3_Fold;
SET CDE3_Fold;
LABEL CDE3_Fold='In quale POSIZIONE svolge l attività?';
FORMAT CDE3_Fold PosizAut1F. ;
RUN;

PROC IMPORT OUT=CDE3_G DATATABLE='CDE3_G' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE PagasCF
1 = 'Regolarmente lo stesso'
2 = 'Di quando in quando'
3 = 'Alla fine della commessa'
4 = 'Altro'
;
DATA LIB.CDE3_G;
SET CDE3_G;
LABEL CDE3_G='Se non ha alcun tipo di contratto  come la pagano?';
FORMAT CDE3_G PagasCF. ;
RUN;

PROC IMPORT OUT=CDE3_Gbis DATATABLE='CDE3_Gbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE3_Gbis;
SET CDE3_Gbis;
LABEL CDE3_Gbis='Può specificare?';
RUN;

PROC IMPORT OUT=CDE3_H DATATABLE='CDE3_H' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE atipicoF
1 = 'Prestazione OCCASIONALE  lavoro su commessa'
2 = 'Collaborazione COOrdinata e CONTinuativa senza vincolo di subordinazione (prestazione di lavoro autonomo che dura nel tempo)'
3 = 'Contratto di AGENZIA (come  agente )'
4 = 'Socio di cooperativa  studio associato impresa (dove lavora)'
5 = 'Lavoro INTERinale'
6 = 'Telelavoro'
7 = 'Collaborazione retribuita a ricerche  indagini  prospezioni  valutazioni  ecc.'
8 = 'Collaborazione retribuita con enti assistenziali  opere caritatevoli  ecc'
11 = 'Piani d INSERimento professionale (P.I.P.)'
12 = 'Altra posizione'
;
DATA LIB.CDE3_H;
SET CDE3_H;
LABEL CDE3_H='Di quale contratto atipico si tratta?';
FORMAT CDE3_H atipicoF. ;
RUN;

PROC IMPORT OUT=CDE3_Hbis DATATABLE='CDE3_Hbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE3_Hbis;
SET CDE3_Hbis;
LABEL CDE3_Hbis='Quale?';
RUN;

PROC IMPORT OUT=CDL DATATABLE='CDL' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE $CDLF
'c001' = 'Astronomia'
'c002' = 'Scienze Biologiche'
'c003' = 'Scienze Geologiche'
'c004' = 'Scienze Naturali'
'c005' = 'Fisica'
'c006' = 'Matematica'
'c007' = 'Scienza dei  Materiali'
'c008' = 'Chimica'
'c009' = 'Chimica Industriale'
'c010' = 'Biotecnologie'
'c011' = 'Diploma in Informatica'
;
DATA LIB.CDL;
SET CDL;
LABEL CDL='Corso di Laurea';
FORMAT CDL CDLF. ;
RUN;

PROC IMPORT OUT=CORSOAGR DATATABLE='CORSOAGR' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE corsoinF
1 = 'Scienze Agrarie'
2 = 'Scienze e tecnologie agrarie'
3 = 'Scienze forestali'
4 = 'Scienze forestali ed ambientali'
5 = 'Altro'
;
DATA LIB.CORSOAGR;
SET CORSOAGR;
LABEL CORSOAGR='Corso di laurea in...';
FORMAT CORSOAGR corsoinF. ;
RUN;

PROC IMPORT OUT=D1A_old DATATABLE='D1A_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE LuogoA1F
;
DATA LIB.D1A_old;
SET D1A_old;
LABEL D1A_old='In quale comune italiano o in quale Paese (estero) svolge l attività principale?';
FORMAT D1A_old LuogoA1F. ;
RUN;

PROC IMPORT OUT=D9 DATATABLE='D9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE altraAttF
1 = 'Sì  seconda attività di lavoro'
2 = 'Sì  anche tre o quattro lavori'
3 = 'No'
;
DATA LIB.D9;
SET D9;
LABEL D9='Svolge anche una seconda o una terza attività lavorativa OLTRE a quella sopra descritta?';
FORMAT D9 altraAttF. ;
RUN;

PROC IMPORT OUT=E1 DATATABLE='E1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE LretribF
1 = 'No  solo lavoro non retribuito'
2 = 'Sia lavoro retribuito  sia non retribuito'
3 = 'Svolge solo lavoro retribuito'
;
DATA LIB.E1;
SET E1;
LABEL E1='Il lavoro che svolge ATTUALMENTE è retribuito?';
FORMAT E1 LretribF. ;
RUN;

PROC IMPORT OUT=E12 DATATABLE='E12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE motsceltF
1 = 'Non è una mia scelta  mi ci hanno mandato  terminato il precedente contratto  licenziato'
2 = 'Possibilità di guadagno  di carriera  di ascesa sociale'
3 = 'Maggiore stabilità  sicurezza del posto'
4 = 'Acquisizione di professionalità  di responsabilità'
5 = 'Maggiore coerenza con gli studi seguiti'
6 = 'Rispondenza ad interessi culturali  ideali  lavorare in contatto con la gente'
7 = 'Indipendenza e autonomia professionale (di compiti  di ruoli)'
8 = 'Prossimità a domicilio'
9 = 'Solo voglia di cambiare'
10 = 'Altro'
11 = 'Il caso  è stato il primo lavoro che mi hanno offerto'
12 = 'Orario flessibile  part-time'
;
DATA LIB.E12;
SET E12;
LABEL E12='Quali  ASPETTI del Suo lavoro più l hanno portato a sceglierlo? (RILEVATORE:  NON  leggere le modalità di risposta)';
FORMAT E12 motsceltF. ;
PROC TRANSPOSE OUT=LIB.E12_MCOLS PREFIX=E12_ ;
BY UID TID Block;
VAR E12;
ID E12;
RUN;

PROC IMPORT OUT=E12bis DATATABLE='E12bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.E12bis;
SET E12bis;
LABEL E12bis='SPECIFICA  ALTRO';
RUN;

PROC IMPORT OUT=E2 DATATABLE='E2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE primaAttF
1 = 'Primo lavoro'
2 = 'Svolto altre attività lavorative dall ultimo contatto'
;
DATA LIB.E2;
SET E2;
LABEL E2='Questo è il suo PRIMO lavoro  o prima di questo  sempre dall ultima volta  ha svolto anche ALTRE attività lavorative?';
FORMAT E2 primaAttF. ;
RUN;

PROC IMPORT OUT=E2A DATATABLE='E2A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.E2A;
SET E2A;
LABEL E2A='Quali attività lavorative svolgeva PRIMA di questa?';
RUN;

PROC IMPORT OUT=E2B DATATABLE='E2B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ContrF
2 = 'SI  con CONTRATTO di lavoro'
1 = 'NO  senza contratto'
;
DATA LIB.E2B;
SET E2B;
LABEL E2B='Siamo interessati a conoscere il tipo di CONTRATTO di lavoro con cui svolgeva l attività (la principale tra quelle dette  se più d una). Innanzitutto  per questa attività aveva un contratto di lavoro di qualche tipo o lavorava senza contratto  in nero  tanto per capirci? Con noi può parlare liberamente.';
FORMAT E2B ContrF. ;
RUN;

PROC IMPORT OUT=E2C DATATABLE='E2C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE TipoLavF
1 = 'Lavoro DIPENDENTE'
2 = 'Lavoro AUTONOMO'
3 = 'Contratto atipico/parasubordinato'
;
DATA LIB.E2C;
SET E2C;
LABEL E2C='Lavorava come dipendente  come autonomo o in posizione atipica  cioè in parte dipendente e in parte autonoma?';
FORMAT E2C TipoLavF. ;
RUN;

PROC IMPORT OUT=E2D DATATABLE='E2D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE TemplavF
;
DATA LIB.E2D;
SET E2D;
LABEL E2D='Il lavoro era a tempo indeterminato  a tempo determinato e  nell uno e nell altro caso  a tempo pieno o tempo parziale  oppure si trattava di un contratto d ingresso nel mondo del lavoro  tipo CFL o apprendistato?';
FORMAT E2D TemplavF. ;
RUN;

PROC IMPORT OUT=E2Dbis DATATABLE='E2Dbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.E2Dbis;
SET E2Dbis;
LABEL E2Dbis='Può specificare?';
RUN;

PROC IMPORT OUT=E2E DATATABLE='E2E' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Posiz2F
1 = 'Dirigente (anche professore universitario  magistrato  ecc.)'
2 = 'Funzionario direttivo  quadro'
3 = 'Insegnante di scuola dell infanzia  di base (elementare e media) o superiore'
4 = 'Impiegato  intermedio'
5 = 'Ricercatore  anche universitario'
6 = 'Operaio  apprendista  lavorante a domicilio  subalterno e assimilati'
7 = 'Socio di cooperativa  studio associato (dove presta opera)'
;
DATA LIB.E2E;
SET E2E;
LABEL E2E='In quale POSIZIONE svolgeva l attività?';
FORMAT E2E Posiz2F. ;
RUN;

PROC IMPORT OUT=E2F DATATABLE='E2F' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.E2F;
SET E2F;
LABEL E2F='In quale POSIZIONE svolgeva l attività?';
FORMAT E2F PosizAutF. ;
RUN;

PROC IMPORT OUT=E2F_old DATATABLE='E2F_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE PosizAut1F
;
DATA LIB.E2F_old;
SET E2F_old;
LABEL E2F_old='In quale POSIZIONE svolgeva l attività?';
FORMAT E2F_old PosizAut1F. ;
RUN;

PROC IMPORT OUT=E2FA DATATABLE='E2FA' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.E2FA;
SET E2FA;
LABEL E2FA='SPECIFICARE:';
RUN;

PROC IMPORT OUT=E2G DATATABLE='E2G' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE PagasCF
1 = 'Regolarmente lo stesso'
2 = 'Di quando in quando'
3 = 'Alla fine della commessa'
4 = 'Altro'
;
DATA LIB.E2G;
SET E2G;
LABEL E2G='Se non aveva alcun tipo di contratto  come la pagavano?';
FORMAT E2G PagasCF. ;
RUN;

PROC IMPORT OUT=E2Gbis DATATABLE='E2Gbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.E2Gbis;
SET E2Gbis;
LABEL E2Gbis='Può specificare?';
RUN;

PROC IMPORT OUT=E2H DATATABLE='E2H' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE atipicoF
1 = 'Prestazione OCCASIONALE  lavoro su commessa'
2 = 'Collaborazione COOrdinata e CONTinuativa senza vincolo di subordinazione (prestazione di lavoro autonomo che dura nel tempo)'
3 = 'Contratto di AGENZIA (come  agente )'
4 = 'Socio di cooperativa  studio associato impresa (dove lavora)'
5 = 'Lavoro INTERinale'
6 = 'Telelavoro'
7 = 'Collaborazione retribuita a ricerche  indagini  prospezioni  valutazioni  ecc.'
8 = 'Collaborazione retribuita con enti assistenziali  opere caritatevoli  ecc'
11 = 'Piani d INSERimento professionale (P.I.P.)'
12 = 'Altra posizione'
;
DATA LIB.E2H;
SET E2H;
LABEL E2H='Di quale contratto atipico si trattava?';
FORMAT E2H atipicoF. ;
RUN;

PROC IMPORT OUT=E2Hbis DATATABLE='E2Hbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.E2Hbis;
SET E2Hbis;
LABEL E2Hbis='Quale ALTRA POSIZIONE?';
RUN;

PROC IMPORT OUT=E3 DATATABLE='E3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ConclusF
10 = 'Semplice VOGLIA di cambiare'
3 = 'DISTANZA eccessiva  impegno orario eccessivo'
4 = 'REDDITO inadeguato  sistema premiante scarso'
5 = 'MANSIONI professionali basse  prospettive di CARRIERA scarse  mancata legittimazione del ruolo professionale'
8 = 'Lavoro INSTABILE  mancanza di sicurezza'
2 = 'Impegni FAMIGLIARI sopraggiunti'
9 = 'RAPPORTI inadeguati con colleghi e/o superiori  ambiente negativo'
7 = 'SCADENZA del contratto  senza possibilità di proseguimento retribuita'
1 = 'Servizio MILITARE  obiezione di coscienza'
6 = 'LICENZIAMENTO  decisione aziendale'
11 = 'Altro'
;
DATA LIB.E3;
SET E3;
LABEL E3='Quali sono i motivi principali per cui si è CONCLUSA la PRECEDENTE attività lavorativa (non più di due)?';
FORMAT E3 ConclusF. ;
PROC TRANSPOSE OUT=LIB.E3_MCOLS PREFIX=E3_ ;
BY UID TID Block;
VAR E3;
ID E3;
RUN;

PROC IMPORT OUT=E3A DATATABLE='E3A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE meseF
1 = 'gennaio'
2 = 'febbraio'
3 = 'marzo'
4 = 'aprile'
5 = 'maggio'
6 = 'giugno'
7 = 'luglio'
8 = 'agosto'
9 = 'settembre'
10 = 'ottobre'
11 = 'novembre'
12 = 'dicembre'
;
DATA LIB.E3A;
SET E3A;
LABEL E3A='In quale mese ha  CONCLUSO  la precedente attività lavorativa?';
FORMAT E3A meseF. ;
RUN;

PROC IMPORT OUT=E3bis DATATABLE='E3bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.E3bis;
SET E3bis;
LABEL E3bis='SPECIFICA  ALTRO';
RUN;

PROC IMPORT OUT=E4 DATATABLE='E4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE meseF
1 = 'gennaio'
2 = 'febbraio'
3 = 'marzo'
4 = 'aprile'
5 = 'maggio'
6 = 'giugno'
7 = 'luglio'
8 = 'agosto'
9 = 'settembre'
10 = 'ottobre'
11 = 'novembre'
12 = 'dicembre'
;
DATA LIB.E4;
SET E4;
LABEL E4='In quale mese ha  INIZIATO  la nuova attività?';
FORMAT E4 meseF. ;
RUN;

PROC IMPORT OUT=F1A DATATABLE='F1A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.F1A;
SET F1A;
LABEL F1A='Nel periodo successivo al conseguimento del titolo  ha svolto attività lavorative RETRIBUITE?';
FORMAT F1A SiNoF. ;
RUN;

PROC IMPORT OUT=F1B DATATABLE='F1B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.F1B;
SET F1B;
LABEL F1B='Nel periodo successivo all ultimo contatto  ha svolto attività lavorative RETRIBUITE?';
FORMAT F1B SiNoF. ;
RUN;

PROC IMPORT OUT=F1B_alt1_T2 DATATABLE='F1B_alt1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.F1B_alt1_T2;
SET F1B_alt1_T2;
LABEL F1B_alt1_T2='Nel periodo successivo all ultimo contatto  ha svolto attività lavorative retribuite?';
FORMAT F1B_alt1_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=F1B_alt2_T2 DATATABLE='F1B_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.F1B_alt2_T2;
SET F1B_alt2_T2;
LABEL F1B_alt2_T2='Dalla laurea  ha svolto attività retribuite?';
FORMAT F1B_alt2_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=F1B_alt3_T2 DATATABLE='F1B_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.F1B_alt3_T2;
SET F1B_alt3_T2;
LABEL F1B_alt3_T2='Dalla laurea  ha svolto attività lavorative retribuite?';
FORMAT F1B_alt3_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=F1C_alt1_T2 DATATABLE='F1C_alt1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.F1C_alt1_T2;
SET F1C_alt1_T2;
LABEL F1C_alt1_T2='E dalla laurea?';
FORMAT F1C_alt1_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=F1C_alt2_T2 DATATABLE='F1C_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.F1C_alt2_T2;
SET F1C_alt2_T2;
LABEL F1C_alt2_T2='E negli ultimi sei mesi  cioè dall ultimo contatto?';
FORMAT F1C_alt2_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=F1C_alt3_T2 DATATABLE='F1C_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE meseF
1 = 'gennaio'
2 = 'febbraio'
3 = 'marzo'
4 = 'aprile'
5 = 'maggio'
6 = 'giugno'
7 = 'luglio'
8 = 'agosto'
9 = 'settembre'
10 = 'ottobre'
11 = 'novembre'
12 = 'dicembre'
;
DATA LIB.F1C_alt3_T2;
SET F1C_alt3_T2;
LABEL F1C_alt3_T2='L ultima volta che è capitato che mese era?';
FORMAT F1C_alt3_T2 meseF. ;
RUN;

PROC IMPORT OUT=F2 DATATABLE='F2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.F2;
SET F2;
LABEL F2='Quali attività ha svolto?';
RUN;

PROC IMPORT OUT=F2A DATATABLE='F2A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE durAttF
1 = 'Meno di un mese'
2 = '1-2 mesi'
3 = '3-4 mesi'
4 = 'da 5 a meno di 6 mesi'
;
DATA LIB.F2A;
SET F2A;
LABEL F2A='Complessivamente  quanti MESI sono durate queste attività?';
FORMAT F2A durAttF. ;
RUN;

PROC IMPORT OUT=F3 DATATABLE='F3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Concl2F
;
DATA LIB.F3;
SET F3;
LABEL F3='Quali sono i MOTIVI principali per cui ha lasciato/concluso l ultimo di questi lavori (non più di due)?';
FORMAT F3 Concl2F. ;
PROC TRANSPOSE OUT=LIB.F3_MCOLS PREFIX=F3_ ;
BY UID TID Block;
VAR F3;
ID F3;
RUN;

PROC IMPORT OUT=F3bis DATATABLE='F3bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.F3bis;
SET F3bis;
LABEL F3bis='Può specificare?';
RUN;

PROC IMPORT OUT=F4 DATATABLE='F4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.F4;
SET F4;
LABEL F4='Durante gli ultimi sei mesi ha CERCATO lavoro (in qualsiasi modo)?';
FORMAT F4 SiNoF. ;
RUN;

PROC IMPORT OUT=F5 DATATABLE='F5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ricerlavF
1 = 'NO  per ora non è nei piani'
2 = 'SI  dopo malattia/maternità/viaggio'
3 = 'SI  dopo servizio di leva o servizio civile'
4 = 'SI  a breve'
;
DATA LIB.F5;
SET F5;
LABEL F5='Pensa di CERCARE lavoro nel prossimo futuro?';
FORMAT F5 ricerlavF. ;
RUN;

PROC IMPORT OUT=FAC DATATABLE='FAC' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.FAC;
SET FAC;
LABEL FAC='Facolta';
FORMAT FAC FacoltaF. ;
RUN;

PROC IMPORT OUT=FGH6 DATATABLE='FGH6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.FGH6;
SET FGH6;
LABEL FGH6='Negli ultimi sei mesi  ha RIFIUTATO dei lavori che Le sono stati offerti?';
FORMAT FGH6 SiNoF. ;
RUN;

PROC IMPORT OUT=FGH7 DATATABLE='FGH7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.FGH7;
SET FGH7;
LABEL FGH7='Di quali lavori si trattava?';
RUN;

PROC IMPORT OUT=FGH8 DATATABLE='FGH8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE motivrifF
1 = 'In quel momento avevo già un lavoro'
2 = 'Non erano interessanti'
3 = 'Non erano stabili  erano precarie  a tempo definito'
4 = 'Non erano coerenti con l indirizzo degli studi'
5 = 'Non erano adeguati al titolo di studio conseguito'
6 = 'Erano localizzate lontano da casa  in posti disagiati'
7 = 'Volevo continuare gli studi'
8 = 'Altri motivi'
9 = 'Reddito inadeguato  insufficiente'
10 = 'Leva o servizio civile'
;
DATA LIB.FGH8;
SET FGH8;
LABEL FGH8='Per quali MOTIVI prevalenti ha rifiutato questi lavori (al massimo due risposte)?';
FORMAT FGH8 motivrifF. ;
PROC TRANSPOSE OUT=LIB.FGH8_MCOLS PREFIX=FGH8_ ;
BY UID TID Block;
VAR FGH8;
ID FGH8;
RUN;

PROC IMPORT OUT=FGH8bis DATATABLE='FGH8bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.FGH8bis;
SET FGH8bis;
LABEL FGH8bis='SPECIFICA ALTRO';
RUN;

PROC IMPORT OUT=FGHL6alt23_T2 DATATABLE='FGHL6alt23_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.FGHL6alt23_T2;
SET FGHL6alt23_T2;
LABEL FGHL6alt23_T2='Nelle ricerche di lavoro svolte dalla laurea in avanti ha rifutato dei lavori che le sono stati offerti?';
FORMAT FGHL6alt23_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=FGHL6x1_T2 DATATABLE='FGHL6x1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.FGHL6x1_T2;
SET FGHL6x1_T2;
LABEL FGHL6x1_T2='E in tutte le ricerche svolte dalla laurea?';
FORMAT FGHL6x1_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=FGHL6x2_T2 DATATABLE='FGHL6x2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.FGHL6x2_T2;
SET FGHL6x2_T2;
LABEL FGHL6x2_T2='E negli ultimi 6 mesi?';
FORMAT FGHL6x2_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=FGHL6x3_T2 DATATABLE='FGHL6x3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE meseF
1 = 'gennaio'
2 = 'febbraio'
3 = 'marzo'
4 = 'aprile'
5 = 'maggio'
6 = 'giugno'
7 = 'luglio'
8 = 'agosto'
9 = 'settembre'
10 = 'ottobre'
11 = 'novembre'
12 = 'dicembre'
;
DATA LIB.FGHL6x3_T2;
SET FGHL6x3_T2;
LABEL FGHL6x3_T2='L ultima volta che è capitato  che mese era?';
FORMAT FGHL6x3_T2 meseF. ;
RUN;

PROC IMPORT OUT=G1 DATATABLE='G1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE meseF
1 = 'gennaio'
2 = 'febbraio'
3 = 'marzo'
4 = 'aprile'
5 = 'maggio'
6 = 'giugno'
7 = 'luglio'
8 = 'agosto'
9 = 'settembre'
10 = 'ottobre'
11 = 'novembre'
12 = 'dicembre'
;
DATA LIB.G1;
SET G1;
LABEL G1='In quale mese ha CONCLUSO questa attività?';
FORMAT G1 meseF. ;
RUN;

PROC IMPORT OUT=G2 DATATABLE='G2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE motconclF
1 = 'Attività non coerente con l indirizzo degli studi'
2 = 'Attività non adeguata al titolo di studio conseguito'
3 = 'Contratto di lavoro insoddisfacente'
4 = 'Distanza eccessiva da casa'
5 = 'Impegno orario eccessivo'
6 = 'Impegni familiari sopraggiunti'
7 = 'Lavoro instabile  mancanza di sicurezza'
8 = 'Licenziamento  scadenza del contratto  senza possibilità di proseguimento (anche non pagata)  decisione aziendale'
9 = 'Mansioni professionali basse  prospettive di carriera scarse  mancata legittimazione del ruolo professionale'
10 = 'Rapporti inadeguati con colleghi e/o superiori  ambiente negativo'
11 = 'Reddito inadeguato  sistema premiante scarso'
12 = 'Scadenza del contratto  senza possibilità di proseguimento retribuita'
13 = 'Semplice voglia di cambiare'
14 = 'Servizio militare  obiezione di coscienza'
15 = 'ALTRO'
16 = 'Per completare un percorso formativo(STAGE  TIROCINO  ESAME DI STATO)'
;
DATA LIB.G2;
SET G2;
LABEL G2='Quali sono i MOTIVI principali per cui ha lasciato/concluso la precedente attività lavorativa (non più di due)?';
FORMAT G2 motconclF. ;
PROC TRANSPOSE OUT=LIB.G2_MCOLS PREFIX=G2_ ;
BY UID TID Block;
VAR G2;
ID G2;
RUN;

PROC IMPORT OUT=G2bis DATATABLE='G2bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.G2bis;
SET G2bis;
LABEL G2bis='SPECIFICA  ALTRO';
RUN;

PROC IMPORT OUT=G3 DATATABLE='G3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.G3;
SET G3;
LABEL G3='Da quando ha lasciato il lavoro  ne ha CERCATO un altro?';
FORMAT G3 SiNoF. ;
RUN;

PROC IMPORT OUT=G3A DATATABLE='G3A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.G3A;
SET G3A;
LABEL G3A='Da quando ha lasciato il lavoro  ha svolto attività retribuite?';
FORMAT G3A SiNoF. ;
RUN;

PROC IMPORT OUT=G3B DATATABLE='G3B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.G3B;
SET G3B;
LABEL G3B='Quali attività ha svolto?';
RUN;

PROC IMPORT OUT=G3C DATATABLE='G3C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE durAttF
1 = 'Meno di un mese'
2 = '1-2 mesi'
3 = '3-4 mesi'
4 = 'da 5 a meno di 6 mesi'
;
DATA LIB.G3C;
SET G3C;
LABEL G3C='Complessivamente  quanti MESI sono durate queste attività?';
FORMAT G3C durAttF. ;
RUN;

PROC IMPORT OUT=G4 DATATABLE='G4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ricerlavF
1 = 'NO  per ora non è nei piani'
2 = 'SI  dopo malattia/maternità/viaggio'
3 = 'SI  dopo servizio di leva o servizio civile'
4 = 'SI  a breve'
;
DATA LIB.G4;
SET G4;
LABEL G4='Pensa di CERCARE lavoro nel prossimo futuro?';
FORMAT G4 ricerlavF. ;
RUN;

PROC IMPORT OUT=H1 DATATABLE='H1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Cosafa3F
0 = 'STESSA attività rilevata al contatto precedente'
1 = 'NUOVA attività'
;
DATA LIB.H1;
SET H1;
LABEL H1='Di quale  o quali attività si tratta (cosa fa)?';
FORMAT H1 Cosafa3F. ;
RUN;

PROC IMPORT OUT=H1bis DATATABLE='H1bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.H1bis;
SET H1bis;
LABEL H1bis='Quale ATTIVITA ?';
RUN;

PROC IMPORT OUT=H2 DATATABLE='H2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE accordoF
1 = 'Lavoro non retribuito su commessa  nell ambito di un progetto'
2 = 'Collaborazione volontaria non retribuita con docenti  esperti  professionisti ..'
3 = 'Collaborazione volontaria con enti assistenziali  ospedali (anche internazionale)  ecc.'
4 = 'Stage post lauream'
5 = 'Tirocinio/praticantato obbligatorio per l ammissione all esame di Stato'
6 = 'Coadiuvante in azienda familiare'
7 = 'Nessun tipo di contratto'
8 = 'Altro'
;
DATA LIB.H2;
SET H2;
LABEL H2='E  legato da un accordo stabile con il datore di lavoro?';
FORMAT H2 accordoF. ;
RUN;

PROC IMPORT OUT=H2bis DATATABLE='H2bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.H2bis;
SET H2bis;
LABEL H2bis='Può specificare?';
RUN;

PROC IMPORT OUT=H3 DATATABLE='H3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.H3;
SET H3;
LABEL H3='Da quanti MESI dura questa attività?';
RUN;

PROC IMPORT OUT=H3A DATATABLE='H3A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE volontF
1 = 'Gratificazione personale'
2 = 'Volontà di acquisire professionalità'
3 = 'Prospettiva di futura assunzione'
4 = 'Altro'
;
DATA LIB.H3A;
SET H3A;
LABEL H3A='Oltre alle OVVIE ragioni etiche ed ideali  che COSA la spinge a svolgere attività di volontariato? (una sola risposta)';
FORMAT H3A volontF. ;
RUN;

PROC IMPORT OUT=H3Abis DATATABLE='H3Abis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.H3Abis;
SET H3Abis;
LABEL H3Abis='Può specificare?';
RUN;

PROC IMPORT OUT=H4 DATATABLE='H4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.H4;
SET H4;
LABEL H4='Dall ultimo contatto (negli ultimi sei mesi)  ha svolto azioni per la RICERCA di LAVORO retribuito?';
FORMAT H4 SiNoF. ;
RUN;

PROC IMPORT OUT=H5 DATATABLE='H5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE futuroF
1 = 'Penso di proseguire senza retribuzione'
2 = 'Mi hanno promesso che cominceranno a pagarmi'
3 = 'Aspetto l espletamento di un concorso'
4 = 'Aspetto d iniziare un nuovo corso di studi (dottorato  master ecc.)'
5 = 'Penso di cercare un lavoro retribuito'
6 = 'Altro'
;
DATA LIB.H5;
SET H5;
LABEL H5='Cosa pensa di fare nel prossimo futuro  diciamo nei PROSSIMI 6 mesi? Pensa di proseguire in questa attività o di cercare un attività diversa?';
FORMAT H5 futuroF. ;
RUN;

PROC IMPORT OUT=H5A DATATABLE='H5A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE senzapagF
1 = 'Sto aspettando un posto  avendo vinto un concorso  una borsa  o altro'
2 = 'Intanto acquisisco esperienza  vedrò cosa mi si presenta'
3 = 'Prospettato futura assunzione'
4 = 'Altro'
;
DATA LIB.H5A;
SET H5A;
LABEL H5A='Perchè accetta di lavorare senza essere pagato?';
FORMAT H5A senzapagF. ;
RUN;

PROC IMPORT OUT=H5Abis DATATABLE='H5Abis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.H5Abis;
SET H5Abis;
LABEL H5Abis='Può specificare?';
RUN;

PROC IMPORT OUT=H5bis DATATABLE='H5bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.H5bis;
SET H5bis;
LABEL H5bis='Può specificare?';
RUN;

PROC IMPORT OUT=I1 DATATABLE='I1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.I1;
SET I1;
LABEL I1='Negli ULTIMI 6 MESI ha svolto (altre) attività di STUDIO  o QUALIFICAZIONE professionale  o uno STAGE?';
FORMAT I1 SiNoF. ;
RUN;

PROC IMPORT OUT=I1_old DATATABLE='I1_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE altreattF
1 = 'No'
2 = 'Sì  esattamente le stesse rilevate la volta precedente'
3 = 'Sì  nuova/e attività'
;
DATA LIB.I1_old;
SET I1_old;
LABEL I1_old='Negli ULTIMI 6 MESI ha svolto (altre) attività di STUDIO  o QUALIFICAZIONE professionale  o uno STAGE?';
FORMAT I1_old altreattF. ;
RUN;

PROC IMPORT OUT=I1B DATATABLE='I1B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE tirocF
1 = 'Sì  concluso'
2 = 'Sì  in corso'
3 = 'No'
;
DATA LIB.I1B;
SET I1B;
LABEL I1B='Sta svolgendo o ha svolto (negli ultimi 6 mesi)  TIROCINIO/PRATICANTATO per l ammissione all esame di Stato?';
FORMAT I1B tirocF. ;
RUN;

PROC IMPORT OUT=I1B_alt3_T2 DATATABLE='I1B_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1B_alt3_T2;
SET I1B_alt3_T2;
LABEL I1B_alt3_T2='TIROCINIO/PRATICANTATO per l ammissione all esame di Stato';
FORMAT I1B_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1B1 DATATABLE='I1B1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE I1B1F
1 = 'Avvocato'
2 = 'Notaio'
;
DATA LIB.I1B1;
SET I1B1;
LABEL I1B1='Che tipo di PRATICANTATO?';
FORMAT I1B1 I1B1F. ;
RUN;

PROC IMPORT OUT=I1B1B DATATABLE='I1B1B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE pagagiuF
1 = 'Nessuna retribuzione'
2 = 'Mensa  buoni pasto'
3 = 'Meno di 200 Euro'
4 = 'Da 201 a 300 Euro'
5 = 'Da 301 a 400 Euro'
6 = 'Da 401 a 500 Euro'
7 = 'Da 501 a 600 Euro'
8 = 'Da 601 a 700 Euro'
9 = 'Da 701 a 800 Euro'
10 = 'Da 801 a 900 Euro'
11 = 'Da 901 a 1000 Euro'
12 = 'Da  1001 a 1250 Euro'
13 = 'Da  1251 a 1500 Euro'
14 = 'Da  1501 a 2000 Euro'
15 = 'Da  2001  e più'
;
DATA LIB.I1B1B;
SET I1B1B;
LABEL I1B1B='Mi può dire se la retribuiscono in qualche modo';
FORMAT I1B1B pagagiuF. ;
RUN;

PROC IMPORT OUT=I1bis_T2 DATATABLE='I1bis_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.I1bis_T2;
SET I1bis_T2;
LABEL I1bis_T2='E nei 6 MESI PRECedenti aveva svolto ATTIVITA  DI STUDIO simile?';
FORMAT I1bis_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=I1C DATATABLE='I1C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE stageF
1 = 'Sì  concluso'
2 = 'Concluso uno stage  ne ha iniziato un altro'
3 = 'Sì  in corso'
4 = 'No'
;
DATA LIB.I1C;
SET I1C;
LABEL I1C='Sta svolgendo o ha svolto( negli ultimi 6 mesi) STAGE POST LAUREAM(organizzato dall UNIVersità)';
FORMAT I1C stageF. ;
RUN;

PROC IMPORT OUT=I1C_alt3_T2 DATATABLE='I1C_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1C_alt3_T2;
SET I1C_alt3_T2;
LABEL I1C_alt3_T2='STAGE POST LAUREAM (organizzato dall UNIVersità)';
FORMAT I1C_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1D DATATABLE='I1D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE corsoF
1 = 'Sì  concluso'
2 = 'Concluso un corso  ne ha iniziato un altro'
3 = 'Sì  in corso'
4 = 'No'
;
DATA LIB.I1D;
SET I1D;
LABEL I1D='Negli ultimi 6 mesi si è iscritto ad un <br>Corso di studi universitario (altra LAUREA o DIPLOMA)';
FORMAT I1D corsoF. ;
RUN;

PROC IMPORT OUT=I1D_alt3_T2 DATATABLE='I1D_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1D_alt3_T2;
SET I1D_alt3_T2;
LABEL I1D_alt3_T2='Corso di studi universitario (altra LAUREA o DIPLOMA)';
FORMAT I1D_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1E DATATABLE='I1E' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE tirocF
1 = 'Sì  concluso'
2 = 'Sì  in corso'
3 = 'No'
;
DATA LIB.I1E;
SET I1E;
LABEL I1E='Sta svolgendo un DOTTORATO di ricerca';
FORMAT I1E tirocF. ;
RUN;

PROC IMPORT OUT=I1E_alt3_T2 DATATABLE='I1E_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1E_alt3_T2;
SET I1E_alt3_T2;
LABEL I1E_alt3_T2='DOTTORATO di ricerca';
FORMAT I1E_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1F DATATABLE='I1F' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE I1FF
1 = 'Si  concluso '
2 = 'Si  in corso'
3 = 'No'
;
DATA LIB.I1F;
SET I1F;
LABEL I1F='Sta svolgendo o ha svolto  Attività sostenuta da BORSA o ASSEGNO di studio o di ricerca (anche post-dottorato)';
FORMAT I1F I1FF. ;
RUN;

PROC IMPORT OUT=I1F_alt3_T2 DATATABLE='I1F_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1F_alt3_T2;
SET I1F_alt3_T2;
LABEL I1F_alt3_T2='Attività sostenuta da BORSA o ASSEGNO di studio o di ricerca (anche post-dottorato)';
FORMAT I1F_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1G DATATABLE='I1G' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scuolaF
1 = 'Sì  conclusa'
2 = 'Sì  in corso'
3 = 'No'
;
DATA LIB.I1G;
SET I1G;
LABEL I1G='Sta svolgendo una SCUOLA di SPECIALIZZAZIONE post lauream';
FORMAT I1G scuolaF. ;
RUN;

PROC IMPORT OUT=I1G_alt3_T2 DATATABLE='I1G_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1G_alt3_T2;
SET I1G_alt3_T2;
LABEL I1G_alt3_T2='SCUOLA di SPECIALIZZAZIONE post lauream';
FORMAT I1G_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1H DATATABLE='I1H' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE tirocF
1 = 'Sì  concluso'
2 = 'Sì  in corso'
3 = 'No'
;
DATA LIB.I1H;
SET I1H;
LABEL I1H='Sta svolgendo un MASTER o corso di perfezionamento (anche all estero)';
FORMAT I1H tirocF. ;
RUN;

PROC IMPORT OUT=I1H_alt3_T2 DATATABLE='I1H_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1H_alt3_T2;
SET I1H_alt3_T2;
LABEL I1H_alt3_T2='MASTER o corso di perfezionamento (anche all estero)';
FORMAT I1H_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1I DATATABLE='I1I' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE corsoF
1 = 'Sì  concluso'
2 = 'Concluso un corso  ne ha iniziato un altro'
3 = 'Sì  in corso'
4 = 'No'
;
DATA LIB.I1I;
SET I1I;
LABEL I1I='Sta svolgendo un Corso di formazione del FONDO  SOCIALE  EUROPEO';
FORMAT I1I corsoF. ;
RUN;

PROC IMPORT OUT=I1I_alt3_T2 DATATABLE='I1I_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1I_alt3_T2;
SET I1I_alt3_T2;
LABEL I1I_alt3_T2='Corso di formazione del FONDO  SOCIALE  EUROPEO';
FORMAT I1I_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1J DATATABLE='I1J' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE corsoF
1 = 'Sì  concluso'
2 = 'Concluso un corso  ne ha iniziato un altro'
3 = 'Sì  in corso'
4 = 'No'
;
DATA LIB.I1J;
SET I1J;
LABEL I1J='Sta svolgendo un Altro CORSO di formazione professionale promosso<br> da ente PUBBLICO (Regione  provincia  comunque NON svolto solo internamente ad aziende)';
FORMAT I1J corsoF. ;
RUN;

PROC IMPORT OUT=I1J_alt3_T2 DATATABLE='I1J_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1J_alt3_T2;
SET I1J_alt3_T2;
LABEL I1J_alt3_T2='Altro CORSO di formazione professionale promosso da ente PUBBLICO (Regione  provincia  comunque NON svolto solo internamente ad aziende)';
FORMAT I1J_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1K DATATABLE='I1K' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE corsoF
1 = 'Sì  concluso'
2 = 'Concluso un corso  ne ha iniziato un altro'
3 = 'Sì  in corso'
4 = 'No'
;
DATA LIB.I1K;
SET I1K;
LABEL I1K='Sta svolgendo o ha svolto negli ultimi 6 mesi un Corso/i di LINGUA straniera';
FORMAT I1K corsoF. ;
RUN;

PROC IMPORT OUT=I1K_alt3_T2 DATATABLE='I1K_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1K_alt3_T2;
SET I1K_alt3_T2;
LABEL I1K_alt3_T2='Corso/i di LINGUA straniera';
FORMAT I1K_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1L DATATABLE='I1L' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE corsoF
1 = 'Sì  concluso'
2 = 'Concluso un corso  ne ha iniziato un altro'
3 = 'Sì  in corso'
4 = 'No'
;
DATA LIB.I1L;
SET I1L;
LABEL I1L='Sta svolgendo o ha svolto negli ultimi 6 mesi un Corso/i di INFORMATICA';
FORMAT I1L corsoF. ;
RUN;

PROC IMPORT OUT=I1L_alt3_T2 DATATABLE='I1L_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1L_alt3_T2;
SET I1L_alt3_T2;
LABEL I1L_alt3_T2='Corso/i di INFORMATICA';
FORMAT I1L_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1M DATATABLE='I1M' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE corsoF
1 = 'Sì  concluso'
2 = 'Concluso un corso  ne ha iniziato un altro'
3 = 'Sì  in corso'
4 = 'No'
;
DATA LIB.I1M;
SET I1M;
LABEL I1M='Sta svolgendo o ha svolto negli ultimi 6 mesi un Corso/i AZIENDALE /i interno/i in genere  affiancamento a personale interno';
FORMAT I1M corsoF. ;
RUN;

PROC IMPORT OUT=I1M_alt3_T2 DATATABLE='I1M_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1M_alt3_T2;
SET I1M_alt3_T2;
LABEL I1M_alt3_T2='Corso/i AZIENDALE /i interno/i in genere  affiancamento a personale interno';
FORMAT I1M_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1N DATATABLE='I1N' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scuolaF
1 = 'Sì  conclusa'
2 = 'Sì  in corso'
3 = 'No'
;
DATA LIB.I1N;
SET I1N;
LABEL I1N='Sta svolgendo o ha svolto negli ultimi 6 mesi ALTRA ATTIVITA  di qualificazione professionale';
FORMAT I1N scuolaF. ;
RUN;

PROC IMPORT OUT=I1N_alt3_T2 DATATABLE='I1N_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE alt3F
1 = 'Sì  negli ultimi sei mesi'
2 = 'Sì. nei sei mesi precedenti'
3 = 'Sì  per tutti i dodici mesi  o a cavallo'
4 = 'No'
;
DATA LIB.I1N_alt3_T2;
SET I1N_alt3_T2;
LABEL I1N_alt3_T2='ALTRA ATTIVITA  di qualificazione professionale';
FORMAT I1N_alt3_T2 alt3F. ;
RUN;

PROC IMPORT OUT=I1N1bis_T2 DATATABLE='I1N1bis_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.I1N1bis_T2;
SET I1N1bis_T2;
LABEL I1N1bis_T2='Quale?';
RUN;

PROC IMPORT OUT=I1N2bis_T2 DATATABLE='I1N2bis_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.I1N2bis_T2;
SET I1N2bis_T2;
LABEL I1N2bis_T2='Quale?';
RUN;

PROC IMPORT OUT=I1N3bis_T2 DATATABLE='I1N3bis_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.I1N3bis_T2;
SET I1N3bis_T2;
LABEL I1N3bis_T2='Quale?';
RUN;

PROC IMPORT OUT=I1Ndue DATATABLE='I1Ndue' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.I1Ndue;
SET I1Ndue;
LABEL I1Ndue='Quale?';
RUN;

PROC IMPORT OUT=I1Nuno DATATABLE='I1Nuno' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.I1Nuno;
SET I1Nuno;
LABEL I1Nuno='Quale?';
RUN;

PROC IMPORT OUT=I1P DATATABLE='I1P' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.I1P;
SET I1P;
LABEL I1P='[SE STA SVOLGENDO O HA CONCLUSO QUALCHE ATTIVITA  DI STUDIO DOPO L UNIVERSITA ]<br>  Perchè ha ritenuto utile continuare a studiare dopo l Università?';
RUN;

PROC IMPORT OUT=I2 DATATABLE='I2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.I2;
SET I2;
LABEL I2='Sente la necessità di ULTERIORE formazione   (a breve termine)?';
FORMAT I2 SiNoF. ;
RUN;

PROC IMPORT OUT=I2bis DATATABLE='I2bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.I2bis;
SET I2bis;
LABEL I2bis='QUALE IN PARTICOLARE';
RUN;

PROC IMPORT OUT=J1 DATATABLE='J1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J1;
SET J1;
LABEL J1='Su una scala da 1 (minimo) a 10 (massimo)  quanto è SODDISFATTO del Suo LAVORO attuale?';
FORMAT J1 scalaF. ;
RUN;

PROC IMPORT OUT=J1_alt1_T2 DATATABLE='J1_alt1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J1_alt1_T2;
SET J1_alt1_T2;
LABEL J1_alt1_T2='Quanto è SODDISFATTO del Suo lavoro ATTuale  per niente  poco  abbastanza  o molto?';
FORMAT J1_alt1_T2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=J1_alt2_T2 DATATABLE='J1_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1avF
;
DATA LIB.J1_alt2_T2;
SET J1_alt2_T2;
LABEL J1_alt2_T2='Su una scala da 1 a 5  quanto è SODDISFATTO del Suo lavoro ATTuale?';
FORMAT J1_alt2_T2 scala1avF. ;
RUN;

PROC IMPORT OUT=J1_T1 DATATABLE='J1_T1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J1_T1;
SET J1_T1;
LABEL J1_T1='Su una scala da 1 (minimo) a 10 (massimo)  quanto è SODDISFATTO del Suo LAVORO attuale?';
FORMAT J1_T1 scalaF. ;
RUN;

PROC IMPORT OUT=J10 DATATABLE='J10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMol1F
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J10;
SET J10;
LABEL J10='Quanto  nello svolgimento del suo lavoro  riesce a VALORIZZARE la Sue capacità professionali  per niente  poco  abbastanza o molto?';
FORMAT J10 NieMol1F. ;
RUN;

PROC IMPORT OUT=J10_alt2_T2 DATATABLE='J10_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1avF
;
DATA LIB.J10_alt2_T2;
SET J10_alt2_T2;
LABEL J10_alt2_T2='Su una scala da da 1 a 5  quanto riesce a VALORIZZARE le Sue capacità professionali nello svolgimento del Suo lavoro?';
FORMAT J10_alt2_T2 scala1avF. ;
RUN;

PROC IMPORT OUT=J10_alt3_T2 DATATABLE='J10_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J10_alt3_T2;
SET J10_alt3_T2;
LABEL J10_alt3_T2='Su una scala da 1 a 10  quanto riesce a VALORIZZARE le Sue CAPACITA  PROFESSIONALI nello svolgimento del suo lavoro?';
FORMAT J10_alt3_T2 scalaF. ;
RUN;

PROC IMPORT OUT=J10Balt2_T2 DATATABLE='J10Balt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ValoNnValoF
1 = 'Valorizza'
2 = 'Non valorizza'
;
DATA LIB.J10Balt2_T2;
SET J10Balt2_T2;
LABEL J10Balt2_T2='E dovendo dare un giudizio secco  direbbe che riesce a valorizzarle oppure no?';
FORMAT J10Balt2_T2 ValoNnValoF. ;
RUN;

PROC IMPORT OUT=J11 DATATABLE='J11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE altriF
1 = 'Può essere svolta da altri laureati'
2 = 'La laurea non è necessaria  sarebbe sufficiente un titolo inferiore'
3 = 'Ci vuole il titolo di studio che possiede'
;
DATA LIB.J11;
SET J11;
LABEL J11='Pensa che la sua attività di lavoro attuale possa essere svolta-- con esiti di poco differenti --da laureati di altre discipline  oppure è un attività per la quale il suo titolo di studio è specifico?';
FORMAT J11 altriF. ;
RUN;

PROC IMPORT OUT=J11A DATATABLE='J11A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE psicolF
1 = 'Assistente sociale'
2 = 'Economista'
3 = 'Filosofo'
4 = 'Formatore'
5 = 'Giurista'
6 = 'Ingegnere'
7 = 'Insegnante'
8 = 'logopedista'
9 = 'Logopedista/riabilitatore/psicomotricista'
10 = 'Medico'
11 = 'Neurologo'
12 = 'Pedagogista'
13 = 'Pediatra'
14 = 'Ricercatore'
15 = 'Sociologo'
16 = 'Altro'
;
DATA LIB.J11A;
SET J11A;
LABEL J11A='(SE fac. PSICOLOGIA) A quale delle seguenti professioni si sente particolarmente vicino? (RILEVATORE:LEGGERE UNA ALLA VOLTA E ASPETTARE RISPOSTA SI/NO)';
FORMAT J11A psicolF. ;
PROC TRANSPOSE OUT=LIB.J11A_MCOLS PREFIX=J11A_ ;
BY UID TID Block;
VAR J11A;
ID J11A;
RUN;

PROC IMPORT OUT=J11A1a DATATABLE='J11A1a' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1a;
SET J11A1a;
LABEL J11A1a='Un laureato in GIURISPRUDENZA';
FORMAT J11A1a MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1b DATATABLE='J11A1b' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1b;
SET J11A1b;
LABEL J11A1b='Un laureato o diplomato in INFORMATICA';
FORMAT J11A1b MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1c DATATABLE='J11A1c' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1c;
SET J11A1c;
LABEL J11A1c='Un laureato in SOCIOLOGIA o SCIENZE POLITICHE';
FORMAT J11A1c MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1d DATATABLE='J11A1d' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1d;
SET J11A1d;
LABEL J11A1d='Un laureato in ECONOMIA E COMMERCIO';
FORMAT J11A1d MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1e DATATABLE='J11A1e' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1e;
SET J11A1e;
LABEL J11A1e='Un laureato in MATEMATICA  e  FISICA';
FORMAT J11A1e MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1f DATATABLE='J11A1f' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1f;
SET J11A1f;
LABEL J11A1f='Un laureato in INGEGNERIA';
FORMAT J11A1f MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1g DATATABLE='J11A1g' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1g;
SET J11A1g;
LABEL J11A1g='Un laureato in LETTERE';
FORMAT J11A1g MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1h DATATABLE='J11A1h' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1h;
SET J11A1h;
LABEL J11A1h='Un laureato in AGRARIA';
FORMAT J11A1h MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1i DATATABLE='J11A1i' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1i;
SET J11A1i;
LABEL J11A1i='Un laureato in SCIENZE DELLA FORMAZIONE o PSICOLOGIA';
FORMAT J11A1i MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1l DATATABLE='J11A1l' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1l;
SET J11A1l;
LABEL J11A1l='Un laureato in MEDICINA e CHIRURGIA (o VETERINARIA)';
FORMAT J11A1l MiStMvF. ;
RUN;

PROC IMPORT OUT=J11A1m DATATABLE='J11A1m' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MiStMvF
1 = 'Migliori'
2 = 'Gli stessi'
3 = 'Meno validi'
;
DATA LIB.J11A1m;
SET J11A1m;
LABEL J11A1m='Un laureato in FARMACIA';
FORMAT J11A1m MiStMvF. ;
RUN;

PROC IMPORT OUT=J11Abis DATATABLE='J11Abis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.J11Abis;
SET J11Abis;
LABEL J11Abis='Può specificare?';
RUN;

PROC IMPORT OUT=J12 DATATABLE='J12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE J12F
1 = 'SI  anche un diplomato (maturità)'
2 = 'SI  anche meno che diplomato'
3 = 'NO  ci vuole il titolo universitario'
;
DATA LIB.J12;
SET J12;
LABEL J12='L attività lavorativa che svolge potrebbe essere svolta-- con esiti di poco differenti --da un diplomato di scuola superiore o anche meno qualificato?';
FORMAT J12 J12F. ;
RUN;

PROC IMPORT OUT=J13 DATATABLE='J13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J13;
SET J13;
LABEL J13='Su una scala da 1 a 10  QUANTO sente essere ADEGUATA la preparazione professionale conseguita all Università rispetto al tipo di lavoro che svolge?';
FORMAT J13 scalaF. ;
RUN;

PROC IMPORT OUT=J13_alt1_T2 DATATABLE='J13_alt1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMol1F
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J13_alt1_T2;
SET J13_alt1_T2;
LABEL J13_alt1_T2='Quanto sente essere ADEGUATA la preparazione professionale conseguita all Università rispetto al tipo di lavoro che svolge: per niente  poco  abbastanza o molto?';
FORMAT J13_alt1_T2 NieMol1F. ;
RUN;

PROC IMPORT OUT=J13_alt2_T2 DATATABLE='J13_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1avF
;
DATA LIB.J13_alt2_T2;
SET J13_alt2_T2;
LABEL J13_alt2_T2='Su una scala da 1 a 5  quanto sente essere ADEGUATA la preparazione professionale conseguta all Università rispetto al tipo di lavoro che svolge?';
FORMAT J13_alt2_T2 scala1avF. ;
RUN;

PROC IMPORT OUT=J13_T1 DATATABLE='J13_T1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J13_T1;
SET J13_T1;
LABEL J13_T1='Su una scala da 1 a 10  QUANTO sente essere ADEGUATA la preparazione professionale conseguita all Università rispetto al tipo di lavoro che svolge?';
FORMAT J13_T1 scalaF. ;
RUN;

PROC IMPORT OUT=J13Balt2_T2 DATATABLE='J13Balt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AdNnAdF
1 = 'Adeguata'
2 = 'Non adeguata'
;
DATA LIB.J13Balt2_T2;
SET J13Balt2_T2;
LABEL J13Balt2_T2='Dovendo dare un giudizio secco  direbbe  adeguata  o  inadeguata ?';
FORMAT J13Balt2_T2 AdNnAdF. ;
RUN;

PROC IMPORT OUT=J14 DATATABLE='J14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE preparF
1 = 'Poco specialistica'
2 = 'Adeguata'
3 = 'Troppo specialistica'
;
DATA LIB.J14;
SET J14;
LABEL J14='Lei sente che la PREPARAZIONE  PROFESSIONALE conseguita all università-- rispetto al tipo di lavoro che svolge-- è POCO specialistico  TROPPO specialistico o ADEGUATA?';
FORMAT J14 preparF. ;
RUN;

PROC IMPORT OUT=J14_T1 DATATABLE='J14_T1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE preparF
1 = 'Poco specialistica'
2 = 'Adeguata'
3 = 'Troppo specialistica'
;
DATA LIB.J14_T1;
SET J14_T1;
LABEL J14_T1='Lei sente che la PREPARAZIONE  PROFESSIONALE conseguita all università-- rispetto al tipo di lavoro che svolge-- è POCO specialistico  TROPPO specialistico o ADEGUATA?';
FORMAT J14_T1 preparF. ;
RUN;

PROC IMPORT OUT=J1B_alt2_T2 DATATABLE='J1B_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE PosNegF
1 = 'Positivo'
2 = 'Negativo'
;
DATA LIB.J1B_alt2_T2;
SET J1B_alt2_T2;
LABEL J1B_alt2_T2='E dovendo dare un giudizio secco sarebbe positivo o negativo?';
FORMAT J1B_alt2_T2 PosNegF. ;
RUN;

PROC IMPORT OUT=J2 DATATABLE='J2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J2;
SET J2;
LABEL J2='Quanto-- nello svolgimento delle Sue mansioni  --si avvale di FORMA  MENTIS ossia della cultura professionale generale (IMPOSTAZIONE MENTALE) derivante dalla formazione universitaria  per niente  poco  abbastanza o molto?';
FORMAT J2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=J2_alt2_T2 DATATABLE='J2_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1avF
;
DATA LIB.J2_alt2_T2;
SET J2_alt2_T2;
LABEL J2_alt2_T2='Su una scala da 1 a 5  quanto  nello svolgimento delle Sue mansioni  si avvale di FORMA MENTIS  ossia della cultura professionale generale derivante dalla formazione universitaria?';
FORMAT J2_alt2_T2 scala1avF. ;
RUN;

PROC IMPORT OUT=J2_alt3_T2 DATATABLE='J2_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J2_alt3_T2;
SET J2_alt3_T2;
LABEL J2_alt3_T2='Su una scala da 1 a 10  quanto  nello svolgimento delle Sue mansioni  si avvale di FORMA MENTIS  ossia della cultura professionale generale derivante dalla formazione universitaria?';
FORMAT J2_alt3_T2 scalaF. ;
RUN;

PROC IMPORT OUT=J22 DATATABLE='J22' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J22;
SET J22;
LABEL J22='Cosa s aspetta per il Suo FUTURO  PROFESsionale  diciamo di qui a due anni avanti. Si aspetta dei cambiamenti  e se sì  di che tipo?';
FORMAT J22 cambiamF. ;
RUN;

PROC IMPORT OUT=J22bis DATATABLE='J22bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.J22bis;
SET J22bis;
LABEL J22bis='Può specificare?';
RUN;

PROC IMPORT OUT=J2A DATATABLE='J2A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J2A;
SET J2A;
LABEL J2A='Quanto-- nello svolgimento delle Sue mansioni  --si avvale di FORMA  MENTIS  ossia della cultura professionale generale (IMPOSTAZIONE MENTALE) derivante dalla formazione  universitaria  per niente  poco  abbastanza  o molto? Tanto per capirci  qualcuno chiama forma mentis tutto ciò che resta nella mente quando si è scordato tutto ciò che si è imparato.';
FORMAT J2A NieMoltoF. ;
RUN;

PROC IMPORT OUT=J2B_alt2_T2 DATATABLE='J2B_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AvvNAvvF
1 = 'Si avvale'
2 = 'Non si avvale'
;
DATA LIB.J2B_alt2_T2;
SET J2B_alt2_T2;
LABEL J2B_alt2_T2='E dovendo dare una risposta secca direbbe che si avvale della  forma mentis  acquisita  oppure no?';
FORMAT J2B_alt2_T2 AvvNAvvF. ;
RUN;

PROC IMPORT OUT=J3 DATATABLE='J3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J3;
SET J3;
LABEL J3='Quanto-- nello svolgimento del Suo lavoro --utilizza METODI e TECNICHE utili a  saper fare  acquisiti durante gli studi universitari  per niente  poco  abbastanza  o molto?';
FORMAT J3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=J3_alt2_T2 DATATABLE='J3_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1avF
;
DATA LIB.J3_alt2_T2;
SET J3_alt2_T2;
LABEL J3_alt2_T2='Su una scala da 1 a 5  quanto  nello svolgimento del Suo lavoro  utilizza METODI E TECNICHE utili a  saper fare  acquisiti durante gli studi universitari?';
FORMAT J3_alt2_T2 scala1avF. ;
RUN;

PROC IMPORT OUT=J3_alt3_T2 DATATABLE='J3_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J3_alt3_T2;
SET J3_alt3_T2;
LABEL J3_alt3_T2='Su una scala da 1 a 10  quanto nello svolgimento del Suo lavoro  utilizza METODI E TECNICHE utili a  saper fare  acquisiti durante gli studi universitari?';
FORMAT J3_alt3_T2 scalaF. ;
RUN;

PROC IMPORT OUT=J3B_alt2_T2 DATATABLE='J3B_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE UtilNnUtiF
1 = 'Li utilizza'
2 = 'Non li utilizza'
;
DATA LIB.J3B_alt2_T2;
SET J3B_alt2_T2;
LABEL J3B_alt2_T2='E dovendo dare una risposta secca  direbbe che li utilizza oppure no?';
FORMAT J3B_alt2_T2 UtilNnUtiF. ;
RUN;

PROC IMPORT OUT=J4 DATATABLE='J4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE nesUnaF
1 = 'Nessuna'
2 = 'Almeno una'
;
DATA LIB.J4;
SET J4;
LABEL J4='Nello svolgimento della Sua attività lavorativa  utilizza abilità (COMPETENZE) ACQUISITE durante gli studi universitari (indicare solo quelle acquisite durante gli studi universitari)?';
FORMAT J4 nesUnaF. ;
RUN;

PROC IMPORT OUT=J5 DATATABLE='J5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE nesUnaF
1 = 'Nessuna'
2 = 'Almeno una'
;
DATA LIB.J5;
SET J5;
LABEL J5='Vi sono abilità (COMPETENZE) utili per lo svolgimento della Sua attività lavorativa di cui sente maggiormente la MANCANZA non avendole acquisite durante gli studi universitari?';
FORMAT J5 nesUnaF. ;
RUN;

PROC IMPORT OUT=J6 DATATABLE='J6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J6;
SET J6;
LABEL J6='Nello svolgimento della Sua attività lavorativa  quanto sono importanti gli insegnamenti di BASE  ossia quelli di tipo PROPEDEUTICO? Mi dica qual è l importanza con un voto tra 1 e 10  dove 1 è il minimo e 10 il massimo.';
FORMAT J6 scalaF. ;
RUN;

PROC IMPORT OUT=J6_alt1_T2 DATATABLE='J6_alt1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMol1F
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J6_alt1_T2;
SET J6_alt1_T2;
LABEL J6_alt1_T2='Nello svolgimento della Sua attività lavorativa quanto sono importanti gli insegnamenti di BASE  ossia quelli di tipo PROPEDEUTICO  per niente  poco  abbastanza o molto?';
FORMAT J6_alt1_T2 NieMol1F. ;
RUN;

PROC IMPORT OUT=J6_alt2_T2 DATATABLE='J6_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1avF
;
DATA LIB.J6_alt2_T2;
SET J6_alt2_T2;
LABEL J6_alt2_T2='Nello svolgimento della Sua attività lavorativa quanto sono importanti gli insegnamenti di BASE  ossia quelli di tipo PROPEDEUTICO? Mi dica qual è l importanza con un voto tra 1 e 5  dove1  è il minimo e 5 il massimo.';
FORMAT J6_alt2_T2 scala1avF. ;
RUN;

PROC IMPORT OUT=J6_T1 DATATABLE='J6_T1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J6_T1;
SET J6_T1;
LABEL J6_T1='Nello svolgimento della Sua attività lavorativa  quanto sono importanti gli insegnamenti di BASE  ossia quelli di tipo PROPEDEUTICO? Mi dica qual è l importanza con un voto tra 1 e 10  dove 1 è il minimo e 10 il massimo.';
FORMAT J6_T1 scalaF. ;
RUN;

PROC IMPORT OUT=J6A1 DATATABLE='J6A1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE GiurisF
1 = 'Istituzioni di diritto privato'
2 = 'Istituzioni di diritto pubblico'
3 = 'Economia politica'
4 = 'Diritto costituzionale'
5 = 'Diritto Internazionale'
6 = 'Scienza delle finanze'
7 = 'Diritto amministrativo'
8 = 'Diritto civile'
9 = 'Diritto commerciale'
10 = 'Diritto del lavoro'
11 = 'Diritto penale'
12 = 'Diritto processuale civile'
13 = 'Diritto tributario'
14 = 'Procedura civile'
15 = 'Procedura penale'
16 = 'Economia aziendale'
17 = 'Diritto industriale'
18 = 'Scienze dell amministrazione'
19 = 'ALTRO'
;
DATA LIB.J6A1;
SET J6A1;
LABEL J6A1='(SE fac. GIURISPRUDENZA) Quali tra gli insegnamenti istituzionali le sono risultati più utili per il Suo lavoro?';
FORMAT J6A1 GiurisF. ;
PROC TRANSPOSE OUT=LIB.J6A1_MCOLS PREFIX=J6A1_ ;
BY UID TID Block;
VAR J6A1;
ID J6A1;
RUN;

PROC IMPORT OUT=J6A1_old DATATABLE='J6A1_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.J6A1_old;
SET J6A1_old;
LABEL J6A1_old='(SE fac. GIURISPRUDENZA) Quali tra gli insegnamenti istituzionali le sono risultati più utili per il Suo lavoro?';
RUN;

PROC IMPORT OUT=J6A1al DATATABLE='J6A1al' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.J6A1al;
SET J6A1al;
LABEL J6A1al='ALTRO:';
RUN;

PROC IMPORT OUT=J6Adue DATATABLE='J6Adue' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range3F
1 = '1'
2 = '2'
3 = '3'
;
DATA LIB.J6Adue;
SET J6Adue;
LABEL J6Adue='Fisico-matematica';
FORMAT J6Adue Range3F. ;
RUN;

PROC IMPORT OUT=J6Atre DATATABLE='J6Atre' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range3F
1 = '1'
2 = '2'
3 = '3'
;
DATA LIB.J6Atre;
SET J6Atre;
LABEL J6Atre='Biologica';
FORMAT J6Atre Range3F. ;
RUN;

PROC IMPORT OUT=J6Auno DATATABLE='J6Auno' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range3F
1 = '1'
2 = '2'
3 = '3'
;
DATA LIB.J6Auno;
SET J6Auno;
LABEL J6Auno='Chimica';
FORMAT J6Auno Range3F. ;
RUN;

PROC IMPORT OUT=J6B_alt2_T2 DATATABLE='J6B_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ImpNnImpF
1 = 'Importanti'
2 = 'Non importanti'
;
DATA LIB.J6B_alt2_T2;
SET J6B_alt2_T2;
LABEL J6B_alt2_T2='E dovendo scegliere  dare un giudizio secco  direbbe che sono importanti oppure no?';
FORMAT J6B_alt2_T2 ImpNnImpF. ;
RUN;

PROC IMPORT OUT=J7 DATATABLE='J7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J7;
SET J7;
LABEL J7='Nello svolgimento della Sua attività lavorativa  quanto sono importanti gli insegnamenti di tipo PROFESSIONALIZZANTE  ossia di fine percorso  che Lei ha seguito? Mi dica qual è l importanza con un voto tra 1 e 10  dove 1 è il minimo e 10 il massimo.';
FORMAT J7 scalaF. ;
RUN;

PROC IMPORT OUT=J7_alt1_T2 DATATABLE='J7_alt1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMol1F
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7_alt1_T2;
SET J7_alt1_T2;
LABEL J7_alt1_T2='Nello svolgimento della Sua attività lavorativa. quanto sono importanti gli insegnamenti di tipo PROFESSIONALIZZANTE  ossia di fine percorso  che Lei ha seguito: per niente  poco  abbastanza o molto?';
FORMAT J7_alt1_T2 NieMol1F. ;
RUN;

PROC IMPORT OUT=J7_alt2_T2 DATATABLE='J7_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1avF
;
DATA LIB.J7_alt2_T2;
SET J7_alt2_T2;
LABEL J7_alt2_T2='Nello svolgimento della Sua attività lavorativa  quanto sono importanti gli insegnamenti di tipo PROFESSIONALIZZANTE  ossia di fine percorso? Mi dica qual è l importanza con un voto da 1 a 5  dove 1 è il minimo e 5 il massimo.';
FORMAT J7_alt2_T2 scala1avF. ;
RUN;

PROC IMPORT OUT=J7A1a DATATABLE='J7A1a' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range4F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
;
DATA LIB.J7A1a;
SET J7A1a;
LABEL J7A1a='Area economico-politica';
FORMAT J7A1a Range4F. ;
RUN;

PROC IMPORT OUT=J7A1b DATATABLE='J7A1b' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range4F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
;
DATA LIB.J7A1b;
SET J7A1b;
LABEL J7A1b='Area giuridica';
FORMAT J7A1b Range4F. ;
RUN;

PROC IMPORT OUT=J7A1c DATATABLE='J7A1c' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range4F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
;
DATA LIB.J7A1c;
SET J7A1c;
LABEL J7A1c='Area economico-aziendale';
FORMAT J7A1c Range4F. ;
RUN;

PROC IMPORT OUT=J7A1d DATATABLE='J7A1d' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range4F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
;
DATA LIB.J7A1d;
SET J7A1d;
LABEL J7A1d='Area quantitativo-statistica';
FORMAT J7A1d Range4F. ;
RUN;

PROC IMPORT OUT=J7A2a DATATABLE='J7A2a' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range6F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
;
DATA LIB.J7A2a;
SET J7A2a;
LABEL J7A2a='Chimica-farmaceutica';
FORMAT J7A2a Range6F. ;
RUN;

PROC IMPORT OUT=J7A2b DATATABLE='J7A2b' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range6F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
;
DATA LIB.J7A2b;
SET J7A2b;
LABEL J7A2b='Tecnica e legislazione farmaceutica';
FORMAT J7A2b Range6F. ;
RUN;

PROC IMPORT OUT=J7A2c DATATABLE='J7A2c' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range6F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
;
DATA LIB.J7A2c;
SET J7A2c;
LABEL J7A2c='Farmacologia';
FORMAT J7A2c Range6F. ;
RUN;

PROC IMPORT OUT=J7A2d DATATABLE='J7A2d' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range6F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
;
DATA LIB.J7A2d;
SET J7A2d;
LABEL J7A2d='Analitica';
FORMAT J7A2d Range6F. ;
RUN;

PROC IMPORT OUT=J7A2e DATATABLE='J7A2e' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range6F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
;
DATA LIB.J7A2e;
SET J7A2e;
LABEL J7A2e='Cosmetologia';
FORMAT J7A2e Range6F. ;
RUN;

PROC IMPORT OUT=J7A2f DATATABLE='J7A2f' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Range6F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
6 = '6'
;
DATA LIB.J7A2f;
SET J7A2f;
LABEL J7A2f='Dietetico-alimentare';
FORMAT J7A2f Range6F. ;
RUN;

PROC IMPORT OUT=J7A3 DATATABLE='J7A3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE GiurisF
1 = 'Istituzioni di diritto privato'
2 = 'Istituzioni di diritto pubblico'
3 = 'Economia politica'
4 = 'Diritto costituzionale'
5 = 'Diritto Internazionale'
6 = 'Scienza delle finanze'
7 = 'Diritto amministrativo'
8 = 'Diritto civile'
9 = 'Diritto commerciale'
10 = 'Diritto del lavoro'
11 = 'Diritto penale'
12 = 'Diritto processuale civile'
13 = 'Diritto tributario'
14 = 'Procedura civile'
15 = 'Procedura penale'
16 = 'Economia aziendale'
17 = 'Diritto industriale'
18 = 'Scienze dell amministrazione'
19 = 'ALTRO'
;
DATA LIB.J7A3;
SET J7A3;
LABEL J7A3='(SE fac. GIURISPRUDENZA) Quali tra gli insegnamenti  MONOGRAFICI  le sono risultati più utili per il Suo lavoro  per la Sua professionalizzazione?';
FORMAT J7A3 GiurisF. ;
PROC TRANSPOSE OUT=LIB.J7A3_MCOLS PREFIX=J7A3_ ;
BY UID TID Block;
VAR J7A3;
ID J7A3;
RUN;

PROC IMPORT OUT=J7A3_old DATATABLE='J7A3_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.J7A3_old;
SET J7A3_old;
LABEL J7A3_old='(SE fac. GIURISPRUDENZA) Quali tra gli insegnamenti  MONOGRAFICI  le sono risultati più utili per il Suo lavoro  per la Sua professionalizzazione?';
RUN;

PROC IMPORT OUT=J7A3al DATATABLE='J7A3al' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.J7A3al;
SET J7A3al;
LABEL J7A3al='ALTRO:';
RUN;

PROC IMPORT OUT=J7A4_civile DATATABLE='J7A4_civile' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A4_civile;
SET J7A4_civile;
LABEL J7A4_civile='INGEGNERISTICI di BASE (scienza delle costruzioni  Tecnica delle Costruzionifisica  Idraulica  Topografia ..)';
FORMAT J7A4_civile NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A4_ind DATATABLE='J7A4_ind' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A4_ind;
SET J7A4_ind;
LABEL J7A4_ind='INGEGNERISTICI di BASE (Fisica tecnica  Machine  Elettronica  Impianti chimici  Scienza delle costruzioni  ecc.)';
FORMAT J7A4_ind NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A4_inf DATATABLE='J7A4_inf' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A4_inf;
SET J7A4_inf;
LABEL J7A4_inf='INGEGNERISTICI di BASE (Elettronica  Controlli automatici  Comunicazioni elettriche  Fondamenti di informatica  ecc..)';
FORMAT J7A4_inf NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A4a DATATABLE='J7A4a' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A4a;
SET J7A4a;
LABEL J7A4a='INGEGNERISTICI di BASE (scienza delle cotruzioni  fisica tecnica  idraulica ..)';
FORMAT J7A4a NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A4b DATATABLE='J7A4b' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A4b;
SET J7A4b;
LABEL J7A4b='SPECIALISTICI GENERALI (specifici del corso di studi seguito)';
FORMAT J7A4b NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A4c DATATABLE='J7A4c' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A4c;
SET J7A4c;
LABEL J7A4c='SPECIALISTICI  PARTICOLARI (specifici dell indirizzo seguito)';
FORMAT J7A4c NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A4d DATATABLE='J7A4d' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A4d;
SET J7A4d;
LABEL J7A4d='SCIENTIFICI di BASE (area matematica  fisica  chimica ...)';
FORMAT J7A4d NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5a DATATABLE='J7A5a' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5a;
SET J7A5a;
LABEL J7A5a='Antropologia';
FORMAT J7A5a NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5b DATATABLE='J7A5b' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5b;
SET J7A5b;
LABEL J7A5b='Biologia e fondamenti anatomo-fisiologici';
FORMAT J7A5b NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5c DATATABLE='J7A5c' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5c;
SET J7A5c;
LABEL J7A5c='Compteneze linguistiche (inglese)';
FORMAT J7A5c NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5d DATATABLE='J7A5d' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5d;
SET J7A5d;
LABEL J7A5d='Elaborazione automatica dei dati';
FORMAT J7A5d NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5e DATATABLE='J7A5e' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5e;
SET J7A5e;
LABEL J7A5e='Psicologia del lavoro e delle organizzazioni';
FORMAT J7A5e NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5f DATATABLE='J7A5f' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5f;
SET J7A5f;
LABEL J7A5f='Psicologia dell erà evolutiva';
FORMAT J7A5f NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5g DATATABLE='J7A5g' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5g;
SET J7A5g;
LABEL J7A5g='Psicologia della personalità';
FORMAT J7A5g NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5h DATATABLE='J7A5h' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5h;
SET J7A5h;
LABEL J7A5h='Psicologia dinamica';
FORMAT J7A5h NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5i DATATABLE='J7A5i' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5i;
SET J7A5i;
LABEL J7A5i='Psicologia generale';
FORMAT J7A5i NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5l DATATABLE='J7A5l' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5l;
SET J7A5l;
LABEL J7A5l='Psicologia sociale';
FORMAT J7A5l NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5m DATATABLE='J7A5m' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5m;
SET J7A5m;
LABEL J7A5m='Sociologia';
FORMAT J7A5m NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5n DATATABLE='J7A5n' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5n;
SET J7A5n;
LABEL J7A5n='Statistica';
FORMAT J7A5n NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7A5o DATATABLE='J7A5o' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J7A5o;
SET J7A5o;
LABEL J7A5o='Teorie tecniche dei test  del colloquio  del questionario  d indagine della personalità';
FORMAT J7A5o NieMoltoF. ;
RUN;

PROC IMPORT OUT=J7B DATATABLE='J7B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE elemForF
1 = 'Formazione di base'
2 = 'Formazione sperimentale'
3 = 'Formazione specialistica'
4 = 'Riferimento a casi concreti derivanti dall esperienza dei docenti'
5 = 'Riferimento a casi concreti derivanti dalla Sua esperienza diretta'
;
DATA LIB.J7B;
SET J7B;
LABEL J7B='Quale tra i cinque elementi formativi che ora le leggo Le è più UTILE in ASSOLUTO per l attività che svolge? Glieli leggo due volte. Le chiedo qual è il più importante in assoluto.';
FORMAT J7B elemForF. ;
RUN;

PROC IMPORT OUT=J7B_alt2_T2 DATATABLE='J7B_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ImpNnImpF
1 = 'Importanti'
2 = 'Non importanti'
;
DATA LIB.J7B_alt2_T2;
SET J7B_alt2_T2;
LABEL J7B_alt2_T2='E dovendo dare un giudizio secco  direbbe che sono importanti  oppure no?';
FORMAT J7B_alt2_T2 ImpNnImpF. ;
RUN;

PROC IMPORT OUT=J8 DATATABLE='J8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J8;
SET J8;
LABEL J8='(SE SI E  LAUREATO CON UNA TESI DI TIPO APPLICATIVO O SPERIMENTALE) SE SI= Su una scala da 1 (MINimo) a 10 (MASsimo)  come valuta l ESPERIENZA della TESI nella sua FORMAZione PROFessionale?';
FORMAT J8 scalaF. ;
RUN;

PROC IMPORT OUT=J8_alt1_T2 DATATABLE='J8_alt1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMol1F
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J8_alt1_T2;
SET J8_alt1_T2;
LABEL J8_alt1_T2='[SE SI E  LAUREATO CON UNA TESI DI TIPO APPLICATIVO O SPERIMENTALE]  Quanto ha influito l ESPERIENZA della TESI nella sua FORMazione PROFessionale: per niente  poco  abbastanza  o molto?';
FORMAT J8_alt1_T2 NieMol1F. ;
RUN;

PROC IMPORT OUT=J8_alt2_T2 DATATABLE='J8_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1avF
;
DATA LIB.J8_alt2_T2;
SET J8_alt2_T2;
LABEL J8_alt2_T2='[SE SI E  LAUREATO CON UNA TESI DI TIPO APPLICATIVO O SPERIMENTALE]  Su una scala da 1 a 5  come valuta l ESPERIENZA della TESI nella sua FORMazione PROFessionale?';
FORMAT J8_alt2_T2 scala1avF. ;
RUN;

PROC IMPORT OUT=J8B_alt2_T2 DATATABLE='J8B_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE PosNegF
1 = 'Positivo'
2 = 'Negativo'
;
DATA LIB.J8B_alt2_T2;
SET J8B_alt2_T2;
LABEL J8B_alt2_T2='E dovendo dare un giudizio secco  sarebbe positivo o negativo?';
FORMAT J8B_alt2_T2 PosNegF. ;
RUN;

PROC IMPORT OUT=J9 DATATABLE='J9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.J9;
SET J9;
LABEL J9='Nel complesso  l attività lavorativa che svolge è COERENTE  con ciò che ha appreso durante gli studi universitari  per niente  poco abbastanza o molto?';
FORMAT J9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=J9_alt2_T2 DATATABLE='J9_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1avF
;
DATA LIB.J9_alt2_T2;
SET J9_alt2_T2;
LABEL J9_alt2_T2='Su una scala da 1 a 5  quanto giudica COERENTE l attività lavorativa che svolge con ciò che ha appreso durante gli studi universitari?';
FORMAT J9_alt2_T2 scala1avF. ;
RUN;

PROC IMPORT OUT=J9_alt3_T2 DATATABLE='J9_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
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
;
DATA LIB.J9_alt3_T2;
SET J9_alt3_T2;
LABEL J9_alt3_T2='Su una scala da 1 a 10  quanto giudica COERENTE l attività lavorativa che svolge con ciò che ha appreso durante gli studi universitari?';
FORMAT J9_alt3_T2 scalaF. ;
RUN;

PROC IMPORT OUT=J9B_alt2_T2 DATATABLE='J9B_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE CoeNnCoeF
1 = 'Coerente'
2 = 'Incoerente'
;
DATA LIB.J9B_alt2_T2;
SET J9B_alt2_T2;
LABEL J9B_alt2_T2='E dovendo dare un giudizio secco  direbbe  coerente  o  incoerente ?';
FORMAT J9B_alt2_T2 CoeNnCoeF. ;
RUN;

PROC IMPORT OUT=JA9 DATATABLE='JA9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE pococoeF
1 = 'Per consuetudine con la professione già esercitata'
2 = 'Per gratificazione personale'
3 = 'Per mancanza di alternative (interessanti)'
4 = 'Per mancanza di alternative/ offerte economicamente vantaggiose'
5 = 'Per incompatibilità personale con le professioni connesse al titolo conseguito'
6 = 'Per altro motivo'
7 = 'Per esigenza  necessità o motivi economici'
8 = 'Per fare esperienza o comunque per interesse'
;
DATA LIB.JA9;
SET JA9;
LABEL JA9='Perchè ha accettato di svolgere un attività lavorativa che Le sembra così POCO coerente con gli studi svolti?  [ACCETTARE FINO A 2 RISPOSTE]';
FORMAT JA9 pococoeF. ;
PROC TRANSPOSE OUT=LIB.JA9_MCOLS PREFIX=JA9_ ;
BY UID TID Block;
VAR JA9;
ID JA9;
RUN;

PROC IMPORT OUT=JA9bis DATATABLE='JA9bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.JA9bis;
SET JA9bis;
LABEL JA9bis='Quale?';
RUN;

PROC IMPORT OUT=K0 DATATABLE='K0' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K0;
SET K0;
LABEL K0='Nel cercare lavoro  su cosa si ORIENTA prevalentemente?';
RUN;

PROC IMPORT OUT=K1 DATATABLE='K1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE scala1F
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
11 = 'Non ha alcuna idea del lavoro futuro'
;
DATA LIB.K1;
SET K1;
LABEL K1='Su una scala da 1 (minimo) a 10 (massimo)  quanto sente essere ADEGUATA la PREParazione PROFessionale conseguita all Università rispetto al tipo di lavoro che vorrebbe avere?';
FORMAT K1 scala1F. ;
RUN;

PROC IMPORT OUT=K1_alt1_T2 DATATABLE='K1_alt1_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE k1_alt1F
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
11 = 'Non ha alcuna idea del lavoro futuro'
;
DATA LIB.K1_alt1_T2;
SET K1_alt1_T2;
LABEL K1_alt1_T2='Quanto sente essere ADEGUATA la preparazione professionale conseguita all Università rispetto al tipo di lavoro che vorrebbe avere: per niente  poco  abbastanza o molto?';
FORMAT K1_alt1_T2 k1_alt1F. ;
RUN;

PROC IMPORT OUT=K1_alt2_T2 DATATABLE='K1_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE k1_alt2F
1 = '1'
2 = '2'
3 = '3'
4 = '4'
5 = '5'
11 = 'Non ha alcuna idea del lavoro futuro'
;
DATA LIB.K1_alt2_T2;
SET K1_alt2_T2;
LABEL K1_alt2_T2='Su una scala da 1 a 5  quanto sente essere ADEGUATA la preparazione professionale conseguita all Università rispetto al tipo di lavoro che vorrebbe avere?';
FORMAT K1_alt2_T2 k1_alt2F. ;
RUN;

PROC IMPORT OUT=K10AJ20A DATATABLE='K10AJ20A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K10AJ20A;
SET K10AJ20A;
LABEL K10AJ20A='Quale sarebbe l ateneo estero migliore per lei?';
RUN;

PROC IMPORT OUT=K10J20 DATATABLE='K10J20' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K10J20;
SET K10J20;
LABEL K10J20='Per quale MOTIVO si orienterebbe verso un ateneo all estero?';
RUN;

PROC IMPORT OUT=K11J21 DATATABLE='K11J21' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K11J21;
SET K11J21;
LABEL K11J21='Che cosa l ha indotta a cambiare idea?';
RUN;

PROC IMPORT OUT=K11J21_T1 DATATABLE='K11J21_T1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K11J21_T1;
SET K11J21_T1;
LABEL K11J21_T1='Che cosa l ha indotta a cambiare idea?';
RUN;

PROC IMPORT OUT=K1B_T2 DATATABLE='K1B_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AdNnAdF
1 = 'Adeguata'
2 = 'Non adeguata'
;
DATA LIB.K1B_T2;
SET K1B_T2;
LABEL K1B_T2='Dovendo dare un giudizio secco  direbbe  adeguata  o  inadeguata ?';
FORMAT K1B_T2 AdNnAdF. ;
RUN;

PROC IMPORT OUT=K2 DATATABLE='K2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE preparF
1 = 'Poco specialistica'
2 = 'Adeguata'
3 = 'Troppo specialistica'
;
DATA LIB.K2;
SET K2;
LABEL K2='Lei sente che la preparazione professionale conseguita all Università  rispetto al tipo di lavoro che vorrebbe avere  è poco specialistica  troppo specialistica  o adeguata?';
FORMAT K2 preparF. ;
RUN;

PROC IMPORT OUT=K3 DATATABLE='K3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K3;
SET K3;
LABEL K3='Quali sono gli aspetti della formazione universitaria da cui più ha tratto GIOVAMENTO nella ricerca di lavoro (che sono dei PUNTI di FORZA della preparazione universitaria) ? (al massimo tre)';
RUN;

PROC IMPORT OUT=K4 DATATABLE='K4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K4;
SET K4;
LABEL K4='E quali sono gli aspetti della formazione universitaria che Le hanno causato il maggior DISAGIO (che sono di svantaggio) nella ricerca di lavoro (al massimo due  i più negativi)?';
PROC TRANSPOSE OUT=LIB.K4_MCOLS PREFIX=K4_ ;
BY UID TID Block;
VAR K4;
ID K4;
RUN;

PROC IMPORT OUT=K5J15 DATATABLE='K5J15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE indietroF
1 = 'NO  non mi reiscriverei neppure all università'
2 = 'NO  frequenterei una facoltà diversa'
3 = 'SI  stessa Facoltà  ma corso o indirizzo diverso'
4 = 'SI  stesso corso di studi o indirizzo  ma in un altra università italiana'
5 = 'SI  stesso corso di studi o indirizzo ma in una università all estero '
6 = 'SI  rifarei lo stesso percorso realizzato all università di Padova'
;
DATA LIB.K5J15;
SET K5J15;
LABEL K5J15='SE POTESSE TORNARE INDIETRO  frequenterebbe lo stesso corso di studi nella Facoltà dove ha ottenuto il titolo universitario?';
FORMAT K5J15 indietroF. ;
RUN;

PROC IMPORT OUT=K5J15_pre_T2 DATATABLE='K5J15_pre_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiNoF
1 = 'SI'
2 = 'NO'
;
DATA LIB.K5J15_pre_T2;
SET K5J15_pre_T2;
LABEL K5J15_pre_T2='ORA ha cambiato idea?';
FORMAT K5J15_pre_T2 SiNoF. ;
RUN;

PROC IMPORT OUT=K5J15_T0 DATATABLE='K5J15_T0' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE TornIndF
1 = 'Non mi reiscriverei neppure all Università'
2 = 'Non mi reiscriverei alla stessa facoltà'
3 = 'SI  stessa facoltà ma corso o indirizzo diverso'
4 = 'SI  stesso corso e stessa facoltà'
5 = 'SI  stesso corso di studio ma in altra università'
6 = 'SI  rifarei lo stesso percorso realizzato nell università di Padova'
;
DATA LIB.K5J15_T0;
SET K5J15_T0;
LABEL K5J15_T0='SE POTESSE TORNARE INDIETRO  frequenterebbe lo stesso corso di studi nella Facoltà dove ha ottenuto il titolo universitario?';
FORMAT K5J15_T0 TornIndF. ;
RUN;

PROC IMPORT OUT=K6J16 DATATABLE='K6J16' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K6J16;
SET K6J16;
LABEL K6J16='L affermazione è piuttosto forte. Qual è il principale MOTIVO per cui non si reiscriverebbe neppure all università?';
RUN;

PROC IMPORT OUT=K7AJ17A DATATABLE='K7AJ17A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K7AJ17A;
SET K7AJ17A;
LABEL K7AJ17A='Quale facoltà frequenterebbe invece?';
RUN;

PROC IMPORT OUT=K7J17 DATATABLE='K7J17' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K7J17;
SET K7J17;
LABEL K7J17='Che cosa la spinge a dare un giudizio così secco della facoltà che ha frequentato?';
RUN;

PROC IMPORT OUT=K8AJ18A DATATABLE='K8AJ18A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K8AJ18A;
SET K8AJ18A;
LABEL K8AJ18A='Quale corso/indirizzo frequenterebbe allora?';
RUN;

PROC IMPORT OUT=K8J18 DATATABLE='K8J18' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K8J18;
SET K8J18;
LABEL K8J18='Per quale MOTIVO cambierebbe corsi di studio o indirizzo?';
RUN;

PROC IMPORT OUT=K9AJ19A DATATABLE='K9AJ19A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K9AJ19A;
SET K9AJ19A;
LABEL K9AJ19A='Quale sarebbe l ateneo migliore per lei?';
RUN;

PROC IMPORT OUT=K9J19 DATATABLE='K9J19' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.K9J19;
SET K9J19;
LABEL K9J19='Per quale MOTIVO cambierebbe ateneo?';
RUN;

PROC IMPORT OUT=L1 DATATABLE='L1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE nonLavF
1 = 'Salute'
2 = 'Matrimonio (in attesa di o appena contratto)'
3 = 'Accudire i figli (in attesa di)'
4 = 'Assistenza familiari e parenti (esclusi i figli)'
5 = 'Obblighi di leva'
6 = 'Attesa di un concorso per il quale ho già presentato domanda di partecipazione'
7 = 'Attesa d iniziare un corso di studi post lauream o post diploma (master  dottorato di ricerca  formazione professionale  ecc.)'
8 = 'Attesa di trovare un corso di studi post lauream interessante'
9 = 'Attesa di iniziare uno stage (presso azienda o Ente)'
10 = 'Attesa di assunzione a seguito concorso e/o colloquio'
11 = 'Attesa di iniziare un attività in proprio'
12 = 'Benestante (non ho bisogno di lavorare)'
13 = 'Per ora NON ho INTERESSE a cercare lavoro'
14 = 'NON ho trovato alcun lavoro INTERESSANTE'
15 = 'Altro'
;
DATA LIB.L1;
SET L1;
LABEL L1='Qual è il MOTIVO principale per cui NON cerca lavoro? (Possibili più risposte)';
FORMAT L1 nonLavF. ;
RUN;

PROC IMPORT OUT=L1altro DATATABLE='L1altro' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.L1altro;
SET L1altro;
LABEL L1altro='SPECIFICARE:';
RUN;

PROC IMPORT OUT=L2 DATATABLE='L2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE stufoF
1 = 'Si sta riposando dopo il conseguimento del titolo'
2 = 'Si sta riposando per altre fatiche'
3 = 'Stufo di cercare inutilmente'
4 = 'Ha perso interesse a lavorare'
5 = 'Altro'
;
DATA LIB.L2;
SET L2;
LABEL L2='Mi può dire precisamente che cosa significa che non le INTERESSA cercare lavoro? Vuol dire che è stufo di cercare inutilmente  che si sta riposando per altre fatiche  che non ha proprio interesse a lavorare  o che altro?';
FORMAT L2 stufoF. ;
RUN;

PROC IMPORT OUT=L2bis DATATABLE='L2bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.L2bis;
SET L2bis;
LABEL L2bis='Specificare:';
RUN;

PROC IMPORT OUT=L3 DATATABLE='L3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE preferF
1 = 'Alle dipendenze a tempo pieno'
2 = 'Alle dipendenze part-time'
3 = 'Autonomo'
4 = 'In qualsiasi posizione'
5 = 'Non disponibile'
;
DATA LIB.L3;
SET L3;
LABEL L3='Per lei sarebbe preferibile lavorare alle dipendenze  a tempo pieno o parziale  oppure svolgere attività di lavoro autonomo  oppure non ha preferenze?';
FORMAT L3 preferF. ;
RUN;

PROC IMPORT OUT=L3A DATATABLE='L3A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE luogoF
1 = 'Solo vicino a casa (nel raggio di 30 minuti)'
2 = 'Nel raggio di non più di un ora da casa'
3 = 'In Italia  da non più di due ore da casa'
4 = 'Ovunque in Italia'
5 = 'Anche all estero'
;
DATA LIB.L3A;
SET L3A;
LABEL L3A='In quale luogo sarebbe stato disposto a lavorare?';
FORMAT L3A luogoF. ;
RUN;

PROC IMPORT OUT=L3B DATATABLE='L3B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.L3B;
SET L3B;
LABEL L3B='A quale livello di RETRIBUZIONE minima mensile sarebbe stato disposto a lavorare se il lavoro avesse avuto anche le caratteristiche che lei desiderava?       Euro mensili netti..................................';
RUN;

PROC IMPORT OUT=L3C DATATABLE='L3C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AcLavDivF
1 = 'NO'
2 = 'SI  solo se ci fossero prospettive di miglioramento in un futuro prossimo'
3 = 'SI  in ogni caso'
;
DATA LIB.L3C;
SET L3C;
LABEL L3C='Se le venisse offerto  accetterebbe un lavoro con caratteristiche diverse da quelle desiderate?';
FORMAT L3C AcLavDivF. ;
RUN;

PROC IMPORT OUT=L4 DATATABLE='L4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE coerentiF
1 = 'Solo coerente con il titolo di studio conseguito'
2 = 'Solo occupazioni dignitose  anche se non coerenti con il titolo'
3 = 'Qualsiasi occupazione'
;
DATA LIB.L4;
SET L4;
LABEL L4='Lei cercava solo occupazioni COERENTI con il titolo di STUDIO o andava bene anche un altro tipo di occupazione?';
FORMAT L4 coerentiF. ;
RUN;

PROC IMPORT OUT=L4A DATATABLE='L4A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE problF
1 = 'Situazione economica generale del Paese'
2 = 'Scarsa spendibilità del titolo di studi conseguito'
3 = 'Troppe porte restano chiuse  il laureato non viene neppure ricevuto  gli imprenditori fanno i furbi'
4 = 'Nessuno risponde alle offerte di lavoro scritte  all invio di curriculum'
5 = 'Trovano lavoro solo i raccomandati'
6 = 'Richiesta di lavoro con caratteristiche particolari (tipo di lavoro  orario  luogo di lavoro  stipendio)'
7 = 'Altro'
;
DATA LIB.L4A;
SET L4A;
LABEL L4A='Secondo Lei  i problemi nella ricerca di lavoro sono prevalentemente imputabili a:';
FORMAT L4A problF. ;
RUN;

PROC IMPORT OUT=L4Abis DATATABLE='L4Abis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.L4Abis;
SET L4Abis;
LABEL L4Abis='Può specificare?';
RUN;

PROC IMPORT OUT=L5 DATATABLE='L5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE tempoF
1 = 'Entro 3 mesi'
2 = 'Oltre 3 mesi fino a 6 mesi'
3 = 'Oltre 6 mesi fino a 12 mesi'
4 = 'Più di 12 mesi'
5 = 'Mai'
6 = 'Non sono in grado di fare previsioni'
7 = 'Quando i figli diventeranno più grandi'
;
DATA LIB.L5;
SET L5;
LABEL L5='Entro quanto TEMPO prevede che si modifichi la sua attuale condizione di non-studio e/o non-ricerca di lavoro (rispondere anche se attende di iniziare qualche attività)?';
FORMAT L5 tempoF. ;
RUN;

PROC IMPORT OUT=LD DATATABLE='LD' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE LaurdiplF
1 = 'Laureato'
2 = 'Diplomato'
;
DATA LIB.LD;
SET LD;
LABEL LD='Laureato o diplomato?';
FORMAT LD LaurdiplF. ;
RUN;

PROC IMPORT OUT=M1 DATATABLE='M1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.M1;
SET M1;
LABEL M1='La ringraziamo molto per la Sua collaborazione. L assicuriamo nuovamente che faremo un uso esclusivamente statistico delle informazioni che ci ha fornito. Ha altri suggerimenti per fare meglio l indagine?';
RUN;

PROC IMPORT OUT=M1A DATATABLE='M1A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE contattoF
1 = 'Fra sei mesi sarò prevalentemente all estero  o comunque non raggiungibile'
2 = 'Dal lunedì al venerdì'
3 = 'Solo di sabato'
4 = 'Solo di sabato o domenica'
5 = 'Tutta la settimana'
6 = 'Giorni precisi'
;
DATA LIB.M1A;
SET M1A;
LABEL M1A='Per concludere  mi può dire in quali giorni e in quali orari è più facile trovarLa a casa per poterLa contattare la prossima volta (cioè fra 6 mesi)?';
FORMAT M1A contattoF. ;
RUN;

PROC IMPORT OUT=M1Abis DATATABLE='M1Abis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.M1Abis;
SET M1Abis;
LABEL M1Abis='Quali?';
RUN;

PROC IMPORT OUT=M1B DATATABLE='M1B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE orariF
1 = 'Prevalentemente di giorno'
2 = 'Prevalentemente di sera'
3 = 'Altri orari'
;
DATA LIB.M1B;
SET M1B;
LABEL M1B='E in quali orari?';
FORMAT M1B orariF. ;
RUN;

PROC IMPORT OUT=M1Bdue DATATABLE='M1Bdue' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.M1Bdue;
SET M1Bdue;
LABEL M1Bdue='Quali?';
RUN;

PROC IMPORT OUT=M1Buno DATATABLE='M1Buno' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.M1Buno;
SET M1Buno;
LABEL M1Buno='Dopo quale ora?';
RUN;

PROC IMPORT OUT=M3a DATATABLE='M3a' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE M3aImpF
1 = 'Molto interessato'
2 = 'Abbastanza interessato'
3 = 'Poco interessato'
4 = 'Per nulla interessato'
;
DATA LIB.M3a;
SET M3a;
LABEL M3a='NEL CORSO DELL INTERVISTA  IL RISPONDENTE SEMBRAVA INTERESSATO ALL INDAGINE?';
FORMAT M3a M3aImpF. ;
RUN;

PROC IMPORT OUT=M3b DATATABLE='M3b' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE M3bIntF
1 = 'No mai'
2 = 'Sì  fin dall inizio'
3 = 'Sì solo a partire da...'
;
DATA LIB.M3b;
SET M3b;
LABEL M3b='NEL CORSO DELL INTERVISTA  ILRISPONDENTE HA MANIFESTATO FRETTA O IMPAZIENZA?';
FORMAT M3b M3bIntF. ;
RUN;

PROC IMPORT OUT=M3bA DATATABLE='M3bA' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.M3bA;
SET M3bA;
LABEL M3bA='specificare il blocco o l argomento...';
RUN;

PROC IMPORT OUT=M3c DATATABLE='M3c' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE M3cIntF
1 = 'Sì  molto spesso'
2 = 'Sì  solo su argomenti specifici'
3 = 'No mai'
;
DATA LIB.M3c;
SET M3c;
LABEL M3c='NEL CORSO DELL INTERVISTA  IL RISPONDENTE HA MANIFESTATO SEGNALI DI IMBARAZZO?';
FORMAT M3c M3cIntF. ;
RUN;

PROC IMPORT OUT=M3c1 DATATABLE='M3c1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.M3c1;
SET M3c1;
LABEL M3c1='Specificare blocchi o argomenti';
RUN;

PROC IMPORT OUT=N1A DATATABLE='N1A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE RicLavF
1 = 'Lavoro dipendente'
2 = 'Lavoro autonomo'
3 = 'Ambedue le direzioni'
4 = 'NON ho cercato o mi hanno CONTATTATO'
;
DATA LIB.N1A;
SET N1A;
LABEL N1A='Nella RICERCA di un NUOVO lavoro  si è/era orientato verso il lavoro dipendente  verso il lavoro autonomo  o in ambedue le direzioni?';
FORMAT N1A RicLavF. ;
RUN;

PROC IMPORT OUT=N1Ano DATATABLE='N1Ano' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Ano;
SET N1Ano;
LABEL N1Ano='Specificare come ha ottenuto COLLOQUIO e il lavoro che svolge.';
RUN;

PROC IMPORT OUT=N1B DATATABLE='N1B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE curricF
1 = 'NO'
2 = 'SI'
;
DATA LIB.N1B;
SET N1B;
LABEL N1B='Per cercare lavoro ha inviato CURRICULUM a datori di lavoro?';
FORMAT N1B curricF. ;
RUN;

PROC IMPORT OUT=N1B_old DATATABLE='N1B_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE curric1F
;
DATA LIB.N1B_old;
SET N1B_old;
LABEL N1B_old='Per cercare lavoro ha inviato CURRICULUM a datori di lavoro?';
FORMAT N1B_old curric1F. ;
RUN;

PROC IMPORT OUT=N1Bbis DATATABLE='N1Bbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Bbis;
SET N1Bbis;
LABEL N1Bbis='Ci può dire QUANTI approssimativamente?';
RUN;

PROC IMPORT OUT=N1C DATATABLE='N1C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE IndCurrF
1 = 'Da colleghi di lavoro  conoscenti'
2 = 'Dal personale dei centri per l impiego  di Veneto Lavoro'
3 = 'Da banche dati elettroniche/Internet'
4 = 'Da inserzioni sui giornali  publicazioni specializzate'
5 = 'Da uffici dell Università'
6 = 'Da professori universitari'
7 = 'Da ALTRA fonte'
8 = 'Elenco telefonico'
9 = 'Pagine gialle'
10 = 'Ass. di categoria  ordini professionali  Camera di comercio'
;
DATA LIB.N1C;
SET N1C;
LABEL N1C='Da chi ha avuto gli INDIRIZZI per l invio dei curricula (accettare tutte le risposte spontanee)';
FORMAT N1C IndCurrF. ;
PROC TRANSPOSE OUT=LIB.N1C_MCOLS PREFIX=N1C_ ;
BY UID TID Block;
VAR N1C;
ID N1C;
RUN;

PROC IMPORT OUT=N1Cbis DATATABLE='N1Cbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Cbis;
SET N1Cbis;
LABEL N1Cbis='Quale?';
RUN;

PROC IMPORT OUT=N1D DATATABLE='N1D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE inserzF
1 = 'SI  ha POsto inserzioni'
2 = 'SI  ha RIsposto ad inserzioni che lo interessavano'
3 = 'SI  ha POsto inserzioni ed ha RIsposto'
4 = 'NO'
;
DATA LIB.N1D;
SET N1D;
LABEL N1D='Sempre in questi 6 mesi  ha POSTO inserzioni  o ha RISPOSTO ad inserzioni  sui giornali ....';
FORMAT N1D inserzF. ;
RUN;

PROC IMPORT OUT=N1D1 DATATABLE='N1D1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE GiornaliF
1 = 'SOLO LOCali'
2 = 'SOLO NAZionani'
3 = 'AMBEDUE'
;
DATA LIB.N1D1;
SET N1D1;
LABEL N1D1='Si trattava di GIORNALI LOCali o anche NAZionali?';
FORMAT N1D1 GiornaliF. ;
RUN;

PROC IMPORT OUT=N1E DATATABLE='N1E' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1E;
SET N1E;
LABEL N1E='Si ricorda su QUANTI  GIORNALI ha posto inserzioni  sempre in questi sei mesi?';
RUN;

PROC IMPORT OUT=N1F DATATABLE='N1F' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE bancheF
0 = 'Nessuna  NP'
1 = 'Una sola'
2 = 'Due'
3 = 'Da tre a cinque'
4 = 'Da cinque a dieci'
5 = 'Oltre a dieci'
;
DATA LIB.N1F;
SET N1F;
LABEL N1F='Su  QUANTE   BANCHE  DATI ha inserito il suo CURRICULUM.   (ESCLUSO Almalaurea e il nostro primo questionario che come sa costituisce una banca dati T=0). Se sono tante  basta che mi dica l ordine di grandezza?';
FORMAT N1F bancheF. ;
RUN;

PROC IMPORT OUT=N1F1 DATATABLE='N1F1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE N1F1F
0 = 'NO  non SAPEVO'
1 = 'NO  non provato (SAPEVO)'
2 = 'NO  ho tentato ma non c era possibilità'
4 = 'SI'
;
DATA LIB.N1F1;
SET N1F1;
LABEL N1F1='Ha avuto modo di inserire il suo curruculum nella banca dati ALMALAUREA al momento della domanda di laurea?';
FORMAT N1F1 N1F1F. ;
RUN;

PROC IMPORT OUT=N1Fdue DATATABLE='N1Fdue' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Fdue;
SET N1Fdue;
LABEL N1Fdue='Si ricorda quali?';
RUN;

PROC IMPORT OUT=N1Funo DATATABLE='N1Funo' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Funo;
SET N1Funo;
LABEL N1Funo='Si ricorda quale?';
RUN;

PROC IMPORT OUT=N1G DATATABLE='N1G' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE colloquiF
1 = 'NO  non ho MAI svolto un colloquio di lavoro'
2 = 'SI  RISPondendo ad offerte di lavoro trovate su INTERNET'
3 = 'SI  grazie a curricula portati  a MANO '
4 = 'SI  grazie a curricula spediti per POSTA  PER E_MAIL'
5 = 'SI  grazie ad inserzioni sui GIORNALI'
6 = 'SI  INSERrendo del CV su banche dati su INTERNET'
7 = 'SI  MA i colloqui di lavoro sono derivati da ALTRE iniziative'
8 = 'Altro'
;
DATA LIB.N1G;
SET N1G;
LABEL N1G='Nei  6 mesi passati  è riuscito ad ottenere COLLOQUI di lavoro inviando o portando curriculum  ponendo annunci sui giornali o immettendo il suo curriculum in banche dati elettroniche? Ci interessa sapere DOVE PRINCIPALMENTE è stata vista la sua offerta.';
FORMAT N1G colloquiF. ;
RUN;

PROC IMPORT OUT=N1Gbis DATATABLE='N1Gbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Gbis;
SET N1Gbis;
LABEL N1Gbis='SPECIFICA ALTRO';
RUN;

PROC IMPORT OUT=N1H DATATABLE='N1H' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1H;
SET N1H;
LABEL N1H='QUANTI  COLLOQUI  di lavoro ha sostenuto in questi mesi?';
RUN;

PROC IMPORT OUT=N1H_alt2_T2 DATATABLE='N1H_alt2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1H_alt2_T2;
SET N1H_alt2_T2;
LABEL N1H_alt2_T2='QUANTI COLLOQUI di lavoro ha sostenuto DALLA LAUREA?';
RUN;

PROC IMPORT OUT=N1H_alt3_T2 DATATABLE='N1H_alt3_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1H_alt3_T2;
SET N1H_alt3_T2;
LABEL N1H_alt3_T2='QUANTI COLLOQUI di lavoro ha sostenuto DALLA LAUREA IN AVANTI?';
RUN;

PROC IMPORT OUT=N1H1 DATATABLE='N1H1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE DoveCollF
1 = 'Dentro al COMUNE di RESidenza'
2 = 'Dentro alla PROVincia di RESidenza'
3 = 'Dentro alla REGione VENETO'
4 = 'In ITALIA'
5 = 'In ITALIA e all ESTERO'
6 = 'SOLO all  ESTERO'
;
DATA LIB.N1H1;
SET N1H1;
LABEL N1H1='(SE HA OTTENUTO COLLOQUI NEGLI ULTIMI 6 MESI)   Dove?';
FORMAT N1H1 DoveCollF. ;
RUN;

PROC IMPORT OUT=N1Hbis_T2 DATATABLE='N1Hbis_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Hbis_T2;
SET N1Hbis_T2;
LABEL N1Hbis_T2='E DALLA LAUREA?';
RUN;

PROC IMPORT OUT=N1Hbis2_T2 DATATABLE='N1Hbis2_T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Hbis2_T2;
SET N1Hbis2_T2;
LABEL N1Hbis2_T2='E negli ultimi 6 MESI?';
RUN;

PROC IMPORT OUT=N1I DATATABLE='N1I' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE banchedF
1 = 'Università  Servizio stage  Ufficio stage'
2 = 'Associazioni industriali  Unindustria  Confindustria  Forema'
3 = 'Informagiovani  Europalavoro.it'
4 = 'AGENZIA INTERINALE (Adecco  ecc)'
5 = 'Internet (generico  non ricorda quale sito)'
6 = 'Almalaurea'
7 = 'Bancalavoro.it'
8 = 'Cesop.it'
9 = 'CGIL  CISL  Etc'
10 = 'Cliccalavoro.it'
11 = 'Corriere della Sera'
12 = 'Farmaonline.it'
13 = 'Handimpresa.it'
14 = 'Infoimprese.it (CCIAA)'
15 = 'JobDirect.it'
16 = 'JobItaly'
17 = 'Jobline.it  MonsterItalia'
18 = 'JobPilot.it'
19 = 'JobWorld.it'
20 = 'Okkupati.rai.it'
21 = 'Oracle'
22 = 'Progetto Giovani'
23 = 'Stepstone.it'
24 = 'Talentmanager.it'
25 = 'Non ricorda'
26 = 'Non risponde'
27 = 'Nessuna/Mai usate'
28 = 'Altro Internet (Specificare)'
;
DATA LIB.N1I;
SET N1I;
LABEL N1I='Qual è la BANCA  DATI che è risultata EFFICACE per ottenere un colloquio? (NON LEGGERE LE MODALITA )';
FORMAT N1I banchedF. ;
RUN;

PROC IMPORT OUT=N1I_old DATATABLE='N1I_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1I_old;
SET N1I_old;
LABEL N1I_old='Qual è la BANCA  DATI che è risultata EFFICACE per ottenere un colloquio? (NON LEGGERE LE MODALITA )';
RUN;

PROC IMPORT OUT=N1Ialtro DATATABLE='N1Ialtro' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Ialtro;
SET N1Ialtro;
LABEL N1Ialtro='ALTRO:';
RUN;

PROC IMPORT OUT=N1J DATATABLE='N1J' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ricorsoF
1 = 'NO  nessun ricorso'
2 = 'SI  almeno uno'
;
DATA LIB.N1J;
SET N1J;
LABEL N1J='Nella ricerca di lavoro  ha fatto ricorso a qualche sistema di COLLOCAMENTO pubblico  ad AGENZIE private  UNIVERSITA ..o si è fidato di CONOSCENZE di amici  parenti  professori  o altro?';
FORMAT N1J ricorsoF. ;
RUN;

PROC IMPORT OUT=N1K DATATABLE='N1K' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ric1F
;
DATA LIB.N1K;
SET N1K;
LABEL N1K='A chi ha fatto ricorso o si è affidato?';
FORMAT N1K ric1F. ;
PROC TRANSPOSE OUT=LIB.N1K_MCOLS PREFIX=N1K_ ;
BY UID TID Block;
VAR N1K;
ID N1K;
RUN;

PROC IMPORT OUT=N1Kdue DATATABLE='N1Kdue' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Kdue;
SET N1Kdue;
LABEL N1Kdue='Può specificare?/Quali sportelli?';
RUN;

PROC IMPORT OUT=N1Kuno DATATABLE='N1Kuno' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1Kuno;
SET N1Kuno;
LABEL N1Kuno='SPECIFICARE ALTRO';
RUN;

PROC IMPORT OUT=N1L DATATABLE='N1L' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE concorsiF
1 = 'No'
2 = 'Solo presentato domanda  offerto la disponibilità per insegnamento anche come precario'
3 = 'Fatto concorsi con esito positivo'
4 = 'Fatto concorsi con esito negativo'
5 = 'Altro'
;
DATA LIB.N1L;
SET N1L;
LABEL N1L='Ha fatto CONCORSI oppure ha offerto la sua disponibilità per entrare nella scuola come INSEGNANTE?';
FORMAT N1L concorsiF. ;
RUN;

PROC IMPORT OUT=N1LA DATATABLE='N1LA' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1LA;
SET N1LA;
LABEL N1LA='SPECIFICARE:';
RUN;

PROC IMPORT OUT=N1M DATATABLE='N1M' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ConcPubF
1 = 'No'
2 = 'Offerto per periodi temporanei'
3 = 'Iscritto ad un concorso pubblico non ancora sostenuto'
4 = 'Sostenuto un concorso pubblico'
5 = 'Sostenuti più concorsi pubblici'
6 = 'Altro'
;
DATA LIB.N1M;
SET N1M;
LABEL N1M='Ha partecipato a CONCORSI per entrare in un ENTE pubblico o si è offerto per forme di assunzione temporanea (borse di studio  lavori socialmente utili  altro) in un ente pubblico?';
FORMAT N1M ConcPubF. ;
RUN;

PROC IMPORT OUT=N1M_1 DATATABLE='N1M_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE N1M_1F
1 = 'Magistratura'
2 = 'Altro tipo'
;
DATA LIB.N1M_1;
SET N1M_1;
LABEL N1M_1='Si tratta del concorso per la MAGISTRATURA o ALTRO tipo di concorso?';
FORMAT N1M_1 N1M_1F. ;
RUN;

PROC IMPORT OUT=N1M1 DATATABLE='N1M1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE DoveCollF
1 = 'Dentro al COMUNE di RESidenza'
2 = 'Dentro alla PROVincia di RESidenza'
3 = 'Dentro alla REGione VENETO'
4 = 'In ITALIA'
5 = 'In ITALIA e all ESTERO'
6 = 'SOLO all  ESTERO'
;
DATA LIB.N1M1;
SET N1M1;
LABEL N1M1='Dove?';
FORMAT N1M1 DoveCollF. ;
RUN;

PROC IMPORT OUT=N1MA DATATABLE='N1MA' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N1MA;
SET N1MA;
LABEL N1MA='SPECIFICARE:';
RUN;

PROC IMPORT OUT=N1N DATATABLE='N1N' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AndConcF
1 = 'Negativamente'
2 = 'Positivamente e prossimo all assunzione'
5 = 'Positivamente  già assunto'
3 = 'Positivamente ma rifiutato il posto'
4 = 'Non sa ancora l esito'
;
DATA LIB.N1N;
SET N1N;
LABEL N1N='Come sono andati i concorsi?';
FORMAT N1N AndConcF. ;
RUN;

PROC IMPORT OUT=N2 DATATABLE='N2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AlboF
1 = 'No'
2 = 'Sostenuto esami di Stato con esito positivo'
3 = 'Sostenuto esami di Stato con esito negativo'
4 = 'Iscritto ad un Albo professionale'
5 = 'Sta per sostenerlo'
;
DATA LIB.N2;
SET N2;
LABEL N2='Si è iscritto/a ad un ALBO professionale o ha sostenuto ESAMI di STATO per accedervi o per avere un abilitazione?';
FORMAT N2 AlboF. ;
RUN;

PROC IMPORT OUT=N2A DATATABLE='N2A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AlboProfF
1 = 'Agronomi e forestali'
2 = 'Chimici'
3 = 'Farmacisti'
4 = 'Fisioterapisti'
5 = 'Infermieri'
6 = 'Ingegneri'
7 = 'IPASVI'
8 = 'Pubblicisti'
9 = 'Tecnico di laboratorio'
10 = 'Agenti e rappresentanti di commercio'
11 = 'Biologi'
12 = 'Dietisti'
13 = 'Geologi'
14 = 'Veterinari'
15 = 'Non risponde'
16 = 'Altro'
17 = 'Psicologi'
18 = 'Consulente del Lavoro'
;
DATA LIB.N2A;
SET N2A;
LABEL N2A='A quale Albo professionale si è iscritto/a o quale esame di Stato ha sostenuto (o sta per sostenere)?';
FORMAT N2A AlboProfF. ;
RUN;

PROC IMPORT OUT=N2A_old DATATABLE='N2A_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N2A_old;
SET N2A_old;
LABEL N2A_old='A quale Albo professionale si è iscritto/a o quale esame di Stato ha sostenuto (o sta per sostenere)?';
RUN;

PROC IMPORT OUT=N2Aaltro DATATABLE='N2Aaltro' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N2Aaltro;
SET N2Aaltro;
LABEL N2Aaltro='ALTRO:';
RUN;

PROC IMPORT OUT=N2B DATATABLE='N2B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AvvioAttF
1 = 'No'
2 = 'Sì  da solo/a'
3 = 'Sì  fondato società (anche cooperativa) o studio associato con altri professionisti'
4 = 'Sì  entrato in società (già fondate) come nuovo socio (anche studio associato)'
5 = 'Altro tipo di attività autonoma'
;
DATA LIB.N2B;
SET N2B;
LABEL N2B='Ha avviato un attività AUTONOMA  da solo/a o con altri?';
FORMAT N2B AvvioAttF. ;
RUN;

PROC IMPORT OUT=N2Bbis DATATABLE='N2Bbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N2Bbis;
SET N2Bbis;
LABEL N2Bbis='Quale?';
RUN;

PROC IMPORT OUT=N2C DATATABLE='N2C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE FormGiurF
1 = 'Società individuale'
2 = 'S.r.l.  società a responsabilità limitata'
3 = 'Altra società di persone'
4 = 'Società di capitali'
;
DATA LIB.N2C;
SET N2C;
LABEL N2C='Quale forma giuridica aveva o ha la società in cui è entrato/a o che ha fondato?';
FORMAT N2C FormGiurF. ;
RUN;

PROC IMPORT OUT=N2D DATATABLE='N2D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE preesistF
1 = 'Attività preesistente'
2 = 'Attività del tutto nuova'
3 = 'NP'
;
DATA LIB.N2D;
SET N2D;
LABEL N2D='Si trattava del proseguimento di un attività di famiglia preesistente (anche con soluzione giuridica diversa) o di un attività del tutto nuova?';
FORMAT N2D preesistF. ;
RUN;

PROC IMPORT OUT=N3 DATATABLE='N3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE esteroF
1 = 'SI  per l Europa'
2 = 'SI  per gli U.S.A.'
3 = 'SI  per altro continente'
4 = 'NO'
;
DATA LIB.N3;
SET N3;
LABEL N3='Ha cercato lavoro per l ESTERO?  PREVALENTEMENTE...';
FORMAT N3 esteroF. ;
RUN;

PROC IMPORT OUT=N3A DATATABLE='N3A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE RiLavEstF
0 = 'Non ha cercato  NP'
1 = 'Risposto a chiamate di datori di lavoro su indicazione dell Università'
2 = 'Risposto a notizie diffuse da datori di lavoro su PAGINE WEB'
3 = 'Ottenuto COLLOQUIO di lavoro o borsa su segnalazione da parte di famigliari o parenti'
4 = 'Ottenuto COLLOQUIO di lavoro o borsa su segnalazione da parte di amici o conoscenti'
5 = 'Ottenuto COLLOQUIO di lavoro o borsa su segnalazione di professori universitari'
6 = 'Posto INSERZIONI sui giornali'
7 = 'Iscritto a bacheche elettroniche su INTERNET (Informagiovani  Jobpilot  Jobline  ecc.)'
8 = 'Iscrizione presso uffici di COLLOCAMENTO pubblico/ Centri per l impiego'
9 = 'Proseguito uno STAGE all estero'
10 = 'Offerto disponibilità ad agenzie interinali (lavoro in affitto)'
11 = 'Offerto disponibilità per l insegnamento nella scuola'
12 = 'Presentato domande per partecipare a concorsi pubblici'
13 = 'Partecipato a CONCORSI pubblici'
14 = 'Fondato una SOCIETA  o uno STUDIO associato per il lavoro autonomo'
16 = 'Consultato le GAZZETTE dei concorsi'
15 = 'Altra azione'
;
DATA LIB.N3A;
SET N3A;
LABEL N3A='Come ha cercato lavoro per l estero?';
FORMAT N3A RiLavEstF. ;
PROC TRANSPOSE OUT=LIB.N3A_MCOLS PREFIX=N3A_ ;
BY UID TID Block;
VAR N3A;
ID N3A;
RUN;

PROC IMPORT OUT=N3Abis DATATABLE='N3Abis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N3Abis;
SET N3Abis;
LABEL N3Abis='Quale?';
RUN;

PROC IMPORT OUT=N3B DATATABLE='N3B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MercEstF
1 = 'Positive  più che in Italia'
2 = 'Talvolta positive  talvolta negative'
3 = 'Generalmente negative'
4 = 'Altro'
;
DATA LIB.N3B;
SET N3B;
LABEL N3B='Che risposte ha avuto dal mercato estero?';
FORMAT N3B MercEstF. ;
RUN;

PROC IMPORT OUT=N3Bbis DATATABLE='N3Bbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N3Bbis;
SET N3Bbis;
LABEL N3Bbis='Può specificare?';
RUN;

PROC IMPORT OUT=N3C DATATABLE='N3C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE FattoF
1 = 'Mi sono presentato e sono stato assunto'
2 = 'Mi sono presentato  ma la proposta non era soddisfacente'
3 = 'Non mi sono presentato perchè la proposta non era soddisfacente (rispetto alle aspettative)'
4 = 'Non mi sono presentato per motivi di organizzazione familiare'
5 = 'Non mi sono presentato per altro motivo'
6 = 'Penso di presentarmi'
7 = 'Penso di non presentarmi'
;
DATA LIB.N3C;
SET N3C;
LABEL N3C='E lei cosa pensa di fare o cosa ha fatto in relazione alle risposte ottenute?';
FORMAT N3C FattoF. ;
RUN;

PROC IMPORT OUT=N4 DATATABLE='N4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE RiLavEsF
1 = 'Nessuna'
2 = 'RISPOSTO a chiamate di datori di lavoro su indicazione dell UNIVERSITA '
3 = 'RISPOSTO a notizie diffuse da datori di lavoro su pagine WEB'
4 = 'Ottenuto COLLoquio di lavoro o borsa su segnalazione da parte di FAMIGLIARI o PARENTI'
5 = 'Ottenuto COLLoquio di lavoro o borsa su segnalazione da parte di CONOSCENTI'
6 = 'Ottenuto colloquio di lavoro o borsa su segnalazione di PROF. universitari'
7 = 'POSTO INSERZioni sui GIORNali'
8 = 'ISCRITTO a bacheche elettroniche su INTERNET (Informagiovani  Jobpilot  Jobline  ecc.)'
9 = 'ISCRIZIONE presso UFFici di COLLocamento PUBBLico/Centri per l impiego'
10 = 'Proseguito uno stage all estero'
11 = 'Offerto disponibilità ad agenzie interinali (lavoro in affitto)'
12 = 'OFFERTA disponibilità per l insegnamento nella SCUOLA'
13 = 'PRESENTATO domande per partecipare a CONCORSI pubblici'
14 = 'FONDATO una società o uno studio associato per il lavoro autonomo'
15 = 'ALTRA AZIONE'
100 = 'COLLOQUI (iniziativa personale)'
101 = 'Inviato CV (come descritto)'
102 = 'Consultazione GIORNALI  e  INTERNET'
;
DATA LIB.N4;
SET N4;
LABEL N4='Quali tra le azioni di ricerca sono state svolte nell ULTIMO  MESE (sia per l Italia che per l estero)?';
FORMAT N4 RiLavEsF. ;
RUN;

PROC IMPORT OUT=N4A DATATABLE='N4A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N4A;
SET N4A;
LABEL N4A='Può dirci perchè ha cercato lavoro pur lavorando?';
RUN;

PROC IMPORT OUT=N4bis DATATABLE='N4bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N4bis;
SET N4bis;
LABEL N4bis='Può specificare?';
RUN;

PROC IMPORT OUT=N5 DATATABLE='N5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE CanRicF
1 = 'Invio Curriculum per POSTA'
2 = 'Iscrizione Curriculum su BANCHE DATI ELETTRONICHE'
3 = 'POSTO INSERZIONI su GIORNALI'
4 = 'Recato a INFORMAGiovani (o CENTRO PER L IMPIEGO o SERVIZIO STAGE)'
5 = 'Recato all  UNIVERSITA '
6 = 'Chiesto aiuto a PROFessore UNIVersitario'
7 = 'RISPOSTO a offerte su INTERNET'
8 = 'RISPOSTO A INSERZIONI su GIORNALI'
9 = 'Chiesto aiuto a PARENTI O AMICI'
10 = 'ALTRO'
11 = 'Nessuna'
;
DATA LIB.N5;
SET N5;
LABEL N5='Saprebbe ricostruire la SEQUENZA DI CANALI seguiti per la RICERCA DI LAVORO negli ULTIMI 6 MESI?  Qual è la PRIMA ATTIVITA  che ha fatto per cercare lavoro? [NON LEGGERE LE MODALITA ]    ';
FORMAT N5 CanRicF. ;
RUN;

PROC IMPORT OUT=N5_1 DATATABLE='N5_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE CanRicF
1 = 'Invio Curriculum per POSTA'
2 = 'Iscrizione Curriculum su BANCHE DATI ELETTRONICHE'
3 = 'POSTO INSERZIONI su GIORNALI'
4 = 'Recato a INFORMAGiovani (o CENTRO PER L IMPIEGO o SERVIZIO STAGE)'
5 = 'Recato all  UNIVERSITA '
6 = 'Chiesto aiuto a PROFessore UNIVersitario'
7 = 'RISPOSTO a offerte su INTERNET'
8 = 'RISPOSTO A INSERZIONI su GIORNALI'
9 = 'Chiesto aiuto a PARENTI O AMICI'
10 = 'ALTRO'
11 = 'Nessuna'
;
DATA LIB.N5_1;
SET N5_1;
LABEL N5_1='E qual è stata la SECONDA in ordine di tempo?';
FORMAT N5_1 CanRicF. ;
RUN;

PROC IMPORT OUT=N5_2 DATATABLE='N5_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE CanRicF
1 = 'Invio Curriculum per POSTA'
2 = 'Iscrizione Curriculum su BANCHE DATI ELETTRONICHE'
3 = 'POSTO INSERZIONI su GIORNALI'
4 = 'Recato a INFORMAGiovani (o CENTRO PER L IMPIEGO o SERVIZIO STAGE)'
5 = 'Recato all  UNIVERSITA '
6 = 'Chiesto aiuto a PROFessore UNIVersitario'
7 = 'RISPOSTO a offerte su INTERNET'
8 = 'RISPOSTO A INSERZIONI su GIORNALI'
9 = 'Chiesto aiuto a PARENTI O AMICI'
10 = 'ALTRO'
11 = 'Nessuna'
;
DATA LIB.N5_2;
SET N5_2;
LABEL N5_2='E la TERZA?';
FORMAT N5_2 CanRicF. ;
RUN;

PROC IMPORT OUT=N5A DATATABLE='N5A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N5A;
SET N5A;
LABEL N5A='SPECIFICARE:';
RUN;

PROC IMPORT OUT=N5A1 DATATABLE='N5A1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N5A1;
SET N5A1;
LABEL N5A1='SPECIFICARE:';
RUN;

PROC IMPORT OUT=N5A2 DATATABLE='N5A2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.N5A2;
SET N5A2;
LABEL N5A2='SPECIFICARE:';
RUN;

PROC IMPORT OUT=Notes DATATABLE='Notes' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Notes;
SET Notes;
LABEL Notes='Annotazioni sul questionario';
RUN;

PROC IMPORT OUT=P1 DATATABLE='P1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1;
SET P1;
LABEL P1='Quali abilità (COMPETENZE) utilizza per il Suo lavoro?';
PROC TRANSPOSE OUT=LIB.P1_MCOLS PREFIX=P1_ ;
BY UID TID Block;
VAR P1;
ID P1;
RUN;

PROC IMPORT OUT=P1A DATATABLE='P1A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1A;
SET P1A;
LABEL P1A='Quali tra le abilità (COMPETENZE) indicate sono più significative per il Suo lavoro? ';
PROC TRANSPOSE OUT=LIB.P1A_MCOLS PREFIX=P1A_ ;
BY UID TID Block;
VAR P1A;
ID P1A;
RUN;

PROC IMPORT OUT=P1Aa DATATABLE='P1Aa' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1Aa;
SET P1Aa;
LABEL P1Aa='Quali tra le abilità (COMPETENZE) indicate sono più significative per il suo lavoro?';
PROC TRANSPOSE OUT=LIB.P1Aa_MCOLS PREFIX=P1Aa_ ;
BY UID TID Block;
VAR P1Aa;
ID P1Aa;
RUN;

PROC IMPORT OUT=P1Agr_1 DATATABLE='P1Agr_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_1;
SET P1Agr_1;
LABEL P1Agr_1='Saper utilizzare il computer ';
FORMAT P1Agr_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_10 DATATABLE='P1Agr_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_10;
SET P1Agr_10;
LABEL P1Agr_10='Applicare tecniche di analisi agronomica';
FORMAT P1Agr_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_11 DATATABLE='P1Agr_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_11;
SET P1Agr_11;
LABEL P1Agr_11='Applicare tecniche di analisi forestale';
FORMAT P1Agr_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_12 DATATABLE='P1Agr_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_12;
SET P1Agr_12;
LABEL P1Agr_12='Utilizzare conoscenze di economia  estimo  ecc.';
FORMAT P1Agr_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_13 DATATABLE='P1Agr_13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_13;
SET P1Agr_13;
LABEL P1Agr_13='Utilizzare strumentazione tecnico scientifica  di laboratorio';
FORMAT P1Agr_13 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_14 DATATABLE='P1Agr_14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_14;
SET P1Agr_14;
LABEL P1Agr_14='Utilizzare tecniche di analisi topologica  GIS';
FORMAT P1Agr_14 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_15 DATATABLE='P1Agr_15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_15;
SET P1Agr_15;
LABEL P1Agr_15='Utilizzare tecniche di difesa dei vegetali';
FORMAT P1Agr_15 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_2 DATATABLE='P1Agr_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_2;
SET P1Agr_2;
LABEL P1Agr_2='Saper utilizzare programmi di calcolo particolari';
FORMAT P1Agr_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_3 DATATABLE='P1Agr_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_3;
SET P1Agr_3;
LABEL P1Agr_3='Parlare o scrivere in inglese';
FORMAT P1Agr_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_4 DATATABLE='P1Agr_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_4;
SET P1Agr_4;
LABEL P1Agr_4='Leggere  parlare o scrivere in un altra lingua straniera';
FORMAT P1Agr_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_5 DATATABLE='P1Agr_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_5;
SET P1Agr_5;
LABEL P1Agr_5='Gestire rapporti con clienti  utenti  fornitori';
FORMAT P1Agr_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_6 DATATABLE='P1Agr_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_6;
SET P1Agr_6;
LABEL P1Agr_6='Organizzare il lavoro degli altri';
FORMAT P1Agr_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_7 DATATABLE='P1Agr_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_7;
SET P1Agr_7;
LABEL P1Agr_7='Lavorare in gruppo  in èquipe';
FORMAT P1Agr_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_8 DATATABLE='P1Agr_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_8;
SET P1Agr_8;
LABEL P1Agr_8='Scrivere progetti per ottenere fondi';
FORMAT P1Agr_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Agr_9 DATATABLE='P1Agr_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Agr_9;
SET P1Agr_9;
LABEL P1Agr_9='Applicare tecniche di analisi zootecnica';
FORMAT P1Agr_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1comp_mancanti DATATABLE='P1comp_mancanti' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE comp_mancantiF
68 = 'Gestire rapporti con i superiori'
6 = 'Applicare conoscenze cliniche'
116 = 'Utilizzare strumenti informatici per la ricerca informazioni tecnico-professionali'
35 = 'Comporre controversie  mediare tra soggetti  interessi  culture'
79 = 'Parlare in pubblico'
37 = 'Conoscenze del diritto commerciale  del lavoro  contrattuale  civile  di area tecnica'
38 = 'Conoscenze del diritto pubblico  (degli enti locali  regionali  costituzionale  internazionale)'
39 = 'Conoscenze di bilanci  contabilità'
51 = 'Discutere problematiche di natura scientifica e tecnica'
72 = 'Mediare tra soggetti  interessi  culture'
99 = 'Reperire  consultare e utilizzare informazioni presenti in banche dati'
66 = 'Gestire e analizzare dati'
75 = 'Organizzare l attività di laboratorio'
54 = 'Elaborare modelli matematici'
107 = 'Scrivere relazioni tecniche'
55 = 'Elaborare progetti per la richiesta di finanziamenti pubblici e privati'
40 = 'Conoscenze di economia aziendale  di marketing'
91 = 'Progettare un intervento formativo'
3 = 'Analizzare dati osservabili e sperimentali'
67 = 'Gestire rapporti con clienti  utenti  fornitori'
77 = 'Orientare allo studio  al lavoro'
92 = 'Progettare un intervento terapeutico'
5 = 'Analizzare le dinamiche di gruppo'
36 = 'Condurre colloqui clinici'
11 = 'Applicare tecniche di indagini della personalità'
12 = 'Applicare tecniche di osservazione del comportamento'
60 = 'Fare ricerche sperimentali'
49 = 'Costruire strumenti per la misurazione di variabili psicologiche'
108 = 'Somministrare e correggere test'
9 = 'Applicare tecniche di analisi agronomica'
10 = 'Applicare tecniche di analisi forestale'
113 = 'Utilizzare conoscenze di economia  estimo  ecc.'
115 = 'Utilizzare strumentazione tecnico scientifica  di laboratorio'
119 = 'Utilizzare tecniche di analisi topologica  GIS'
120 = 'Utilizzare tecniche di difesa dei vegetali'
102 = 'Saper utilizzare programmi di calcolo particolari'
73 = 'Modelli di gestione attività no profit'
118 = 'Utilizzare strumenti informatici per ricerca informazioni normative e giurisprudenziali'
101 = 'Ricerca bibliotecaria (cartacea) di informazioni normative e giurisprudenzali'
30 = 'Capacità di ricondurre il caso concreto nelle categorie giuridiche'
109 = 'Sostenere una discussione giuridica'
27 = 'Capacità di redigere un atto o un parere giuridico'
45 = 'Conoscere le normative sui contratti'
71 = 'Leggere  parlare o scrivere in un altra  lingua straniera'
105 = 'Scrivere progetti per ottenere fondi'
23 = 'Capacità di interpretare o applicare normative nuove (che non siano state oggetto di precedente studio)'
114 = 'Utilizzare il calcolatore'
117 = 'Utilizzare strumenti informatici per ricerca di informazioni e dati su WEB'
82 = 'Pianificazione e gestione aziendale'
81 = 'Pianificazione e gestione attività di marketing e communicazione'
93 = 'Progettazione sistemi informativi'
94 = 'Programmazione della produzione o degli acquisti di materie prime'
111 = 'Uso di modelli matematici e statistici per le decisioni  analisi di dati'
112 = 'Uso di strumenti di analisi organizzativa e di processi'
100 = 'Revisione contabile'
74 = 'Organizzare il lavoro degli altri'
123 = 'Utilizzo del calcolatore per svolgere attività tecniche'
31 = 'Capacità di usare tecniche e linguaggi della comunicazione diretta e mediata'
24 = 'Capacità di osservazione sistematica e d uso di relativi metodi e strumenti'
29 = 'Capacità di ricerca-azione'
21 = 'Capacità di direzione'
124 = 'Altro Specificare'
28 = 'Capacità di relazione e comunicazione'
78 = 'Padronanza del linguaggio scritto e parlato'
98 = 'Reperire fonti e dati su Internet e in letteratura'
86 = 'Problem solving'
32 = 'Catalogare e classificare beni culturali  museali  ambientali.'
83 = 'Predisporre e sottoscrivere atti e provvedimenti.'
7 = 'Applicare conoscenze economiche/aziendali'
50 = 'Discussione di problematiche tecnico/scientifiche'
56 = 'Elaborazione di relazioni tecniche '
57 = 'Esecuzione di calcoli'
70 = 'Lavorare in gruppo  in équipe'
52 = 'Disegno/progettazione'
104 = 'Sapersi rapportare con clienti/utenti'
122 = 'Utilizzazione di strumentazione scientifico-tecnica  di laboratorio'
95 = 'Programmazione e analisi di sistemi'
97 = 'Reperimento  consultazione e utilizzazione di informazioni su banche dati e in letteratura'
76 = 'Organizzazione/ programmazione del lavoro'
34 = 'Competenze economiche/aziendali'
85 = 'Presentare progetti'
80 = 'Parlare o scrivere in inglese'
4 = 'Analizzare dati statistici'
25 = 'Capacità di progettazione  monitoraggio e valutazione di eventi educativo-formativi'
16 = 'Capacità di analisi di dati'
15 = 'Capacità  di ascolto attivo'
18 = 'Capacità di comunicare in modo assertivo'
19 = 'Capacità di comunicare in rete'
41 = 'Conoscenze di economia  scienze delle finanze'
42 = 'Conoscere e usare le fonti ufficiali dei dati'
87 = 'Progettare e valutare servizi'
1 = 'Analisi di bilanci  controllo di gestione'
48 = 'Costruire ed interpretare indicatici ed informazioni per le decisioni'
106 = 'Scrivere rapporti (di ricerca)'
33 = 'Communicare con altri esperti (diversi da statistica)'
90 = 'Progettare indagini statistiche  sondaggi  ricerche di mercato  test di prodotto'
89 = 'Progettare esperimenti e interpretare i risultati'
8 = 'Applicare linguaggi di programmazione'
53 = 'Elaborare ed analizzare i dati con packages (SPSS  SAS  STATISTICA ecc.)'
69 = 'Interpretare i risultati di analisi multivariate'
61 = 'Fare simulazioni su calcolatore (metodi Montecarlo )'
58 = 'Fare previsioni demografiche  sociali'
59 = 'Fare previsioni economiche'
17 = 'Capacità di applicare metodi e tecniche formativo-educatico-animazione'
26 = 'Capacità di promuovere interazioni interpersonali e intergruppali'
22 = 'Capacità di interpretare eventi alla luce delle Scienze dell Educazione'
20 = 'Capacità di diagnosticare bisogni e potenzialità di sviluppo della persona e  della comunità'
64 = 'Gestione e analisi di dati'
84 = 'Predisporre piani e progetti'
46 = 'Contabilità e analisi di bilancio'
2 = 'Analisi e decisioni nei mercati finanziari'
13 = 'Aspetti giuridici della gestione aziendale (commerciale e tributario)'
47 = 'Controllo di gestione  budgeting e reporting'
121 = 'Utilizzare tecniche e strumentazioni di laboratorio'
96 = 'Realizzare analisi chimiche  microbiologiche  tecnologiche'
110 = 'Sviluppo (ricerca) nuovi prodotti farmacologici  chimici  cosmetici'
103 = 'Sapere relazionarsi con glia altri  comunicare'
44 = 'Conoscere la legislazione farmaceutica'
43 = 'Conoscere la brevettistica  la farmacovigilanza'
14 = 'Avere cultura d impresa'
88 = 'Progettare e/o realizzare ricerche di mercato  marketing'
62 = 'Gestione del  processo logistico'
63 = 'Gestione della finanza aziendale'
65 = 'Gestione e sviluppo delle risorse umane'
;
DATA LIB.P1comp_mancanti;
SET P1comp_mancanti;
LABEL P1comp_mancanti='Di quali competenze sente particolarmente la mancanza per il suo lavoro?';
FORMAT P1comp_mancanti comp_mancantiF. ;
PROC TRANSPOSE OUT=LIB.P1comp_mancanti_MCOLS PREFIX=P1comp_mancanti_ ;
BY UID TID Block;
VAR P1comp_mancanti;
ID P1comp_mancanti;
RUN;

PROC IMPORT OUT=P1comp_mancanti1 DATATABLE='P1comp_mancanti1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1comp_mancanti1;
SET P1comp_mancanti1;
LABEL P1comp_mancanti1='Specificare altro';
RUN;

PROC IMPORT OUT=P1E DATATABLE='P1E' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE EconAbilF
1 = 'Analisi di bilancio'
2 = 'Analisi e decisione nei mercati finanziari'
3 = 'Aspetti giuridici della gestione aziendale (commerciale e tributario)'
4 = 'Conoscenza degli strumenti informatici'
5 = 'Conoscenza delle lingue'
6 = 'Controllo di gestione  budgeting e reporting'
7 = 'Gestione del processo logistico'
8 = 'Gestione della finanza aziendale'
9 = 'Gestione e sviluppo delle risorse umane'
10 = 'Modelli di gestione attività no profit'
11 = 'Modelli di gestione delle imprese pubbliche'
12 = 'Pianificazione commerciale'
13 = 'Progettazione attività di marketing'
14 = 'Progettazione sistemi informativi'
15 = 'Programmazione della produzione'
16 = 'Strumenti quantitativi (modelli matematici e statistici per le decisioni)'
17 = 'Tecnica professionale (Revisione contabile)'
18 = 'Altro'
;
DATA LIB.P1E;
SET P1E;
LABEL P1E='Quali abilità (COMPETENZE) utilizza per il Suo lavoro?';
FORMAT P1E EconAbilF. ;
PROC TRANSPOSE OUT=LIB.P1E_MCOLS PREFIX=P1E_ ;
BY UID TID Block;
VAR P1E;
ID P1E;
RUN;

PROC IMPORT OUT=P1Ebis DATATABLE='P1Ebis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1Ebis;
SET P1Ebis;
LABEL P1Ebis='Può specificare?';
RUN;

PROC IMPORT OUT=P1Ec_1 DATATABLE='P1Ec_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_1;
SET P1Ec_1;
LABEL P1Ec_1='Utilizzare strumenti informatici per ricerca di informazioni e dati su WEB';
FORMAT P1Ec_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_10 DATATABLE='P1Ec_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_10;
SET P1Ec_10;
LABEL P1Ec_10='Pianificazione e gestione aziendale';
FORMAT P1Ec_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_11 DATATABLE='P1Ec_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_11;
SET P1Ec_11;
LABEL P1Ec_11='Pianificazione e gestione attività di marketing e communicazione';
FORMAT P1Ec_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_12 DATATABLE='P1Ec_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_12;
SET P1Ec_12;
LABEL P1Ec_12='Progettazione sistemi informativi';
FORMAT P1Ec_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_13 DATATABLE='P1Ec_13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_13;
SET P1Ec_13;
LABEL P1Ec_13='Programmazione della produzione o degli acquisti di materie prime';
FORMAT P1Ec_13 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_14 DATATABLE='P1Ec_14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_14;
SET P1Ec_14;
LABEL P1Ec_14='Uso di modelli matematici e statistici per le decisioni  analisi di dati';
FORMAT P1Ec_14 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_15 DATATABLE='P1Ec_15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_15;
SET P1Ec_15;
LABEL P1Ec_15='Uso di strumenti di analisi organizzativa e di processi';
FORMAT P1Ec_15 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_16 DATATABLE='P1Ec_16' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_16;
SET P1Ec_16;
LABEL P1Ec_16='Revisione contabile';
FORMAT P1Ec_16 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_17 DATATABLE='P1Ec_17' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_17;
SET P1Ec_17;
LABEL P1Ec_17='Parlare o scrivere in inglese';
FORMAT P1Ec_17 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_18 DATATABLE='P1Ec_18' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_18;
SET P1Ec_18;
LABEL P1Ec_18='Leggere  parlare o scrivere in un altra lingua';
FORMAT P1Ec_18 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_19 DATATABLE='P1Ec_19' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_19;
SET P1Ec_19;
LABEL P1Ec_19='Organizzare il lavoro degli altri';
FORMAT P1Ec_19 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_2 DATATABLE='P1Ec_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_2;
SET P1Ec_2;
LABEL P1Ec_2='Utilizzo del calcolatore per svolgere attività tecniche';
FORMAT P1Ec_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_20 DATATABLE='P1Ec_20' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_20;
SET P1Ec_20;
LABEL P1Ec_20='Gestire rapporti con clienti  utenti  fornitori';
FORMAT P1Ec_20 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_21 DATATABLE='P1Ec_21' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_21;
SET P1Ec_21;
LABEL P1Ec_21='Scrivere rapporti di ricerca';
FORMAT P1Ec_21 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_3 DATATABLE='P1Ec_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_3;
SET P1Ec_3;
LABEL P1Ec_3='Contabilità e analisi di bilancio';
FORMAT P1Ec_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_4 DATATABLE='P1Ec_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_4;
SET P1Ec_4;
LABEL P1Ec_4='Analisi e decisioni nei mercati finanziari';
FORMAT P1Ec_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_5 DATATABLE='P1Ec_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_5;
SET P1Ec_5;
LABEL P1Ec_5='Aspetti giuridici della gestione aziendale (commerciale e tributario)';
FORMAT P1Ec_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_6 DATATABLE='P1Ec_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_6;
SET P1Ec_6;
LABEL P1Ec_6='Controllo di gestione  budgeting e reporting';
FORMAT P1Ec_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_7 DATATABLE='P1Ec_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_7;
SET P1Ec_7;
LABEL P1Ec_7='Gestione del  processo logistico';
FORMAT P1Ec_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_8 DATATABLE='P1Ec_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_8;
SET P1Ec_8;
LABEL P1Ec_8='Gestione della finanza aziendale';
FORMAT P1Ec_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ec_9 DATATABLE='P1Ec_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ec_9;
SET P1Ec_9;
LABEL P1Ec_9='Gestione e sviluppo delle risorse umane';
FORMAT P1Ec_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1F DATATABLE='P1F' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE formazF
0 = 'Capacità di usare tecniche e linguaggi della comunicazione diretta e mediata'
1 = 'Capacità di ascolto attivo'
2 = 'Capacità di comunicare in modo assertivo'
3 = 'Capacità di comunicare in rete'
4 = 'Capacità di adattamento alle diverse situazioni socio-relazionali'
5 = 'Capacità di lavorare in gruppo  in équipe'
6 = 'Capacità di elaborazione scritta di saggi/rapporti...'
7 = 'Capacità di applicare metodi e tecniche formativo-educativo-animativi'
8 = 'Capacità di efficacia personale (elaborazione vissuti  emozioni...)'
9 = 'Capacità di curiosità culturale ed apertura mentale'
10 = 'Capacità di promuovere interazioni interpersonali e intergruppali'
11 = 'Capacità di interpretare eventi alla luce delle Scienze dell Educazione'
12 = 'Capacità di diagnosticare bisogni e potenzialità di sviluppo della persona e della comunità'
13 = 'Capacità di osservazione sistematica e d uso di relativi metodi e strumenti'
14 = 'Capacità di problem finding'
15 = 'Capacità di comprendere ed elaborare unitariamente le problematiche della persona'
16 = 'Capacità di visione olistica'
17 = 'Capacità di problem solving'
18 = 'Capacità di ricerca-azione'
19 = 'Capacità di direzione'
20 = 'Capacità di progettazione  monitoraggio e valutazione di eventi educativo-formativi'
21 = 'Disponibilità allo studio a all autoaggiornamento'
22 = 'Altro'
;
DATA LIB.P1F;
SET P1F;
LABEL P1F='Quali abilità (COMPETENZE) utilizza per il Suo lavoro?';
FORMAT P1F formazF. ;
PROC TRANSPOSE OUT=LIB.P1F_MCOLS PREFIX=P1F_ ;
BY UID TID Block;
VAR P1F;
ID P1F;
RUN;

PROC IMPORT OUT=P1Farm_1 DATATABLE='P1Farm_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_1;
SET P1Farm_1;
LABEL P1Farm_1='Utilizzo del calcolatore';
FORMAT P1Farm_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_10 DATATABLE='P1Farm_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_10;
SET P1Farm_10;
LABEL P1Farm_10='Utilizzare tecniche e strumentazioni di laboratorio';
FORMAT P1Farm_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_11 DATATABLE='P1Farm_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_11;
SET P1Farm_11;
LABEL P1Farm_11='Realizzare analisi chimiche  microbiologiche  tecnologiche';
FORMAT P1Farm_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_12 DATATABLE='P1Farm_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_12;
SET P1Farm_12;
LABEL P1Farm_12='Sviluppo (ricerca) nuovi prodotti farmacologici  chimici  cosmetici';
FORMAT P1Farm_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_2 DATATABLE='P1Farm_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_2;
SET P1Farm_2;
LABEL P1Farm_2='Parlare o scrivere in inglese';
FORMAT P1Farm_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_3 DATATABLE='P1Farm_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_3;
SET P1Farm_3;
LABEL P1Farm_3='Leggere  parlare o scrivere  in un altra lingua straniera';
FORMAT P1Farm_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_4 DATATABLE='P1Farm_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_4;
SET P1Farm_4;
LABEL P1Farm_4='Sapere relazionarsi con glia altri  comuniare';
FORMAT P1Farm_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_5 DATATABLE='P1Farm_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_5;
SET P1Farm_5;
LABEL P1Farm_5='Conoscere la legislazione farmaceutica';
FORMAT P1Farm_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_6 DATATABLE='P1Farm_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_6;
SET P1Farm_6;
LABEL P1Farm_6='Organizzare il lavoro degli altri';
FORMAT P1Farm_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_7 DATATABLE='P1Farm_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_7;
SET P1Farm_7;
LABEL P1Farm_7='Conoscere la brevettistica  la farmacovigilanza';
FORMAT P1Farm_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_8 DATATABLE='P1Farm_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_8;
SET P1Farm_8;
LABEL P1Farm_8='Avere cultura d impresa';
FORMAT P1Farm_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Farm_9 DATATABLE='P1Farm_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Farm_9;
SET P1Farm_9;
LABEL P1Farm_9='Progettare e/o realizzare ricerche di mercato  marketing';
FORMAT P1Farm_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Fbis DATATABLE='P1Fbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1Fbis;
SET P1Fbis;
LABEL P1Fbis='Può specificare?';
RUN;

PROC IMPORT OUT=P1G DATATABLE='P1G' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE giurispF
1 = 'Capacità di individuare gli elementi giuridicamente rilevanti delle fattispecie'
2 = 'Capacità di reperire informazioni normative e giurisprudenziali utilizzando strumenti di ricerca cartacei o informatici'
3 = 'Riflessione teorico-filosofica sui sistemi giuridici'
4 = 'Riflessione storico-comparativa sui sistemi giuridici'
5 = 'Riflessione economica sulla disciplina giuridica del mercato'
6 = 'Organizzazione pratica dell attività lavorativa'
7 = 'Problem-solving'
8 = 'Abilità linguistiche'
9 = 'Altro'
;
DATA LIB.P1G;
SET P1G;
LABEL P1G='Quali abilità (COMPETENZE) utilizza per il Suo lavoro?';
FORMAT P1G giurispF. ;
PROC TRANSPOSE OUT=LIB.P1G_MCOLS PREFIX=P1G_ ;
BY UID TID Block;
VAR P1G;
ID P1G;
RUN;

PROC IMPORT OUT=P1Gbis DATATABLE='P1Gbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1Gbis;
SET P1Gbis;
LABEL P1Gbis='Può specificare?';
RUN;

PROC IMPORT OUT=P1GR_1 DATATABLE='P1GR_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_1;
SET P1GR_1;
LABEL P1GR_1='Utilizzare strumenti informatici per ricerca informazioni normative e giurisprudenziali';
FORMAT P1GR_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_10 DATATABLE='P1GR_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_10;
SET P1GR_10;
LABEL P1GR_10='Lavorare in gruppo  in èquipe';
FORMAT P1GR_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_11 DATATABLE='P1GR_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_11;
SET P1GR_11;
LABEL P1GR_11='Gestire rapporti con clienti  utenti  fornitori';
FORMAT P1GR_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_12 DATATABLE='P1GR_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_12;
SET P1GR_12;
LABEL P1GR_12='Comporre controversie  mediare tra soggetti e interessi';
FORMAT P1GR_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_13 DATATABLE='P1GR_13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_13;
SET P1GR_13;
LABEL P1GR_13='Parlare o scrivere in inglese';
FORMAT P1GR_13 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_14 DATATABLE='P1GR_14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_14;
SET P1GR_14;
LABEL P1GR_14='Leggere  parlare o scrivere in un altra  lingua straniera';
FORMAT P1GR_14 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_15 DATATABLE='P1GR_15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_15;
SET P1GR_15;
LABEL P1GR_15='Scrivere progetti per ottenere fondi';
FORMAT P1GR_15 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_16 DATATABLE='P1GR_16' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_16;
SET P1GR_16;
LABEL P1GR_16='Scrivere rapporti (di ricerca)';
FORMAT P1GR_16 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_17 DATATABLE='P1GR_17' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_17;
SET P1GR_17;
LABEL P1GR_17='Parlare in pubblico';
FORMAT P1GR_17 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_18 DATATABLE='P1GR_18' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_18;
SET P1GR_18;
LABEL P1GR_18='Capacità di interpretare o applicare normative nuove (che non siano state oggetto di precedente studio)';
FORMAT P1GR_18 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_2 DATATABLE='P1GR_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_2;
SET P1GR_2;
LABEL P1GR_2='Ricerca bibliotecaria (cartacea) di informazioni normative e giurisprudenzali';
FORMAT P1GR_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_3 DATATABLE='P1GR_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_3;
SET P1GR_3;
LABEL P1GR_3='Capacità di ricondurre il caso concreto nelle categorie giuridiche';
FORMAT P1GR_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_4 DATATABLE='P1GR_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_4;
SET P1GR_4;
LABEL P1GR_4='Sostenere una discussione giuridica';
FORMAT P1GR_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_5 DATATABLE='P1GR_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_5;
SET P1GR_5;
LABEL P1GR_5='Capacità di redigere un atto o un parere giuridico';
FORMAT P1GR_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_6 DATATABLE='P1GR_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_6;
SET P1GR_6;
LABEL P1GR_6='Conoscenze di economia  scienza delle finanze';
FORMAT P1GR_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_7 DATATABLE='P1GR_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_7;
SET P1GR_7;
LABEL P1GR_7='Conoscenze di economia aziendale  marketing';
FORMAT P1GR_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_8 DATATABLE='P1GR_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_8;
SET P1GR_8;
LABEL P1GR_8='Conoscere le normative sui contratti.';
FORMAT P1GR_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1GR_9 DATATABLE='P1GR_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1GR_9;
SET P1GR_9;
LABEL P1GR_9='Organizzare il lavoro degli altri  organizzare cose';
FORMAT P1GR_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1I DATATABLE='P1I' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ingegnF
1 = 'Discussione di problematiche tecnico/scientifiche'
2 = 'Elaborazione di modelli matematici'
3 = 'Elaborazione di relazioni tecniche '
4 = 'Esecuzione di calcoli'
5 = 'Lavorare in gruppo  in équipe'
6 = 'Organizzazione/programmazione del lavoro'
7 = 'Reperimento  consultazione e utilizzazione di informazioni su banche dati e in letteratura'
8 = 'Risoluzione di problemi tecnici specifici'
9 = 'Utilizzo del computer'
10 = 'Utilizzare strumenti di laboratorio'
11 = 'Utilizzazione di strumentazione scientifica'
12 = 'Altro'
;
DATA LIB.P1I;
SET P1I;
LABEL P1I='Quali abilità (COMPETENZE) utilizza per il Suo lavoro?';
FORMAT P1I ingegnF. ;
PROC TRANSPOSE OUT=LIB.P1I_MCOLS PREFIX=P1I_ ;
BY UID TID Block;
VAR P1I;
ID P1I;
RUN;

PROC IMPORT OUT=P1Ibis DATATABLE='P1Ibis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1Ibis;
SET P1Ibis;
LABEL P1Ibis='Può specificare?';
RUN;

PROC IMPORT OUT=P1Ing_1 DATATABLE='P1Ing_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_1;
SET P1Ing_1;
LABEL P1Ing_1='Discussione di problematiche tecnico/scientifiche';
FORMAT P1Ing_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_10 DATATABLE='P1Ing_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_10;
SET P1Ing_10;
LABEL P1Ing_10='Reperimento  consultazione e utilizzazione di informazioni su banche dati e in letteratura';
FORMAT P1Ing_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_11 DATATABLE='P1Ing_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_11;
SET P1Ing_11;
LABEL P1Ing_11='Gestione e analisi di dati';
FORMAT P1Ing_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_12 DATATABLE='P1Ing_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_12;
SET P1Ing_12;
LABEL P1Ing_12='Organizzazione/ programmazione del lavoro';
FORMAT P1Ing_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_13 DATATABLE='P1Ing_13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_13;
SET P1Ing_13;
LABEL P1Ing_13='Competenze economiche/aziendali';
FORMAT P1Ing_13 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_14 DATATABLE='P1Ing_14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_14;
SET P1Ing_14;
LABEL P1Ing_14='Presentare progetti';
FORMAT P1Ing_14 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_15 DATATABLE='P1Ing_15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_15;
SET P1Ing_15;
LABEL P1Ing_15='Parlare o scrivere in lingua inglese';
FORMAT P1Ing_15 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_16 DATATABLE='P1Ing_16' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_16;
SET P1Ing_16;
LABEL P1Ing_16='Leggere  parlare o scrivere in un altra lingua straniera';
FORMAT P1Ing_16 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_2 DATATABLE='P1Ing_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_2;
SET P1Ing_2;
LABEL P1Ing_2='Elaborazione di modelli matematici';
FORMAT P1Ing_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_3 DATATABLE='P1Ing_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_3;
SET P1Ing_3;
LABEL P1Ing_3='Elaborazione di relazioni tecniche ';
FORMAT P1Ing_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_4 DATATABLE='P1Ing_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_4;
SET P1Ing_4;
LABEL P1Ing_4='Esecuzione di calcoli';
FORMAT P1Ing_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_5 DATATABLE='P1Ing_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_5;
SET P1Ing_5;
LABEL P1Ing_5='Lavorare in gruppo  in équipe';
FORMAT P1Ing_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_6 DATATABLE='P1Ing_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_6;
SET P1Ing_6;
LABEL P1Ing_6='Disegno/progettazione';
FORMAT P1Ing_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_7 DATATABLE='P1Ing_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_7;
SET P1Ing_7;
LABEL P1Ing_7='Sapersi rapportare con clienti/utenti';
FORMAT P1Ing_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_8 DATATABLE='P1Ing_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_8;
SET P1Ing_8;
LABEL P1Ing_8='Utilizzazione di strumentazione scientifico-tecnica  di laboratorio';
FORMAT P1Ing_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ing_9 DATATABLE='P1Ing_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ing_9;
SET P1Ing_9;
LABEL P1Ing_9='Programmazione e analisi di sistemi';
FORMAT P1Ing_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_1 DATATABLE='P1Lett_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_1;
SET P1Lett_1;
LABEL P1Lett_1='Utilizzare il calcolatore';
FORMAT P1Lett_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_10 DATATABLE='P1Lett_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_10;
SET P1Lett_10;
LABEL P1Lett_10='Predisporre e sottoscrivere atti e provvedimenti.';
FORMAT P1Lett_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_11 DATATABLE='P1Lett_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_11;
SET P1Lett_11;
LABEL P1Lett_11='Applicare conoscenze economiche/aziendali';
FORMAT P1Lett_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_2 DATATABLE='P1Lett_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_2;
SET P1Lett_2;
LABEL P1Lett_2='Capacità di relazione e comunicazione';
FORMAT P1Lett_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_3 DATATABLE='P1Lett_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_3;
SET P1Lett_3;
LABEL P1Lett_3='Lavorare in gruppo  in èquipe';
FORMAT P1Lett_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_4 DATATABLE='P1Lett_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_4;
SET P1Lett_4;
LABEL P1Lett_4='Padronanza del linguaggio scritto e parlato';
FORMAT P1Lett_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_5 DATATABLE='P1Lett_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_5;
SET P1Lett_5;
LABEL P1Lett_5='Parlare o scrivere in lingua inglese';
FORMAT P1Lett_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_6 DATATABLE='P1Lett_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_6;
SET P1Lett_6;
LABEL P1Lett_6='Leggere  parlare o scrivere in un altra lingua straniera';
FORMAT P1Lett_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_7 DATATABLE='P1Lett_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_7;
SET P1Lett_7;
LABEL P1Lett_7='Reperire fonti e dati su Internet e in letteratura';
FORMAT P1Lett_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_8 DATATABLE='P1Lett_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_8;
SET P1Lett_8;
LABEL P1Lett_8='Problem solving';
FORMAT P1Lett_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Lett_9 DATATABLE='P1Lett_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Lett_9;
SET P1Lett_9;
LABEL P1Lett_9='Catalogare e classificare beni culturali  museali  ambientali.';
FORMAT P1Lett_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1P DATATABLE='P1P' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE psicol1F
1 = 'Analizzare i dati'
2 = 'Analizzare le dinamiche di gruppo'
3 = 'Applicare le tecniche di indagine della personalità'
4 = 'Applicare tecniche di osservazione del comportamento'
5 = 'Condurre colloqui clinici'
6 = 'Conoscere ed usare le fonti dei dati'
7 = 'Conoscere le lingue'
8 = 'Costruire strumenti per la misurazione di variabili psicologiche'
9 = 'Fare ricerche sperimentali'
10 = 'Progettare un intervento formativo'
11 = 'Progettare un intervento terapeutico'
12 = 'Somministrare e correggere test'
13 = 'Stendere rapporti di ricerca'
14 = 'Altro'
;
DATA LIB.P1P;
SET P1P;
LABEL P1P='Quali abilità (COMPETENZE) utilizza per il Suo lavoro?';
FORMAT P1P psicol1F. ;
PROC TRANSPOSE OUT=LIB.P1P_MCOLS PREFIX=P1P_ ;
BY UID TID Block;
VAR P1P;
ID P1P;
RUN;

PROC IMPORT OUT=P1Pbis DATATABLE='P1Pbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1Pbis;
SET P1Pbis;
LABEL P1Pbis='Può specificare?';
RUN;

PROC IMPORT OUT=P1Psico_1 DATATABLE='P1Psico_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_1;
SET P1Psico_1;
LABEL P1Psico_1='Progettare un intervento formativo';
FORMAT P1Psico_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_10 DATATABLE='P1Psico_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_10;
SET P1Psico_10;
LABEL P1Psico_10='Analizzare dati osservabili e sperimentali';
FORMAT P1Psico_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_11 DATATABLE='P1Psico_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_11;
SET P1Psico_11;
LABEL P1Psico_11='Utilizzare il calcolatore';
FORMAT P1Psico_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_12 DATATABLE='P1Psico_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_12;
SET P1Psico_12;
LABEL P1Psico_12='Conoscere e usare le fonti dei dati';
FORMAT P1Psico_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_13 DATATABLE='P1Psico_13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_13;
SET P1Psico_13;
LABEL P1Psico_13='Parlare o scrivere in inglese';
FORMAT P1Psico_13 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_14 DATATABLE='P1Psico_14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_14;
SET P1Psico_14;
LABEL P1Psico_14='Leggere  parlare o scrivere in un altra lingua straniera';
FORMAT P1Psico_14 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_15 DATATABLE='P1Psico_15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_15;
SET P1Psico_15;
LABEL P1Psico_15='Scrivere rapporti di ricerca';
FORMAT P1Psico_15 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_16 DATATABLE='P1Psico_16' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_16;
SET P1Psico_16;
LABEL P1Psico_16='Stendere progetti per ottenere fondi';
FORMAT P1Psico_16 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_17 DATATABLE='P1Psico_17' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_17;
SET P1Psico_17;
LABEL P1Psico_17='Gestire rapporti con clienti  utenti  fornitori';
FORMAT P1Psico_17 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_18 DATATABLE='P1Psico_18' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_18;
SET P1Psico_18;
LABEL P1Psico_18='Mediare tra soggetti  tra interessi  culture';
FORMAT P1Psico_18 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_19 DATATABLE='P1Psico_19' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_19;
SET P1Psico_19;
LABEL P1Psico_19='Orientare allo studio  al lavoro';
FORMAT P1Psico_19 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_2 DATATABLE='P1Psico_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_2;
SET P1Psico_2;
LABEL P1Psico_2='Progettare un intervento terapeutico';
FORMAT P1Psico_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_20 DATATABLE='P1Psico_20' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_20;
SET P1Psico_20;
LABEL P1Psico_20='Organizzare il lavoro di altri  organizzare cose  logistica';
FORMAT P1Psico_20 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_3 DATATABLE='P1Psico_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_3;
SET P1Psico_3;
LABEL P1Psico_3='Analizzare le dinamiche di gruppo';
FORMAT P1Psico_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_4 DATATABLE='P1Psico_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_4;
SET P1Psico_4;
LABEL P1Psico_4='Condurre colloqui clinici';
FORMAT P1Psico_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_5 DATATABLE='P1Psico_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_5;
SET P1Psico_5;
LABEL P1Psico_5='Applicare tecniche di indagini della personalità';
FORMAT P1Psico_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_6 DATATABLE='P1Psico_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_6;
SET P1Psico_6;
LABEL P1Psico_6='Applicare tecniche di osservazione del comportamento';
FORMAT P1Psico_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_7 DATATABLE='P1Psico_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_7;
SET P1Psico_7;
LABEL P1Psico_7='Fare ricerche sperimentali';
FORMAT P1Psico_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_8 DATATABLE='P1Psico_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_8;
SET P1Psico_8;
LABEL P1Psico_8='Costruire strumenti per la misurazione di variabili psicologiche';
FORMAT P1Psico_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Psico_9 DATATABLE='P1Psico_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Psico_9;
SET P1Psico_9;
LABEL P1Psico_9='Somministrare e correggere test';
FORMAT P1Psico_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sa DATATABLE='P1Sa' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sa;
SET P1Sa;
LABEL P1Sa='Conoscere e usare le fonti ufficiali dei dati';
FORMAT P1Sa NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sb DATATABLE='P1Sb' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sb;
SET P1Sb;
LABEL P1Sb='Progettare un indagine statistica  un sondaggio';
FORMAT P1Sb NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sc DATATABLE='P1Sc' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sc;
SET P1Sc;
LABEL P1Sc='Progettare e selezionare un campione statistico';
FORMAT P1Sc NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sd DATATABLE='P1Sd' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sd;
SET P1Sd;
LABEL P1Sd='Progettare un esperimento';
FORMAT P1Sd NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Se DATATABLE='P1Se' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Se;
SET P1Se;
LABEL P1Se='Leggere i risultati di un esperimento statistico';
FORMAT P1Se NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sf DATATABLE='P1Sf' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sf;
SET P1Sf;
LABEL P1Sf='Conoscere i linguaggi di calcolo automatico';
FORMAT P1Sf NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_1 DATATABLE='P1SF_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_1;
SET P1SF_1;
LABEL P1SF_1='Capacità di usare tecniche e linguaggi della comunicazione diretta e mediata';
FORMAT P1SF_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_10 DATATABLE='P1SF_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_10;
SET P1SF_10;
LABEL P1SF_10='Capacità di osservazione sistematica e d uso di relativi metodi e strumenti';
FORMAT P1SF_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_11 DATATABLE='P1SF_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_11;
SET P1SF_11;
LABEL P1SF_11='Capacità di ricerca-azione';
FORMAT P1SF_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_12 DATATABLE='P1SF_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_12;
SET P1SF_12;
LABEL P1SF_12='Capacità di direzione';
FORMAT P1SF_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_13 DATATABLE='P1SF_13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_13;
SET P1SF_13;
LABEL P1SF_13='Capacità di progettazione  monitoraggio e valutazione di eventi educativo-formativi';
FORMAT P1SF_13 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_14 DATATABLE='P1SF_14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_14;
SET P1SF_14;
LABEL P1SF_14='Capacità di analisi di dati';
FORMAT P1SF_14 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_15 DATATABLE='P1SF_15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_15;
SET P1SF_15;
LABEL P1SF_15='Capacità di usare il calcolatore';
FORMAT P1SF_15 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_16 DATATABLE='P1SF_16' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_16;
SET P1SF_16;
LABEL P1SF_16='Parlare o scrivere in inglese';
FORMAT P1SF_16 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_17 DATATABLE='P1SF_17' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_17;
SET P1SF_17;
LABEL P1SF_17='Leggere  parlare o scrivere in un altra lingua straniera';
FORMAT P1SF_17 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_18 DATATABLE='P1SF_18' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_18;
SET P1SF_18;
LABEL P1SF_18='Gestire rapporti con clienti  utenti  fornitori';
FORMAT P1SF_18 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_19 DATATABLE='P1SF_19' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_19;
SET P1SF_19;
LABEL P1SF_19='Capacità di mediate ta soggetti  interessi  culture';
FORMAT P1SF_19 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_2 DATATABLE='P1SF_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_2;
SET P1SF_2;
LABEL P1SF_2='Capacità  di ascolto attivo';
FORMAT P1SF_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_20 DATATABLE='P1SF_20' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_20;
SET P1SF_20;
LABEL P1SF_20='Capacità di orientare allo studio  al lavoro';
FORMAT P1SF_20 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_21 DATATABLE='P1SF_21' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_21;
SET P1SF_21;
LABEL P1SF_21='Scrivere rapporti (di ricerca)';
FORMAT P1SF_21 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_3 DATATABLE='P1SF_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_3;
SET P1SF_3;
LABEL P1SF_3='Capacità di comunicare in modo assertivo';
FORMAT P1SF_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_4 DATATABLE='P1SF_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_4;
SET P1SF_4;
LABEL P1SF_4='Capacità di comunicare in rete';
FORMAT P1SF_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_5 DATATABLE='P1SF_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_5;
SET P1SF_5;
LABEL P1SF_5='Capacità di lavorare in gruppo  in èquipe';
FORMAT P1SF_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_6 DATATABLE='P1SF_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_6;
SET P1SF_6;
LABEL P1SF_6='Capacità di applicare metodi e tecniche formativo-educatico-animazione';
FORMAT P1SF_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_7 DATATABLE='P1SF_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_7;
SET P1SF_7;
LABEL P1SF_7='Capacità di promuovere interazioni interpersonali e intergruppali';
FORMAT P1SF_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_8 DATATABLE='P1SF_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_8;
SET P1SF_8;
LABEL P1SF_8='Capacità di interpretare eventi alla luce delle Scienze dell Educazione';
FORMAT P1SF_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SF_9 DATATABLE='P1SF_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SF_9;
SET P1SF_9;
LABEL P1SF_9='Capacità di diagnosticare bisogni e potenzialità di sviluppo della persona e  della comunità';
FORMAT P1SF_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sg DATATABLE='P1Sg' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sg;
SET P1Sg;
LABEL P1Sg='Usare i packages per l analisi statistica dei dati (SPSS  SAS  STATISTICA  ecc.)';
FORMAT P1Sg NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sh DATATABLE='P1Sh' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sh;
SET P1Sh;
LABEL P1Sh='Fare simulazioni su calcolatore (metodi Montecarlo  ecc.)';
FORMAT P1Sh NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Si DATATABLE='P1Si' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Si;
SET P1Si;
LABEL P1Si='Leggere i risultati di un analisi multivariata';
FORMAT P1Si NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sl DATATABLE='P1Sl' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sl;
SET P1Sl;
LABEL P1Sl='Analizzare fenomeni demografici  sociali';
FORMAT P1Sl NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sm DATATABLE='P1Sm' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sm;
SET P1Sm;
LABEL P1Sm='Analizzare fenomeni economici';
FORMAT P1Sm NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_1 DATATABLE='P1SM_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_1;
SET P1SM_1;
LABEL P1SM_1='Discutere problematiche di natura scientifica e tecnica';
FORMAT P1SM_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_10 DATATABLE='P1SM_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_10;
SET P1SM_10;
LABEL P1SM_10='Gestire rapporti con clienti  utenti  fornitori';
FORMAT P1SM_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_11 DATATABLE='P1SM_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_11;
SET P1SM_11;
LABEL P1SM_11='Mediare tra soggetti  tra interessi  culture';
FORMAT P1SM_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_12 DATATABLE='P1SM_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_12;
SET P1SM_12;
LABEL P1SM_12='Reperire  consultare e utilizzare informazioni presenti in banche dati';
FORMAT P1SM_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_13 DATATABLE='P1SM_13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_13;
SET P1SM_13;
LABEL P1SM_13='Gestire e analizzare dati';
FORMAT P1SM_13 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_14 DATATABLE='P1SM_14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_14;
SET P1SM_14;
LABEL P1SM_14='Parlare o scrivere in lingua inglese';
FORMAT P1SM_14 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_15 DATATABLE='P1SM_15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_15;
SET P1SM_15;
LABEL P1SM_15='Leggere  parlare o scrivere in un altra lingua straniera';
FORMAT P1SM_15 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_2 DATATABLE='P1SM_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_2;
SET P1SM_2;
LABEL P1SM_2='Utilizzare strumentazione scientifica   di laboratorio';
FORMAT P1SM_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_3 DATATABLE='P1SM_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_3;
SET P1SM_3;
LABEL P1SM_3='Organizzare l attività di laboratorio';
FORMAT P1SM_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_4 DATATABLE='P1SM_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_4;
SET P1SM_4;
LABEL P1SM_4='Elaborare modelli matematici';
FORMAT P1SM_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_5 DATATABLE='P1SM_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_5;
SET P1SM_5;
LABEL P1SM_5='Scrivere relazioni tecniche';
FORMAT P1SM_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_6 DATATABLE='P1SM_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_6;
SET P1SM_6;
LABEL P1SM_6='Elaborare progetti per la richiesta di finanziamenti pubblici e privati';
FORMAT P1SM_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_7 DATATABLE='P1SM_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_7;
SET P1SM_7;
LABEL P1SM_7='Conoscenze di economia aziendale  di marketing';
FORMAT P1SM_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_8 DATATABLE='P1SM_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_8;
SET P1SM_8;
LABEL P1SM_8='Lavorare in gruppo  in èquipe';
FORMAT P1SM_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SM_9 DATATABLE='P1SM_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SM_9;
SET P1SM_9;
LABEL P1SM_9='Organizzare/programmare il lavoro di altri  organizzare cose logistiche';
FORMAT P1SM_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sn DATATABLE='P1Sn' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sn;
SET P1Sn;
LABEL P1Sn='Fare previsioni demografiche';
FORMAT P1Sn NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1So DATATABLE='P1So' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1So;
SET P1So;
LABEL P1So='Fare previsioni economiche';
FORMAT P1So NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sp DATATABLE='P1Sp' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sp;
SET P1Sp;
LABEL P1Sp='Progettare un servizio sociale';
FORMAT P1Sp NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_1 DATATABLE='P1SP_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_1;
SET P1SP_1;
LABEL P1SP_1='Utilizzare strumenti informatici per la ricerca informazioni tecnico-professionali';
FORMAT P1SP_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_10 DATATABLE='P1SP_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_10;
SET P1SP_10;
LABEL P1SP_10='Comporre controversie  mediare tra soggetti  interessi  culture';
FORMAT P1SP_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_11 DATATABLE='P1SP_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_11;
SET P1SP_11;
LABEL P1SP_11='Orientare allo studio  al lavoro  ecc.';
FORMAT P1SP_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_12 DATATABLE='P1SP_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_12;
SET P1SP_12;
LABEL P1SP_12='Parlare o scrivere in inglese';
FORMAT P1SP_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_13 DATATABLE='P1SP_13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_13;
SET P1SP_13;
LABEL P1SP_13='Leggere  parlare o scrivere in altra lingua straniera';
FORMAT P1SP_13 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_14 DATATABLE='P1SP_14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_14;
SET P1SP_14;
LABEL P1SP_14='Scrivere progetti per avere fondi';
FORMAT P1SP_14 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_15 DATATABLE='P1SP_15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_15;
SET P1SP_15;
LABEL P1SP_15='Analizzare dati statistici';
FORMAT P1SP_15 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_16 DATATABLE='P1SP_16' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_16;
SET P1SP_16;
LABEL P1SP_16='Scrivere rapporti (di ricerca)';
FORMAT P1SP_16 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_17 DATATABLE='P1SP_17' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_17;
SET P1SP_17;
LABEL P1SP_17='Parlare in pubblico';
FORMAT P1SP_17 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_2 DATATABLE='P1SP_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_2;
SET P1SP_2;
LABEL P1SP_2='Conoscenze del diritto commerciale  del lavoro  contrattuale  civile  di area tecnica';
FORMAT P1SP_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_3 DATATABLE='P1SP_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_3;
SET P1SP_3;
LABEL P1SP_3='Conoscenze del diritto pubblico  (degli enti locali  regionali  costituzionale  internazionale)';
FORMAT P1SP_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_4 DATATABLE='P1SP_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_4;
SET P1SP_4;
LABEL P1SP_4='Conoscenze di economia  scienze delle finanze';
FORMAT P1SP_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_5 DATATABLE='P1SP_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_5;
SET P1SP_5;
LABEL P1SP_5='Conoscenze di economia aziendale  marketing';
FORMAT P1SP_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_6 DATATABLE='P1SP_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_6;
SET P1SP_6;
LABEL P1SP_6='Conoscenze di bilanci  contabilità';
FORMAT P1SP_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_7 DATATABLE='P1SP_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_7;
SET P1SP_7;
LABEL P1SP_7='Organizzare il lavoro degli altri  organizzare cose  logistica';
FORMAT P1SP_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_8 DATATABLE='P1SP_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_8;
SET P1SP_8;
LABEL P1SP_8='Lavorare in gruppo  in èquipe';
FORMAT P1SP_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SP_9 DATATABLE='P1SP_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SP_9;
SET P1SP_9;
LABEL P1SP_9='Gestire rapporti con clienti  utenti  fornitori';
FORMAT P1SP_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sq DATATABLE='P1Sq' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sq;
SET P1Sq;
LABEL P1Sq='Analizzare un bilancio';
FORMAT P1Sq NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sr DATATABLE='P1Sr' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sr;
SET P1Sr;
LABEL P1Sr='Predisporre controlli di gestione di aziende o servizi';
FORMAT P1Sr NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Ss DATATABLE='P1Ss' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Ss;
SET P1Ss;
LABEL P1Ss='Valutare qualità di servizi';
FORMAT P1Ss NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_1 DATATABLE='P1SS_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_1;
SET P1SS_1;
LABEL P1SS_1='Conoscere e usare le fonti ufficiali dei dati';
FORMAT P1SS_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_10 DATATABLE='P1SS_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_10;
SET P1SS_10;
LABEL P1SS_10='Progettare e valutare servizi';
FORMAT P1SS_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_11 DATATABLE='P1SS_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_11;
SET P1SS_11;
LABEL P1SS_11='Analisi di bilanci  controllo di gestione';
FORMAT P1SS_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_12 DATATABLE='P1SS_12' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_12;
SET P1SS_12;
LABEL P1SS_12='Costruire ed interpretare indicatici ed informazioni per le decisioni';
FORMAT P1SS_12 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_13 DATATABLE='P1SS_13' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_13;
SET P1SS_13;
LABEL P1SS_13='Scrivere rapporti (di ricerca)';
FORMAT P1SS_13 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_14 DATATABLE='P1SS_14' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_14;
SET P1SS_14;
LABEL P1SS_14='Parlare o scrivere in inglese';
FORMAT P1SS_14 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_15 DATATABLE='P1SS_15' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_15;
SET P1SS_15;
LABEL P1SS_15='Leggere  parlare o scrivere in altra lingua straniera';
FORMAT P1SS_15 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_16 DATATABLE='P1SS_16' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_16;
SET P1SS_16;
LABEL P1SS_16='Communicare con altri esperti (diversi da statistica)';
FORMAT P1SS_16 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_17 DATATABLE='P1SS_17' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_17;
SET P1SS_17;
LABEL P1SS_17='Gestire rapporti clienti  utenti  fornitori';
FORMAT P1SS_17 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_18 DATATABLE='P1SS_18' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_18;
SET P1SS_18;
LABEL P1SS_18='Saper lavorare in gruppo  in èquipe';
FORMAT P1SS_18 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_19 DATATABLE='P1SS_19' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_19;
SET P1SS_19;
LABEL P1SS_19='Organizzare il lavoro degli altri';
FORMAT P1SS_19 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_2 DATATABLE='P1SS_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_2;
SET P1SS_2;
LABEL P1SS_2='Progettare indagini statistiche  sondaggi  ricerche di mercato  test di prodotto';
FORMAT P1SS_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_3 DATATABLE='P1SS_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_3;
SET P1SS_3;
LABEL P1SS_3='Progettare esperimenti e interpretare i risultati';
FORMAT P1SS_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_4 DATATABLE='P1SS_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_4;
SET P1SS_4;
LABEL P1SS_4='Aplicare linguaggi di programmazione';
FORMAT P1SS_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_5 DATATABLE='P1SS_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_5;
SET P1SS_5;
LABEL P1SS_5='Elaborare ed analizzare i dati con packages (SPSS  SAS  STATISTICA ecc.)';
FORMAT P1SS_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_6 DATATABLE='P1SS_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_6;
SET P1SS_6;
LABEL P1SS_6='Interpretare i risultati di analisi multivariate';
FORMAT P1SS_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_7 DATATABLE='P1SS_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_7;
SET P1SS_7;
LABEL P1SS_7='Fare simulazioni su calcolatore (metodi Montecarlo )';
FORMAT P1SS_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_8 DATATABLE='P1SS_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_8;
SET P1SS_8;
LABEL P1SS_8='Fare previsioni demografiche  sociali';
FORMAT P1SS_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1SS_9 DATATABLE='P1SS_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1SS_9;
SET P1SS_9;
LABEL P1SS_9='Fare previsioni economiche';
FORMAT P1SS_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1St DATATABLE='P1St' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1St;
SET P1St;
LABEL P1St='Progettare e/o realizzare ricerche di mercato';
FORMAT P1St NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Su DATATABLE='P1Su' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Su;
SET P1Su;
LABEL P1Su='Individuare indicatori e informazioni per le decisioni';
FORMAT P1Su NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sv DATATABLE='P1Sv' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sv;
SET P1Sv;
LABEL P1Sv='Stendere rapporti di ricerca';
FORMAT P1Sv NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sw DATATABLE='P1Sw' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sw;
SET P1Sw;
LABEL P1Sw='Usare mezzi audiovisivi';
FORMAT P1Sw NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sy DATATABLE='P1Sy' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sy;
SET P1Sy;
LABEL P1Sy='Conoscere le lingue';
FORMAT P1Sy NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Sz DATATABLE='P1Sz' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Sz;
SET P1Sz;
LABEL P1Sz='Comunicare con esperti in campi diversi della statistica';
FORMAT P1Sz NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1T DATATABLE='P1T' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE agrariaF
1 = 'Agronomia'
2 = 'Analisi di mercato e Marketing agroalimentare'
3 = 'Chimica del suolo e Uso e riciclo delle biomasse'
4 = 'Coltivazioni erbacee e foraggicoltura'
5 = 'Conservazione e trasformazione dei prodotti agroalimentari'
6 = 'Controllo della flora infestante'
7 = 'Costruzioni  ingegneria agraria e topografia'
8 = 'Diritto agrario e comunitario'
9 = 'Ecologia agraria'
10 = 'Economia e gestione ambientale'
11 = 'Estimo  valutazioni economiche e Pianificazione territoriale'
12 = 'Frutticoltura'
13 = 'Gestione degli allevamenti zootecnici'
14 = 'Gestione economico-finanziaria di impresa'
15 = 'Lotta biologica ed integrata e difesa degli alimenti dagli animali infestanti'
16 = 'Meccanizzazione agricola'
17 = 'Microbiologia e biotecnologie agrarie ed agroalimentari'
18 = 'Miglioramento genetico dei vegetali e degli animali da reddito'
19 = 'Nutrizione e Alimentazione degli animali da reddito'
20 = 'Orticoltura e florovivaismo'
21 = 'Patologia vegetale  dei prodotti e delle derrate agrarie'
22 = 'Progettazione e gestione verde pubblico e privato  parchi ed aree protette'
23 = 'Progetti di Sviluppo rurale e di investimento'
24 = 'Valutazione della Qualità e certificazione dei prodotti agroalimentari'
25 = 'Viticoltura ed enologia'
26 = 'Altro'
;
DATA LIB.P1T;
SET P1T;
LABEL P1T='Quali abilità?';
FORMAT P1T agrariaF. ;
PROC TRANSPOSE OUT=LIB.P1T_MCOLS PREFIX=P1T_ ;
BY UID TID Block;
VAR P1T;
ID P1T;
RUN;

PROC IMPORT OUT=P1Tbis DATATABLE='P1Tbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P1Tbis;
SET P1Tbis;
LABEL P1Tbis='Può specificare?';
RUN;

PROC IMPORT OUT=P1Veter_1 DATATABLE='P1Veter_1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_1;
SET P1Veter_1;
LABEL P1Veter_1='Parlare o scrivere in inglese';
FORMAT P1Veter_1 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_10 DATATABLE='P1Veter_10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_10;
SET P1Veter_10;
LABEL P1Veter_10='Gestione e analisi di dati';
FORMAT P1Veter_10 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_11 DATATABLE='P1Veter_11' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_11;
SET P1Veter_11;
LABEL P1Veter_11='Scrivere rapporti su ricerche';
FORMAT P1Veter_11 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_2 DATATABLE='P1Veter_2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_2;
SET P1Veter_2;
LABEL P1Veter_2='Leggere  parlare o scrivere in un altra lingua straniera';
FORMAT P1Veter_2 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_3 DATATABLE='P1Veter_3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_3;
SET P1Veter_3;
LABEL P1Veter_3='Utilizzare il calcolatore';
FORMAT P1Veter_3 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_4 DATATABLE='P1Veter_4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_4;
SET P1Veter_4;
LABEL P1Veter_4='Organizzare il Corso degli altri';
FORMAT P1Veter_4 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_5 DATATABLE='P1Veter_5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_5;
SET P1Veter_5;
LABEL P1Veter_5='Predisporre piani e progetti';
FORMAT P1Veter_5 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_6 DATATABLE='P1Veter_6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_6;
SET P1Veter_6;
LABEL P1Veter_6='Gestire rapporti clienti  utenti  fornitori';
FORMAT P1Veter_6 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_7 DATATABLE='P1Veter_7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_7;
SET P1Veter_7;
LABEL P1Veter_7='Gestire rapporti con i superiori';
FORMAT P1Veter_7 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_8 DATATABLE='P1Veter_8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_8;
SET P1Veter_8;
LABEL P1Veter_8='Applicare conoscenze cliniche';
FORMAT P1Veter_8 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P1Veter_9 DATATABLE='P1Veter_9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NieMoltoF
1 = 'Per niente'
2 = 'Poco'
3 = 'Abbastanza'
4 = 'Molto'
;
DATA LIB.P1Veter_9;
SET P1Veter_9;
LABEL P1Veter_9='Utilizzare strumentazioni tecnico-scientifica';
FORMAT P1Veter_9 NieMoltoF. ;
RUN;

PROC IMPORT OUT=P2a DATATABLE='P2a' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE forestF
1 = 'Assestamento e riassetto forestale'
2 = 'Verde e parchi urbani'
3 = 'Piani antincendio'
4 = 'Viabilià forestale'
5 = 'Sistemazioni idraulico forestali'
6 = 'Rimboschimento e rinverdimento versanti'
7 = 'Pianificazione territoriale (ambienti di pianura)'
8 = 'Pianificazione territoriale (ambienti montani)'
9 = 'Arboricoltura da legno'
10 = 'Zootecnia montana'
11 = 'Mercato del legno'
12 = 'Patologia forestale (difesa)'
13 = 'Sicurezza (ambito forestale)'
14 = 'Estimo forestale'
15 = 'Fauna selvatica'
16 = 'Vivaistica forestale'
17 = 'GIS e rilievi topografici'
18 = 'Valutazione Impatto Ambientale'
19 = 'Utilizzazioni forestali'
20 = 'Industrie del legno'
21 = 'Miglioramento pascoli'
22 = 'Altro'
;
DATA LIB.P2a;
SET P2a;
LABEL P2a='Abilità';
FORMAT P2a forestF. ;
PROC TRANSPOSE OUT=LIB.P2a_MCOLS PREFIX=P2a_ ;
BY UID TID Block;
VAR P2a;
ID P2a;
RUN;

PROC IMPORT OUT=P2abis DATATABLE='P2abis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P2abis;
SET P2abis;
LABEL P2abis='Può specificare?';
RUN;

PROC IMPORT OUT=P2altro DATATABLE='P2altro' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P2altro;
SET P2altro;
LABEL P2altro='Quali?';
RUN;

PROC IMPORT OUT=P2b DATATABLE='P2b' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE EconCompF
1 = 'Area bilancio  finanza e controllo'
2 = 'Area logistico-produttivo'
3 = 'Area organizzazione e risorse umane'
4 = 'Area commerciale e marketing'
5 = 'Area strumenti quantitativi (modelli matematici e statistici per decisioni)'
6 = 'Area giuridica per la gestione aziendale (commerciale e tributario)'
7 = 'Gestione delle imprese pubbliche'
8 = 'Gestione delle attività no-profit'
9 = 'Competenze di gestione dei sistemi informativi '
10 = 'Tecnica professionale'
11 = 'Altre competenze'
;
DATA LIB.P2b;
SET P2b;
LABEL P2b='Competenze di cui sente la mancanza';
FORMAT P2b EconCompF. ;
PROC TRANSPOSE OUT=LIB.P2b_MCOLS PREFIX=P2b_ ;
BY UID TID Block;
VAR P2b;
ID P2b;
RUN;

PROC IMPORT OUT=P2bbis DATATABLE='P2bbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P2bbis;
SET P2bbis;
LABEL P2bbis='Quali?';
RUN;

PROC IMPORT OUT=P2c DATATABLE='P2c' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE giurispF
1 = 'Capacità di individuare gli elementi giuridicamente rilevanti delle fattispecie'
2 = 'Capacità di reperire informazioni normative e giurisprudenziali utilizzando strumenti di ricerca cartacei o informatici'
3 = 'Riflessione teorico-filosofica sui sistemi giuridici'
4 = 'Riflessione storico-comparativa sui sistemi giuridici'
5 = 'Riflessione economica sulla disciplina giuridica del mercato'
6 = 'Organizzazione pratica dell attività lavorativa'
7 = 'Problem-solving'
8 = 'Abilità linguistiche'
9 = 'Altro'
;
DATA LIB.P2c;
SET P2c;
LABEL P2c='Competenze di cui sente la mancanza';
FORMAT P2c giurispF. ;
PROC TRANSPOSE OUT=LIB.P2c_MCOLS PREFIX=P2c_ ;
BY UID TID Block;
VAR P2c;
ID P2c;
RUN;

PROC IMPORT OUT=P2cbis DATATABLE='P2cbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P2cbis;
SET P2cbis;
LABEL P2cbis='Può specificare?';
RUN;

PROC IMPORT OUT=P2d DATATABLE='P2d' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ingegn1F
1 = 'Competenze matematiche approfondite'
2 = 'Competenze giuridiche e sociali'
3 = 'Competenze economico-gestionali'
4 = 'Competenze specialistiche di ingegneria approfondite'
5 = 'Competenze informatiche'
6 = 'Competenze linguistiche (lingue straniere)'
7 = 'Esperienza diretta di lavoro'
8 = 'Altro'
;
DATA LIB.P2d;
SET P2d;
LABEL P2d='Competenze di cui sente la mancanza';
FORMAT P2d ingegn1F. ;
PROC TRANSPOSE OUT=LIB.P2d_MCOLS PREFIX=P2d_ ;
BY UID TID Block;
VAR P2d;
ID P2d;
RUN;

PROC IMPORT OUT=P2dbis DATATABLE='P2dbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P2dbis;
SET P2dbis;
LABEL P2dbis='Può specificare?';
RUN;

PROC IMPORT OUT=P2e DATATABLE='P2e' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE areapsicF
1 = 'Biologica'
2 = 'Economica'
3 = 'Farmacologica'
4 = 'Giuridica'
5 = 'Informatica'
6 = 'Linguistica'
7 = 'Medica'
8 = 'Neurologica'
9 = 'Pedagogica'
10 = 'Statistica'
11 = 'Altro'
;
DATA LIB.P2e;
SET P2e;
LABEL P2e='Area';
FORMAT P2e areapsicF. ;
PROC TRANSPOSE OUT=LIB.P2e_MCOLS PREFIX=P2e_ ;
BY UID TID Block;
VAR P2e;
ID P2e;
RUN;

PROC IMPORT OUT=P2ebis DATATABLE='P2ebis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P2ebis;
SET P2ebis;
LABEL P2ebis='Può specificare?';
RUN;

PROC IMPORT OUT=P2f DATATABLE='P2f' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE formazF
0 = 'Capacità di usare tecniche e linguaggi della comunicazione diretta e mediata'
1 = 'Capacità di ascolto attivo'
2 = 'Capacità di comunicare in modo assertivo'
3 = 'Capacità di comunicare in rete'
4 = 'Capacità di adattamento alle diverse situazioni socio-relazionali'
5 = 'Capacità di lavorare in gruppo  in équipe'
6 = 'Capacità di elaborazione scritta di saggi/rapporti...'
7 = 'Capacità di applicare metodi e tecniche formativo-educativo-animativi'
8 = 'Capacità di efficacia personale (elaborazione vissuti  emozioni...)'
9 = 'Capacità di curiosità culturale ed apertura mentale'
10 = 'Capacità di promuovere interazioni interpersonali e intergruppali'
11 = 'Capacità di interpretare eventi alla luce delle Scienze dell Educazione'
12 = 'Capacità di diagnosticare bisogni e potenzialità di sviluppo della persona e della comunità'
13 = 'Capacità di osservazione sistematica e d uso di relativi metodi e strumenti'
14 = 'Capacità di problem finding'
15 = 'Capacità di comprendere ed elaborare unitariamente le problematiche della persona'
16 = 'Capacità di visione olistica'
17 = 'Capacità di problem solving'
18 = 'Capacità di ricerca-azione'
19 = 'Capacità di direzione'
20 = 'Capacità di progettazione  monitoraggio e valutazione di eventi educativo-formativi'
21 = 'Disponibilità allo studio a all autoaggiornamento'
22 = 'Altro'
;
DATA LIB.P2f;
SET P2f;
LABEL P2f='Lista di abilità';
FORMAT P2f formazF. ;
PROC TRANSPOSE OUT=LIB.P2f_MCOLS PREFIX=P2f_ ;
BY UID TID Block;
VAR P2f;
ID P2f;
RUN;

PROC IMPORT OUT=P2fbis DATATABLE='P2fbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P2fbis;
SET P2fbis;
LABEL P2fbis='Può specificare?';
RUN;

PROC IMPORT OUT=P2g DATATABLE='P2g' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE statistF
1 = 'di statistica multivariata'
2 = 'nell analisi di serie storiche'
3 = 'Altre competenze tecnico-statistiche'
4 = 'informatiche'
5 = 'demografiche'
6 = 'di analisi economica  econometrica'
7 = 'di economia d azienda'
8 = 'di statistica sociale  sociologia applicata'
9 = 'Altre'
;
DATA LIB.P2g;
SET P2g;
LABEL P2g='COMPETENZE di cui sente maggiormente la mancanza';
FORMAT P2g statistF. ;
PROC TRANSPOSE OUT=LIB.P2g_MCOLS PREFIX=P2g_ ;
BY UID TID Block;
VAR P2g;
ID P2g;
RUN;

PROC IMPORT OUT=P2gbis DATATABLE='P2gbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.P2gbis;
SET P2gbis;
LABEL P2gbis='Quali?';
RUN;

PROC IMPORT OUT=Q_AREA DATATABLE='Q_AREA' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE $AreaF
'A0001' = 'Amministrazione Finanza e Controllo'
'A0002' = 'Produzione Logistica Qualità'
'A0003' = 'Commerciale/Vendite/Comunicazione'
'A0004' = 'Tecnologia e Sistemi Informativi'
'A0005' = 'Istruzione Ricerca  e Formazione'
'A0006' = 'Libere Professioni/Consulenza'
;
DATA LIB.Q_AREA;
SET Q_AREA;
LABEL Q_AREA='In quale area Svolge il suo lavoro';
FORMAT Q_AREA AreaF. ;
RUN;

PROC IMPORT OUT=Q_MANSIONI DATATABLE='Q_MANSIONI' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q_MANSIONI;
SET Q_MANSIONI;
LABEL Q_MANSIONI='Quali MANSIONI svolge attualmente? ';
RUN;

PROC IMPORT OUT=Q_PROFESSIONI DATATABLE='Q_PROFESSIONI' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ProfessioniF
59 = 'Controller  esperto in controllo di gestione  analisi bilanci'
5 = 'Agronomo'
145 = 'Marketing  e Analisi di mercato  (addetto esperto responsabile  assistente  direttore)  Product manager'
39 = 'Chimica del suolo e Uso e riciclo delle biomasse'
42 = 'Coltivazioni erbacee e foraggicoltura'
47 = 'Conservazione e trasformazione dei prodotti agroalimentari'
60 = 'Controllo della flora infestante'
61 = 'Costruzioni  ingegneria agraria e topografia'
68 = 'Diritto agrario e comunitario'
72 = 'Ecologia agraria'
73 = 'Economia e gestione ambientale'
83 = 'Estimo  valutazioni economiche e Pianificazione territoriale'
98 = 'Frutticoltura'
107 = 'Gestione degli allevamenti zootecnici'
109 = 'Gestione economico-finanziaria di impresa'
142 = 'Lotta biologica ed integrata e difesa degli alimenti dagli animali infestanti'
147 = 'Meccanizzazione agricola'
156 = 'Microbiologia e biotecnologie agrarie ed agroalimentari'
157 = 'Miglioramento genetico dei vegetali e degli animali da reddito'
162 = 'Nutrizione e Alimentazione degli animali da reddito'
170 = 'Orticoltura e florovivaismo'
174 = 'Patologia vegetale  dei prodotti e delle derrate agrarie'
180 = 'Progettazione e gestione verde pubblico e privato  parchi ed aree protette'
182 = 'Progetti di Sviluppo rurale e di investimento'
224 = 'Valutazione della Qualità e certificazione dei prodotti agroalimentari'
80 = 'Enologo'
19 = 'Astronomo'
28 = 'Biologo molecolare'
41 = 'Chimico industriale'
26 = 'Biologo applicato'
27 = 'Biologo marino'
29 = 'Biologo operatore in area sanitaria'
46 = 'Conservazione delle collezioni nei musei di storia naturale e negli orti botanici (Esperto)'
100 = 'Genetista'
31 = 'Biotecnologo'
173 = 'Ottica  in rivelatori di radiazione elettromagnetica (Esperto)'
210 = 'Sistemi spaziali (Esperto)'
155 = 'Meteorologo'
181 = 'Progettazione  preparazione e caratterizzazione dei materiali (Esperto)'
89 = 'Fisico applicato'
90 = 'Fisico Elettronico'
91 = 'Fisico Informatico'
92 = 'Fisico Sanitario'
204 = 'Risk manager'
105 = 'Geologo applicato alle georisorse'
101 = 'Geofisico'
104 = 'Geologo applicato alla costruzione e alla stabilità dei versanti'
9 = 'Analista Programmatore  Analista Operativo  Informatico Consulente informatico  Sviluppatore software  EDP SI ecc'
30 = 'Biologo per la gestione di parchi naturali ed aree protette'
7 = 'Analisi e monitoraggio dell ambiente (Esperto)'
198 = 'Responsabile di laboratorio di analisi chimiche microbiologiche e ambientali'
103 = 'Geologo ambientale'
106 = 'Geologo rivelatore'
63 = 'Didattica delle discipline matematiche (Esperto)'
64 = 'Dietista'
93 = 'Fisioterapista'
141 = 'Logopedista'
171 = 'Ortottista - Assistente di oftalmologia'
172 = 'Ostetrica/o'
20 = 'Audiometrista (Tecnico)'
21 = 'Audioprotesista (Tecnico)'
160 = 'Neurofisiopatologia (Tecnico)'
214 = 'Tecnico sanitario di laboratorio biomedico'
215 = 'Tecnico sanitario di radiologia medica'
43 = 'Commerciante'
3 = 'Agente di commercio'
44 = 'Commesso  addetto alle vendite'
111 = 'Guida  accompagnatore turistico'
12 = 'Animatore turistico'
4 = 'Agente di viaggio'
196 = 'Receptionist  addetto reception'
165 = 'Operatore socio-sanitario'
114 = 'Infermiere/a'
13 = 'Archeologo'
212 = 'Storico dell arte  dei beni culturali  del territorio'
199 = 'Restauro (Esperto/responsabile)'
14 = 'Archivista'
24 = 'Bibliotecario'
133 = 'Insegnante'
136 = 'Insegnante di sostegno'
11 = 'Animatore per l infanzia'
97 = 'Formatore tutor'
78 = 'Educatore socio-culturale'
75 = 'Educatore  ambientale  esperto in educazione ambientale'
79 = 'Educatore socio-sanitario'
217 = 'Traduttore  interprete'
193 = 'Pubbliche relazioni (Addetto  assistente  responsabile)'
110 = 'Giornalista  addetto stampa'
2 = 'Agente assicurativo'
23 = 'Avvocato  praticante avvocato'
35 = 'Cancellliere giudiziario'
49 = 'Consulente del lavoro'
113 = 'Impiegato o funzionario in ufficio legale'
112 = 'Impiegato o funzionario amministrativo operatore amministrativo  contabile o generico  operatore unico'
143 = 'Magistrato  uditore giudiziario'
161 = 'Notaio  praticante notaio'
53 = 'Consulente legale'
52 = 'Consulente fiscale'
6 = 'Amministrazione finanza  controllo  credit manager (Adetto/Responsabile)'
177 = 'Post vendita  Customer care  (Addetto  assistente)'
140 = 'Liquidatore  perito assicurativo valutazione danni  quantificazione danni'
1 = 'Acquisti(Addetto/responsabile )'
225 = 'Vendite  account(Addetto/responsabile )'
222 = 'Ufficiale esercito  carabinieri  polizia  ecc'
184 = 'Promotore finanziario  esperto servizi finanziari/bancari e assicurativi'
223 = 'Ufficio commerciale (Addetto/responsabile  area manager  account)'
201 = 'Ricerca e sviluppo (Esperto/Responsabile)'
85 = 'Farmacista'
86 = 'Farmacoeconomista'
99 = 'Funzionario in istituzioni e organizzazioni nazionali e internazionali del settore sanitario'
179 = 'Produzione e logistica (addetto  assistente  responsabile)'
209 = 'Sicurezza del lavoro e della tutela ambientale (Responsabile)'
62 = 'Depositi di prodotti farmaceutici (Responsabile)'
139 = 'Laboratorio di analisi chimiche  microbiologiche  ambientali (addetto/specialista/responsabile)'
81 = 'Erborista (Tecnico)'
33 = 'Brevetti (Addetto/responsabile)'
70 = 'Documentazione tecnico-scientifica (Addetto/responsabile)'
15 = 'Assicuratore di qualità '
32 = 'Biotecnologo farmaceutico'
66 = 'Direttore tecnico '
87 = 'Farmacovigilanza (Esperto)'
207 = 'Segreteria di direzione e staff di direzione'
8 = 'Analista finanziario'
17 = 'Assistente produzione  logistica e manutenzione  Buyer'
22 = 'Auditor  altro revisore (senior o junior)'
34 = 'Business analyst'
50 = 'Consulente di direzione'
71 = 'Dottore commercialista'
178 = 'Product manager'
65 = 'Direttore di stabilimento  direttore di una filiale  ecc.'
200 = 'Revisore contabile'
202 = 'Ricercatore non universitario (centri studi)'
203 = 'Ricercatore  docente universitario'
58 = 'Content Manager'
227 = 'Web Master/Esperto di sicurezza/Amministratore del SITO'
226 = 'WEB Designer'
117 = 'Ingegnere chimico'
119 = 'Ingegnere dei materiali'
122 = 'Ingegnere elettrico'
124 = 'Ingegnere gestionale'
126 = 'Ingegnere meccanico'
129 = 'Ingegneria chimica (Tecnico)'
132 = 'Ingegneria meccanica (Tecnico)'
120 = 'Ingegnere delle telecomunicazioni'
123 = 'Ingegnere elettronico'
125 = 'Ingegnere informatico'
130 = 'Ingegneria elettronica (Tecnico)'
131 = 'Ingegneria informatica (Tecnico)'
118 = 'Ingegnere civile'
121 = 'Ingegnere edile'
116 = 'Ingegnere biomedico'
127 = 'Ingegnere per l ambiente e il territorio'
128 = 'Ingegneria biomedica (Tecnico)'
149 = 'Medico Veterinario'
154 = 'Medico Veterinario per piccoli animali'
194 = 'Qualità di servizi educativi/formativi/orientativi (Addetto/responsabile)'
208 = 'Selezione del personale'
10 = 'Animatore (culturale  di comunità  per il tempo libero  ecc.)'
153 = 'Medico Veterinario per grandi animali'
152 = 'Medico Veterinario per animali non convenzionali  selvatici'
151 = 'Medico Veterinario di Sanità  Pubblica'
150 = 'Medico Veterinario  Dipendente (Università  USL  Zooprofilatico)'
186 = 'Psicologo del lavoro'
187 = 'Psicologo della formazione'
189 = 'Psicologo dello sport'
190 = 'Psicologo in ambito giuridico'
191 = 'Psicologo ricercatore  ricercatore sociale in generale'
185 = 'Psicologo clinico e di comunità'
192 = 'Psicoterapeuta'
188 = 'Psicologo della riabilitazione  neuropsicologo'
183 = 'Project management (leader  manager)'
45 = 'Comunicazione (Esperto)'
169 = 'Orientatore scolastico'
94 = 'Formatore'
96 = 'Formatore orientatore'
18 = 'Assistente sociale'
54 = 'Consulente pedagogico per il lavoro e la formazione'
56 = 'Consulente pedagogico per l infanzia'
55 = 'Consulente pedagogico per la famiglia'
37 = 'Centro  agenzia o servizio educativo/formativo/orientativo (dirigente  direttore  operatore)'
67 = 'Dirigente scolastico'
69 = 'Documentalista'
74 = 'Educatore'
76 = 'Educatore dell infanzia'
77 = 'Educatore di comunità'
82 = 'Esperto della riabilitazione e dell integrazione'
25 = 'Biologo'
84 = 'Etologo'
102 = 'Geologo'
158 = 'Mineralista'
175 = 'Petrografo'
206 = 'Sedimentologo'
213 = 'Stratigrafo'
159 = 'Naturalista (Esperto)'
88 = 'Fisico'
146 = 'Matematico'
205 = 'Scienziato dei Materiali'
40 = 'Chimico'
216 = 'Tecnologie dell istruzione e dell apprendimento'
95 = 'Formatore dei formatori'
134 = 'Insegnante di scuola di base'
135 = 'Insegnante di scuola secondaria superiore'
137 = 'Ispettore direttivo-pedagogista'
138 = 'Ispettore tecnico'
144 = 'Manager di ambienti didattici on-line'
148 = 'Mediatore (interculturale  familiare  penale  ecc.)'
163 = 'Operatore di strada'
218 = 'Turismo culturale (Operatore)'
164 = 'Operatore psicopedagogico'
166 = 'Operatore tecnologico'
168 = 'Orientatore per il lavoro e la professione'
219 = 'Tutor aziendale'
220 = 'Tutor d aula'
221 = 'Tutor di rete'
108 = 'Gestione delle risorse umane (Addetto/responsabile/esperto/direttore)'
36 = 'Cassiere'
51 = 'Consulente finanziario'
57 = 'Consulente previdenziale'
197 = 'Recupero crediti'
167 = 'Operatore/organizzatore di corsi di formazione professionale'
176 = 'Pianificatore di produzione  acquisti/vendite'
195 = 'Quality controller  esperto/addetto  di controllo di qualità industriale  quality manager  assicuratore di qualità'
48 = 'Consulente (in studio professionale  proprio o associato) generico'
16 = 'Assistente alla clientela per strumentazione e prodotti chimici'
38 = 'Certificazioni di qualità ISO'
115 = 'Informatore Scientifico'
211 = 'Specialista in metodologie chimiche di controllo e analisi'
228 = 'Altro attinente con il Corso  di Laurea seguito'
229 = 'Altro non attinente con il Corso  di Laurea seguito'
;
DATA LIB.Q_PROFESSIONI;
SET Q_PROFESSIONI;
LABEL Q_PROFESSIONI='A quale delle seguente professione si sente più vicino';
FORMAT Q_PROFESSIONI ProfessioniF. ;
RUN;

PROC IMPORT OUT=Q_PROFESSIONI1 DATATABLE='Q_PROFESSIONI1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q_PROFESSIONI1;
SET Q_PROFESSIONI1;
LABEL Q_PROFESSIONI1='Specificare Altro';
RUN;

PROC IMPORT OUT=Q_PROFESSIONI2 DATATABLE='Q_PROFESSIONI2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q_PROFESSIONI2;
SET Q_PROFESSIONI2;
LABEL Q_PROFESSIONI2='Specificare Altro';
RUN;

PROC IMPORT OUT=Q_SETTORE DATATABLE='Q_SETTORE' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE $SettoriF
'S0022' = 'Industria  artigianato'
'S0015' = 'Commercio e pubblici esercizi'
'S0041' = 'Turismo'
'S0021' = 'Gestione e valorizzazione del patrimonio culturale'
'S0004' = 'Altri servizi (credito  trasporti  servizi alle imprese)'
'S0023' = 'Insegnamento  formazione'
'S0003' = 'Altra Pubblica amministrazione'
'S0016' = 'Credito  assicurazioni'
'S0037' = 'Scuola preuniversitaria e formazione (superiore media elementari)'
'S0042' = 'Università'
'S0039' = 'Servizio alla persona (servizio sanitario)'
'S0029' = 'Organizzazione internazionale'
'S0025' = 'Libera professione  Studio professionale (proprio o associato)'
'S0035' = 'Ricerca attinente alla propria laurea in un ambiente pubblico'
'S0034' = 'Ricerca attinente alla propria laurea in un ambiente privato'
'S0007' = 'Analisi  controlli qualità  … in ambiente pubblico'
'S0006' = 'Analisi  controlli qualità  … in ambiente privato'
'S0040' = 'Sistemi informativi SI  informatica'
'S0014' = 'Certificazioni (diverso dal controllo di qualità)'
'S0009' = 'Area Finanziaria'
'S0027' = 'Marketing e comunicazione'
'S0013' = 'Azienda /Industria farmaceutica'
'S0020' = 'Farmacia territoriale (aperta al pubblico)'
'S0019' = 'Farmacia ospedaliera'
'S0018' = 'Ente nazionale o internazionale del settore sanitario'
'S0010' = 'Azienda /Industria Chimica'
'S0011' = 'Azienda /Industria Cosmetologica'
'S0012' = 'Azienda /Industria dietetico-alimentare'
'S0002' = 'Altra azienda industriale'
'S0024' = 'Laboratorio analisi'
'S0001' = 'Acquisti'
'S0005' = 'Amministrazione e controllo'
'S0008' = 'Area Commerciale'
'S0043' = 'Vendite'
'S0017' = 'Direzione generale  strategia'
'S0026' = 'Logistica'
'S0028' = 'Organizzazione e gestione delle risorse umane'
'S0030' = 'Post-vendita (=customer service)'
'S0031' = 'Produzione'
'S0032' = 'Progettazione  ingegnerizzazione (Ufficio tecnico/automazione)'
'S0033' = 'Qualità  controllo qualità'
'S0036' = 'Ricerca e sviluppo (R&S)'
'S0038' = 'Segreteria di direzione  staff di direzione'
'S0044' = 'Altro settore'
;
DATA LIB.Q_SETTORE;
SET Q_SETTORE;
LABEL Q_SETTORE='In quale SETTORE svolge la sua Attività?';
FORMAT Q_SETTORE SettoriF. ;
RUN;

PROC IMPORT OUT=Q_SETTORE_bis DATATABLE='Q_SETTORE_bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q_SETTORE_bis;
SET Q_SETTORE_bis;
LABEL Q_SETTORE_bis='Specificare altro';
RUN;

PROC IMPORT OUT=Q1 DATATABLE='Q1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1;
SET Q1;
LABEL Q1='Di quale/i attività si tratta (fino a 3 risposte?';
RUN;

PROC IMPORT OUT=Q1_MANSIONI DATATABLE='Q1_MANSIONI' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1_MANSIONI;
SET Q1_MANSIONI;
LABEL Q1_MANSIONI='Con quali MANSIONI';
RUN;

PROC IMPORT OUT=Q1A DATATABLE='Q1A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Q1AF
1 = 'Impresa agricola-forestale di proprietà o familiare'
2 = 'Impresa agricola-forestale di proprietà altrui'
3 = 'Impresa agro-alimentare fornitrice di materie prime (mangimifici  industria sementiera  ecc…)'
4 = 'Impresa agro-alimentare fornitrice di attrezzature  assistenza e mezzi tecnici (compresi i consorzi)'
5 = 'Impresa agro-alimentare di trasformazione di prodotti'
6 = 'Impresa agro-alimentare nel settore della commercializzazione'
7 = 'Organizzazione professionale  sindacale  o associazioni di categoria'
8 = 'Imprese e cooperative di servizi (credito  assicurazioni  gestione ambiente…)'
9 = 'Studi professionale e attività di libera professione'
10 = 'Pubblica amministrazione (stato  regioni  enti territoriali  parchi e riserve)'
11 = 'Scuole media inferiore e superiore'
12 = 'Università (dottorandi  borsisti  docenti  e personale tecnico amministrativo)'
13 = 'Organizzazioni e associazioni no profit (LIPU  WWF)'
14 = 'Altro attinente con la formazione'
15 = 'Altro non attinente con la formazione'
;
DATA LIB.Q1A;
SET Q1A;
LABEL Q1A='In quale organizzazione?';
FORMAT Q1A Q1AF. ;
RUN;

PROC IMPORT OUT=Q1A_old DATATABLE='Q1A_old' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AgrOrgF
1 = 'Allevamento'
2 = 'ARPA'
3 = 'Azienda di credito'
4 = 'Comunità montana'
5 = 'Ente di formazione'
6 = 'Ente di sviluppo  di bonifica ed altri enti pubblici'
7 = 'Ente parco o riserva'
8 = 'Grande distribuzione'
9 = 'Impresa agricola di proprietà'
10 = 'Impresa agricola di terzi'
11 = 'Impresa di commercializzazione di prodotti agricoli e/o zootecnici'
12 = 'Impresa di sevizi per la gestione dell ambiente'
13 = 'Impresa di trasformazione di prodotti agricoli e/o zootecnici'
14 = 'Impresa forestale'
15 = 'Impresa per la certificazione di qualità'
16 = 'Impresa produttrice di mezzi tecnici per l agricoltura'
17 = 'Ispettorato agrario'
18 = 'Organizzazione Internazionale (FAO  UE  UNESCO ecc.)'
19 = 'Organizzazione professionale o sindacale'
20 = 'PA: Stato (escluso insegnamento)'
21 = 'Regione  Provincia  Comune'
22 = 'Scuole medie inferiori e superiori'
23 = 'Società di assicurazione'
24 = 'Studio professionale quale diplomato'
25 = 'Studio professionale quale laureato'
26 = 'Università'
27 = 'Vivaio'
28 = 'Altro'
;
DATA LIB.Q1A_old;
SET Q1A_old;
LABEL Q1A_old='In quale organizzazione?';
FORMAT Q1A_old AgrOrgF. ;
RUN;

PROC IMPORT OUT=Q1Aa DATATABLE='Q1Aa' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE areaeconF
1 = 'Acquisti'
2 = 'Amministrazione e controllo'
3 = 'Commerciale'
4 = 'Direzione generale'
5 = 'Finanza'
6 = 'Formazione'
7 = 'Logistica'
8 = 'Marketing e comunicazione'
9 = 'Organizzazione e gestione delle risorse umane'
10 = 'Post-vendita'
11 = 'Produzione'
12 = 'Progettazione  ingegnerizzazione '
13 = 'Qualità'
14 = 'Ricerca e sviluppo'
15 = 'Segreteria di direzione'
16 = 'Sistemi informativi  informatica'
17 = 'Strategia'
18 = 'Vendite'
19 = 'Altro'
;
DATA LIB.Q1Aa;
SET Q1Aa;
LABEL Q1Aa='In quale area aziendale svolge attulamente la sua attività?';
FORMAT Q1Aa areaeconF. ;
RUN;

PROC IMPORT OUT=Q1Aabis DATATABLE='Q1Aabis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Aabis;
SET Q1Aabis;
LABEL Q1Aabis='Quale?( Solo se risponde altro)';
RUN;

PROC IMPORT OUT=Q1Ab DATATABLE='Q1Ab' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE areafarmF
1 = 'Analitica'
2 = 'Chimica'
3 = 'Commerciale'
4 = 'Cosmetologica'
5 = 'Dietetico-alimentare'
6 = 'Farmaceutica'
7 = 'Farmacia aperta al pubblico o ospedaliera'
8 = 'Farmacologica'
9 = 'Altro'
;
DATA LIB.Q1Ab;
SET Q1Ab;
LABEL Q1Ab='L attività lavorativa che svolge  in quale area è inquadrabile?';
FORMAT Q1Ab areafarmF. ;
RUN;

PROC IMPORT OUT=Q1Abbis DATATABLE='Q1Abbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Abbis;
SET Q1Abbis;
LABEL Q1Abbis='Specificare ';
RUN;

PROC IMPORT OUT=Q1Abis DATATABLE='Q1Abis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Abis;
SET Q1Abis;
LABEL Q1Abis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1Abis1 DATATABLE='Q1Abis1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Abis1;
SET Q1Abis1;
LABEL Q1Abis1='Può specificare ?';
RUN;

PROC IMPORT OUT=Q1Abis2 DATATABLE='Q1Abis2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Abis2;
SET Q1Abis2;
LABEL Q1Abis2='Può specificare?';
RUN;

PROC IMPORT OUT=Q1Ac DATATABLE='Q1Ac' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MansGiurF
1 = 'Composizione di controversie'
2 = 'Consulenza a privati in sede non contenziosa'
3 = 'Direzione o organizzazione nell ambito di attività professionali  industriali o commerciali'
4 = 'Esercizio di funzioni pubbliche di natura amministrativa'
5 = 'Insegnamento in sede extrauniversitaria'
6 = 'Insegnamento in sede universitaria'
7 = 'Patrocinio di parti private in sede contenziosa'
8 = 'Redazione e/o autenticazione di atti'
9 = 'Ricerca in ambito universitario'
10 = 'Ricerca normativa e/o giurisprudenziale a supporto di attività professionali  industriali o commerciali'
11 = 'Supporto ad attività didattiche in sede universitaria'
12 = 'Supporto di segreteria ad attività di studi professionali entro l ambito giuridico'
13 = 'Altro'
;
DATA LIB.Q1Ac;
SET Q1Ac;
LABEL Q1Ac='Con riferimento all attività lavorativa  quali mansioni svolge?';
FORMAT Q1Ac MansGiurF. ;
RUN;

PROC IMPORT OUT=Q1Acbis DATATABLE='Q1Acbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Acbis;
SET Q1Acbis;
LABEL Q1Acbis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1Ad DATATABLE='Q1Ad' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE areaingF
1 = 'Acquisti'
2 = 'Amministrazione e controllo'
3 = 'Commerciale  Vendite'
4 = 'Direzione generale'
5 = 'Finanza'
6 = 'Formazione'
7 = 'Logistica'
8 = 'Marketing e Comunicazione  Public Relations'
9 = 'Organizzazione e gestione delle risorse umane'
10 = 'Post-vendita (customer service)'
11 = 'Produzione'
12 = 'Progettazione  ingegnerizzazione (Ufficio Tecnico/automazione)'
13 = 'Qualità  Controllo di qualità'
14 = 'Ricerca e sviluppo (R&S)'
15 = 'Segreteria di direzione  staff di direzione'
16 = 'Sistemi informativi  informatica'
17 = 'Strategia'
19 = 'Altro'
;
DATA LIB.Q1Ad;
SET Q1Ad;
LABEL Q1Ad='In quale area aziendale svolge attualmente la sua attività?';
FORMAT Q1Ad areaingF. ;
RUN;

PROC IMPORT OUT=Q1Adbis DATATABLE='Q1Adbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Adbis;
SET Q1Adbis;
LABEL Q1Adbis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1Ae DATATABLE='Q1Ae' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE areaec1F
1 = 'Amministrazione'
2 = 'Assistenza sociale'
3 = 'Consulenza  counseling'
4 = 'Diagnosi organizzative'
5 = 'Formazione'
6 = 'Insegnamento'
7 = 'Marketing  ricerche psicosociali e di mercato'
8 = 'Orientamento scolastico e professionale'
9 = 'Psicoterapia'
10 = 'Psicodiagnostica'
11 = 'Ricerca'
12 = 'Sanità'
13 = 'Scuola'
14 = 'Selezione'
15 = 'Università'
16 = 'Vendite'
17 = 'Altro'
;
DATA LIB.Q1Ae;
SET Q1Ae;
LABEL Q1Ae='In quale area di attività economica svolge principalmente la Sua attività?';
FORMAT Q1Ae areaec1F. ;
RUN;

PROC IMPORT OUT=Q1Aebis DATATABLE='Q1Aebis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Aebis;
SET Q1Aebis;
LABEL Q1Aebis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1Af DATATABLE='Q1Af' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE AmbFormF
1 = 'Ambiente'
2 = 'Cultura'
3 = 'Disabilità  handicap'
4 = 'Disagio  devianza'
5 = 'Formazione'
6 = 'Impresa'
7 = 'Insegnamento'
8 = 'Ricerca'
9 = 'Sanitario'
10 = 'Sociale'
11 = 'Tempo libero'
12 = 'Altro'
;
DATA LIB.Q1Af;
SET Q1Af;
LABEL Q1Af='In quale ambito svolge principalmente la Sua attività?';
FORMAT Q1Af AmbFormF. ;
RUN;

PROC IMPORT OUT=Q1Afbis DATATABLE='Q1Afbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Afbis;
SET Q1Afbis;
LABEL Q1Afbis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1Ag DATATABLE='Q1Ag' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MMricF
1 = 'Astronomo'
2 = 'Biologo'
3 = 'Biologo molecolare'
4 = 'Esperto Gemmologo'
5 = 'Esperto Naturalista'
6 = 'Esperto in Sistematica zoologica o botanica'
7 = 'Etologo'
8 = 'Fisico'
9 = 'Geologo'
10 = 'Matematico'
11 = 'Mineralista'
12 = 'Paleontologo'
13 = 'Petrografo'
14 = 'Scienziato dei materiali'
15 = 'Sedimentologo'
16 = 'Stratigrafo'
17 = 'Chimico'
;
DATA LIB.Q1Ag;
SET Q1Ag;
LABEL Q1Ag='Attività nell ambito della ricerca';
FORMAT Q1Ag MMricF. ;
RUN;

PROC IMPORT OUT=Q1B DATATABLE='Q1B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Formaz2F
1 = 'Ricerca educativo-formativa di base (storica  fondamentale  comparata  altro)'
2 = 'Ricerca e sviluppo nel campo scolastico/educativo/della formazione- orientamento professionale'
3 = 'Elaborazione di studi  indagini  rapporti'
4 = 'Analisi della domanda e dei bisogni educativi/formativi/orientativi'
5 = 'Selezione del personale'
6 = 'Progettazione-pianificazione di sistemi educativi/formativi/orientativi'
7 = 'Progettazione-pianificazione di interventi educativi/formativi/orientativi'
8 = 'Progettazione-pianificazione di materiali educativi/formativi/orientativi'
9 = 'Progettazione-pianificazione di ambienti/sistemi di formazione a distanza o on-line'
10 = 'Monitoraggio-valutazione di sistemi educativi/formativi/orientativi'
11 = 'Monitoraggio-valutazione di interventi educativi/formativi/orientativi'
12 = 'Monitoraggio-valutazione di materiali educativi/formativi/orientativi'
13 = 'Analisi-certificazione di qualità dei servizi educativi/formativi/orientativi'
14 = 'Insegnamento-docenza'
15 = 'Tutoring (d aula/ di inserimento lavorativo /on line /altro)'
16 = 'Counseling (formativo/orientativo/personale/familiare/altro)'
17 = 'Animazione'
18 = 'Lavoro in rete'
19 = 'Lavoro di comunità - sviluppo di comunità'
20 = 'Sostegno educativo-formativo individualizzato'
21 = 'Formazione dei formatori-supervisione'
22 = 'Direzione di strutture o servizi educativi/formativi/orientativi'
23 = 'Promozione di servizi educativi/formativi/orientativi (relazione con l utenza  comunicazione  marketing)'
24 = 'Altro'
;
DATA LIB.Q1B;
SET Q1B;
LABEL Q1B='Quali MANSIONI specifiche svolge?';
FORMAT Q1B Formaz2F. ;
PROC TRANSPOSE OUT=LIB.Q1B_MCOLS PREFIX=Q1B_ ;
BY UID TID Block;
VAR Q1B;
ID Q1B;
RUN;

PROC IMPORT OUT=Q1b1 DATATABLE='Q1b1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE agr1F
;
DATA LIB.Q1b1;
SET Q1b1;
LABEL Q1b1='A quale delle seguenti professioni si sente più vicino?';
FORMAT Q1b1 agr1F. ;
RUN;

PROC IMPORT OUT=Q1b10 DATATABLE='Q1b10' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE statF
1 = 'ANALISTA di bilancio'
2 = 'ANALISTA  finanziario'
3 = 'ANALISTA  programmatore  informatico'
4 = 'Consulente  specialista (con varie competenze)'
5 = 'Controller  esperto di controllo di gestione'
6 = 'Demografo'
7 = 'ESPERTO di decision support system'
8 = 'ESPERTO di marketing  ricercatore di mercato'
9 = 'ESPERTO di project management'
10 = 'INSEGNANTE di scuola dell infanzia'
11 = 'INSEGNANTE di scuola secondaria (superiore)'
12 = 'INSEGNANTE di base (elementare e media)'
13 = 'Quality controller  statistico per il controllo di qualità industriale'
14 = 'RICERCATORE non universitario'
15 = 'Ricercatore  DOCENTE universitario'
16 = 'STATISTICO ambientale'
17 = 'STATISTICO   economico'
18 = 'STATISTICO  medico'
19 = 'STATISTICO  sanitario'
20 = 'STATISTICO  sociale'
21 = 'STATISTICO valutatore (valutazione e qualità servizi  sistemi)'
22 = 'Altro'
;
DATA LIB.Q1b10;
SET Q1b10;
LABEL Q1b10='Di quale attività si tratta?';
FORMAT Q1b10 statF. ;
RUN;

PROC IMPORT OUT=Q1b10bis DATATABLE='Q1b10bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b10bis;
SET Q1b10bis;
LABEL Q1b10bis='SPECIFICA  ALTRO';
RUN;

PROC IMPORT OUT=Q1b1bis DATATABLE='Q1b1bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b1bis;
SET Q1b1bis;
LABEL Q1b1bis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1b2 DATATABLE='Q1b2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE EconProfF
1 = 'Addetto alle pubbliche relazioni o esperto di comunicazione'
2 = 'Addetto amministrazione contabilità  controller  credit manager'
3 = 'Addetto customer care'
4 = 'Addetto direzione del personale'
5 = 'Addetto EDP e SI (analista programmatore  informatico  programmatore  database administrator)'
6 = 'Addetto segreteria di direzione e staff'
7 = 'Analista finanziario'
8 = 'Assistente marketing'
9 = 'Assistente produzione  logistica e manutenzione  Buyer'
10 = 'Auditor  revisore (senior o junior)'
11 = 'Business analyst'
12 = 'Consulente del lavoro'
13 = 'Consulente di direzione'
14 = 'Direttore marketing'
15 = 'Dottore commercialista'
16 = 'Formatore tutor'
17 = 'Insegnante di scuola dell infanzia'
18 = 'Insegnante di base (elementare e media)'
19 = 'Insegnante di scuola secondaria (superiore) '
20 = 'Operatore di back office in banche  mercati finanziari e assicurazioni (titoli  fidi  ecc.)'
21 = 'Operatore di front office in banche  mercati finanziari e assicurazioni (sportello ecc.)'
22 = 'Product manager'
23 = 'Project manager o leader'
24 = 'Promotore di servizi finanziari'
25 = 'Quality manager'
26 = 'Responsabile amministrazione finanza e controllo'
27 = 'Responsabile commerciale  Area manager'
28 = 'Responsabile del personale'
29 = 'Responsabile di unità organizzativa (direttore di stabilimento  direttore di una filiale  ecc.)'
30 = 'Responsabile produzione e logistica  Responsabile acquisti'
31 = 'Responsabile R&S'
32 = 'Responsabile SI e EDP'
33 = 'Revisore contabile'
34 = 'Ricercatore non universitario (centri studi)'
35 = 'Ricercatore  docente universitario'
36 = 'Venditore agente  Account'
37 = 'Analista di content management (esperto di comunicazione on line)'
38 = 'Channel manager  Channel operator'
39 = 'Content manager (web content manager)'
40 = 'Esperto della sicurezza (esperto security  security consultant)'
41 = 'Esperto di marketing on line'
42 = 'Redattore web'
43 = 'Responsabile database marketing'
44 = 'Web analyst (analista web  analista programmatore web)'
45 = 'Web communicator (esperto di comunicazione multimediale  multimedia communicator)'
46 = 'Web designer (grafico web)'
47 = 'Web master  Web master assistant'
48 = 'Web producer'
49 = 'Web publisher'
50 = 'Web site administrator (amministratore del sito  web server system engineer)'
51 = 'Web writer'
52 = 'Altro'
;
DATA LIB.Q1b2;
SET Q1b2;
LABEL Q1b2='A quale delle seguenti professioni si sente più vicino ?';
FORMAT Q1b2 EconProfF. ;
RUN;

PROC IMPORT OUT=Q1b2bis DATATABLE='Q1b2bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b2bis;
SET Q1b2bis;
LABEL Q1b2bis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1b3 DATATABLE='Q1b3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE farmacF
1 = 'Addetto agli uffici commerciali '
2 = 'Addetto ai brevetti '
3 = 'Addetto ai controlli di qualità '
4 = 'Addetto alla documentazione tecnico-scientifica '
5 = 'Assicuratore di qualità '
6 = 'Biotecnologo farmaceutico'
7 = 'Consulente '
8 = 'Direttore tecnico '
9 = 'Esperto di farmacovigilanza '
10 = 'Esperto di ricerca e sviluppo'
11 = 'Farmacista'
12 = 'Farmacoeconomista'
13 = 'Funzionario in istituzioni e organizzazioni nazionali e internazionali del settore sanitario'
14 = 'Informatore scientifico per il settore farmaceutico  cosmetico  erboristico e dietetico alimentare'
15 = 'Responsabile della produzione '
16 = 'Responsabile della sicurezza del lavoro e della tutela ambientale'
17 = 'Responsabile di depositi di prodotti farmaceutici'
18 = 'Responsabile di laboratorio di analisi chimiche  microbiologiche  ambientali'
19 = 'Tecnico erborista'
20 = 'Altro attinente  al titolo posseduto'
99 = 'Altro non attinente  al titolo posseduto'
;
DATA LIB.Q1b3;
SET Q1b3;
LABEL Q1b3='A quale delle seguenti professioni si sente più vicino?';
FORMAT Q1b3 farmacF. ;
RUN;

PROC IMPORT OUT=Q1b3bis DATATABLE='Q1b3bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b3bis;
SET Q1b3bis;
LABEL Q1b3bis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1b4 DATATABLE='Q1b4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE giuris1F
;
DATA LIB.Q1b4;
SET Q1b4;
LABEL Q1b4='A quale delle seguenti professioni si sente più vicino ?';
FORMAT Q1b4 giuris1F. ;
RUN;

PROC IMPORT OUT=Q1b4bis DATATABLE='Q1b4bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b4bis;
SET Q1b4bis;
LABEL Q1b4bis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1b5 DATATABLE='Q1b5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE ingegF
1 = 'Ingegnere chimico'
2 = 'Ingegnere dei materiali'
3 = 'Ingegnere elettrico'
4 = 'Ingegnere gestionale'
5 = 'Ingegnere meccanico'
6 = 'Tecnico in ingegneria chimica'
7 = 'Tecnico in ingegneria meccanica'
8 = 'Ingegnere delle telecomunicazioni'
9 = 'Ingegnere elettronico'
10 = 'Ingegnere informatico'
11 = 'Tecnico in ingegneria elettronica'
12 = 'Tecnico in ingegneria informatica'
13 = 'Ingegnere civile'
14 = 'Ingegnere edile'
15 = 'Ingegnere biomedico'
16 = 'Ingegnere per l ambiente e il territorio'
17 = 'Tecnico in ingegneria biomedica'
18 = 'Altro'
19 = 'Insegnante'
20 = 'Analista programmatore/sviluppatore softqare/consulente informatico'
21 = 'Tecnico commerciale'
22 = 'Ricercatore'
;
DATA LIB.Q1b5;
SET Q1b5;
LABEL Q1b5='A quale delle seguenti professioni si sente più vicino?';
FORMAT Q1b5 ingegF. ;
RUN;

PROC IMPORT OUT=Q1b5bis DATATABLE='Q1b5bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b5bis;
SET Q1b5bis;
LABEL Q1b5bis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1b6 DATATABLE='Q1b6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE areaps1F
1 = 'Clinica'
2 = 'Logopedia e Psicomotricità'
3 = 'Psicobiologia e Psiconeurologia'
4 = 'Psicodiagnostica'
5 = 'Psicologia commerciale e del marketing'
6 = 'Psicologia del ciclo di vita (Psicologia dell invecchiamento)'
7 = 'Psicologia del lavoro'
8 = 'Psicologia del turismo e del tempo libero'
9 = 'Psicologia dell handicap e della riabilitazione'
10 = 'Psicologia dell età evolutiva'
11 = 'Psicologia dell orientamento scolastico e professionale'
12 = 'Psicologia della devianza e delle tossicodipendenze'
13 = 'Psicologia delle emergenze'
14 = 'Psicologia dello sport'
15 = 'Psicologia economica'
16 = 'Psicologia giuridica'
17 = 'Psicologia sperimentale'
18 = 'Psicometria'
19 = 'Psicopedagogico-didattica'
20 = 'Psicoterapia della famiglia'
21 = 'Psicoterapia di gruppo'
22 = 'Psicoterapia individuale'
23 = 'Altro'
;
DATA LIB.Q1b6;
SET Q1b6;
LABEL Q1b6='L attività che svolge  in quale area è inquadrabile?';
FORMAT Q1b6 areaps1F. ;
RUN;

PROC IMPORT OUT=Q1b6bis DATATABLE='Q1b6bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b6bis;
SET Q1b6bis;
LABEL Q1b6bis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1b7 DATATABLE='Q1b7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE Formaz1F
1 = 'Addetto alla qualità di servizi educativi/formativi/orientativi'
2 = 'Addetto alla selezione del personale'
3 = 'Animatore (culturale  di comunità  per il tempo libero  ecc.)'
4 = 'Assistente sociale'
5 = 'Bibliotecario'
6 = 'Consulente pedagogico per il lavoro e la formazione'
7 = 'Consulente pedagogico per l infanzia'
8 = 'Consulente pedagogico per la famiglia'
9 = 'Dirigente di centro  agenzia o servizio educativo/formativo/orientativo'
10 = 'Dirigente scolastico'
11 = 'Documentalista'
12 = 'Educatore'
13 = 'Educatore dell infanzia'
14 = 'Educatore di comunità'
15 = 'Esperto della riabilitazione e dell integrazione'
16 = 'Esperto di educazione ambientale'
17 = 'Esperto di tecnologie dell istruzione e dell apprendimento'
18 = 'Formatore'
19 = 'Formatore dei formatori'
20 = 'Guida turistica'
21 = 'Insegnante di scuola di base'
22 = 'Insegnante di scuola secondaria superiore'
23 = 'Ispettore direttivo-pedagogista'
24 = 'Ispettore tecnico'
25 = 'Manager di ambienti didattici on-line'
26 = 'Mediatore (interculturale  familiare  penale  ecc.)'
27 = 'Operatore di strada'
28 = 'Operatore per il turismo culturale'
29 = 'Operatore psicopedagogico'
30 = 'Operatore tecnologico'
31 = 'Orientatore per il lavoro e la professione'
32 = 'Orientatore scolastico'
33 = 'Responsabile delle risorse umane'
34 = 'Ricercatore non universitario'
35 = 'Ricercatore  docente universitario'
36 = 'Tutor aziendale'
37 = 'Tutor d aula'
38 = 'Tutor di rete'
39 = 'Altro'
;
DATA LIB.Q1b7;
SET Q1b7;
LABEL Q1b7='Di quale attività si tratta ?';
FORMAT Q1b7 Formaz1F. ;
RUN;

PROC IMPORT OUT=Q1b7bis DATATABLE='Q1b7bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b7bis;
SET Q1b7bis;
LABEL Q1b7bis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1b8 DATATABLE='Q1b8' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE areaMMF
1 = 'Ricerca'
2 = 'Attività industriali'
3 = 'Servizi alle imprese e alla collettività'
4 = 'Attività per l ambiente e il territorio'
5 = 'Formazione'
6 = 'Altro'
;
DATA LIB.Q1b8;
SET Q1b8;
LABEL Q1b8='L attività che svolge  in quale area si colloca?';
FORMAT Q1b8 areaMMF. ;
RUN;

PROC IMPORT OUT=Q1b8bis DATATABLE='Q1b8bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b8bis;
SET Q1b8bis;
LABEL Q1b8bis='Può specificare l area e l attività?';
RUN;

PROC IMPORT OUT=Q1b9 DATATABLE='Q1b9' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE politF
1 = 'Account'
2 = 'Addetto all ufficio legale'
3 = 'Addetto alle pubbliche relazione'
4 = 'Archivista'
5 = 'Bibliotecario'
6 = 'Cancelliere giudiziario'
7 = 'Comunicatore d impresa e di prodotto'
8 = 'Comunicatore istituzionale'
9 = 'Consulente del lavoro'
10 = 'Copywriter'
11 = 'Diplomatico'
12 = 'Documentalista'
13 = 'Dottore commercialista'
14 = 'Esperto di comunicazione'
15 = 'Esperto di marketing'
16 = 'Esperto di project management'
17 = 'Esperto gestore e pianificatore dei media'
18 = 'Esperto in gestione delle risorse umane'
19 = 'Formatore tutor'
20 = 'Funzionario di polizia'
21 = 'Funzionario di prefettura'
22 = 'Funzionario o dirigente delle pubbliche amministrazioni'
23 = 'Giornalista'
24 = 'Operatore o dirigente di amministrazione  finanza e controllo'
25 = 'Operatore o dirigente di area commerciale'
26 = 'Operatore o dirigente di area marketing e comunicazione'
27 = 'Operatore o dirigente nel settore delle banche  del mercati finanziari  delle assicurazioni'
28 = 'Promotore di servizi finanziari'
29 = 'Revisore contabile'
30 = 'Ricercatore sociale'
31 = 'Altro'
;
DATA LIB.Q1b9;
SET Q1b9;
LABEL Q1b9='Di che attività si tratta?';
FORMAT Q1b9 politF. ;
RUN;

PROC IMPORT OUT=Q1b9bis DATATABLE='Q1b9bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1b9bis;
SET Q1b9bis;
LABEL Q1b9bis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1Ba DATATABLE='Q1Ba' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MMinduF
1 = 'Addetto agli uffici commerciali in aziende farmaceutiche  chimiche  cosmetiche e dietetico-alimentari'
2 = 'Addetto ai controlli di qualità in ambito farmaceutico  cosmetico  dietetico-alimentare'
3 = 'Addetto al servizio di farmacovigilanza in aziende farmaceutiche'
4 = 'Addetto alla documentazione tecnico-scientifica di prodotti farmaceutici  chimici  cosmetici e dietetico-alimentari'
5 = 'Addetto alla ricerca e allo sviluppo in aziende farmaceutiche  chimiche  cosmetiche e dietetico-alimentari'
6 = 'Biologo marino'
7 = 'Biotecnologo Industriale'
8 = 'Chimico'
9 = 'Chimico industriale'
10 = 'Direttore di stabilimento di acque minerali'
11 = 'Direttore tecnico in aziende farmaceutiche  chimiche  cosmetiche e dietetico-alimentari'
12 = 'Esperto di marketing'
13 = 'Esperto in analisi di immagini'
14 = 'Esperto in maricoltura ed acquacoltura'
15 = 'Esperto in ottica'
16 = 'Esperto in progettazione  preparazione e caratterizzazione dei materiali'
17 = 'Esperto in rilevatori di radiazione elettromagnetica'
18 = 'Esperto in sistemi spaziali'
19 = 'Fisico Applicato'
20 = 'Fisico Elettronico'
21 = 'Geologo applicato alle georisorse'
22 = 'Quality Controller'
23 = 'Responsabile della produzione in aziende farmaceutiche  chimiche  cosmetiche e dietetico-alimentari'
24 = 'Tecnico in biotecnologia agro-industriali'
25 = 'Altro'
;
DATA LIB.Q1Ba;
SET Q1Ba;
LABEL Q1Ba='Attività nell ambito dell industria';
FORMAT Q1Ba MMinduF. ;
RUN;

PROC IMPORT OUT=Q1Babis DATATABLE='Q1Babis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Babis;
SET Q1Babis;
LABEL Q1Babis='ALTRO:';
RUN;

PROC IMPORT OUT=Q1Bbis DATATABLE='Q1Bbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Bbis;
SET Q1Bbis;
LABEL Q1Bbis='Può specificare?';
RUN;

PROC IMPORT OUT=Q1bis DATATABLE='Q1bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1bis;
SET Q1bis;
LABEL Q1bis='A quale professione si sente più vicino?';
PROC TRANSPOSE OUT=LIB.Q1bis_MCOLS PREFIX=Q1bis_ ;
BY UID TID Block;
VAR Q1bis;
ID Q1bis;
RUN;

PROC IMPORT OUT=Q1C DATATABLE='Q1C' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE fasciaF
1 = 'Infanzia'
2 = 'Adolescenza'
3 = 'Giovani'
4 = 'Adulti'
5 = 'Anziani'
6 = 'Tutte le età'
;
DATA LIB.Q1C;
SET Q1C;
LABEL Q1C='Quale fascia di utenza è principalmente interessata alla Sua attività?';
FORMAT Q1C fasciaF. ;
RUN;

PROC IMPORT OUT=Q1Ca DATATABLE='Q1Ca' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MMimprF
1 = 'Addetto ai brevetti in campo farmaceutico  chimico  cosmetico e dietetico-alimentare'
2 = 'Analista operativo'
3 = 'Analista programmatore'
4 = 'Assistente alla clientela per strumentazione e prodotti chimici'
5 = 'Addetto alla sicurezza del lavoro e alla tutela dell ambiente'
6 = 'Specialista in biochimica clinica'
7 = 'Biologo operatore in area sanitaria'
8 = 'Biologo responsabile sanitario in operazioni di disinfestazione'
9 = 'Certificatore di non pericolosità del carico delle navi'
10 = 'Certificatore di qualità ISO9000 e ISO14000'
11 = 'Chimico periziale'
12 = 'Consulente per il settore farmaceutico  cosmetico e dietetico-alimentare'
13 = 'Esperto di restauro'
14 = 'Esperto di project management'
15 = 'Esperto nella conservazione delle collezioni nei Musei di storia Naturale e negli Orti Botanici'
16 = 'Esperto qualificato di radioprotezione'
17 = 'Fisico Informatico'
18 = 'Fisico Sanitario'
19 = 'Genetista'
20 = 'Geofisico'
21 = 'Geologo applicato alla costruzione e alla stabilità dei versanti'
22 = 'Informatore scientifico per il settore farmaceutico  cosmetico  erboristico e dietetico-alimentare'
23 = 'Meteorologo'
24 = 'Microbiologo'
25 = 'Specialista in patologia clinica'
26 = 'Risk manager'
27 = 'Specialista in Chimica Nucleare'
28 = 'Specialista in metodologie chimiche di controllo e di analisi'
29 = 'Specialista in scienza dell alimentazione'
30 = 'Valutatore'
31 = 'ALTRO'
;
DATA LIB.Q1Ca;
SET Q1Ca;
LABEL Q1Ca='Attività nell ambito dei servizi alle imprese e alla collettività';
FORMAT Q1Ca MMimprF. ;
RUN;

PROC IMPORT OUT=Q1Cabis DATATABLE='Q1Cabis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Cabis;
SET Q1Cabis;
LABEL Q1Cabis='Specificare altro:';
RUN;

PROC IMPORT OUT=Q1D DATATABLE='Q1D' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MMambF
1 = 'Biologo ambientale'
2 = 'Biologo per la gestione di parchi naturali ed aree protette'
3 = 'Ecologo vegetale'
4 = 'Esperto in analisi e monitoraggio dell ambiente'
5 = 'Esperto in floristica e fitogeografia'
6 = 'Esperto nella progettazione ambientale'
7 = 'Geologo ambientale'
8 = 'Geologo rilevatore'
9 = 'Geomorfologo'
10 = 'Idrogeologo'
11 = 'Responsabile di laboratorio di anlisi chimiche  microbiologiche  ambientali'
12 = 'Altro'
;
DATA LIB.Q1D;
SET Q1D;
LABEL Q1D='Attività per l ambiente e il territorio';
FORMAT Q1D MMambF. ;
RUN;

PROC IMPORT OUT=Q1Daltro DATATABLE='Q1Daltro' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Daltro;
SET Q1Daltro;
LABEL Q1Daltro='ALTRO:';
RUN;

PROC IMPORT OUT=Q1E DATATABLE='Q1E' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE MMformF
1 = 'Esperto in didattica delle discipline matematiche'
2 = 'Esperto in educazione ambientale'
3 = 'Altro'
;
DATA LIB.Q1E;
SET Q1E;
LABEL Q1E='Attività nell ambito della formazione';
FORMAT Q1E MMformF. ;
RUN;

PROC IMPORT OUT=Q1Ebis DATATABLE='Q1Ebis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.Q1Ebis;
SET Q1Ebis;
LABEL Q1Ebis='Può specificare?';
RUN;

PROC IMPORT OUT=S6 DATATABLE='S6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE NumRilevF
1 = 'T = 1'
2 = 'T = 2'
3 = 'T = 3'
4 = 'T = 4'
5 = 'T = 5'
6 = 'T = 6'
;
DATA LIB.S6;
SET S6;
LABEL S6='5';
FORMAT S6 NumRilevF. ;
RUN;

PROC IMPORT OUT=T1 DATATABLE='T1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SiInteressaF
1 = 'Si Interessa'
2 = 'Non si Interessa'
;
DATA LIB.T1;
SET T1;
LABEL T1='Si sta interessando delle OFFERTE FORMATIVE dell  Università di Padova per quanto riguarda LAUREE SPECIALISTICHE  MASTER e DOTTORATO DI RICERCA?';
FORMAT T1 SiInteressaF. ;
RUN;

PROC IMPORT OUT=T1A DATATABLE='T1A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE CanaliF
1 = 'Internet'
2 = 'Giornali'
3 = 'Legge ciò che manda l Università'
4 = 'Altro'
;
DATA LIB.T1A;
SET T1A;
LABEL T1A='Attraverso quali MEZZI o CANALI si informa prevalentemente?';
FORMAT T1A CanaliF. ;
PROC TRANSPOSE OUT=LIB.T1A_MCOLS PREFIX=T1A_ ;
BY UID TID Block;
VAR T1A;
ID T1A;
RUN;

PROC IMPORT OUT=T1Aal DATATABLE='T1Aal' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.T1Aal;
SET T1Aal;
LABEL T1Aal='SPECIFICARE:';
RUN;

PROC IMPORT OUT=T2 DATATABLE='T2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE RappDocF
1 = 'Sì  per RICERCA DI LAVORO'
2 = 'Sì  per COLLABORAZIONE di ricerca scientifica'
3 = 'Sì  per ALTRO MOTIVO'
4 = 'No'
;
DATA LIB.T2;
SET T2;
LABEL T2='Ha tenuto rapporti con qualche docente dopo il titolo?';
FORMAT T2 RappDocF. ;
RUN;

PROC IMPORT OUT=T3 DATATABLE='T3' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE SìF
1 = 'No'
2 = 'Sì'
;
DATA LIB.T3;
SET T3;
LABEL T3='Fa parte di qualche ASSOCiazione di LAUReati?';
FORMAT T3 SìF. ;
RUN;

PROC IMPORT OUT=T3A DATATABLE='T3A' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.T3A;
SET T3A;
LABEL T3A='Quale?';
RUN;

PROC IMPORT OUT=T4 DATATABLE='T4' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE RappresF
1 = 'Sì  rappresentante in organi di Ateneo'
2 = 'Sì  rappresentante della facoltà o corso di studio'
3 = 'Sì  rappresentante in altri organi'
4 = 'No'
;
DATA LIB.T4;
SET T4;
LABEL T4='E  stato rappresentante degli studenti durante l Università?';
FORMAT T4 RappresF. ;
RUN;

PROC IMPORT OUT=T5 DATATABLE='T5' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE LaureeF
1 = 'Le migliora'
2 = 'Sono più o meno uguali'
3 = 'Le peggiora'
4 = 'Non so  non ne ho idea'
;
DATA LIB.T5;
SET T5;
LABEL T5='Secondo lei  l OFFERTA FORMativa che è stata introdotta con le LAUREE TRIENNALI  o che sta per essere introdotta con quelle SPECIALISTICHE  MIGLIORA sostanzialmente le COMPETENZE degli studenti  le mantiene più o meno allo STESSO LIVELLO  o le PEGGIORA?';
FORMAT T5 LaureeF. ;
RUN;

PROC IMPORT OUT=T6 DATATABLE='T6' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE PossibiliF
1 = 'Miglioreranno'
2 = 'Saranno più o meno le stesse'
3 = 'Peggioreranno'
4 = 'Non so  non ne ho idea'
;
DATA LIB.T6;
SET T6;
LABEL T6='E le POSSIBilità di IMPIEGO di chi acquisirà i nuovi titoli  MIGLIORERANNO  saranno PIU  O MENo le stesse  o PEGGIORERANNO  secondo lei?';
FORMAT T6 PossibiliF. ;
RUN;

PROC IMPORT OUT=T7 DATATABLE='T7' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.T7;
SET T7;
LABEL T7='Provi per qualche attimo a calarsi nei panni del PRESIDE della Facoltà  o un altro DIRIGENTE dell Università.  Cosa farebbe per aiutare un laureato o diplomato a realizzare le sue PROSPETTIVE di INSERIMENTO NEL LAVORO e di CARRIERA? ';
RUN;

PROC FREQ DATA=LIB.A0;
TABLES A0;
RUN;
PROC FREQ DATA=LIB.B0A;
TABLES B0A;
RUN;
PROC FREQ DATA=LIB.B0B;
TABLES B0B;
RUN;
PROC FREQ DATA=LIB.B0C;
TABLES B0C;
RUN;
PROC FREQ DATA=LIB.B1;
TABLES B1;
RUN;
PROC FREQ DATA=LIB.B1A;
TABLES B1A;
RUN;
PROC FREQ DATA=LIB.B1B;
TABLES B1B;
RUN;
PROC FREQ DATA=LIB.B1C;
TABLES B1C;
RUN;
PROC FREQ DATA=LIB.B1D;
TABLES B1D;
RUN;
PROC FREQ DATA=LIB.B2A;
TABLES B2A;
RUN;
PROC FREQ DATA=LIB.B3A;
TABLES B3A;
RUN;
PROC FREQ DATA=LIB.B3B;
TABLES B3B;
RUN;
PROC FREQ DATA=LIB.B3C;
TABLES B3C;
RUN;
PROC FREQ DATA=LIB.B3D;
TABLES B3D;
RUN;
PROC FREQ DATA=LIB.B4;
TABLES B4;
RUN;
PROC FREQ DATA=LIB.B7;
TABLES B7;
RUN;
PROC FREQ DATA=LIB.B7A;
TABLES B7A;
RUN;
PROC FREQ DATA=LIB.B7A1;
TABLES B7A1;
RUN;
PROC FREQ DATA=LIB.B7Abis;
TABLES B7Abis;
RUN;
PROC FREQ DATA=LIB.B7B;
TABLES B7B;
RUN;
PROC FREQ DATA=LIB.B7B1;
TABLES B7B1;
RUN;
PROC FREQ DATA=LIB.B7Bbis;
TABLES B7Bbis;
RUN;
PROC FREQ DATA=LIB.B7C;
TABLES B7C;
RUN;
PROC FREQ DATA=LIB.B7Cbis;
TABLES B7Cbis;
RUN;
PROC FREQ DATA=LIB.B7D;
TABLES B7D;
RUN;
PROC FREQ DATA=LIB.B8;
TABLES B8;
RUN;
PROC FREQ DATA=LIB.B8_before;
TABLES B8_before;
RUN;
PROC FREQ DATA=LIB.B8ATT0R;
TABLES B8ATT0R;
RUN;
PROC FREQ DATA=LIB.B8CIR;
TABLES B8CIR;
RUN;
PROC FREQ DATA=LIB.B8T0R;
TABLES B8T0R;
RUN;
PROC FREQ DATA=LIB.C1;
TABLES C1;
RUN;
PROC FREQ DATA=LIB.C1A;
TABLES C1A;
RUN;
PROC FREQ DATA=LIB.C1B;
TABLES C1B;
RUN;
PROC FREQ DATA=LIB.C2;
TABLES C2;
RUN;
PROC FREQ DATA=LIB.C2_alt1_T2;
TABLES C2_alt1_T2;
RUN;
PROC FREQ DATA=LIB.C3;
TABLES C3;
RUN;
PROC FREQ DATA=LIB.C4I_alt_T2;
TABLES C4I_alt_T2;
RUN;
PROC FREQ DATA=LIB.C4I_old;
TABLES C4I_old;
RUN;
PROC FREQ DATA=LIB.C7;
TABLES C7;
RUN;
PROC FREQ DATA=LIB.C7bis_T1;
TABLES C7bis_T1;
RUN;
PROC FREQ DATA=LIB.C8_T1;
TABLES C8_T1;
RUN;
PROC FREQ DATA=LIB.C9;
TABLES C9;
RUN;
PROC FREQ DATA=LIB.CDE;
TABLES CDE;
RUN;
PROC FREQ DATA=LIB.CDE_A;
TABLES CDE_A;
RUN;
PROC FREQ DATA=LIB.CDE_B;
TABLES CDE_B;
RUN;
PROC FREQ DATA=LIB.CDE_Bbis;
TABLES CDE_Bbis;
RUN;
PROC FREQ DATA=LIB.CDE_C;
TABLES CDE_C;
RUN;
PROC FREQ DATA=LIB.CDE_cinq;
TABLES CDE_cinq;
RUN;
PROC FREQ DATA=LIB.CDE_D;
TABLES CDE_D;
RUN;
PROC FREQ DATA=LIB.CDE_Dbis;
TABLES CDE_Dbis;
RUN;
PROC FREQ DATA=LIB.CDE_due;
TABLES CDE_due;
RUN;
PROC FREQ DATA=LIB.CDE_quat;
TABLES CDE_quat;
RUN;
PROC FREQ DATA=LIB.CDE_tre;
TABLES CDE_tre;
RUN;
PROC FREQ DATA=LIB.CDE1;
TABLES CDE1;
RUN;
PROC FREQ DATA=LIB.CDE1_A;
TABLES CDE1_A;
RUN;
PROC FREQ DATA=LIB.CDE1_B;
TABLES CDE1_B;
RUN;
PROC FREQ DATA=LIB.CDE1_C;
TABLES CDE1_C;
RUN;
PROC FREQ DATA=LIB.CDE1_D;
TABLES CDE1_D;
RUN;
PROC FREQ DATA=LIB.CDE1_E;
TABLES CDE1_E;
RUN;
PROC FREQ DATA=LIB.CDE1_Ebis;
TABLES CDE1_Ebis;
RUN;
PROC FREQ DATA=LIB.CDE1_F;
TABLES CDE1_F;
RUN;
PROC FREQ DATA=LIB.CDE1_G;
TABLES CDE1_G;
RUN;
PROC FREQ DATA=LIB.CDE1_Gbis;
TABLES CDE1_Gbis;
RUN;
PROC FREQ DATA=LIB.CDE1_Gold;
TABLES CDE1_Gold;
RUN;
PROC FREQ DATA=LIB.CDE1_H;
TABLES CDE1_H;
RUN;
PROC FREQ DATA=LIB.CDE1_Hbis;
TABLES CDE1_Hbis;
RUN;
PROC FREQ DATA=LIB.CDE1_I;
TABLES CDE1_I;
RUN;
PROC FREQ DATA=LIB.CDE1_Ibis;
TABLES CDE1_Ibis;
RUN;
PROC FREQ DATA=LIB.CDE2;
TABLES CDE2;
RUN;
PROC FREQ DATA=LIB.CDE2_A;
TABLES CDE2_A;
RUN;
PROC FREQ DATA=LIB.CDE2_ALIAS;
TABLES CDE2_ALIAS;
RUN;
PROC FREQ DATA=LIB.CDE2_B;
TABLES CDE2_B;
RUN;
PROC FREQ DATA=LIB.CDE2_B1;
TABLES CDE2_B1;
RUN;
PROC FREQ DATA=LIB.CDE2_C;
TABLES CDE2_C;
RUN;
PROC FREQ DATA=LIB.CDE2_D;
TABLES CDE2_D;
RUN;
PROC FREQ DATA=LIB.CDE2_E;
TABLES CDE2_E;
RUN;
PROC FREQ DATA=LIB.CDE2_Ebis;
TABLES CDE2_Ebis;
RUN;
PROC FREQ DATA=LIB.CDE2_F;
TABLES CDE2_F;
RUN;
PROC FREQ DATA=LIB.CDE2_G;
TABLES CDE2_G;
RUN;
PROC FREQ DATA=LIB.CDE2_Gbis;
TABLES CDE2_Gbis;
RUN;
PROC FREQ DATA=LIB.CDE2_I;
TABLES CDE2_I;
RUN;
PROC FREQ DATA=LIB.CDE3;
TABLES CDE3;
RUN;
PROC FREQ DATA=LIB.CDE3_A;
TABLES CDE3_A;
RUN;
PROC FREQ DATA=LIB.CDE3_B;
TABLES CDE3_B;
RUN;
PROC FREQ DATA=LIB.CDE3_C;
TABLES CDE3_C;
RUN;
PROC FREQ DATA=LIB.CDE3_D;
TABLES CDE3_D;
RUN;
PROC FREQ DATA=LIB.CDE3_Dbis;
TABLES CDE3_Dbis;
RUN;
PROC FREQ DATA=LIB.CDE3_E;
TABLES CDE3_E;
RUN;
PROC FREQ DATA=LIB.CDE3_F;
TABLES CDE3_F;
RUN;
PROC FREQ DATA=LIB.CDE3_Fbis;
TABLES CDE3_Fbis;
RUN;
PROC FREQ DATA=LIB.CDE3_Fold;
TABLES CDE3_Fold;
RUN;
PROC FREQ DATA=LIB.CDE3_G;
TABLES CDE3_G;
RUN;
PROC FREQ DATA=LIB.CDE3_Gbis;
TABLES CDE3_Gbis;
RUN;
PROC FREQ DATA=LIB.CDE3_H;
TABLES CDE3_H;
RUN;
PROC FREQ DATA=LIB.CDE3_Hbis;
TABLES CDE3_Hbis;
RUN;
PROC FREQ DATA=LIB.CDL;
TABLES CDL;
RUN;
PROC FREQ DATA=LIB.CORSOAGR;
TABLES CORSOAGR;
RUN;
PROC FREQ DATA=LIB.D1A_old;
TABLES D1A_old;
RUN;
PROC FREQ DATA=LIB.D9;
TABLES D9;
RUN;
PROC FREQ DATA=LIB.E1;
TABLES E1;
RUN;
PROC FREQ DATA=LIB.E12;
TABLES E12;
RUN;
PROC FREQ DATA=LIB.E12bis;
TABLES E12bis;
RUN;
PROC FREQ DATA=LIB.E2;
TABLES E2;
RUN;
PROC FREQ DATA=LIB.E2A;
TABLES E2A;
RUN;
PROC FREQ DATA=LIB.E2B;
TABLES E2B;
RUN;
PROC FREQ DATA=LIB.E2C;
TABLES E2C;
RUN;
PROC FREQ DATA=LIB.E2D;
TABLES E2D;
RUN;
PROC FREQ DATA=LIB.E2Dbis;
TABLES E2Dbis;
RUN;
PROC FREQ DATA=LIB.E2E;
TABLES E2E;
RUN;
PROC FREQ DATA=LIB.E2F;
TABLES E2F;
RUN;
PROC FREQ DATA=LIB.E2F_old;
TABLES E2F_old;
RUN;
PROC FREQ DATA=LIB.E2FA;
TABLES E2FA;
RUN;
PROC FREQ DATA=LIB.E2G;
TABLES E2G;
RUN;
PROC FREQ DATA=LIB.E2Gbis;
TABLES E2Gbis;
RUN;
PROC FREQ DATA=LIB.E2H;
TABLES E2H;
RUN;
PROC FREQ DATA=LIB.E2Hbis;
TABLES E2Hbis;
RUN;
PROC FREQ DATA=LIB.E3;
TABLES E3;
RUN;
PROC FREQ DATA=LIB.E3A;
TABLES E3A;
RUN;
PROC FREQ DATA=LIB.E3bis;
TABLES E3bis;
RUN;
PROC FREQ DATA=LIB.E4;
TABLES E4;
RUN;
PROC FREQ DATA=LIB.F1A;
TABLES F1A;
RUN;
PROC FREQ DATA=LIB.F1B;
TABLES F1B;
RUN;
PROC FREQ DATA=LIB.F1B_alt1_T2;
TABLES F1B_alt1_T2;
RUN;
PROC FREQ DATA=LIB.F1B_alt2_T2;
TABLES F1B_alt2_T2;
RUN;
PROC FREQ DATA=LIB.F1B_alt3_T2;
TABLES F1B_alt3_T2;
RUN;
PROC FREQ DATA=LIB.F1C_alt1_T2;
TABLES F1C_alt1_T2;
RUN;
PROC FREQ DATA=LIB.F1C_alt2_T2;
TABLES F1C_alt2_T2;
RUN;
PROC FREQ DATA=LIB.F1C_alt3_T2;
TABLES F1C_alt3_T2;
RUN;
PROC FREQ DATA=LIB.F2;
TABLES F2;
RUN;
PROC FREQ DATA=LIB.F2A;
TABLES F2A;
RUN;
PROC FREQ DATA=LIB.F3;
TABLES F3;
RUN;
PROC FREQ DATA=LIB.F3bis;
TABLES F3bis;
RUN;
PROC FREQ DATA=LIB.F4;
TABLES F4;
RUN;
PROC FREQ DATA=LIB.F5;
TABLES F5;
RUN;
PROC FREQ DATA=LIB.FAC;
TABLES FAC;
RUN;
PROC FREQ DATA=LIB.FGH6;
TABLES FGH6;
RUN;
PROC FREQ DATA=LIB.FGH7;
TABLES FGH7;
RUN;
PROC FREQ DATA=LIB.FGH8;
TABLES FGH8;
RUN;
PROC FREQ DATA=LIB.FGH8bis;
TABLES FGH8bis;
RUN;
PROC FREQ DATA=LIB.FGHL6alt23_T2;
TABLES FGHL6alt23_T2;
RUN;
PROC FREQ DATA=LIB.FGHL6x1_T2;
TABLES FGHL6x1_T2;
RUN;
PROC FREQ DATA=LIB.FGHL6x2_T2;
TABLES FGHL6x2_T2;
RUN;
PROC FREQ DATA=LIB.FGHL6x3_T2;
TABLES FGHL6x3_T2;
RUN;
PROC FREQ DATA=LIB.G1;
TABLES G1;
RUN;
PROC FREQ DATA=LIB.G2;
TABLES G2;
RUN;
PROC FREQ DATA=LIB.G2bis;
TABLES G2bis;
RUN;
PROC FREQ DATA=LIB.G3;
TABLES G3;
RUN;
PROC FREQ DATA=LIB.G3A;
TABLES G3A;
RUN;
PROC FREQ DATA=LIB.G3B;
TABLES G3B;
RUN;
PROC FREQ DATA=LIB.G3C;
TABLES G3C;
RUN;
PROC FREQ DATA=LIB.G4;
TABLES G4;
RUN;
PROC FREQ DATA=LIB.H1;
TABLES H1;
RUN;
PROC FREQ DATA=LIB.H1bis;
TABLES H1bis;
RUN;
PROC FREQ DATA=LIB.H2;
TABLES H2;
RUN;
PROC FREQ DATA=LIB.H2bis;
TABLES H2bis;
RUN;
PROC FREQ DATA=LIB.H3;
TABLES H3;
RUN;
PROC FREQ DATA=LIB.H3A;
TABLES H3A;
RUN;
PROC FREQ DATA=LIB.H3Abis;
TABLES H3Abis;
RUN;
PROC FREQ DATA=LIB.H4;
TABLES H4;
RUN;
PROC FREQ DATA=LIB.H5;
TABLES H5;
RUN;
PROC FREQ DATA=LIB.H5A;
TABLES H5A;
RUN;
PROC FREQ DATA=LIB.H5Abis;
TABLES H5Abis;
RUN;
PROC FREQ DATA=LIB.H5bis;
TABLES H5bis;
RUN;
PROC FREQ DATA=LIB.I1;
TABLES I1;
RUN;
PROC FREQ DATA=LIB.I1_old;
TABLES I1_old;
RUN;
PROC FREQ DATA=LIB.I1B;
TABLES I1B;
RUN;
PROC FREQ DATA=LIB.I1B_alt3_T2;
TABLES I1B_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1B1;
TABLES I1B1;
RUN;
PROC FREQ DATA=LIB.I1B1B;
TABLES I1B1B;
RUN;
PROC FREQ DATA=LIB.I1bis_T2;
TABLES I1bis_T2;
RUN;
PROC FREQ DATA=LIB.I1C;
TABLES I1C;
RUN;
PROC FREQ DATA=LIB.I1C_alt3_T2;
TABLES I1C_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1D;
TABLES I1D;
RUN;
PROC FREQ DATA=LIB.I1D_alt3_T2;
TABLES I1D_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1E;
TABLES I1E;
RUN;
PROC FREQ DATA=LIB.I1E_alt3_T2;
TABLES I1E_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1F;
TABLES I1F;
RUN;
PROC FREQ DATA=LIB.I1F_alt3_T2;
TABLES I1F_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1G;
TABLES I1G;
RUN;
PROC FREQ DATA=LIB.I1G_alt3_T2;
TABLES I1G_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1H;
TABLES I1H;
RUN;
PROC FREQ DATA=LIB.I1H_alt3_T2;
TABLES I1H_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1I;
TABLES I1I;
RUN;
PROC FREQ DATA=LIB.I1I_alt3_T2;
TABLES I1I_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1J;
TABLES I1J;
RUN;
PROC FREQ DATA=LIB.I1J_alt3_T2;
TABLES I1J_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1K;
TABLES I1K;
RUN;
PROC FREQ DATA=LIB.I1K_alt3_T2;
TABLES I1K_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1L;
TABLES I1L;
RUN;
PROC FREQ DATA=LIB.I1L_alt3_T2;
TABLES I1L_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1M;
TABLES I1M;
RUN;
PROC FREQ DATA=LIB.I1M_alt3_T2;
TABLES I1M_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1N;
TABLES I1N;
RUN;
PROC FREQ DATA=LIB.I1N_alt3_T2;
TABLES I1N_alt3_T2;
RUN;
PROC FREQ DATA=LIB.I1N1bis_T2;
TABLES I1N1bis_T2;
RUN;
PROC FREQ DATA=LIB.I1N2bis_T2;
TABLES I1N2bis_T2;
RUN;
PROC FREQ DATA=LIB.I1N3bis_T2;
TABLES I1N3bis_T2;
RUN;
PROC FREQ DATA=LIB.I1Ndue;
TABLES I1Ndue;
RUN;
PROC FREQ DATA=LIB.I1Nuno;
TABLES I1Nuno;
RUN;
PROC FREQ DATA=LIB.I1P;
TABLES I1P;
RUN;
PROC FREQ DATA=LIB.I2;
TABLES I2;
RUN;
PROC FREQ DATA=LIB.I2bis;
TABLES I2bis;
RUN;
PROC FREQ DATA=LIB.J1;
TABLES J1;
RUN;
PROC FREQ DATA=LIB.J1_alt1_T2;
TABLES J1_alt1_T2;
RUN;
PROC FREQ DATA=LIB.J1_alt2_T2;
TABLES J1_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J1_T1;
TABLES J1_T1;
RUN;
PROC FREQ DATA=LIB.J10;
TABLES J10;
RUN;
PROC FREQ DATA=LIB.J10_alt2_T2;
TABLES J10_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J10_alt3_T2;
TABLES J10_alt3_T2;
RUN;
PROC FREQ DATA=LIB.J10Balt2_T2;
TABLES J10Balt2_T2;
RUN;
PROC FREQ DATA=LIB.J11;
TABLES J11;
RUN;
PROC FREQ DATA=LIB.J11A;
TABLES J11A;
RUN;
PROC FREQ DATA=LIB.J11A1a;
TABLES J11A1a;
RUN;
PROC FREQ DATA=LIB.J11A1b;
TABLES J11A1b;
RUN;
PROC FREQ DATA=LIB.J11A1c;
TABLES J11A1c;
RUN;
PROC FREQ DATA=LIB.J11A1d;
TABLES J11A1d;
RUN;
PROC FREQ DATA=LIB.J11A1e;
TABLES J11A1e;
RUN;
PROC FREQ DATA=LIB.J11A1f;
TABLES J11A1f;
RUN;
PROC FREQ DATA=LIB.J11A1g;
TABLES J11A1g;
RUN;
PROC FREQ DATA=LIB.J11A1h;
TABLES J11A1h;
RUN;
PROC FREQ DATA=LIB.J11A1i;
TABLES J11A1i;
RUN;
PROC FREQ DATA=LIB.J11A1l;
TABLES J11A1l;
RUN;
PROC FREQ DATA=LIB.J11A1m;
TABLES J11A1m;
RUN;
PROC FREQ DATA=LIB.J11Abis;
TABLES J11Abis;
RUN;
PROC FREQ DATA=LIB.J12;
TABLES J12;
RUN;
PROC FREQ DATA=LIB.J13;
TABLES J13;
RUN;
PROC FREQ DATA=LIB.J13_alt1_T2;
TABLES J13_alt1_T2;
RUN;
PROC FREQ DATA=LIB.J13_alt2_T2;
TABLES J13_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J13_T1;
TABLES J13_T1;
RUN;
PROC FREQ DATA=LIB.J13Balt2_T2;
TABLES J13Balt2_T2;
RUN;
PROC FREQ DATA=LIB.J14;
TABLES J14;
RUN;
PROC FREQ DATA=LIB.J14_T1;
TABLES J14_T1;
RUN;
PROC FREQ DATA=LIB.J1B_alt2_T2;
TABLES J1B_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J2;
TABLES J2;
RUN;
PROC FREQ DATA=LIB.J2_alt2_T2;
TABLES J2_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J2_alt3_T2;
TABLES J2_alt3_T2;
RUN;
PROC FREQ DATA=LIB.J22;
TABLES J22;
RUN;
PROC FREQ DATA=LIB.J22bis;
TABLES J22bis;
RUN;
PROC FREQ DATA=LIB.J2A;
TABLES J2A;
RUN;
PROC FREQ DATA=LIB.J2B_alt2_T2;
TABLES J2B_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J3;
TABLES J3;
RUN;
PROC FREQ DATA=LIB.J3_alt2_T2;
TABLES J3_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J3_alt3_T2;
TABLES J3_alt3_T2;
RUN;
PROC FREQ DATA=LIB.J3B_alt2_T2;
TABLES J3B_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J4;
TABLES J4;
RUN;
PROC FREQ DATA=LIB.J5;
TABLES J5;
RUN;
PROC FREQ DATA=LIB.J6;
TABLES J6;
RUN;
PROC FREQ DATA=LIB.J6_alt1_T2;
TABLES J6_alt1_T2;
RUN;
PROC FREQ DATA=LIB.J6_alt2_T2;
TABLES J6_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J6_T1;
TABLES J6_T1;
RUN;
PROC FREQ DATA=LIB.J6A1;
TABLES J6A1;
RUN;
PROC FREQ DATA=LIB.J6A1_old;
TABLES J6A1_old;
RUN;
PROC FREQ DATA=LIB.J6A1al;
TABLES J6A1al;
RUN;
PROC FREQ DATA=LIB.J6Adue;
TABLES J6Adue;
RUN;
PROC FREQ DATA=LIB.J6Atre;
TABLES J6Atre;
RUN;
PROC FREQ DATA=LIB.J6Auno;
TABLES J6Auno;
RUN;
PROC FREQ DATA=LIB.J6B_alt2_T2;
TABLES J6B_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J7;
TABLES J7;
RUN;
PROC FREQ DATA=LIB.J7_alt1_T2;
TABLES J7_alt1_T2;
RUN;
PROC FREQ DATA=LIB.J7_alt2_T2;
TABLES J7_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J7A1a;
TABLES J7A1a;
RUN;
PROC FREQ DATA=LIB.J7A1b;
TABLES J7A1b;
RUN;
PROC FREQ DATA=LIB.J7A1c;
TABLES J7A1c;
RUN;
PROC FREQ DATA=LIB.J7A1d;
TABLES J7A1d;
RUN;
PROC FREQ DATA=LIB.J7A2a;
TABLES J7A2a;
RUN;
PROC FREQ DATA=LIB.J7A2b;
TABLES J7A2b;
RUN;
PROC FREQ DATA=LIB.J7A2c;
TABLES J7A2c;
RUN;
PROC FREQ DATA=LIB.J7A2d;
TABLES J7A2d;
RUN;
PROC FREQ DATA=LIB.J7A2e;
TABLES J7A2e;
RUN;
PROC FREQ DATA=LIB.J7A2f;
TABLES J7A2f;
RUN;
PROC FREQ DATA=LIB.J7A3;
TABLES J7A3;
RUN;
PROC FREQ DATA=LIB.J7A3_old;
TABLES J7A3_old;
RUN;
PROC FREQ DATA=LIB.J7A3al;
TABLES J7A3al;
RUN;
PROC FREQ DATA=LIB.J7A4_civile;
TABLES J7A4_civile;
RUN;
PROC FREQ DATA=LIB.J7A4_ind;
TABLES J7A4_ind;
RUN;
PROC FREQ DATA=LIB.J7A4_inf;
TABLES J7A4_inf;
RUN;
PROC FREQ DATA=LIB.J7A4a;
TABLES J7A4a;
RUN;
PROC FREQ DATA=LIB.J7A4b;
TABLES J7A4b;
RUN;
PROC FREQ DATA=LIB.J7A4c;
TABLES J7A4c;
RUN;
PROC FREQ DATA=LIB.J7A4d;
TABLES J7A4d;
RUN;
PROC FREQ DATA=LIB.J7A5a;
TABLES J7A5a;
RUN;
PROC FREQ DATA=LIB.J7A5b;
TABLES J7A5b;
RUN;
PROC FREQ DATA=LIB.J7A5c;
TABLES J7A5c;
RUN;
PROC FREQ DATA=LIB.J7A5d;
TABLES J7A5d;
RUN;
PROC FREQ DATA=LIB.J7A5e;
TABLES J7A5e;
RUN;
PROC FREQ DATA=LIB.J7A5f;
TABLES J7A5f;
RUN;
PROC FREQ DATA=LIB.J7A5g;
TABLES J7A5g;
RUN;
PROC FREQ DATA=LIB.J7A5h;
TABLES J7A5h;
RUN;
PROC FREQ DATA=LIB.J7A5i;
TABLES J7A5i;
RUN;
PROC FREQ DATA=LIB.J7A5l;
TABLES J7A5l;
RUN;
PROC FREQ DATA=LIB.J7A5m;
TABLES J7A5m;
RUN;
PROC FREQ DATA=LIB.J7A5n;
TABLES J7A5n;
RUN;
PROC FREQ DATA=LIB.J7A5o;
TABLES J7A5o;
RUN;
PROC FREQ DATA=LIB.J7B;
TABLES J7B;
RUN;
PROC FREQ DATA=LIB.J7B_alt2_T2;
TABLES J7B_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J8;
TABLES J8;
RUN;
PROC FREQ DATA=LIB.J8_alt1_T2;
TABLES J8_alt1_T2;
RUN;
PROC FREQ DATA=LIB.J8_alt2_T2;
TABLES J8_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J8B_alt2_T2;
TABLES J8B_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J9;
TABLES J9;
RUN;
PROC FREQ DATA=LIB.J9_alt2_T2;
TABLES J9_alt2_T2;
RUN;
PROC FREQ DATA=LIB.J9_alt3_T2;
TABLES J9_alt3_T2;
RUN;
PROC FREQ DATA=LIB.J9B_alt2_T2;
TABLES J9B_alt2_T2;
RUN;
PROC FREQ DATA=LIB.JA9;
TABLES JA9;
RUN;
PROC FREQ DATA=LIB.JA9bis;
TABLES JA9bis;
RUN;
PROC FREQ DATA=LIB.K0;
TABLES K0;
RUN;
PROC FREQ DATA=LIB.K1;
TABLES K1;
RUN;
PROC FREQ DATA=LIB.K1_alt1_T2;
TABLES K1_alt1_T2;
RUN;
PROC FREQ DATA=LIB.K1_alt2_T2;
TABLES K1_alt2_T2;
RUN;
PROC FREQ DATA=LIB.K10AJ20A;
TABLES K10AJ20A;
RUN;
PROC FREQ DATA=LIB.K10J20;
TABLES K10J20;
RUN;
PROC FREQ DATA=LIB.K11J21;
TABLES K11J21;
RUN;
PROC FREQ DATA=LIB.K11J21_T1;
TABLES K11J21_T1;
RUN;
PROC FREQ DATA=LIB.K1B_T2;
TABLES K1B_T2;
RUN;
PROC FREQ DATA=LIB.K2;
TABLES K2;
RUN;
PROC FREQ DATA=LIB.K3;
TABLES K3;
RUN;
PROC FREQ DATA=LIB.K4;
TABLES K4;
RUN;
PROC FREQ DATA=LIB.K5J15;
TABLES K5J15;
RUN;
PROC FREQ DATA=LIB.K5J15_pre_T2;
TABLES K5J15_pre_T2;
RUN;
PROC FREQ DATA=LIB.K5J15_T0;
TABLES K5J15_T0;
RUN;
PROC FREQ DATA=LIB.K6J16;
TABLES K6J16;
RUN;
PROC FREQ DATA=LIB.K7AJ17A;
TABLES K7AJ17A;
RUN;
PROC FREQ DATA=LIB.K7J17;
TABLES K7J17;
RUN;
PROC FREQ DATA=LIB.K8AJ18A;
TABLES K8AJ18A;
RUN;
PROC FREQ DATA=LIB.K8J18;
TABLES K8J18;
RUN;
PROC FREQ DATA=LIB.K9AJ19A;
TABLES K9AJ19A;
RUN;
PROC FREQ DATA=LIB.K9J19;
TABLES K9J19;
RUN;
PROC FREQ DATA=LIB.L1;
TABLES L1;
RUN;
PROC FREQ DATA=LIB.L1altro;
TABLES L1altro;
RUN;
PROC FREQ DATA=LIB.L2;
TABLES L2;
RUN;
PROC FREQ DATA=LIB.L2bis;
TABLES L2bis;
RUN;
PROC FREQ DATA=LIB.L3;
TABLES L3;
RUN;
PROC FREQ DATA=LIB.L3A;
TABLES L3A;
RUN;
PROC FREQ DATA=LIB.L3B;
TABLES L3B;
RUN;
PROC FREQ DATA=LIB.L3C;
TABLES L3C;
RUN;
PROC FREQ DATA=LIB.L4;
TABLES L4;
RUN;
PROC FREQ DATA=LIB.L4A;
TABLES L4A;
RUN;
PROC FREQ DATA=LIB.L4Abis;
TABLES L4Abis;
RUN;
PROC FREQ DATA=LIB.L5;
TABLES L5;
RUN;
PROC FREQ DATA=LIB.LD;
TABLES LD;
RUN;
PROC FREQ DATA=LIB.M1;
TABLES M1;
RUN;
PROC FREQ DATA=LIB.M1A;
TABLES M1A;
RUN;
PROC FREQ DATA=LIB.M1Abis;
TABLES M1Abis;
RUN;
PROC FREQ DATA=LIB.M1B;
TABLES M1B;
RUN;
PROC FREQ DATA=LIB.M1Bdue;
TABLES M1Bdue;
RUN;
PROC FREQ DATA=LIB.M1Buno;
TABLES M1Buno;
RUN;
PROC FREQ DATA=LIB.M3a;
TABLES M3a;
RUN;
PROC FREQ DATA=LIB.M3b;
TABLES M3b;
RUN;
PROC FREQ DATA=LIB.M3bA;
TABLES M3bA;
RUN;
PROC FREQ DATA=LIB.M3c;
TABLES M3c;
RUN;
PROC FREQ DATA=LIB.M3c1;
TABLES M3c1;
RUN;
PROC FREQ DATA=LIB.N1A;
TABLES N1A;
RUN;
PROC FREQ DATA=LIB.N1Ano;
TABLES N1Ano;
RUN;
PROC FREQ DATA=LIB.N1B;
TABLES N1B;
RUN;
PROC FREQ DATA=LIB.N1B_old;
TABLES N1B_old;
RUN;
PROC FREQ DATA=LIB.N1Bbis;
TABLES N1Bbis;
RUN;
PROC FREQ DATA=LIB.N1C;
TABLES N1C;
RUN;
PROC FREQ DATA=LIB.N1Cbis;
TABLES N1Cbis;
RUN;
PROC FREQ DATA=LIB.N1D;
TABLES N1D;
RUN;
PROC FREQ DATA=LIB.N1D1;
TABLES N1D1;
RUN;
PROC FREQ DATA=LIB.N1E;
TABLES N1E;
RUN;
PROC FREQ DATA=LIB.N1F;
TABLES N1F;
RUN;
PROC FREQ DATA=LIB.N1F1;
TABLES N1F1;
RUN;
PROC FREQ DATA=LIB.N1Fdue;
TABLES N1Fdue;
RUN;
PROC FREQ DATA=LIB.N1Funo;
TABLES N1Funo;
RUN;
PROC FREQ DATA=LIB.N1G;
TABLES N1G;
RUN;
PROC FREQ DATA=LIB.N1Gbis;
TABLES N1Gbis;
RUN;
PROC FREQ DATA=LIB.N1H;
TABLES N1H;
RUN;
PROC FREQ DATA=LIB.N1H_alt2_T2;
TABLES N1H_alt2_T2;
RUN;
PROC FREQ DATA=LIB.N1H_alt3_T2;
TABLES N1H_alt3_T2;
RUN;
PROC FREQ DATA=LIB.N1H1;
TABLES N1H1;
RUN;
PROC FREQ DATA=LIB.N1Hbis_T2;
TABLES N1Hbis_T2;
RUN;
PROC FREQ DATA=LIB.N1Hbis2_T2;
TABLES N1Hbis2_T2;
RUN;
PROC FREQ DATA=LIB.N1I;
TABLES N1I;
RUN;
PROC FREQ DATA=LIB.N1I_old;
TABLES N1I_old;
RUN;
PROC FREQ DATA=LIB.N1Ialtro;
TABLES N1Ialtro;
RUN;
PROC FREQ DATA=LIB.N1J;
TABLES N1J;
RUN;
PROC FREQ DATA=LIB.N1K;
TABLES N1K;
RUN;
PROC FREQ DATA=LIB.N1Kdue;
TABLES N1Kdue;
RUN;
PROC FREQ DATA=LIB.N1Kuno;
TABLES N1Kuno;
RUN;
PROC FREQ DATA=LIB.N1L;
TABLES N1L;
RUN;
PROC FREQ DATA=LIB.N1LA;
TABLES N1LA;
RUN;
PROC FREQ DATA=LIB.N1M;
TABLES N1M;
RUN;
PROC FREQ DATA=LIB.N1M_1;
TABLES N1M_1;
RUN;
PROC FREQ DATA=LIB.N1M1;
TABLES N1M1;
RUN;
PROC FREQ DATA=LIB.N1MA;
TABLES N1MA;
RUN;
PROC FREQ DATA=LIB.N1N;
TABLES N1N;
RUN;
PROC FREQ DATA=LIB.N2;
TABLES N2;
RUN;
PROC FREQ DATA=LIB.N2A;
TABLES N2A;
RUN;
PROC FREQ DATA=LIB.N2A_old;
TABLES N2A_old;
RUN;
PROC FREQ DATA=LIB.N2Aaltro;
TABLES N2Aaltro;
RUN;
PROC FREQ DATA=LIB.N2B;
TABLES N2B;
RUN;
PROC FREQ DATA=LIB.N2Bbis;
TABLES N2Bbis;
RUN;
PROC FREQ DATA=LIB.N2C;
TABLES N2C;
RUN;
PROC FREQ DATA=LIB.N2D;
TABLES N2D;
RUN;
PROC FREQ DATA=LIB.N3;
TABLES N3;
RUN;
PROC FREQ DATA=LIB.N3A;
TABLES N3A;
RUN;
PROC FREQ DATA=LIB.N3Abis;
TABLES N3Abis;
RUN;
PROC FREQ DATA=LIB.N3B;
TABLES N3B;
RUN;
PROC FREQ DATA=LIB.N3Bbis;
TABLES N3Bbis;
RUN;
PROC FREQ DATA=LIB.N3C;
TABLES N3C;
RUN;
PROC FREQ DATA=LIB.N4;
TABLES N4;
RUN;
PROC FREQ DATA=LIB.N4A;
TABLES N4A;
RUN;
PROC FREQ DATA=LIB.N4bis;
TABLES N4bis;
RUN;
PROC FREQ DATA=LIB.N5;
TABLES N5;
RUN;
PROC FREQ DATA=LIB.N5_1;
TABLES N5_1;
RUN;
PROC FREQ DATA=LIB.N5_2;
TABLES N5_2;
RUN;
PROC FREQ DATA=LIB.N5A;
TABLES N5A;
RUN;
PROC FREQ DATA=LIB.N5A1;
TABLES N5A1;
RUN;
PROC FREQ DATA=LIB.N5A2;
TABLES N5A2;
RUN;
PROC FREQ DATA=LIB.Notes;
TABLES Notes;
RUN;
PROC FREQ DATA=LIB.P1;
TABLES P1;
RUN;
PROC FREQ DATA=LIB.P1A;
TABLES P1A;
RUN;
PROC FREQ DATA=LIB.P1Aa;
TABLES P1Aa;
RUN;
PROC FREQ DATA=LIB.P1Agr_1;
TABLES P1Agr_1;
RUN;
PROC FREQ DATA=LIB.P1Agr_10;
TABLES P1Agr_10;
RUN;
PROC FREQ DATA=LIB.P1Agr_11;
TABLES P1Agr_11;
RUN;
PROC FREQ DATA=LIB.P1Agr_12;
TABLES P1Agr_12;
RUN;
PROC FREQ DATA=LIB.P1Agr_13;
TABLES P1Agr_13;
RUN;
PROC FREQ DATA=LIB.P1Agr_14;
TABLES P1Agr_14;
RUN;
PROC FREQ DATA=LIB.P1Agr_15;
TABLES P1Agr_15;
RUN;
PROC FREQ DATA=LIB.P1Agr_2;
TABLES P1Agr_2;
RUN;
PROC FREQ DATA=LIB.P1Agr_3;
TABLES P1Agr_3;
RUN;
PROC FREQ DATA=LIB.P1Agr_4;
TABLES P1Agr_4;
RUN;
PROC FREQ DATA=LIB.P1Agr_5;
TABLES P1Agr_5;
RUN;
PROC FREQ DATA=LIB.P1Agr_6;
TABLES P1Agr_6;
RUN;
PROC FREQ DATA=LIB.P1Agr_7;
TABLES P1Agr_7;
RUN;
PROC FREQ DATA=LIB.P1Agr_8;
TABLES P1Agr_8;
RUN;
PROC FREQ DATA=LIB.P1Agr_9;
TABLES P1Agr_9;
RUN;
PROC FREQ DATA=LIB.P1comp_mancanti;
TABLES P1comp_mancanti;
RUN;
PROC FREQ DATA=LIB.P1comp_mancanti1;
TABLES P1comp_mancanti1;
RUN;
PROC FREQ DATA=LIB.P1E;
TABLES P1E;
RUN;
PROC FREQ DATA=LIB.P1Ebis;
TABLES P1Ebis;
RUN;
PROC FREQ DATA=LIB.P1Ec_1;
TABLES P1Ec_1;
RUN;
PROC FREQ DATA=LIB.P1Ec_10;
TABLES P1Ec_10;
RUN;
PROC FREQ DATA=LIB.P1Ec_11;
TABLES P1Ec_11;
RUN;
PROC FREQ DATA=LIB.P1Ec_12;
TABLES P1Ec_12;
RUN;
PROC FREQ DATA=LIB.P1Ec_13;
TABLES P1Ec_13;
RUN;
PROC FREQ DATA=LIB.P1Ec_14;
TABLES P1Ec_14;
RUN;
PROC FREQ DATA=LIB.P1Ec_15;
TABLES P1Ec_15;
RUN;
PROC FREQ DATA=LIB.P1Ec_16;
TABLES P1Ec_16;
RUN;
PROC FREQ DATA=LIB.P1Ec_17;
TABLES P1Ec_17;
RUN;
PROC FREQ DATA=LIB.P1Ec_18;
TABLES P1Ec_18;
RUN;
PROC FREQ DATA=LIB.P1Ec_19;
TABLES P1Ec_19;
RUN;
PROC FREQ DATA=LIB.P1Ec_2;
TABLES P1Ec_2;
RUN;
PROC FREQ DATA=LIB.P1Ec_20;
TABLES P1Ec_20;
RUN;
PROC FREQ DATA=LIB.P1Ec_21;
TABLES P1Ec_21;
RUN;
PROC FREQ DATA=LIB.P1Ec_3;
TABLES P1Ec_3;
RUN;
PROC FREQ DATA=LIB.P1Ec_4;
TABLES P1Ec_4;
RUN;
PROC FREQ DATA=LIB.P1Ec_5;
TABLES P1Ec_5;
RUN;
PROC FREQ DATA=LIB.P1Ec_6;
TABLES P1Ec_6;
RUN;
PROC FREQ DATA=LIB.P1Ec_7;
TABLES P1Ec_7;
RUN;
PROC FREQ DATA=LIB.P1Ec_8;
TABLES P1Ec_8;
RUN;
PROC FREQ DATA=LIB.P1Ec_9;
TABLES P1Ec_9;
RUN;
PROC FREQ DATA=LIB.P1F;
TABLES P1F;
RUN;
PROC FREQ DATA=LIB.P1Farm_1;
TABLES P1Farm_1;
RUN;
PROC FREQ DATA=LIB.P1Farm_10;
TABLES P1Farm_10;
RUN;
PROC FREQ DATA=LIB.P1Farm_11;
TABLES P1Farm_11;
RUN;
PROC FREQ DATA=LIB.P1Farm_12;
TABLES P1Farm_12;
RUN;
PROC FREQ DATA=LIB.P1Farm_2;
TABLES P1Farm_2;
RUN;
PROC FREQ DATA=LIB.P1Farm_3;
TABLES P1Farm_3;
RUN;
PROC FREQ DATA=LIB.P1Farm_4;
TABLES P1Farm_4;
RUN;
PROC FREQ DATA=LIB.P1Farm_5;
TABLES P1Farm_5;
RUN;
PROC FREQ DATA=LIB.P1Farm_6;
TABLES P1Farm_6;
RUN;
PROC FREQ DATA=LIB.P1Farm_7;
TABLES P1Farm_7;
RUN;
PROC FREQ DATA=LIB.P1Farm_8;
TABLES P1Farm_8;
RUN;
PROC FREQ DATA=LIB.P1Farm_9;
TABLES P1Farm_9;
RUN;
PROC FREQ DATA=LIB.P1Fbis;
TABLES P1Fbis;
RUN;
PROC FREQ DATA=LIB.P1G;
TABLES P1G;
RUN;
PROC FREQ DATA=LIB.P1Gbis;
TABLES P1Gbis;
RUN;
PROC FREQ DATA=LIB.P1GR_1;
TABLES P1GR_1;
RUN;
PROC FREQ DATA=LIB.P1GR_10;
TABLES P1GR_10;
RUN;
PROC FREQ DATA=LIB.P1GR_11;
TABLES P1GR_11;
RUN;
PROC FREQ DATA=LIB.P1GR_12;
TABLES P1GR_12;
RUN;
PROC FREQ DATA=LIB.P1GR_13;
TABLES P1GR_13;
RUN;
PROC FREQ DATA=LIB.P1GR_14;
TABLES P1GR_14;
RUN;
PROC FREQ DATA=LIB.P1GR_15;
TABLES P1GR_15;
RUN;
PROC FREQ DATA=LIB.P1GR_16;
TABLES P1GR_16;
RUN;
PROC FREQ DATA=LIB.P1GR_17;
TABLES P1GR_17;
RUN;
PROC FREQ DATA=LIB.P1GR_18;
TABLES P1GR_18;
RUN;
PROC FREQ DATA=LIB.P1GR_2;
TABLES P1GR_2;
RUN;
PROC FREQ DATA=LIB.P1GR_3;
TABLES P1GR_3;
RUN;
PROC FREQ DATA=LIB.P1GR_4;
TABLES P1GR_4;
RUN;
PROC FREQ DATA=LIB.P1GR_5;
TABLES P1GR_5;
RUN;
PROC FREQ DATA=LIB.P1GR_6;
TABLES P1GR_6;
RUN;
PROC FREQ DATA=LIB.P1GR_7;
TABLES P1GR_7;
RUN;
PROC FREQ DATA=LIB.P1GR_8;
TABLES P1GR_8;
RUN;
PROC FREQ DATA=LIB.P1GR_9;
TABLES P1GR_9;
RUN;
PROC FREQ DATA=LIB.P1I;
TABLES P1I;
RUN;
PROC FREQ DATA=LIB.P1Ibis;
TABLES P1Ibis;
RUN;
PROC FREQ DATA=LIB.P1Ing_1;
TABLES P1Ing_1;
RUN;
PROC FREQ DATA=LIB.P1Ing_10;
TABLES P1Ing_10;
RUN;
PROC FREQ DATA=LIB.P1Ing_11;
TABLES P1Ing_11;
RUN;
PROC FREQ DATA=LIB.P1Ing_12;
TABLES P1Ing_12;
RUN;
PROC FREQ DATA=LIB.P1Ing_13;
TABLES P1Ing_13;
RUN;
PROC FREQ DATA=LIB.P1Ing_14;
TABLES P1Ing_14;
RUN;
PROC FREQ DATA=LIB.P1Ing_15;
TABLES P1Ing_15;
RUN;
PROC FREQ DATA=LIB.P1Ing_16;
TABLES P1Ing_16;
RUN;
PROC FREQ DATA=LIB.P1Ing_2;
TABLES P1Ing_2;
RUN;
PROC FREQ DATA=LIB.P1Ing_3;
TABLES P1Ing_3;
RUN;
PROC FREQ DATA=LIB.P1Ing_4;
TABLES P1Ing_4;
RUN;
PROC FREQ DATA=LIB.P1Ing_5;
TABLES P1Ing_5;
RUN;
PROC FREQ DATA=LIB.P1Ing_6;
TABLES P1Ing_6;
RUN;
PROC FREQ DATA=LIB.P1Ing_7;
TABLES P1Ing_7;
RUN;
PROC FREQ DATA=LIB.P1Ing_8;
TABLES P1Ing_8;
RUN;
PROC FREQ DATA=LIB.P1Ing_9;
TABLES P1Ing_9;
RUN;
PROC FREQ DATA=LIB.P1Lett_1;
TABLES P1Lett_1;
RUN;
PROC FREQ DATA=LIB.P1Lett_10;
TABLES P1Lett_10;
RUN;
PROC FREQ DATA=LIB.P1Lett_11;
TABLES P1Lett_11;
RUN;
PROC FREQ DATA=LIB.P1Lett_2;
TABLES P1Lett_2;
RUN;
PROC FREQ DATA=LIB.P1Lett_3;
TABLES P1Lett_3;
RUN;
PROC FREQ DATA=LIB.P1Lett_4;
TABLES P1Lett_4;
RUN;
PROC FREQ DATA=LIB.P1Lett_5;
TABLES P1Lett_5;
RUN;
PROC FREQ DATA=LIB.P1Lett_6;
TABLES P1Lett_6;
RUN;
PROC FREQ DATA=LIB.P1Lett_7;
TABLES P1Lett_7;
RUN;
PROC FREQ DATA=LIB.P1Lett_8;
TABLES P1Lett_8;
RUN;
PROC FREQ DATA=LIB.P1Lett_9;
TABLES P1Lett_9;
RUN;
PROC FREQ DATA=LIB.P1P;
TABLES P1P;
RUN;
PROC FREQ DATA=LIB.P1Pbis;
TABLES P1Pbis;
RUN;
PROC FREQ DATA=LIB.P1Psico_1;
TABLES P1Psico_1;
RUN;
PROC FREQ DATA=LIB.P1Psico_10;
TABLES P1Psico_10;
RUN;
PROC FREQ DATA=LIB.P1Psico_11;
TABLES P1Psico_11;
RUN;
PROC FREQ DATA=LIB.P1Psico_12;
TABLES P1Psico_12;
RUN;
PROC FREQ DATA=LIB.P1Psico_13;
TABLES P1Psico_13;
RUN;
PROC FREQ DATA=LIB.P1Psico_14;
TABLES P1Psico_14;
RUN;
PROC FREQ DATA=LIB.P1Psico_15;
TABLES P1Psico_15;
RUN;
PROC FREQ DATA=LIB.P1Psico_16;
TABLES P1Psico_16;
RUN;
PROC FREQ DATA=LIB.P1Psico_17;
TABLES P1Psico_17;
RUN;
PROC FREQ DATA=LIB.P1Psico_18;
TABLES P1Psico_18;
RUN;
PROC FREQ DATA=LIB.P1Psico_19;
TABLES P1Psico_19;
RUN;
PROC FREQ DATA=LIB.P1Psico_2;
TABLES P1Psico_2;
RUN;
PROC FREQ DATA=LIB.P1Psico_20;
TABLES P1Psico_20;
RUN;
PROC FREQ DATA=LIB.P1Psico_3;
TABLES P1Psico_3;
RUN;
PROC FREQ DATA=LIB.P1Psico_4;
TABLES P1Psico_4;
RUN;
PROC FREQ DATA=LIB.P1Psico_5;
TABLES P1Psico_5;
RUN;
PROC FREQ DATA=LIB.P1Psico_6;
TABLES P1Psico_6;
RUN;
PROC FREQ DATA=LIB.P1Psico_7;
TABLES P1Psico_7;
RUN;
PROC FREQ DATA=LIB.P1Psico_8;
TABLES P1Psico_8;
RUN;
PROC FREQ DATA=LIB.P1Psico_9;
TABLES P1Psico_9;
RUN;
PROC FREQ DATA=LIB.P1Sa;
TABLES P1Sa;
RUN;
PROC FREQ DATA=LIB.P1Sb;
TABLES P1Sb;
RUN;
PROC FREQ DATA=LIB.P1Sc;
TABLES P1Sc;
RUN;
PROC FREQ DATA=LIB.P1Sd;
TABLES P1Sd;
RUN;
PROC FREQ DATA=LIB.P1Se;
TABLES P1Se;
RUN;
PROC FREQ DATA=LIB.P1Sf;
TABLES P1Sf;
RUN;
PROC FREQ DATA=LIB.P1SF_1;
TABLES P1SF_1;
RUN;
PROC FREQ DATA=LIB.P1SF_10;
TABLES P1SF_10;
RUN;
PROC FREQ DATA=LIB.P1SF_11;
TABLES P1SF_11;
RUN;
PROC FREQ DATA=LIB.P1SF_12;
TABLES P1SF_12;
RUN;
PROC FREQ DATA=LIB.P1SF_13;
TABLES P1SF_13;
RUN;
PROC FREQ DATA=LIB.P1SF_14;
TABLES P1SF_14;
RUN;
PROC FREQ DATA=LIB.P1SF_15;
TABLES P1SF_15;
RUN;
PROC FREQ DATA=LIB.P1SF_16;
TABLES P1SF_16;
RUN;
PROC FREQ DATA=LIB.P1SF_17;
TABLES P1SF_17;
RUN;
PROC FREQ DATA=LIB.P1SF_18;
TABLES P1SF_18;
RUN;
PROC FREQ DATA=LIB.P1SF_19;
TABLES P1SF_19;
RUN;
PROC FREQ DATA=LIB.P1SF_2;
TABLES P1SF_2;
RUN;
PROC FREQ DATA=LIB.P1SF_20;
TABLES P1SF_20;
RUN;
PROC FREQ DATA=LIB.P1SF_21;
TABLES P1SF_21;
RUN;
PROC FREQ DATA=LIB.P1SF_3;
TABLES P1SF_3;
RUN;
PROC FREQ DATA=LIB.P1SF_4;
TABLES P1SF_4;
RUN;
PROC FREQ DATA=LIB.P1SF_5;
TABLES P1SF_5;
RUN;
PROC FREQ DATA=LIB.P1SF_6;
TABLES P1SF_6;
RUN;
PROC FREQ DATA=LIB.P1SF_7;
TABLES P1SF_7;
RUN;
PROC FREQ DATA=LIB.P1SF_8;
TABLES P1SF_8;
RUN;
PROC FREQ DATA=LIB.P1SF_9;
TABLES P1SF_9;
RUN;
PROC FREQ DATA=LIB.P1Sg;
TABLES P1Sg;
RUN;
PROC FREQ DATA=LIB.P1Sh;
TABLES P1Sh;
RUN;
PROC FREQ DATA=LIB.P1Si;
TABLES P1Si;
RUN;
PROC FREQ DATA=LIB.P1Sl;
TABLES P1Sl;
RUN;
PROC FREQ DATA=LIB.P1Sm;
TABLES P1Sm;
RUN;
PROC FREQ DATA=LIB.P1SM_1;
TABLES P1SM_1;
RUN;
PROC FREQ DATA=LIB.P1SM_10;
TABLES P1SM_10;
RUN;
PROC FREQ DATA=LIB.P1SM_11;
TABLES P1SM_11;
RUN;
PROC FREQ DATA=LIB.P1SM_12;
TABLES P1SM_12;
RUN;
PROC FREQ DATA=LIB.P1SM_13;
TABLES P1SM_13;
RUN;
PROC FREQ DATA=LIB.P1SM_14;
TABLES P1SM_14;
RUN;
PROC FREQ DATA=LIB.P1SM_15;
TABLES P1SM_15;
RUN;
PROC FREQ DATA=LIB.P1SM_2;
TABLES P1SM_2;
RUN;
PROC FREQ DATA=LIB.P1SM_3;
TABLES P1SM_3;
RUN;
PROC FREQ DATA=LIB.P1SM_4;
TABLES P1SM_4;
RUN;
PROC FREQ DATA=LIB.P1SM_5;
TABLES P1SM_5;
RUN;
PROC FREQ DATA=LIB.P1SM_6;
TABLES P1SM_6;
RUN;
PROC FREQ DATA=LIB.P1SM_7;
TABLES P1SM_7;
RUN;
PROC FREQ DATA=LIB.P1SM_8;
TABLES P1SM_8;
RUN;
PROC FREQ DATA=LIB.P1SM_9;
TABLES P1SM_9;
RUN;
PROC FREQ DATA=LIB.P1Sn;
TABLES P1Sn;
RUN;
PROC FREQ DATA=LIB.P1So;
TABLES P1So;
RUN;
PROC FREQ DATA=LIB.P1Sp;
TABLES P1Sp;
RUN;
PROC FREQ DATA=LIB.P1SP_1;
TABLES P1SP_1;
RUN;
PROC FREQ DATA=LIB.P1SP_10;
TABLES P1SP_10;
RUN;
PROC FREQ DATA=LIB.P1SP_11;
TABLES P1SP_11;
RUN;
PROC FREQ DATA=LIB.P1SP_12;
TABLES P1SP_12;
RUN;
PROC FREQ DATA=LIB.P1SP_13;
TABLES P1SP_13;
RUN;
PROC FREQ DATA=LIB.P1SP_14;
TABLES P1SP_14;
RUN;
PROC FREQ DATA=LIB.P1SP_15;
TABLES P1SP_15;
RUN;
PROC FREQ DATA=LIB.P1SP_16;
TABLES P1SP_16;
RUN;
PROC FREQ DATA=LIB.P1SP_17;
TABLES P1SP_17;
RUN;
PROC FREQ DATA=LIB.P1SP_2;
TABLES P1SP_2;
RUN;
PROC FREQ DATA=LIB.P1SP_3;
TABLES P1SP_3;
RUN;
PROC FREQ DATA=LIB.P1SP_4;
TABLES P1SP_4;
RUN;
PROC FREQ DATA=LIB.P1SP_5;
TABLES P1SP_5;
RUN;
PROC FREQ DATA=LIB.P1SP_6;
TABLES P1SP_6;
RUN;
PROC FREQ DATA=LIB.P1SP_7;
TABLES P1SP_7;
RUN;
PROC FREQ DATA=LIB.P1SP_8;
TABLES P1SP_8;
RUN;
PROC FREQ DATA=LIB.P1SP_9;
TABLES P1SP_9;
RUN;
PROC FREQ DATA=LIB.P1Sq;
TABLES P1Sq;
RUN;
PROC FREQ DATA=LIB.P1Sr;
TABLES P1Sr;
RUN;
PROC FREQ DATA=LIB.P1Ss;
TABLES P1Ss;
RUN;
PROC FREQ DATA=LIB.P1SS_1;
TABLES P1SS_1;
RUN;
PROC FREQ DATA=LIB.P1SS_10;
TABLES P1SS_10;
RUN;
PROC FREQ DATA=LIB.P1SS_11;
TABLES P1SS_11;
RUN;
PROC FREQ DATA=LIB.P1SS_12;
TABLES P1SS_12;
RUN;
PROC FREQ DATA=LIB.P1SS_13;
TABLES P1SS_13;
RUN;
PROC FREQ DATA=LIB.P1SS_14;
TABLES P1SS_14;
RUN;
PROC FREQ DATA=LIB.P1SS_15;
TABLES P1SS_15;
RUN;
PROC FREQ DATA=LIB.P1SS_16;
TABLES P1SS_16;
RUN;
PROC FREQ DATA=LIB.P1SS_17;
TABLES P1SS_17;
RUN;
PROC FREQ DATA=LIB.P1SS_18;
TABLES P1SS_18;
RUN;
PROC FREQ DATA=LIB.P1SS_19;
TABLES P1SS_19;
RUN;
PROC FREQ DATA=LIB.P1SS_2;
TABLES P1SS_2;
RUN;
PROC FREQ DATA=LIB.P1SS_3;
TABLES P1SS_3;
RUN;
PROC FREQ DATA=LIB.P1SS_4;
TABLES P1SS_4;
RUN;
PROC FREQ DATA=LIB.P1SS_5;
TABLES P1SS_5;
RUN;
PROC FREQ DATA=LIB.P1SS_6;
TABLES P1SS_6;
RUN;
PROC FREQ DATA=LIB.P1SS_7;
TABLES P1SS_7;
RUN;
PROC FREQ DATA=LIB.P1SS_8;
TABLES P1SS_8;
RUN;
PROC FREQ DATA=LIB.P1SS_9;
TABLES P1SS_9;
RUN;
PROC FREQ DATA=LIB.P1St;
TABLES P1St;
RUN;
PROC FREQ DATA=LIB.P1Su;
TABLES P1Su;
RUN;
PROC FREQ DATA=LIB.P1Sv;
TABLES P1Sv;
RUN;
PROC FREQ DATA=LIB.P1Sw;
TABLES P1Sw;
RUN;
PROC FREQ DATA=LIB.P1Sy;
TABLES P1Sy;
RUN;
PROC FREQ DATA=LIB.P1Sz;
TABLES P1Sz;
RUN;
PROC FREQ DATA=LIB.P1T;
TABLES P1T;
RUN;
PROC FREQ DATA=LIB.P1Tbis;
TABLES P1Tbis;
RUN;
PROC FREQ DATA=LIB.P1Veter_1;
TABLES P1Veter_1;
RUN;
PROC FREQ DATA=LIB.P1Veter_10;
TABLES P1Veter_10;
RUN;
PROC FREQ DATA=LIB.P1Veter_11;
TABLES P1Veter_11;
RUN;
PROC FREQ DATA=LIB.P1Veter_2;
TABLES P1Veter_2;
RUN;
PROC FREQ DATA=LIB.P1Veter_3;
TABLES P1Veter_3;
RUN;
PROC FREQ DATA=LIB.P1Veter_4;
TABLES P1Veter_4;
RUN;
PROC FREQ DATA=LIB.P1Veter_5;
TABLES P1Veter_5;
RUN;
PROC FREQ DATA=LIB.P1Veter_6;
TABLES P1Veter_6;
RUN;
PROC FREQ DATA=LIB.P1Veter_7;
TABLES P1Veter_7;
RUN;
PROC FREQ DATA=LIB.P1Veter_8;
TABLES P1Veter_8;
RUN;
PROC FREQ DATA=LIB.P1Veter_9;
TABLES P1Veter_9;
RUN;
PROC FREQ DATA=LIB.P2a;
TABLES P2a;
RUN;
PROC FREQ DATA=LIB.P2abis;
TABLES P2abis;
RUN;
PROC FREQ DATA=LIB.P2altro;
TABLES P2altro;
RUN;
PROC FREQ DATA=LIB.P2b;
TABLES P2b;
RUN;
PROC FREQ DATA=LIB.P2bbis;
TABLES P2bbis;
RUN;
PROC FREQ DATA=LIB.P2c;
TABLES P2c;
RUN;
PROC FREQ DATA=LIB.P2cbis;
TABLES P2cbis;
RUN;
PROC FREQ DATA=LIB.P2d;
TABLES P2d;
RUN;
PROC FREQ DATA=LIB.P2dbis;
TABLES P2dbis;
RUN;
PROC FREQ DATA=LIB.P2e;
TABLES P2e;
RUN;
PROC FREQ DATA=LIB.P2ebis;
TABLES P2ebis;
RUN;
PROC FREQ DATA=LIB.P2f;
TABLES P2f;
RUN;
PROC FREQ DATA=LIB.P2fbis;
TABLES P2fbis;
RUN;
PROC FREQ DATA=LIB.P2g;
TABLES P2g;
RUN;
PROC FREQ DATA=LIB.P2gbis;
TABLES P2gbis;
RUN;
PROC FREQ DATA=LIB.Q_AREA;
TABLES Q_AREA;
RUN;
PROC FREQ DATA=LIB.Q_MANSIONI;
TABLES Q_MANSIONI;
RUN;
PROC FREQ DATA=LIB.Q_PROFESSIONI;
TABLES Q_PROFESSIONI;
RUN;
PROC FREQ DATA=LIB.Q_PROFESSIONI1;
TABLES Q_PROFESSIONI1;
RUN;
PROC FREQ DATA=LIB.Q_PROFESSIONI2;
TABLES Q_PROFESSIONI2;
RUN;
PROC FREQ DATA=LIB.Q_SETTORE;
TABLES Q_SETTORE;
RUN;
PROC FREQ DATA=LIB.Q_SETTORE_bis;
TABLES Q_SETTORE_bis;
RUN;
PROC FREQ DATA=LIB.Q1;
TABLES Q1;
RUN;
PROC FREQ DATA=LIB.Q1_MANSIONI;
TABLES Q1_MANSIONI;
RUN;
PROC FREQ DATA=LIB.Q1A;
TABLES Q1A;
RUN;
PROC FREQ DATA=LIB.Q1A_old;
TABLES Q1A_old;
RUN;
PROC FREQ DATA=LIB.Q1Aa;
TABLES Q1Aa;
RUN;
PROC FREQ DATA=LIB.Q1Aabis;
TABLES Q1Aabis;
RUN;
PROC FREQ DATA=LIB.Q1Ab;
TABLES Q1Ab;
RUN;
PROC FREQ DATA=LIB.Q1Abbis;
TABLES Q1Abbis;
RUN;
PROC FREQ DATA=LIB.Q1Abis;
TABLES Q1Abis;
RUN;
PROC FREQ DATA=LIB.Q1Abis1;
TABLES Q1Abis1;
RUN;
PROC FREQ DATA=LIB.Q1Abis2;
TABLES Q1Abis2;
RUN;
PROC FREQ DATA=LIB.Q1Ac;
TABLES Q1Ac;
RUN;
PROC FREQ DATA=LIB.Q1Acbis;
TABLES Q1Acbis;
RUN;
PROC FREQ DATA=LIB.Q1Ad;
TABLES Q1Ad;
RUN;
PROC FREQ DATA=LIB.Q1Adbis;
TABLES Q1Adbis;
RUN;
PROC FREQ DATA=LIB.Q1Ae;
TABLES Q1Ae;
RUN;
PROC FREQ DATA=LIB.Q1Aebis;
TABLES Q1Aebis;
RUN;
PROC FREQ DATA=LIB.Q1Af;
TABLES Q1Af;
RUN;
PROC FREQ DATA=LIB.Q1Afbis;
TABLES Q1Afbis;
RUN;
PROC FREQ DATA=LIB.Q1Ag;
TABLES Q1Ag;
RUN;
PROC FREQ DATA=LIB.Q1B;
TABLES Q1B;
RUN;
PROC FREQ DATA=LIB.Q1b1;
TABLES Q1b1;
RUN;
PROC FREQ DATA=LIB.Q1b10;
TABLES Q1b10;
RUN;
PROC FREQ DATA=LIB.Q1b10bis;
TABLES Q1b10bis;
RUN;
PROC FREQ DATA=LIB.Q1b1bis;
TABLES Q1b1bis;
RUN;
PROC FREQ DATA=LIB.Q1b2;
TABLES Q1b2;
RUN;
PROC FREQ DATA=LIB.Q1b2bis;
TABLES Q1b2bis;
RUN;
PROC FREQ DATA=LIB.Q1b3;
TABLES Q1b3;
RUN;
PROC FREQ DATA=LIB.Q1b3bis;
TABLES Q1b3bis;
RUN;
PROC FREQ DATA=LIB.Q1b4;
TABLES Q1b4;
RUN;
PROC FREQ DATA=LIB.Q1b4bis;
TABLES Q1b4bis;
RUN;
PROC FREQ DATA=LIB.Q1b5;
TABLES Q1b5;
RUN;
PROC FREQ DATA=LIB.Q1b5bis;
TABLES Q1b5bis;
RUN;
PROC FREQ DATA=LIB.Q1b6;
TABLES Q1b6;
RUN;
PROC FREQ DATA=LIB.Q1b6bis;
TABLES Q1b6bis;
RUN;
PROC FREQ DATA=LIB.Q1b7;
TABLES Q1b7;
RUN;
PROC FREQ DATA=LIB.Q1b7bis;
TABLES Q1b7bis;
RUN;
PROC FREQ DATA=LIB.Q1b8;
TABLES Q1b8;
RUN;
PROC FREQ DATA=LIB.Q1b8bis;
TABLES Q1b8bis;
RUN;
PROC FREQ DATA=LIB.Q1b9;
TABLES Q1b9;
RUN;
PROC FREQ DATA=LIB.Q1b9bis;
TABLES Q1b9bis;
RUN;
PROC FREQ DATA=LIB.Q1Ba;
TABLES Q1Ba;
RUN;
PROC FREQ DATA=LIB.Q1Babis;
TABLES Q1Babis;
RUN;
PROC FREQ DATA=LIB.Q1Bbis;
TABLES Q1Bbis;
RUN;
PROC FREQ DATA=LIB.Q1bis;
TABLES Q1bis;
RUN;
PROC FREQ DATA=LIB.Q1C;
TABLES Q1C;
RUN;
PROC FREQ DATA=LIB.Q1Ca;
TABLES Q1Ca;
RUN;
PROC FREQ DATA=LIB.Q1Cabis;
TABLES Q1Cabis;
RUN;
PROC FREQ DATA=LIB.Q1D;
TABLES Q1D;
RUN;
PROC FREQ DATA=LIB.Q1Daltro;
TABLES Q1Daltro;
RUN;
PROC FREQ DATA=LIB.Q1E;
TABLES Q1E;
RUN;
PROC FREQ DATA=LIB.Q1Ebis;
TABLES Q1Ebis;
RUN;
PROC FREQ DATA=LIB.S6;
TABLES S6;
RUN;
PROC FREQ DATA=LIB.T1;
TABLES T1;
RUN;
PROC FREQ DATA=LIB.T1A;
TABLES T1A;
RUN;
PROC FREQ DATA=LIB.T1Aal;
TABLES T1Aal;
RUN;
PROC FREQ DATA=LIB.T2;
TABLES T2;
RUN;
PROC FREQ DATA=LIB.T3;
TABLES T3;
RUN;
PROC FREQ DATA=LIB.T3A;
TABLES T3A;
RUN;
PROC FREQ DATA=LIB.T4;
TABLES T4;
RUN;
PROC FREQ DATA=LIB.T5;
TABLES T5;
RUN;
PROC FREQ DATA=LIB.T6;
TABLES T6;
RUN;
PROC FREQ DATA=LIB.T7;
TABLES T7;
RUN;
PROC TABULATE DATA=LIB.A0;
CLASS A0;
TABLES A0,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B0A;
CLASS B0A;
TABLES B0A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B0B;
CLASS B0B;
TABLES B0B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B0C;
CLASS B0C;
TABLES B0C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B1;
CLASS B1;
TABLES B1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B1A;
CLASS B1A;
TABLES B1A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B1B;
CLASS B1B;
TABLES B1B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B1C;
CLASS B1C;
TABLES B1C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B1D;
CLASS B1D;
TABLES B1D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B2A;
CLASS B2A;
TABLES B2A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B3A;
CLASS B3A;
TABLES B3A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B3B;
CLASS B3B;
TABLES B3B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B3C;
CLASS B3C;
TABLES B3C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B3D;
CLASS B3D;
TABLES B3D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B4;
CLASS B4;
TABLES B4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7;
CLASS B7;
TABLES B7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7A;
CLASS B7A;
TABLES B7A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7A1;
CLASS B7A1;
TABLES B7A1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7Abis;
CLASS B7Abis;
TABLES B7Abis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7B;
CLASS B7B;
TABLES B7B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7B1;
CLASS B7B1;
TABLES B7B1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7Bbis;
CLASS B7Bbis;
TABLES B7Bbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7C;
CLASS B7C;
TABLES B7C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7Cbis;
CLASS B7Cbis;
TABLES B7Cbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B7D;
CLASS B7D;
TABLES B7D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B8;
CLASS B8;
TABLES B8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B8_before;
CLASS B8_before;
TABLES B8_before,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B8ATT0R;
CLASS B8ATT0R;
TABLES B8ATT0R,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B8CIR;
CLASS B8CIR;
TABLES B8CIR,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.B8T0R;
CLASS B8T0R;
TABLES B8T0R,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C1;
CLASS C1;
TABLES C1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C1A;
CLASS C1A;
TABLES C1A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C1B;
CLASS C1B;
TABLES C1B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C2;
CLASS C2;
TABLES C2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C2_alt1_T2;
CLASS C2_alt1_T2;
TABLES C2_alt1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C3;
CLASS C3;
TABLES C3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C4I_alt_T2;
CLASS C4I_alt_T2;
TABLES C4I_alt_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C4I_old;
CLASS C4I_old;
TABLES C4I_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C7;
CLASS C7;
TABLES C7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C7bis_T1;
CLASS C7bis_T1;
TABLES C7bis_T1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C8_T1;
CLASS C8_T1;
TABLES C8_T1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.C9;
CLASS C9;
TABLES C9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE;
CLASS CDE;
TABLES CDE,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_A;
CLASS CDE_A;
TABLES CDE_A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_B;
CLASS CDE_B;
TABLES CDE_B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_Bbis;
CLASS CDE_Bbis;
TABLES CDE_Bbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_C;
CLASS CDE_C;
TABLES CDE_C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_cinq;
CLASS CDE_cinq;
TABLES CDE_cinq,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_D;
CLASS CDE_D;
TABLES CDE_D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_Dbis;
CLASS CDE_Dbis;
TABLES CDE_Dbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_due;
CLASS CDE_due;
TABLES CDE_due,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_quat;
CLASS CDE_quat;
TABLES CDE_quat,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE_tre;
CLASS CDE_tre;
TABLES CDE_tre,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1;
CLASS CDE1;
TABLES CDE1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_A;
CLASS CDE1_A;
TABLES CDE1_A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_B;
CLASS CDE1_B;
TABLES CDE1_B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_C;
CLASS CDE1_C;
TABLES CDE1_C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_D;
CLASS CDE1_D;
TABLES CDE1_D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_E;
CLASS CDE1_E;
TABLES CDE1_E,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_Ebis;
CLASS CDE1_Ebis;
TABLES CDE1_Ebis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_F;
CLASS CDE1_F;
TABLES CDE1_F,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_G;
CLASS CDE1_G;
TABLES CDE1_G,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_Gbis;
CLASS CDE1_Gbis;
TABLES CDE1_Gbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_Gold;
CLASS CDE1_Gold;
TABLES CDE1_Gold,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_H;
CLASS CDE1_H;
TABLES CDE1_H,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_Hbis;
CLASS CDE1_Hbis;
TABLES CDE1_Hbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_I;
CLASS CDE1_I;
TABLES CDE1_I,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE1_Ibis;
CLASS CDE1_Ibis;
TABLES CDE1_Ibis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2;
CLASS CDE2;
TABLES CDE2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_A;
CLASS CDE2_A;
TABLES CDE2_A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_ALIAS;
CLASS CDE2_ALIAS;
TABLES CDE2_ALIAS,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_B;
CLASS CDE2_B;
TABLES CDE2_B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_B1;
CLASS CDE2_B1;
TABLES CDE2_B1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_C;
CLASS CDE2_C;
TABLES CDE2_C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_D;
CLASS CDE2_D;
TABLES CDE2_D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_E;
CLASS CDE2_E;
TABLES CDE2_E,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_Ebis;
CLASS CDE2_Ebis;
TABLES CDE2_Ebis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_F;
CLASS CDE2_F;
TABLES CDE2_F,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_G;
CLASS CDE2_G;
TABLES CDE2_G,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_Gbis;
CLASS CDE2_Gbis;
TABLES CDE2_Gbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE2_I;
CLASS CDE2_I;
TABLES CDE2_I,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3;
CLASS CDE3;
TABLES CDE3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_A;
CLASS CDE3_A;
TABLES CDE3_A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_B;
CLASS CDE3_B;
TABLES CDE3_B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_C;
CLASS CDE3_C;
TABLES CDE3_C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_D;
CLASS CDE3_D;
TABLES CDE3_D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_Dbis;
CLASS CDE3_Dbis;
TABLES CDE3_Dbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_E;
CLASS CDE3_E;
TABLES CDE3_E,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_F;
CLASS CDE3_F;
TABLES CDE3_F,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_Fbis;
CLASS CDE3_Fbis;
TABLES CDE3_Fbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_Fold;
CLASS CDE3_Fold;
TABLES CDE3_Fold,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_G;
CLASS CDE3_G;
TABLES CDE3_G,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_Gbis;
CLASS CDE3_Gbis;
TABLES CDE3_Gbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_H;
CLASS CDE3_H;
TABLES CDE3_H,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDE3_Hbis;
CLASS CDE3_Hbis;
TABLES CDE3_Hbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CDL;
CLASS CDL;
TABLES CDL,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.CORSOAGR;
CLASS CORSOAGR;
TABLES CORSOAGR,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.D1A_old;
CLASS D1A_old;
TABLES D1A_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.D9;
CLASS D9;
TABLES D9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E1;
CLASS E1;
TABLES E1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E12;
CLASS E12;
TABLES E12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E12bis;
CLASS E12bis;
TABLES E12bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2;
CLASS E2;
TABLES E2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2A;
CLASS E2A;
TABLES E2A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2B;
CLASS E2B;
TABLES E2B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2C;
CLASS E2C;
TABLES E2C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2D;
CLASS E2D;
TABLES E2D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2Dbis;
CLASS E2Dbis;
TABLES E2Dbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2E;
CLASS E2E;
TABLES E2E,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2F;
CLASS E2F;
TABLES E2F,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2F_old;
CLASS E2F_old;
TABLES E2F_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2FA;
CLASS E2FA;
TABLES E2FA,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2G;
CLASS E2G;
TABLES E2G,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2Gbis;
CLASS E2Gbis;
TABLES E2Gbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2H;
CLASS E2H;
TABLES E2H,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E2Hbis;
CLASS E2Hbis;
TABLES E2Hbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E3;
CLASS E3;
TABLES E3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E3A;
CLASS E3A;
TABLES E3A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E3bis;
CLASS E3bis;
TABLES E3bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.E4;
CLASS E4;
TABLES E4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F1A;
CLASS F1A;
TABLES F1A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F1B;
CLASS F1B;
TABLES F1B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F1B_alt1_T2;
CLASS F1B_alt1_T2;
TABLES F1B_alt1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F1B_alt2_T2;
CLASS F1B_alt2_T2;
TABLES F1B_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F1B_alt3_T2;
CLASS F1B_alt3_T2;
TABLES F1B_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F1C_alt1_T2;
CLASS F1C_alt1_T2;
TABLES F1C_alt1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F1C_alt2_T2;
CLASS F1C_alt2_T2;
TABLES F1C_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F1C_alt3_T2;
CLASS F1C_alt3_T2;
TABLES F1C_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F2;
CLASS F2;
TABLES F2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F2A;
CLASS F2A;
TABLES F2A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F3;
CLASS F3;
TABLES F3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F3bis;
CLASS F3bis;
TABLES F3bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F4;
CLASS F4;
TABLES F4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.F5;
CLASS F5;
TABLES F5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.FAC;
CLASS FAC;
TABLES FAC,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.FGH6;
CLASS FGH6;
TABLES FGH6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.FGH7;
CLASS FGH7;
TABLES FGH7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.FGH8;
CLASS FGH8;
TABLES FGH8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.FGH8bis;
CLASS FGH8bis;
TABLES FGH8bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.FGHL6alt23_T2;
CLASS FGHL6alt23_T2;
TABLES FGHL6alt23_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.FGHL6x1_T2;
CLASS FGHL6x1_T2;
TABLES FGHL6x1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.FGHL6x2_T2;
CLASS FGHL6x2_T2;
TABLES FGHL6x2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.FGHL6x3_T2;
CLASS FGHL6x3_T2;
TABLES FGHL6x3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.G1;
CLASS G1;
TABLES G1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.G2;
CLASS G2;
TABLES G2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.G2bis;
CLASS G2bis;
TABLES G2bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.G3;
CLASS G3;
TABLES G3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.G3A;
CLASS G3A;
TABLES G3A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.G3B;
CLASS G3B;
TABLES G3B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.G3C;
CLASS G3C;
TABLES G3C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.G4;
CLASS G4;
TABLES G4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H1;
CLASS H1;
TABLES H1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H1bis;
CLASS H1bis;
TABLES H1bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H2;
CLASS H2;
TABLES H2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H2bis;
CLASS H2bis;
TABLES H2bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H3;
CLASS H3;
TABLES H3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H3A;
CLASS H3A;
TABLES H3A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H3Abis;
CLASS H3Abis;
TABLES H3Abis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H4;
CLASS H4;
TABLES H4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H5;
CLASS H5;
TABLES H5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H5A;
CLASS H5A;
TABLES H5A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H5Abis;
CLASS H5Abis;
TABLES H5Abis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.H5bis;
CLASS H5bis;
TABLES H5bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1;
CLASS I1;
TABLES I1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1_old;
CLASS I1_old;
TABLES I1_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1B;
CLASS I1B;
TABLES I1B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1B_alt3_T2;
CLASS I1B_alt3_T2;
TABLES I1B_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1B1;
CLASS I1B1;
TABLES I1B1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1B1B;
CLASS I1B1B;
TABLES I1B1B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1bis_T2;
CLASS I1bis_T2;
TABLES I1bis_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1C;
CLASS I1C;
TABLES I1C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1C_alt3_T2;
CLASS I1C_alt3_T2;
TABLES I1C_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1D;
CLASS I1D;
TABLES I1D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1D_alt3_T2;
CLASS I1D_alt3_T2;
TABLES I1D_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1E;
CLASS I1E;
TABLES I1E,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1E_alt3_T2;
CLASS I1E_alt3_T2;
TABLES I1E_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1F;
CLASS I1F;
TABLES I1F,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1F_alt3_T2;
CLASS I1F_alt3_T2;
TABLES I1F_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1G;
CLASS I1G;
TABLES I1G,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1G_alt3_T2;
CLASS I1G_alt3_T2;
TABLES I1G_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1H;
CLASS I1H;
TABLES I1H,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1H_alt3_T2;
CLASS I1H_alt3_T2;
TABLES I1H_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1I;
CLASS I1I;
TABLES I1I,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1I_alt3_T2;
CLASS I1I_alt3_T2;
TABLES I1I_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1J;
CLASS I1J;
TABLES I1J,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1J_alt3_T2;
CLASS I1J_alt3_T2;
TABLES I1J_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1K;
CLASS I1K;
TABLES I1K,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1K_alt3_T2;
CLASS I1K_alt3_T2;
TABLES I1K_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1L;
CLASS I1L;
TABLES I1L,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1L_alt3_T2;
CLASS I1L_alt3_T2;
TABLES I1L_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1M;
CLASS I1M;
TABLES I1M,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1M_alt3_T2;
CLASS I1M_alt3_T2;
TABLES I1M_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1N;
CLASS I1N;
TABLES I1N,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1N_alt3_T2;
CLASS I1N_alt3_T2;
TABLES I1N_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1N1bis_T2;
CLASS I1N1bis_T2;
TABLES I1N1bis_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1N2bis_T2;
CLASS I1N2bis_T2;
TABLES I1N2bis_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1N3bis_T2;
CLASS I1N3bis_T2;
TABLES I1N3bis_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1Ndue;
CLASS I1Ndue;
TABLES I1Ndue,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1Nuno;
CLASS I1Nuno;
TABLES I1Nuno,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I1P;
CLASS I1P;
TABLES I1P,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I2;
CLASS I2;
TABLES I2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.I2bis;
CLASS I2bis;
TABLES I2bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J1;
CLASS J1;
TABLES J1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J1_alt1_T2;
CLASS J1_alt1_T2;
TABLES J1_alt1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J1_alt2_T2;
CLASS J1_alt2_T2;
TABLES J1_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J1_T1;
CLASS J1_T1;
TABLES J1_T1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J10;
CLASS J10;
TABLES J10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J10_alt2_T2;
CLASS J10_alt2_T2;
TABLES J10_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J10_alt3_T2;
CLASS J10_alt3_T2;
TABLES J10_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J10Balt2_T2;
CLASS J10Balt2_T2;
TABLES J10Balt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11;
CLASS J11;
TABLES J11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A;
CLASS J11A;
TABLES J11A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1a;
CLASS J11A1a;
TABLES J11A1a,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1b;
CLASS J11A1b;
TABLES J11A1b,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1c;
CLASS J11A1c;
TABLES J11A1c,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1d;
CLASS J11A1d;
TABLES J11A1d,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1e;
CLASS J11A1e;
TABLES J11A1e,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1f;
CLASS J11A1f;
TABLES J11A1f,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1g;
CLASS J11A1g;
TABLES J11A1g,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1h;
CLASS J11A1h;
TABLES J11A1h,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1i;
CLASS J11A1i;
TABLES J11A1i,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1l;
CLASS J11A1l;
TABLES J11A1l,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11A1m;
CLASS J11A1m;
TABLES J11A1m,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J11Abis;
CLASS J11Abis;
TABLES J11Abis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J12;
CLASS J12;
TABLES J12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J13;
CLASS J13;
TABLES J13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J13_alt1_T2;
CLASS J13_alt1_T2;
TABLES J13_alt1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J13_alt2_T2;
CLASS J13_alt2_T2;
TABLES J13_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J13_T1;
CLASS J13_T1;
TABLES J13_T1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J13Balt2_T2;
CLASS J13Balt2_T2;
TABLES J13Balt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J14;
CLASS J14;
TABLES J14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J14_T1;
CLASS J14_T1;
TABLES J14_T1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J1B_alt2_T2;
CLASS J1B_alt2_T2;
TABLES J1B_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J2;
CLASS J2;
TABLES J2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J2_alt2_T2;
CLASS J2_alt2_T2;
TABLES J2_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J2_alt3_T2;
CLASS J2_alt3_T2;
TABLES J2_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J22;
CLASS J22;
TABLES J22,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J22bis;
CLASS J22bis;
TABLES J22bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J2A;
CLASS J2A;
TABLES J2A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J2B_alt2_T2;
CLASS J2B_alt2_T2;
TABLES J2B_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J3;
CLASS J3;
TABLES J3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J3_alt2_T2;
CLASS J3_alt2_T2;
TABLES J3_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J3_alt3_T2;
CLASS J3_alt3_T2;
TABLES J3_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J3B_alt2_T2;
CLASS J3B_alt2_T2;
TABLES J3B_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J4;
CLASS J4;
TABLES J4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J5;
CLASS J5;
TABLES J5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6;
CLASS J6;
TABLES J6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6_alt1_T2;
CLASS J6_alt1_T2;
TABLES J6_alt1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6_alt2_T2;
CLASS J6_alt2_T2;
TABLES J6_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6_T1;
CLASS J6_T1;
TABLES J6_T1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6A1;
CLASS J6A1;
TABLES J6A1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6A1_old;
CLASS J6A1_old;
TABLES J6A1_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6A1al;
CLASS J6A1al;
TABLES J6A1al,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6Adue;
CLASS J6Adue;
TABLES J6Adue,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6Atre;
CLASS J6Atre;
TABLES J6Atre,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6Auno;
CLASS J6Auno;
TABLES J6Auno,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J6B_alt2_T2;
CLASS J6B_alt2_T2;
TABLES J6B_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7;
CLASS J7;
TABLES J7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7_alt1_T2;
CLASS J7_alt1_T2;
TABLES J7_alt1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7_alt2_T2;
CLASS J7_alt2_T2;
TABLES J7_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A1a;
CLASS J7A1a;
TABLES J7A1a,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A1b;
CLASS J7A1b;
TABLES J7A1b,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A1c;
CLASS J7A1c;
TABLES J7A1c,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A1d;
CLASS J7A1d;
TABLES J7A1d,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A2a;
CLASS J7A2a;
TABLES J7A2a,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A2b;
CLASS J7A2b;
TABLES J7A2b,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A2c;
CLASS J7A2c;
TABLES J7A2c,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A2d;
CLASS J7A2d;
TABLES J7A2d,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A2e;
CLASS J7A2e;
TABLES J7A2e,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A2f;
CLASS J7A2f;
TABLES J7A2f,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A3;
CLASS J7A3;
TABLES J7A3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A3_old;
CLASS J7A3_old;
TABLES J7A3_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A3al;
CLASS J7A3al;
TABLES J7A3al,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A4_civile;
CLASS J7A4_civile;
TABLES J7A4_civile,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A4_ind;
CLASS J7A4_ind;
TABLES J7A4_ind,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A4_inf;
CLASS J7A4_inf;
TABLES J7A4_inf,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A4a;
CLASS J7A4a;
TABLES J7A4a,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A4b;
CLASS J7A4b;
TABLES J7A4b,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A4c;
CLASS J7A4c;
TABLES J7A4c,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A4d;
CLASS J7A4d;
TABLES J7A4d,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5a;
CLASS J7A5a;
TABLES J7A5a,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5b;
CLASS J7A5b;
TABLES J7A5b,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5c;
CLASS J7A5c;
TABLES J7A5c,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5d;
CLASS J7A5d;
TABLES J7A5d,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5e;
CLASS J7A5e;
TABLES J7A5e,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5f;
CLASS J7A5f;
TABLES J7A5f,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5g;
CLASS J7A5g;
TABLES J7A5g,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5h;
CLASS J7A5h;
TABLES J7A5h,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5i;
CLASS J7A5i;
TABLES J7A5i,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5l;
CLASS J7A5l;
TABLES J7A5l,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5m;
CLASS J7A5m;
TABLES J7A5m,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5n;
CLASS J7A5n;
TABLES J7A5n,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7A5o;
CLASS J7A5o;
TABLES J7A5o,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7B;
CLASS J7B;
TABLES J7B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J7B_alt2_T2;
CLASS J7B_alt2_T2;
TABLES J7B_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J8;
CLASS J8;
TABLES J8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J8_alt1_T2;
CLASS J8_alt1_T2;
TABLES J8_alt1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J8_alt2_T2;
CLASS J8_alt2_T2;
TABLES J8_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J8B_alt2_T2;
CLASS J8B_alt2_T2;
TABLES J8B_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J9;
CLASS J9;
TABLES J9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J9_alt2_T2;
CLASS J9_alt2_T2;
TABLES J9_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J9_alt3_T2;
CLASS J9_alt3_T2;
TABLES J9_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.J9B_alt2_T2;
CLASS J9B_alt2_T2;
TABLES J9B_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.JA9;
CLASS JA9;
TABLES JA9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.JA9bis;
CLASS JA9bis;
TABLES JA9bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K0;
CLASS K0;
TABLES K0,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K1;
CLASS K1;
TABLES K1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K1_alt1_T2;
CLASS K1_alt1_T2;
TABLES K1_alt1_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K1_alt2_T2;
CLASS K1_alt2_T2;
TABLES K1_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K10AJ20A;
CLASS K10AJ20A;
TABLES K10AJ20A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K10J20;
CLASS K10J20;
TABLES K10J20,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K11J21;
CLASS K11J21;
TABLES K11J21,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K11J21_T1;
CLASS K11J21_T1;
TABLES K11J21_T1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K1B_T2;
CLASS K1B_T2;
TABLES K1B_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K2;
CLASS K2;
TABLES K2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K3;
CLASS K3;
TABLES K3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K4;
CLASS K4;
TABLES K4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K5J15;
CLASS K5J15;
TABLES K5J15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K5J15_pre_T2;
CLASS K5J15_pre_T2;
TABLES K5J15_pre_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K5J15_T0;
CLASS K5J15_T0;
TABLES K5J15_T0,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K6J16;
CLASS K6J16;
TABLES K6J16,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K7AJ17A;
CLASS K7AJ17A;
TABLES K7AJ17A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K7J17;
CLASS K7J17;
TABLES K7J17,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K8AJ18A;
CLASS K8AJ18A;
TABLES K8AJ18A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K8J18;
CLASS K8J18;
TABLES K8J18,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K9AJ19A;
CLASS K9AJ19A;
TABLES K9AJ19A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.K9J19;
CLASS K9J19;
TABLES K9J19,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L1;
CLASS L1;
TABLES L1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L1altro;
CLASS L1altro;
TABLES L1altro,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L2;
CLASS L2;
TABLES L2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L2bis;
CLASS L2bis;
TABLES L2bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L3;
CLASS L3;
TABLES L3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L3A;
CLASS L3A;
TABLES L3A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L3B;
CLASS L3B;
TABLES L3B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L3C;
CLASS L3C;
TABLES L3C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L4;
CLASS L4;
TABLES L4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L4A;
CLASS L4A;
TABLES L4A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L4Abis;
CLASS L4Abis;
TABLES L4Abis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.L5;
CLASS L5;
TABLES L5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.LD;
CLASS LD;
TABLES LD,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M1;
CLASS M1;
TABLES M1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M1A;
CLASS M1A;
TABLES M1A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M1Abis;
CLASS M1Abis;
TABLES M1Abis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M1B;
CLASS M1B;
TABLES M1B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M1Bdue;
CLASS M1Bdue;
TABLES M1Bdue,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M1Buno;
CLASS M1Buno;
TABLES M1Buno,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M3a;
CLASS M3a;
TABLES M3a,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M3b;
CLASS M3b;
TABLES M3b,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M3bA;
CLASS M3bA;
TABLES M3bA,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M3c;
CLASS M3c;
TABLES M3c,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.M3c1;
CLASS M3c1;
TABLES M3c1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1A;
CLASS N1A;
TABLES N1A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Ano;
CLASS N1Ano;
TABLES N1Ano,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1B;
CLASS N1B;
TABLES N1B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1B_old;
CLASS N1B_old;
TABLES N1B_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Bbis;
CLASS N1Bbis;
TABLES N1Bbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1C;
CLASS N1C;
TABLES N1C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Cbis;
CLASS N1Cbis;
TABLES N1Cbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1D;
CLASS N1D;
TABLES N1D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1D1;
CLASS N1D1;
TABLES N1D1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1E;
CLASS N1E;
TABLES N1E,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1F;
CLASS N1F;
TABLES N1F,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1F1;
CLASS N1F1;
TABLES N1F1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Fdue;
CLASS N1Fdue;
TABLES N1Fdue,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Funo;
CLASS N1Funo;
TABLES N1Funo,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1G;
CLASS N1G;
TABLES N1G,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Gbis;
CLASS N1Gbis;
TABLES N1Gbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1H;
CLASS N1H;
TABLES N1H,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1H_alt2_T2;
CLASS N1H_alt2_T2;
TABLES N1H_alt2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1H_alt3_T2;
CLASS N1H_alt3_T2;
TABLES N1H_alt3_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1H1;
CLASS N1H1;
TABLES N1H1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Hbis_T2;
CLASS N1Hbis_T2;
TABLES N1Hbis_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Hbis2_T2;
CLASS N1Hbis2_T2;
TABLES N1Hbis2_T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1I;
CLASS N1I;
TABLES N1I,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1I_old;
CLASS N1I_old;
TABLES N1I_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Ialtro;
CLASS N1Ialtro;
TABLES N1Ialtro,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1J;
CLASS N1J;
TABLES N1J,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1K;
CLASS N1K;
TABLES N1K,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Kdue;
CLASS N1Kdue;
TABLES N1Kdue,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1Kuno;
CLASS N1Kuno;
TABLES N1Kuno,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1L;
CLASS N1L;
TABLES N1L,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1LA;
CLASS N1LA;
TABLES N1LA,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1M;
CLASS N1M;
TABLES N1M,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1M_1;
CLASS N1M_1;
TABLES N1M_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1M1;
CLASS N1M1;
TABLES N1M1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1MA;
CLASS N1MA;
TABLES N1MA,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N1N;
CLASS N1N;
TABLES N1N,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N2;
CLASS N2;
TABLES N2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N2A;
CLASS N2A;
TABLES N2A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N2A_old;
CLASS N2A_old;
TABLES N2A_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N2Aaltro;
CLASS N2Aaltro;
TABLES N2Aaltro,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N2B;
CLASS N2B;
TABLES N2B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N2Bbis;
CLASS N2Bbis;
TABLES N2Bbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N2C;
CLASS N2C;
TABLES N2C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N2D;
CLASS N2D;
TABLES N2D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N3;
CLASS N3;
TABLES N3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N3A;
CLASS N3A;
TABLES N3A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N3Abis;
CLASS N3Abis;
TABLES N3Abis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N3B;
CLASS N3B;
TABLES N3B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N3Bbis;
CLASS N3Bbis;
TABLES N3Bbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N3C;
CLASS N3C;
TABLES N3C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N4;
CLASS N4;
TABLES N4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N4A;
CLASS N4A;
TABLES N4A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N4bis;
CLASS N4bis;
TABLES N4bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N5;
CLASS N5;
TABLES N5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N5_1;
CLASS N5_1;
TABLES N5_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N5_2;
CLASS N5_2;
TABLES N5_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N5A;
CLASS N5A;
TABLES N5A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N5A1;
CLASS N5A1;
TABLES N5A1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.N5A2;
CLASS N5A2;
TABLES N5A2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Notes;
CLASS Notes;
TABLES Notes,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1;
CLASS P1;
TABLES P1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1A;
CLASS P1A;
TABLES P1A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Aa;
CLASS P1Aa;
TABLES P1Aa,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_1;
CLASS P1Agr_1;
TABLES P1Agr_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_10;
CLASS P1Agr_10;
TABLES P1Agr_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_11;
CLASS P1Agr_11;
TABLES P1Agr_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_12;
CLASS P1Agr_12;
TABLES P1Agr_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_13;
CLASS P1Agr_13;
TABLES P1Agr_13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_14;
CLASS P1Agr_14;
TABLES P1Agr_14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_15;
CLASS P1Agr_15;
TABLES P1Agr_15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_2;
CLASS P1Agr_2;
TABLES P1Agr_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_3;
CLASS P1Agr_3;
TABLES P1Agr_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_4;
CLASS P1Agr_4;
TABLES P1Agr_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_5;
CLASS P1Agr_5;
TABLES P1Agr_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_6;
CLASS P1Agr_6;
TABLES P1Agr_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_7;
CLASS P1Agr_7;
TABLES P1Agr_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_8;
CLASS P1Agr_8;
TABLES P1Agr_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Agr_9;
CLASS P1Agr_9;
TABLES P1Agr_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1comp_mancanti;
CLASS P1comp_mancanti;
TABLES P1comp_mancanti,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1comp_mancanti1;
CLASS P1comp_mancanti1;
TABLES P1comp_mancanti1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1E;
CLASS P1E;
TABLES P1E,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ebis;
CLASS P1Ebis;
TABLES P1Ebis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_1;
CLASS P1Ec_1;
TABLES P1Ec_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_10;
CLASS P1Ec_10;
TABLES P1Ec_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_11;
CLASS P1Ec_11;
TABLES P1Ec_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_12;
CLASS P1Ec_12;
TABLES P1Ec_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_13;
CLASS P1Ec_13;
TABLES P1Ec_13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_14;
CLASS P1Ec_14;
TABLES P1Ec_14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_15;
CLASS P1Ec_15;
TABLES P1Ec_15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_16;
CLASS P1Ec_16;
TABLES P1Ec_16,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_17;
CLASS P1Ec_17;
TABLES P1Ec_17,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_18;
CLASS P1Ec_18;
TABLES P1Ec_18,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_19;
CLASS P1Ec_19;
TABLES P1Ec_19,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_2;
CLASS P1Ec_2;
TABLES P1Ec_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_20;
CLASS P1Ec_20;
TABLES P1Ec_20,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_21;
CLASS P1Ec_21;
TABLES P1Ec_21,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_3;
CLASS P1Ec_3;
TABLES P1Ec_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_4;
CLASS P1Ec_4;
TABLES P1Ec_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_5;
CLASS P1Ec_5;
TABLES P1Ec_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_6;
CLASS P1Ec_6;
TABLES P1Ec_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_7;
CLASS P1Ec_7;
TABLES P1Ec_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_8;
CLASS P1Ec_8;
TABLES P1Ec_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ec_9;
CLASS P1Ec_9;
TABLES P1Ec_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1F;
CLASS P1F;
TABLES P1F,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_1;
CLASS P1Farm_1;
TABLES P1Farm_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_10;
CLASS P1Farm_10;
TABLES P1Farm_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_11;
CLASS P1Farm_11;
TABLES P1Farm_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_12;
CLASS P1Farm_12;
TABLES P1Farm_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_2;
CLASS P1Farm_2;
TABLES P1Farm_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_3;
CLASS P1Farm_3;
TABLES P1Farm_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_4;
CLASS P1Farm_4;
TABLES P1Farm_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_5;
CLASS P1Farm_5;
TABLES P1Farm_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_6;
CLASS P1Farm_6;
TABLES P1Farm_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_7;
CLASS P1Farm_7;
TABLES P1Farm_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_8;
CLASS P1Farm_8;
TABLES P1Farm_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Farm_9;
CLASS P1Farm_9;
TABLES P1Farm_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Fbis;
CLASS P1Fbis;
TABLES P1Fbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1G;
CLASS P1G;
TABLES P1G,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Gbis;
CLASS P1Gbis;
TABLES P1Gbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_1;
CLASS P1GR_1;
TABLES P1GR_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_10;
CLASS P1GR_10;
TABLES P1GR_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_11;
CLASS P1GR_11;
TABLES P1GR_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_12;
CLASS P1GR_12;
TABLES P1GR_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_13;
CLASS P1GR_13;
TABLES P1GR_13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_14;
CLASS P1GR_14;
TABLES P1GR_14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_15;
CLASS P1GR_15;
TABLES P1GR_15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_16;
CLASS P1GR_16;
TABLES P1GR_16,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_17;
CLASS P1GR_17;
TABLES P1GR_17,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_18;
CLASS P1GR_18;
TABLES P1GR_18,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_2;
CLASS P1GR_2;
TABLES P1GR_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_3;
CLASS P1GR_3;
TABLES P1GR_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_4;
CLASS P1GR_4;
TABLES P1GR_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_5;
CLASS P1GR_5;
TABLES P1GR_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_6;
CLASS P1GR_6;
TABLES P1GR_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_7;
CLASS P1GR_7;
TABLES P1GR_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_8;
CLASS P1GR_8;
TABLES P1GR_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1GR_9;
CLASS P1GR_9;
TABLES P1GR_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1I;
CLASS P1I;
TABLES P1I,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ibis;
CLASS P1Ibis;
TABLES P1Ibis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_1;
CLASS P1Ing_1;
TABLES P1Ing_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_10;
CLASS P1Ing_10;
TABLES P1Ing_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_11;
CLASS P1Ing_11;
TABLES P1Ing_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_12;
CLASS P1Ing_12;
TABLES P1Ing_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_13;
CLASS P1Ing_13;
TABLES P1Ing_13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_14;
CLASS P1Ing_14;
TABLES P1Ing_14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_15;
CLASS P1Ing_15;
TABLES P1Ing_15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_16;
CLASS P1Ing_16;
TABLES P1Ing_16,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_2;
CLASS P1Ing_2;
TABLES P1Ing_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_3;
CLASS P1Ing_3;
TABLES P1Ing_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_4;
CLASS P1Ing_4;
TABLES P1Ing_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_5;
CLASS P1Ing_5;
TABLES P1Ing_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_6;
CLASS P1Ing_6;
TABLES P1Ing_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_7;
CLASS P1Ing_7;
TABLES P1Ing_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_8;
CLASS P1Ing_8;
TABLES P1Ing_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ing_9;
CLASS P1Ing_9;
TABLES P1Ing_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_1;
CLASS P1Lett_1;
TABLES P1Lett_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_10;
CLASS P1Lett_10;
TABLES P1Lett_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_11;
CLASS P1Lett_11;
TABLES P1Lett_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_2;
CLASS P1Lett_2;
TABLES P1Lett_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_3;
CLASS P1Lett_3;
TABLES P1Lett_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_4;
CLASS P1Lett_4;
TABLES P1Lett_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_5;
CLASS P1Lett_5;
TABLES P1Lett_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_6;
CLASS P1Lett_6;
TABLES P1Lett_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_7;
CLASS P1Lett_7;
TABLES P1Lett_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_8;
CLASS P1Lett_8;
TABLES P1Lett_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Lett_9;
CLASS P1Lett_9;
TABLES P1Lett_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1P;
CLASS P1P;
TABLES P1P,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Pbis;
CLASS P1Pbis;
TABLES P1Pbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_1;
CLASS P1Psico_1;
TABLES P1Psico_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_10;
CLASS P1Psico_10;
TABLES P1Psico_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_11;
CLASS P1Psico_11;
TABLES P1Psico_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_12;
CLASS P1Psico_12;
TABLES P1Psico_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_13;
CLASS P1Psico_13;
TABLES P1Psico_13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_14;
CLASS P1Psico_14;
TABLES P1Psico_14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_15;
CLASS P1Psico_15;
TABLES P1Psico_15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_16;
CLASS P1Psico_16;
TABLES P1Psico_16,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_17;
CLASS P1Psico_17;
TABLES P1Psico_17,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_18;
CLASS P1Psico_18;
TABLES P1Psico_18,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_19;
CLASS P1Psico_19;
TABLES P1Psico_19,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_2;
CLASS P1Psico_2;
TABLES P1Psico_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_20;
CLASS P1Psico_20;
TABLES P1Psico_20,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_3;
CLASS P1Psico_3;
TABLES P1Psico_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_4;
CLASS P1Psico_4;
TABLES P1Psico_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_5;
CLASS P1Psico_5;
TABLES P1Psico_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_6;
CLASS P1Psico_6;
TABLES P1Psico_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_7;
CLASS P1Psico_7;
TABLES P1Psico_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_8;
CLASS P1Psico_8;
TABLES P1Psico_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Psico_9;
CLASS P1Psico_9;
TABLES P1Psico_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sa;
CLASS P1Sa;
TABLES P1Sa,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sb;
CLASS P1Sb;
TABLES P1Sb,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sc;
CLASS P1Sc;
TABLES P1Sc,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sd;
CLASS P1Sd;
TABLES P1Sd,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Se;
CLASS P1Se;
TABLES P1Se,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sf;
CLASS P1Sf;
TABLES P1Sf,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_1;
CLASS P1SF_1;
TABLES P1SF_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_10;
CLASS P1SF_10;
TABLES P1SF_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_11;
CLASS P1SF_11;
TABLES P1SF_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_12;
CLASS P1SF_12;
TABLES P1SF_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_13;
CLASS P1SF_13;
TABLES P1SF_13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_14;
CLASS P1SF_14;
TABLES P1SF_14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_15;
CLASS P1SF_15;
TABLES P1SF_15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_16;
CLASS P1SF_16;
TABLES P1SF_16,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_17;
CLASS P1SF_17;
TABLES P1SF_17,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_18;
CLASS P1SF_18;
TABLES P1SF_18,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_19;
CLASS P1SF_19;
TABLES P1SF_19,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_2;
CLASS P1SF_2;
TABLES P1SF_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_20;
CLASS P1SF_20;
TABLES P1SF_20,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_21;
CLASS P1SF_21;
TABLES P1SF_21,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_3;
CLASS P1SF_3;
TABLES P1SF_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_4;
CLASS P1SF_4;
TABLES P1SF_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_5;
CLASS P1SF_5;
TABLES P1SF_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_6;
CLASS P1SF_6;
TABLES P1SF_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_7;
CLASS P1SF_7;
TABLES P1SF_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_8;
CLASS P1SF_8;
TABLES P1SF_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SF_9;
CLASS P1SF_9;
TABLES P1SF_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sg;
CLASS P1Sg;
TABLES P1Sg,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sh;
CLASS P1Sh;
TABLES P1Sh,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Si;
CLASS P1Si;
TABLES P1Si,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sl;
CLASS P1Sl;
TABLES P1Sl,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sm;
CLASS P1Sm;
TABLES P1Sm,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_1;
CLASS P1SM_1;
TABLES P1SM_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_10;
CLASS P1SM_10;
TABLES P1SM_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_11;
CLASS P1SM_11;
TABLES P1SM_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_12;
CLASS P1SM_12;
TABLES P1SM_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_13;
CLASS P1SM_13;
TABLES P1SM_13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_14;
CLASS P1SM_14;
TABLES P1SM_14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_15;
CLASS P1SM_15;
TABLES P1SM_15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_2;
CLASS P1SM_2;
TABLES P1SM_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_3;
CLASS P1SM_3;
TABLES P1SM_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_4;
CLASS P1SM_4;
TABLES P1SM_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_5;
CLASS P1SM_5;
TABLES P1SM_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_6;
CLASS P1SM_6;
TABLES P1SM_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_7;
CLASS P1SM_7;
TABLES P1SM_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_8;
CLASS P1SM_8;
TABLES P1SM_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SM_9;
CLASS P1SM_9;
TABLES P1SM_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sn;
CLASS P1Sn;
TABLES P1Sn,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1So;
CLASS P1So;
TABLES P1So,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sp;
CLASS P1Sp;
TABLES P1Sp,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_1;
CLASS P1SP_1;
TABLES P1SP_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_10;
CLASS P1SP_10;
TABLES P1SP_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_11;
CLASS P1SP_11;
TABLES P1SP_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_12;
CLASS P1SP_12;
TABLES P1SP_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_13;
CLASS P1SP_13;
TABLES P1SP_13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_14;
CLASS P1SP_14;
TABLES P1SP_14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_15;
CLASS P1SP_15;
TABLES P1SP_15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_16;
CLASS P1SP_16;
TABLES P1SP_16,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_17;
CLASS P1SP_17;
TABLES P1SP_17,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_2;
CLASS P1SP_2;
TABLES P1SP_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_3;
CLASS P1SP_3;
TABLES P1SP_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_4;
CLASS P1SP_4;
TABLES P1SP_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_5;
CLASS P1SP_5;
TABLES P1SP_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_6;
CLASS P1SP_6;
TABLES P1SP_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_7;
CLASS P1SP_7;
TABLES P1SP_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_8;
CLASS P1SP_8;
TABLES P1SP_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SP_9;
CLASS P1SP_9;
TABLES P1SP_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sq;
CLASS P1Sq;
TABLES P1Sq,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sr;
CLASS P1Sr;
TABLES P1Sr,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Ss;
CLASS P1Ss;
TABLES P1Ss,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_1;
CLASS P1SS_1;
TABLES P1SS_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_10;
CLASS P1SS_10;
TABLES P1SS_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_11;
CLASS P1SS_11;
TABLES P1SS_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_12;
CLASS P1SS_12;
TABLES P1SS_12,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_13;
CLASS P1SS_13;
TABLES P1SS_13,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_14;
CLASS P1SS_14;
TABLES P1SS_14,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_15;
CLASS P1SS_15;
TABLES P1SS_15,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_16;
CLASS P1SS_16;
TABLES P1SS_16,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_17;
CLASS P1SS_17;
TABLES P1SS_17,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_18;
CLASS P1SS_18;
TABLES P1SS_18,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_19;
CLASS P1SS_19;
TABLES P1SS_19,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_2;
CLASS P1SS_2;
TABLES P1SS_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_3;
CLASS P1SS_3;
TABLES P1SS_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_4;
CLASS P1SS_4;
TABLES P1SS_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_5;
CLASS P1SS_5;
TABLES P1SS_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_6;
CLASS P1SS_6;
TABLES P1SS_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_7;
CLASS P1SS_7;
TABLES P1SS_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_8;
CLASS P1SS_8;
TABLES P1SS_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1SS_9;
CLASS P1SS_9;
TABLES P1SS_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1St;
CLASS P1St;
TABLES P1St,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Su;
CLASS P1Su;
TABLES P1Su,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sv;
CLASS P1Sv;
TABLES P1Sv,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sw;
CLASS P1Sw;
TABLES P1Sw,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sy;
CLASS P1Sy;
TABLES P1Sy,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Sz;
CLASS P1Sz;
TABLES P1Sz,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1T;
CLASS P1T;
TABLES P1T,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Tbis;
CLASS P1Tbis;
TABLES P1Tbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_1;
CLASS P1Veter_1;
TABLES P1Veter_1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_10;
CLASS P1Veter_10;
TABLES P1Veter_10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_11;
CLASS P1Veter_11;
TABLES P1Veter_11,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_2;
CLASS P1Veter_2;
TABLES P1Veter_2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_3;
CLASS P1Veter_3;
TABLES P1Veter_3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_4;
CLASS P1Veter_4;
TABLES P1Veter_4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_5;
CLASS P1Veter_5;
TABLES P1Veter_5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_6;
CLASS P1Veter_6;
TABLES P1Veter_6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_7;
CLASS P1Veter_7;
TABLES P1Veter_7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_8;
CLASS P1Veter_8;
TABLES P1Veter_8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P1Veter_9;
CLASS P1Veter_9;
TABLES P1Veter_9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2a;
CLASS P2a;
TABLES P2a,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2abis;
CLASS P2abis;
TABLES P2abis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2altro;
CLASS P2altro;
TABLES P2altro,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2b;
CLASS P2b;
TABLES P2b,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2bbis;
CLASS P2bbis;
TABLES P2bbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2c;
CLASS P2c;
TABLES P2c,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2cbis;
CLASS P2cbis;
TABLES P2cbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2d;
CLASS P2d;
TABLES P2d,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2dbis;
CLASS P2dbis;
TABLES P2dbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2e;
CLASS P2e;
TABLES P2e,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2ebis;
CLASS P2ebis;
TABLES P2ebis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2f;
CLASS P2f;
TABLES P2f,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2fbis;
CLASS P2fbis;
TABLES P2fbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2g;
CLASS P2g;
TABLES P2g,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.P2gbis;
CLASS P2gbis;
TABLES P2gbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q_AREA;
CLASS Q_AREA;
TABLES Q_AREA,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q_MANSIONI;
CLASS Q_MANSIONI;
TABLES Q_MANSIONI,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q_PROFESSIONI;
CLASS Q_PROFESSIONI;
TABLES Q_PROFESSIONI,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q_PROFESSIONI1;
CLASS Q_PROFESSIONI1;
TABLES Q_PROFESSIONI1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q_PROFESSIONI2;
CLASS Q_PROFESSIONI2;
TABLES Q_PROFESSIONI2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q_SETTORE;
CLASS Q_SETTORE;
TABLES Q_SETTORE,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q_SETTORE_bis;
CLASS Q_SETTORE_bis;
TABLES Q_SETTORE_bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1;
CLASS Q1;
TABLES Q1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1_MANSIONI;
CLASS Q1_MANSIONI;
TABLES Q1_MANSIONI,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1A;
CLASS Q1A;
TABLES Q1A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1A_old;
CLASS Q1A_old;
TABLES Q1A_old,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Aa;
CLASS Q1Aa;
TABLES Q1Aa,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Aabis;
CLASS Q1Aabis;
TABLES Q1Aabis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Ab;
CLASS Q1Ab;
TABLES Q1Ab,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Abbis;
CLASS Q1Abbis;
TABLES Q1Abbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Abis;
CLASS Q1Abis;
TABLES Q1Abis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Abis1;
CLASS Q1Abis1;
TABLES Q1Abis1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Abis2;
CLASS Q1Abis2;
TABLES Q1Abis2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Ac;
CLASS Q1Ac;
TABLES Q1Ac,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Acbis;
CLASS Q1Acbis;
TABLES Q1Acbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Ad;
CLASS Q1Ad;
TABLES Q1Ad,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Adbis;
CLASS Q1Adbis;
TABLES Q1Adbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Ae;
CLASS Q1Ae;
TABLES Q1Ae,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Aebis;
CLASS Q1Aebis;
TABLES Q1Aebis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Af;
CLASS Q1Af;
TABLES Q1Af,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Afbis;
CLASS Q1Afbis;
TABLES Q1Afbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Ag;
CLASS Q1Ag;
TABLES Q1Ag,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1B;
CLASS Q1B;
TABLES Q1B,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b1;
CLASS Q1b1;
TABLES Q1b1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b10;
CLASS Q1b10;
TABLES Q1b10,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b10bis;
CLASS Q1b10bis;
TABLES Q1b10bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b1bis;
CLASS Q1b1bis;
TABLES Q1b1bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b2;
CLASS Q1b2;
TABLES Q1b2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b2bis;
CLASS Q1b2bis;
TABLES Q1b2bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b3;
CLASS Q1b3;
TABLES Q1b3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b3bis;
CLASS Q1b3bis;
TABLES Q1b3bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b4;
CLASS Q1b4;
TABLES Q1b4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b4bis;
CLASS Q1b4bis;
TABLES Q1b4bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b5;
CLASS Q1b5;
TABLES Q1b5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b5bis;
CLASS Q1b5bis;
TABLES Q1b5bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b6;
CLASS Q1b6;
TABLES Q1b6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b6bis;
CLASS Q1b6bis;
TABLES Q1b6bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b7;
CLASS Q1b7;
TABLES Q1b7,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b7bis;
CLASS Q1b7bis;
TABLES Q1b7bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b8;
CLASS Q1b8;
TABLES Q1b8,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b8bis;
CLASS Q1b8bis;
TABLES Q1b8bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b9;
CLASS Q1b9;
TABLES Q1b9,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1b9bis;
CLASS Q1b9bis;
TABLES Q1b9bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Ba;
CLASS Q1Ba;
TABLES Q1Ba,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Babis;
CLASS Q1Babis;
TABLES Q1Babis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Bbis;
CLASS Q1Bbis;
TABLES Q1Bbis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1bis;
CLASS Q1bis;
TABLES Q1bis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1C;
CLASS Q1C;
TABLES Q1C,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Ca;
CLASS Q1Ca;
TABLES Q1Ca,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Cabis;
CLASS Q1Cabis;
TABLES Q1Cabis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1D;
CLASS Q1D;
TABLES Q1D,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Daltro;
CLASS Q1Daltro;
TABLES Q1Daltro,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1E;
CLASS Q1E;
TABLES Q1E,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.Q1Ebis;
CLASS Q1Ebis;
TABLES Q1Ebis,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.S6;
CLASS S6;
TABLES S6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T1;
CLASS T1;
TABLES T1,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T1A;
CLASS T1A;
TABLES T1A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T1Aal;
CLASS T1Aal;
TABLES T1Aal,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T2;
CLASS T2;
TABLES T2,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T3;
CLASS T3;
TABLES T3,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T3A;
CLASS T3A;
TABLES T3A,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T4;
CLASS T4;
TABLES T4,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T5;
CLASS T5;
TABLES T5,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T6;
CLASS T6;
TABLES T6,(N PCTN);
RUN;
PROC TABULATE DATA=LIB.T7;
CLASS T7;
TABLES T7,(N PCTN);
RUN;
/*--- Costruire il Join temporaneo dei soli dataset necessari per la specifica analisi da effettuare ---
DATA Join;
MERGE  LIB.A0 LIB.B0A LIB.B0B LIB.B0C LIB.B1 LIB.B1A LIB.B1B LIB.B1C LIB.B1D LIB.B2A LIB.B3A LIB.B3B LIB.B3C LIB.B3D LIB.B4 LIB.B7 LIB.B7A LIB.B7A1 LIB.B7Abis LIB.B7B LIB.B7B1 LIB.B7Bbis LIB.B7C LIB.B7Cbis LIB.B7D LIB.B8 LIB.B8_before LIB.B8ATT0R LIB.B8CIR LIB.B8T0R LIB.C1 LIB.C1A LIB.C1B LIB.C2 LIB.C2_alt1_T2 LIB.C3 LIB.C4I_alt_T2 LIB.C4I_old LIB.C7 LIB.C7bis_T1 LIB.C8_T1 LIB.C9 LIB.CDE LIB.CDE_A LIB.CDE_B LIB.CDE_Bbis LIB.CDE_C LIB.CDE_cinq LIB.CDE_D LIB.CDE_D_MCOLS LIB.CDE_Dbis LIB.CDE_due LIB.CDE_quat LIB.CDE_tre LIB.CDE1 LIB.CDE1_A LIB.CDE1_B LIB.CDE1_C LIB.CDE1_D LIB.CDE1_E LIB.CDE1_Ebis LIB.CDE1_F LIB.CDE1_G LIB.CDE1_Gbis LIB.CDE1_Gold LIB.CDE1_H LIB.CDE1_Hbis LIB.CDE1_I LIB.CDE1_Ibis LIB.CDE2 LIB.CDE2_A LIB.CDE2_ALIAS LIB.CDE2_B LIB.CDE2_B1 LIB.CDE2_C LIB.CDE2_D LIB.CDE2_E LIB.CDE2_Ebis LIB.CDE2_F LIB.CDE2_G LIB.CDE2_Gbis LIB.CDE2_I LIB.CDE3 LIB.CDE3_A LIB.CDE3_B LIB.CDE3_C LIB.CDE3_D LIB.CDE3_Dbis LIB.CDE3_E LIB.CDE3_F LIB.CDE3_Fbis LIB.CDE3_Fold LIB.CDE3_G LIB.CDE3_Gbis LIB.CDE3_H LIB.CDE3_Hbis LIB.CDL LIB.CORSOAGR LIB.D1A_old LIB.D9 LIB.E1 LIB.E12 LIB.E12_MCOLS LIB.E12bis LIB.E2 LIB.E2A LIB.E2B LIB.E2C LIB.E2D LIB.E2Dbis LIB.E2E LIB.E2F LIB.E2F_old LIB.E2FA LIB.E2G LIB.E2Gbis LIB.E2H LIB.E2Hbis LIB.E3 LIB.E3_MCOLS LIB.E3A LIB.E3bis LIB.E4 LIB.F1A LIB.F1B LIB.F1B_alt1_T2 LIB.F1B_alt2_T2 LIB.F1B_alt3_T2 LIB.F1C_alt1_T2 LIB.F1C_alt2_T2 LIB.F1C_alt3_T2 LIB.F2 LIB.F2A LIB.F3 LIB.F3_MCOLS LIB.F3bis LIB.F4 LIB.F5 LIB.FAC LIB.FGH6 LIB.FGH7 LIB.FGH8 LIB.FGH8_MCOLS LIB.FGH8bis LIB.FGHL6alt23_T2 LIB.FGHL6x1_T2 LIB.FGHL6x2_T2 LIB.FGHL6x3_T2 LIB.G1 LIB.G2 LIB.G2_MCOLS LIB.G2bis LIB.G3 LIB.G3A LIB.G3B LIB.G3C LIB.G4 LIB.H1 LIB.H1bis LIB.H2 LIB.H2bis LIB.H3 LIB.H3A LIB.H3Abis LIB.H4 LIB.H5 LIB.H5A LIB.H5Abis LIB.H5bis LIB.I1 LIB.I1_old LIB.I1B LIB.I1B_alt3_T2 LIB.I1B1 LIB.I1B1B LIB.I1bis_T2 LIB.I1C LIB.I1C_alt3_T2 LIB.I1D LIB.I1D_alt3_T2 LIB.I1E LIB.I1E_alt3_T2 LIB.I1F LIB.I1F_alt3_T2 LIB.I1G LIB.I1G_alt3_T2 LIB.I1H LIB.I1H_alt3_T2 LIB.I1I LIB.I1I_alt3_T2 LIB.I1J LIB.I1J_alt3_T2 LIB.I1K LIB.I1K_alt3_T2 LIB.I1L LIB.I1L_alt3_T2 LIB.I1M LIB.I1M_alt3_T2 LIB.I1N LIB.I1N_alt3_T2 LIB.I1N1bis_T2 LIB.I1N2bis_T2 LIB.I1N3bis_T2 LIB.I1Ndue LIB.I1Nuno LIB.I1P LIB.I2 LIB.I2bis LIB.J1 LIB.J1_alt1_T2 LIB.J1_alt2_T2 LIB.J1_T1 LIB.J10 LIB.J10_alt2_T2 LIB.J10_alt3_T2 LIB.J10Balt2_T2 LIB.J11 LIB.J11A LIB.J11A_MCOLS LIB.J11A1a LIB.J11A1b LIB.J11A1c LIB.J11A1d LIB.J11A1e LIB.J11A1f LIB.J11A1g LIB.J11A1h LIB.J11A1i LIB.J11A1l LIB.J11A1m LIB.J11Abis LIB.J12 LIB.J13 LIB.J13_alt1_T2 LIB.J13_alt2_T2 LIB.J13_T1 LIB.J13Balt2_T2 LIB.J14 LIB.J14_T1 LIB.J1B_alt2_T2 LIB.J2 LIB.J2_alt2_T2 LIB.J2_alt3_T2 LIB.J22 LIB.J22bis LIB.J2A LIB.J2B_alt2_T2 LIB.J3 LIB.J3_alt2_T2 LIB.J3_alt3_T2 LIB.J3B_alt2_T2 LIB.J4 LIB.J5 LIB.J6 LIB.J6_alt1_T2 LIB.J6_alt2_T2 LIB.J6_T1 LIB.J6A1 LIB.J6A1_MCOLS LIB.J6A1_old LIB.J6A1al LIB.J6Adue LIB.J6Atre LIB.J6Auno LIB.J6B_alt2_T2 LIB.J7 LIB.J7_alt1_T2 LIB.J7_alt2_T2 LIB.J7A1a LIB.J7A1b LIB.J7A1c LIB.J7A1d LIB.J7A2a LIB.J7A2b LIB.J7A2c LIB.J7A2d LIB.J7A2e LIB.J7A2f LIB.J7A3 LIB.J7A3_MCOLS LIB.J7A3_old LIB.J7A3al LIB.J7A4_civile LIB.J7A4_ind LIB.J7A4_inf LIB.J7A4a LIB.J7A4b LIB.J7A4c LIB.J7A4d LIB.J7A5a LIB.J7A5b LIB.J7A5c LIB.J7A5d LIB.J7A5e LIB.J7A5f LIB.J7A5g LIB.J7A5h LIB.J7A5i LIB.J7A5l LIB.J7A5m LIB.J7A5n LIB.J7A5o LIB.J7B LIB.J7B_alt2_T2 LIB.J8 LIB.J8_alt1_T2 LIB.J8_alt2_T2 LIB.J8B_alt2_T2 LIB.J9 LIB.J9_alt2_T2 LIB.J9_alt3_T2 LIB.J9B_alt2_T2 LIB.JA9 LIB.JA9_MCOLS LIB.JA9bis LIB.K0 LIB.K1 LIB.K1_alt1_T2 LIB.K1_alt2_T2 LIB.K10AJ20A LIB.K10J20 LIB.K11J21 LIB.K11J21_T1 LIB.K1B_T2 LIB.K2 LIB.K3 LIB.K4 LIB.K4_MCOLS LIB.K5J15 LIB.K5J15_pre_T2 LIB.K5J15_T0 LIB.K6J16 LIB.K7AJ17A LIB.K7J17 LIB.K8AJ18A LIB.K8J18 LIB.K9AJ19A LIB.K9J19 LIB.L1 LIB.L1altro LIB.L2 LIB.L2bis LIB.L3 LIB.L3A LIB.L3B LIB.L3C LIB.L4 LIB.L4A LIB.L4Abis LIB.L5 LIB.LD LIB.M1 LIB.M1A LIB.M1Abis LIB.M1B LIB.M1Bdue LIB.M1Buno LIB.M3a LIB.M3b LIB.M3bA LIB.M3c LIB.M3c1 LIB.N1A LIB.N1Ano LIB.N1B LIB.N1B_old LIB.N1Bbis LIB.N1C LIB.N1C_MCOLS LIB.N1Cbis LIB.N1D LIB.N1D1 LIB.N1E LIB.N1F LIB.N1F1 LIB.N1Fdue LIB.N1Funo LIB.N1G LIB.N1Gbis LIB.N1H LIB.N1H_alt2_T2 LIB.N1H_alt3_T2 LIB.N1H1 LIB.N1Hbis_T2 LIB.N1Hbis2_T2 LIB.N1I LIB.N1I_old LIB.N1Ialtro LIB.N1J LIB.N1K LIB.N1K_MCOLS LIB.N1Kdue LIB.N1Kuno LIB.N1L LIB.N1LA LIB.N1M LIB.N1M_1 LIB.N1M1 LIB.N1MA LIB.N1N LIB.N2 LIB.N2A LIB.N2A_old LIB.N2Aaltro LIB.N2B LIB.N2Bbis LIB.N2C LIB.N2D LIB.N3 LIB.N3A LIB.N3A_MCOLS LIB.N3Abis LIB.N3B LIB.N3Bbis LIB.N3C LIB.N4 LIB.N4A LIB.N4bis LIB.N5 LIB.N5_1 LIB.N5_2 LIB.N5A LIB.N5A1 LIB.N5A2 LIB.Notes LIB.P1 LIB.P1_MCOLS LIB.P1A LIB.P1A_MCOLS LIB.P1Aa LIB.P1Aa_MCOLS LIB.P1Agr_1 LIB.P1Agr_10 LIB.P1Agr_11 LIB.P1Agr_12 LIB.P1Agr_13 LIB.P1Agr_14 LIB.P1Agr_15 LIB.P1Agr_2 LIB.P1Agr_3 LIB.P1Agr_4 LIB.P1Agr_5 LIB.P1Agr_6 LIB.P1Agr_7 LIB.P1Agr_8 LIB.P1Agr_9 LIB.P1comp_mancanti LIB.P1comp_mancanti_MCOLS LIB.P1comp_mancanti1 LIB.P1E LIB.P1E_MCOLS LIB.P1Ebis LIB.P1Ec_1 LIB.P1Ec_10 LIB.P1Ec_11 LIB.P1Ec_12 LIB.P1Ec_13 LIB.P1Ec_14 LIB.P1Ec_15 LIB.P1Ec_16 LIB.P1Ec_17 LIB.P1Ec_18 LIB.P1Ec_19 LIB.P1Ec_2 LIB.P1Ec_20 LIB.P1Ec_21 LIB.P1Ec_3 LIB.P1Ec_4 LIB.P1Ec_5 LIB.P1Ec_6 LIB.P1Ec_7 LIB.P1Ec_8 LIB.P1Ec_9 LIB.P1F LIB.P1F_MCOLS LIB.P1Farm_1 LIB.P1Farm_10 LIB.P1Farm_11 LIB.P1Farm_12 LIB.P1Farm_2 LIB.P1Farm_3 LIB.P1Farm_4 LIB.P1Farm_5 LIB.P1Farm_6 LIB.P1Farm_7 LIB.P1Farm_8 LIB.P1Farm_9 LIB.P1Fbis LIB.P1G LIB.P1G_MCOLS LIB.P1Gbis LIB.P1GR_1 LIB.P1GR_10 LIB.P1GR_11 LIB.P1GR_12 LIB.P1GR_13 LIB.P1GR_14 LIB.P1GR_15 LIB.P1GR_16 LIB.P1GR_17 LIB.P1GR_18 LIB.P1GR_2 LIB.P1GR_3 LIB.P1GR_4 LIB.P1GR_5 LIB.P1GR_6 LIB.P1GR_7 LIB.P1GR_8 LIB.P1GR_9 LIB.P1I LIB.P1I_MCOLS LIB.P1Ibis LIB.P1Ing_1 LIB.P1Ing_10 LIB.P1Ing_11 LIB.P1Ing_12 LIB.P1Ing_13 LIB.P1Ing_14 LIB.P1Ing_15 LIB.P1Ing_16 LIB.P1Ing_2 LIB.P1Ing_3 LIB.P1Ing_4 LIB.P1Ing_5 LIB.P1Ing_6 LIB.P1Ing_7 LIB.P1Ing_8 LIB.P1Ing_9 LIB.P1Lett_1 LIB.P1Lett_10 LIB.P1Lett_11 LIB.P1Lett_2 LIB.P1Lett_3 LIB.P1Lett_4 LIB.P1Lett_5 LIB.P1Lett_6 LIB.P1Lett_7 LIB.P1Lett_8 LIB.P1Lett_9 LIB.P1P LIB.P1P_MCOLS LIB.P1Pbis LIB.P1Psico_1 LIB.P1Psico_10 LIB.P1Psico_11 LIB.P1Psico_12 LIB.P1Psico_13 LIB.P1Psico_14 LIB.P1Psico_15 LIB.P1Psico_16 LIB.P1Psico_17 LIB.P1Psico_18 LIB.P1Psico_19 LIB.P1Psico_2 LIB.P1Psico_20 LIB.P1Psico_3 LIB.P1Psico_4 LIB.P1Psico_5 LIB.P1Psico_6 LIB.P1Psico_7 LIB.P1Psico_8 LIB.P1Psico_9 LIB.P1Sa LIB.P1Sb LIB.P1Sc LIB.P1Sd LIB.P1Se LIB.P1Sf LIB.P1SF_1 LIB.P1SF_10 LIB.P1SF_11 LIB.P1SF_12 LIB.P1SF_13 LIB.P1SF_14 LIB.P1SF_15 LIB.P1SF_16 LIB.P1SF_17 LIB.P1SF_18 LIB.P1SF_19 LIB.P1SF_2 LIB.P1SF_20 LIB.P1SF_21 LIB.P1SF_3 LIB.P1SF_4 LIB.P1SF_5 LIB.P1SF_6 LIB.P1SF_7 LIB.P1SF_8 LIB.P1SF_9 LIB.P1Sg LIB.P1Sh LIB.P1Si LIB.P1Sl LIB.P1Sm LIB.P1SM_1 LIB.P1SM_10 LIB.P1SM_11 LIB.P1SM_12 LIB.P1SM_13 LIB.P1SM_14 LIB.P1SM_15 LIB.P1SM_2 LIB.P1SM_3 LIB.P1SM_4 LIB.P1SM_5 LIB.P1SM_6 LIB.P1SM_7 LIB.P1SM_8 LIB.P1SM_9 LIB.P1Sn LIB.P1So LIB.P1Sp LIB.P1SP_1 LIB.P1SP_10 LIB.P1SP_11 LIB.P1SP_12 LIB.P1SP_13 LIB.P1SP_14 LIB.P1SP_15 LIB.P1SP_16 LIB.P1SP_17 LIB.P1SP_2 LIB.P1SP_3 LIB.P1SP_4 LIB.P1SP_5 LIB.P1SP_6 LIB.P1SP_7 LIB.P1SP_8 LIB.P1SP_9 LIB.P1Sq LIB.P1Sr LIB.P1Ss LIB.P1SS_1 LIB.P1SS_10 LIB.P1SS_11 LIB.P1SS_12 LIB.P1SS_13 LIB.P1SS_14 LIB.P1SS_15 LIB.P1SS_16 LIB.P1SS_17 LIB.P1SS_18 LIB.P1SS_19 LIB.P1SS_2 LIB.P1SS_3 LIB.P1SS_4 LIB.P1SS_5 LIB.P1SS_6 LIB.P1SS_7 LIB.P1SS_8 LIB.P1SS_9 LIB.P1St LIB.P1Su LIB.P1Sv LIB.P1Sw LIB.P1Sy LIB.P1Sz LIB.P1T LIB.P1T_MCOLS LIB.P1Tbis LIB.P1Veter_1 LIB.P1Veter_10 LIB.P1Veter_11 LIB.P1Veter_2 LIB.P1Veter_3 LIB.P1Veter_4 LIB.P1Veter_5 LIB.P1Veter_6 LIB.P1Veter_7 LIB.P1Veter_8 LIB.P1Veter_9 LIB.P2a LIB.P2a_MCOLS LIB.P2abis LIB.P2altro LIB.P2b LIB.P2b_MCOLS LIB.P2bbis LIB.P2c LIB.P2c_MCOLS LIB.P2cbis LIB.P2d LIB.P2d_MCOLS LIB.P2dbis LIB.P2e LIB.P2e_MCOLS LIB.P2ebis LIB.P2f LIB.P2f_MCOLS LIB.P2fbis LIB.P2g LIB.P2g_MCOLS LIB.P2gbis LIB.Q_AREA LIB.Q_MANSIONI LIB.Q_PROFESSIONI LIB.Q_PROFESSIONI1 LIB.Q_PROFESSIONI2 LIB.Q_SETTORE LIB.Q_SETTORE_bis LIB.Q1 LIB.Q1_MANSIONI LIB.Q1A LIB.Q1A_old LIB.Q1Aa LIB.Q1Aabis LIB.Q1Ab LIB.Q1Abbis LIB.Q1Abis LIB.Q1Abis1 LIB.Q1Abis2 LIB.Q1Ac LIB.Q1Acbis LIB.Q1Ad LIB.Q1Adbis LIB.Q1Ae LIB.Q1Aebis LIB.Q1Af LIB.Q1Afbis LIB.Q1Ag LIB.Q1B LIB.Q1B_MCOLS LIB.Q1b1 LIB.Q1b10 LIB.Q1b10bis LIB.Q1b1bis LIB.Q1b2 LIB.Q1b2bis LIB.Q1b3 LIB.Q1b3bis LIB.Q1b4 LIB.Q1b4bis LIB.Q1b5 LIB.Q1b5bis LIB.Q1b6 LIB.Q1b6bis LIB.Q1b7 LIB.Q1b7bis LIB.Q1b8 LIB.Q1b8bis LIB.Q1b9 LIB.Q1b9bis LIB.Q1Ba LIB.Q1Babis LIB.Q1Bbis LIB.Q1bis LIB.Q1bis_MCOLS LIB.Q1C LIB.Q1Ca LIB.Q1Cabis LIB.Q1D LIB.Q1Daltro LIB.Q1E LIB.Q1Ebis LIB.S6 LIB.T1 LIB.T1A LIB.T1A_MCOLS LIB.T1Aal LIB.T2 LIB.T3 LIB.T3A LIB.T4 LIB.T5 LIB.T6 LIB.T7;
BY UID TID Block;
RUN;*/
