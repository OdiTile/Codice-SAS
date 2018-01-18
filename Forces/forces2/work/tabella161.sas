/* file tabella161.sas     9 luglio 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella161.sas */
/* tabella161.sas    tabella 16.1 ---  Verifica lavoro a tempo indeterminato */
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

tind=0; if cde1_e in (1,2) then tind=1; /* lavoro a tempo indeterminato  */
run;

proc freq;
tables fac * tind * tid;
tables fac * tid;
where cde1_d=1 and lavorava=1 ; 
run;

proc freq;
tables fac * lavorava * tind * tid;
where cde1_d=1;
run;

proc freq;
tables fac * lavorava * cde1_d * tid;
run;

proc freq;
tables lavorava * cde1_d * tid;
tables lavorava * tind * tid;
run;
proc freq;
tables lavorava * cde1_d * tid;
weight peso;
run;
proc freq;
tables lavorava * tind * tid;
where cde1_d=1;
weight peso;
run;
proc freq;
tables fac * cde1_d * tid;
run;
proc freq;  /* tab 163 per tutta la universita */
tables cde1_d * tid;
run;
proc freq;  /* tab 163 per tutta la universita */
tables cde1_d * tid;
weight peso;
run;

proc freq;
tables fac * lavorava * b8 * tid;
* where fac="fac01" ;
run;
proc freq;
tables lavorava * b8 * tid;
run;

proc freq;
tables fac * lavorava * tind * tid;
run;
proc freq;
tables lavorava * tind * tid;
run;