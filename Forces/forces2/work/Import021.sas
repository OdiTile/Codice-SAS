*--- Captor System data import procedure for SAS release V8 ------------;
/* Import02 + F4 G3 H4 +                                            23-05-04        */
/* I1D I1D_alt3_T2 I1E I1E_alt3_T2 I1F I1F_alt3_T2 I1G I1G_alt3_T2 I1H I1H_alt3_T2  */
/* LIBNAME LIB 'c:\Documenti\dati\forces2\work\sas'; */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces2\work\sas'; */
/* FILENAME QBase 'c:\Documenti\dati\forces2\work\db1.mdb';  */

/*  LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces2\work\sas';  
     LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces2\work\sas';  
     FILENAME QBase '\\Kaos\Lan\Users\Mario\forces2\work\db1.mdb';  */

 LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas'; 
 LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas'; 
 FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb'; 

options nocenter;

PROC IMPORT OUT=studio DATATABLE='studio' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID ;
data lib.studio;
set studio;
drop fac;
if (tid='T4' or tid='T5') then delete;
run;


PROC IMPORT OUT=campioneforces DATATABLE='campioneforces' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;   /* importa la tabella campioneforces nel dataset campioneforces */
PROC SORT; BY matricola;

DATA LIB.campioneforces;
SET campioneforces;
LABEL campioneforces='campione forces completo';
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
FORMAT B8 B8F;
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
FORMAT B8_before CosafaF;
RUN;


PROC IMPORT OUT=C2 DATATABLE='C2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block; run;
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
FORMAT C2 AttivF;
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
FORMAT CDE Luogo2F;
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
FORMAT CDE_D motsceltF;
PROC TRANSPOSE OUT=LIB.CDE_D_MCOLS PREFIX=CDE_D_ ;
BY UID TID Block;
VAR CDE_D;
RUN;

PROC IMPORT OUT=CDE_Dbis DATATABLE='CDE_Dbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.CDE_Dbis;
SET CDE_Dbis;
LABEL CDE_Dbis='SPECIFICA  ALTRO';
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
FORMAT CDE1 MiglPegF;
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
FORMAT CDE1_C ContrF;
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
FORMAT CDE1_D TipoLavF;
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
FORMAT CDE1_E TemplavoF;
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
FORMAT CDE1_F Posiz2F;
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
FORMAT CDE2_G RetrmensF;
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
FORMAT E2 primaAttF;
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
FORMAT E3 ConclusF;
PROC TRANSPOSE OUT=LIB.E3_MCOLS PREFIX=E3_ ;
BY UID TID Block;
VAR E3;
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
FORMAT F1A SiNoF;
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
FORMAT F1B SiNoF;
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
FORMAT F1B_alt1_T2 SiNoF;
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
FORMAT F1B_alt2_T2 SiNoF;
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
FORMAT F1B_alt3_T2 SiNoF;
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
FORMAT F3 Concl2F;
PROC TRANSPOSE OUT=LIB.F3_MCOLS PREFIX=F3_ ;
BY UID TID Block;
VAR F3;
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
FORMAT F4 SiNoF;
RUN;

PROC IMPORT OUT=F7 DATATABLE='F7' DBMS=ACCESS2000 REPLACE;
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
DATA LIB.F7;
SET F7;
LABEL F7='Per quali MOTIVI prevalenti ha rifiutato questi lavori (al massimo due risposte)?';
FORMAT F7 motivrifF;
PROC TRANSPOSE OUT=LIB.F7_MCOLS PREFIX=F7_ ;
BY UID TID Block;
VAR F7;
RUN;

PROC IMPORT OUT=F7bis DATATABLE='F7bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.F7bis;
SET F7bis;
LABEL F7bis='SPECIFICA ALTRO';
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
FORMAT FGH6 SiNoF;
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
FORMAT FGH8 motivrifF;
PROC TRANSPOSE OUT=LIB.FGH8_MCOLS PREFIX=FGH8_ ;
BY UID TID Block;
VAR FGH8;
RUN;

PROC IMPORT OUT=FGH8bis DATATABLE='FGH8bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.FGH8bis;
SET FGH8bis;
LABEL FGH8bis='SPECIFICA ALTRO';
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
FORMAT G3 SiNoF;
RUN;


PROC IMPORT OUT=G6 DATATABLE='G6' DBMS=ACCESS2000 REPLACE;
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
DATA LIB.G6;
SET G6;
LABEL G6='Per quali MOTIVI prevalenti ha rifiutato questi lavori (al massimo due risposte)?';
FORMAT G6 motivrifF;
PROC TRANSPOSE OUT=LIB.G6_MCOLS PREFIX=G6_ ;
BY UID TID Block;
VAR G6;
RUN;

PROC IMPORT OUT=G6bis DATATABLE='G6bis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.G6bis;
SET G6bis;
LABEL G6bis='SPECIFICA  ALTRO';
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
FORMAT H4 SiNoF;
RUN;

PROC IMPORT OUT=H6B DATATABLE='H6B' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
PROC FORMAT LIBRARY=LIB;
VALUE motRif2F
1 = 'In quel momento avevo già un lavoro'
2 = 'Erano precari  instabili  senza prospettive'
3 = 'Non erano interessanti sul piano professionale'
4 = 'Non erano coerenti con l indirizzo degli studi'
5 = 'Non erano adeguati al titolo di studio conseguito '
6 = 'Erano localizzati lontano da casa  in posti disagiati'
7 = 'Volevo continuare gli studi'
8 = 'Altri motivi'
;
DATA LIB.H6B;
SET H6B;
LABEL H6B='Per quali MOTIVI prevalenti ha rifiutato questi lavori (al massimo due risposte)?';
FORMAT H6B motRif2F;
PROC TRANSPOSE OUT=LIB.H6B_MCOLS PREFIX=H6B_ ;
BY UID TID Block;
VAR H6B;
RUN;

PROC IMPORT OUT=H6Bbis DATATABLE='H6Bbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.H6Bbis;
SET H6Bbis;
LABEL H6Bbis='Quali?';
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
FORMAT I1D corsoF;
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
FORMAT I1D_alt3_T2 alt3F;
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
FORMAT I1E tirocF;
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
FORMAT I1E_alt3_T2 alt3F;
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
FORMAT I1F I1FF;
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
FORMAT I1F_alt3_T2 alt3F;
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
FORMAT I1G scuolaF;
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
FORMAT I1G_alt3_T2 alt3F;
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
FORMAT I1H tirocF;
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
FORMAT I1H_alt3_T2 alt3F;
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
FORMAT J11 altriF;
RUN;


PROC IMPORT OUT=L6Bbis DATATABLE='L6Bbis' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID Block;
DATA LIB.L6Bbis;
SET L6Bbis;
LABEL L6Bbis='Può specificare?';
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
FORMAT N1A RicLavF;
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
FORMAT N1B curricF;
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
FORMAT N1B_old curric1F;
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
FORMAT N1C IndCurrF;
PROC TRANSPOSE OUT=LIB.N1C_MCOLS PREFIX=N1C_ ;
BY UID TID Block;
VAR N1C;
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
FORMAT N1D inserzF;
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
FORMAT N1D1 GiornaliF;
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
FORMAT N1F bancheF;
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
FORMAT N1F1 N1F1F;
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
FORMAT N1G colloquiF;
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
FORMAT N1H1 DoveCollF;
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
FORMAT N1I banchedF;
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
FORMAT N1J ricorsoF;
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
FORMAT N1K ric1F;
PROC TRANSPOSE OUT=LIB.N1K_MCOLS PREFIX=N1K_ ;
BY UID TID Block;
VAR N1K;
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
FORMAT N1L concorsiF;
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
FORMAT N1M ConcPubF;
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
FORMAT N1M_1 N1M_1F;
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
FORMAT N1M1 DoveCollF;
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
FORMAT N1N AndConcF;
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
FORMAT N2 AlboF;
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
FORMAT N2A AlboProfF;
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
FORMAT N2B AvvioAttF;
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
FORMAT N2C FormGiurF;
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
FORMAT N2D preesistF;
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
FORMAT N3 esteroF;
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
FORMAT N3A RiLavEstF;
PROC TRANSPOSE OUT=LIB.N3A_MCOLS PREFIX=N3A_ ;
BY UID TID Block;
VAR N3A;
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
FORMAT N3B MercEstF;
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
FORMAT N3C FattoF;
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
FORMAT N4 RiLavEsF;
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
FORMAT N5 CanRicF;
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
FORMAT N5_1 CanRicF;
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
FORMAT N5_2 CanRicF;
RUN;

