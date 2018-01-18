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
proc freq;
title 'lavorava al conseguimento del titolo';
tables lavorava * lav * tid;
run;

proc freq;
title 'ha cambiato lavoro - lavorava - dipendente';
tables cl * tid;
where lavorava=1 and cde1_d=1;
run;
proc freq;
title 'ha cambiato lavoro - lavorava - autonomo';
tables cl * tid;
where lavorava=1 and cde1_d=2;
run;
proc freq;
title 'ha cambiato lavoro - lavorava - altro';
tables cl * tid;
where lavorava=1 and cde1_d=3;
run;
proc freq;
title 'ha cambiato lavoro - non lavorava - dipendente';
tables cl * tid;
where lavorava=0 and cde1_d=1;
run;
proc freq;
title 'ha cambiato lavoro - non lavorava - autonomo';
tables cl * tid;
where lavorava=0 and cde1_d=2;
run;
proc freq;
title 'ha cambiato lavoro - non lavorava - altro';
tables cl * tid;
where lavorava=0 and cde1_d=3;
run;
proc freq;
title 'ha cambiato lavoro - lavorava - dipendente';
tables lav * cl * tid ;
where cde1_d=3 and lavorava=1;
run;

proc freq;
title ' percentuale - lavorava e lavora - pesata';
tables tid * tipolav * cl ;
where lavoravalav=1;
weight peso;
run;
proc freq;
title ' percentuale - non lavorava e lavora - pesata';
tables tid * tipolav * cl ;
where nlavoravalav=1;
weight peso;
run;
proc freq;
tables lavorava * lav * tid;
run;
proc freq;
tables cl * tid;
tables tipolav * cl * tid;
run;