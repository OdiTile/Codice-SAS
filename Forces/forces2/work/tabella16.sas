/* file tabella16.sas     4 luglio 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella16.sas */
/* tabella16.sas    tabella 16.1 ---                              */
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
tind=0; if cde1_e in (1,2) then tind=1; /* lavoro a tempo indeterminato  */
run;
proc freq;
title ' lavorava - occupati ';
tables fac * tid * lav;
where lavorava = 1;
run;
proc freq;
title ' lavorava - tempo indeterminato ';
tables fac * tid * tind;
where lavorava = 1;
run;
proc freq;
title ' non lavorava - occupati ';
tables fac * tid * lav;
where lavorava = 0;
run;
proc freq;
title ' non lavorava - tempo indeterminato ';
tables fac * tid * tind;
where lavorava = 0;
run;
proc freq;  /* prove percentuali  */
tables tind * tid;
where fac = 'fac01' and lavorava=0;
run;