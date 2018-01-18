/* file tabella9.sas     13 giugno 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella9.sas */
/* tabella9.sas    tabella 9.1 ---                              */
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
lav=0; if b8=1 then lav=1;

run;

proc freq;
table sesso;
table ld;
where tid="T1";
run;
proc freq;
table sesso;
table ld;
where tid="T1";
weight peso;
run;
proc freq;
table sesso * ld * lavorava;
where tid="T1";
run;
proc freq;
table sesso * ld * tid;
where b8=1;
run;
proc freq;
table ld * tid;
where b8=1;
run;

proc freq;
table sesso * ld * lavorava;
where tid="T1";
weight peso;
run;
proc freq;
table sesso * ld * tid;
where b8=1;
weight peso;
run;
proc freq;
table ld * tid;
where b8=1;
weight peso;
run;
/* totale di chi lavora per laurea o diploma */
proc freq;
tables ld * lavorava * tid;
weight peso;
run;
proc freq;
tables ld * b8 * tid;
weight peso;
run;
proc freq;
tables ld * sesso * lavorava * tid;
run;
proc freq;
tables ld * sesso * b8 * tid;
run;
proc freq;
tables ld * sesso * lavorava * tid;
weight peso;
run;
proc freq;
tables ld * sesso * b8 * tid;
weight peso;
run;
proc freq;
tables sesso * lavorava * tid;
weight peso;
run;
proc freq;
tables sesso * b8 * tid;
weight peso;
run;
proc freq;
tables ld * lavorava * tid;
weight peso;
run;
proc freq;
tables ld * b8 * tid;
weight peso;
run;
proc freq;
tables lavorava * tid;
weight peso;
run;
proc freq;
tables b8 * tid;
weight peso;
run;