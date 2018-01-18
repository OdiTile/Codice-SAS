/* file tabella10.sas     15 giugno 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella10.sas */
/* tabella10.sas    tabella 10.1 ---                              */
/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';         */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';     */
/* FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';  */
   LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas'; 
   LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
   FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb';  
/* LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces2\work\sas'; 
 LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces2\work\sas'; 
 FILENAME QBase '\\Kaos\Lan\Users\Mario\forces2\work\db1.mdb'; */
options nocenter;
options pagesize = 200;

data lib.dforces01;
set lib.dforces;
/* missing lavorava al tempo 0 = non lavorava */
if lavorava="." then lavorava=0;
if b8=. then delete;
lav=0; if b8=1 then lav=1;
studia=0;
if ((i1dr^=4) or (i1er^=4) or (i1fr^=4) or (i1gr^=4) or (i1hr^=4)) then studia = 1;
 cercalav=0;  /* 0=no 1=si  */
 if f4=1 or g3=1 then cercalav =1; 
 /* cercalavoro anche C9, ma solo per chi gia lavora e questo non e il caso */

run;
proc freq;
tables b8 * fgh6 * lavorava;
tables studia * fgh6 * lavorava;
tables cercalav * fgh6 * lavorava;
tables fgh6 * lavorava;
where tid="T1";
run;
proc freq;
tables b8 * fgh6 * lavorava;
tables studia * fgh6 * lavorava;
tables cercalav * fgh6 * lavorava;
tables fgh6 * lavorava;
where tid="T1";
weight peso;
run;

proc freq;
tables fgh6 ;
where tid="T1";
run;
proc freq;
tables fgh6 ;
where tid="T2";
run;
proc freq;
tables fgh6 ;
where tid="T3";
run;

proc freq;
tables lavorava * b8;
where tid="T1" and fgh6=1;
run;
proc freq;
tables b8 * fgh6 * lavorava;
where tid="T1" ;
run;
proc freq;
tables b8 * fgh6 * lavorava;
where tid="T1" ;
weight peso;
run;

proc freq;
tables studia * fgh6 * lavorava;
tables cercalav * fgh6 * lavorava;
run;
proc freq;
tables studia * fgh6 * lavorava;
tables cercalav * fgh6 * lavorava;
weight peso;
run;
*************************************;
proc freq;
tables fac * tid;
where fgh6=1;
run;
proc freq;
tables fac * tid;
where fgh6=1;
weight peso;
run;
proc freq;
tables ld * tid;
where fgh6=1;
weight peso;
run;