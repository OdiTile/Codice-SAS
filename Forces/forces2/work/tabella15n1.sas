/* file tabella15.sas     4 luglio 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella15.sas */
/* tabella14.sas    tabella 14.1 ---                              */
/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';         */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';     */
/* FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';  */
   LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas'; 
   LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
   FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb';  
/* LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces2\work\sas'; 
 LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces2\work\sas'; 
 FILENAME QBase '\\Kaos\Lan\Users\Mario\forces2\work\db1.mdb';  */
options nocenter;
options pagesize = 200;

data lib.dforces01;
set lib.dforces;
/* missing lavorava al tempo 0 = non lavorava */
if lavorava="." then lavorava=0;
if b8=. then delete;
lav=0;
if b8=1 then lav=1;
studia=0;
if ((i1dr^=4) or (i1er^=4) or (i1fr^=4) or (i1gr^=4) or (i1hr^=4)) then studia = 1;
 cercalav=0;  /* 0=no 1=si  */
 if f4=1 or g3=1 then cercalav =1; 
 /* cercalavoro anche C9, ma solo per chi gia lavora e questo non e il caso */
cl=0; if c2 in (2, 3) then cl=1;  /* ricodifica ha cambiato lavoro */
/* variabili per la tabella 14.2 */
 riflav=0; if (lavorava=1 and fgh6=1 and tid='T1') then riflav=1;
 rifnlav=0; if (lavorava=0 and fgh6=1 and tid='T1') then rifnlav=1;
 /* variabili per la tabella 15.2 */ 
 lavoravalav=0; if (lavorava=1 and lav=1) then lavoravalav = 1;
 nlavoravalav=0; if (lavorava=0 and lav=1) then nlavoravalav = 1;
 tipolav=0; 
 if cde1_d=1 then tipolav=1;
 if cde1_d=2 then tipolav=2;
 if cde1_d=3 then tipolav=3;
run;
/*proc freq;
tables e3_1 *tid;
tables cde1_f * tid;
tables cde*tid;
tables cde1_e * tid;
tables cde2_g * tid;
run;*/
data lib.dforces01;
set lib.dforces01;
if tid in ('T1', 'T2', 'T3') then output;
run;

proc freq;
tables e2 * tid;
run;
proc freq;
tables e3t * tid;
*where e3_1=1;
run;
proc freq;
tables e3_1 * tid;
tables e3_2 * tid;
run;
proc freq;
tables ld * e3_1 * tid;
run;
proc freq;
tables ld * e3_1 * tid;
weight peso;
run;
*****************************;
data lib.dforces01;
set lib.dforces01;
operaio=0;
if cde1_f=6 then operaio=1;
nolaurea=0;
if j11=2 then nolaurea=1;
precario=0;
if cde1_e in (3,4,5,6,7) then precario=1;
bassoredd=0;
if cde2_g in (1,2,3,4,5) then bassoredd=1;
fuorir=0;
if cde in (4, 5) then fuorir=1;
run;
proc freq;
tables operaio * tid;
tables nolaurea * tid;
tables precario * tid;
tables bassoredd * tid;
tables fuorir * tid;
where b8=1;
run;
proc freq;
tables operaio * tid;
tables nolaurea * tid;
tables precario * tid;
tables bassoredd * tid;
tables fuorir * tid;
weight peso;
where b8=1;
run;

proc freq;
tables fac * operaio  * tid;
where b8=1;
weight peso;
run;
proc freq;
tables fac * nolaurea * tid;
where b8=1;
weight peso;
run;
proc freq;
tables fac * precario * tid;
where b8=1;
weight peso;
run;
proc freq;
tables fac * bassoredd * tid;
where b8=1;
weight peso;
run;
proc freq;
tables fac * fuorir * tid;
where b8=1;
weight peso;
run;
****************tabella 16****;
proc freq;
tables lavorava * ld * operaio  * tid;
where b8=1 ;
weight peso;
run;
proc freq;
tables lavorava * ld * nolaurea  * tid;
where b8=1 ;
weight peso;
run;
proc freq;
tables lavorava * ld * precario  * tid;
where b8=1 ;
weight peso;
run;
proc freq;
tables lavorava * ld * bassoredd  * tid;
where b8=1 ;
weight peso;
run;
proc freq;
tables lavorava * ld * fuorir  * tid;
where b8=1 ;
weight peso;
run;
***************************************
