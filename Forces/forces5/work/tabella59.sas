/* file tabella59.sas     2-2-06                      */
/* sequenza import522.sas  -  merge522.sas  -  tabella59.sas */
/*                                                                      */
* LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces5\work\sas';  
* LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces5\work\sas';  
* FILENAME QBase '\\Kaos\Lan\Users\Mario\forces5\source\RBase.mdb';  

 LIBNAME LIB 'C:\Documents and Settings\barney\dati\lav\forces5\work\sas'; 
 LIBNAME LIBRARY 'C:\Documents and Settings\barney\dati\lav\forces5\work\sas'; 
 FILENAME QBase 'C:\Documents and Settings\barney\dati\lav\forces5\source\RBase.mdb'; 

* LIBNAME LIB 'C:\Documents and Settings\herman\dati\lav\forces5\work\sas'; 
* LIBNAME LIBRARY 'C:\Documents and Settings\herman\dati\lav\forces5\work\sas'; 
* FILENAME QBase 'C:\Documents and Settings\herman\dati\lav\forces5\source\RBase.mdb'; 


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
/*======================================= 02-02-06 ==================*/
proc freq;
tables sesso*ld * b8 * tid;
weight peso;
run;
proc freq;
tables sesso* b8 * tid;
weight peso;
run;
proc freq;
tables ld * b8 * tid;
tables b8 * tid;
weight peso;
run;
proc freq;
tables sesso * ld * lavorava * tid;
tables sesso * lavorava * tid;
tables ld * lavorava * tid;
tables lavorava * tid;
weight peso;
run;
