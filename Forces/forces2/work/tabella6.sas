/* file tabella6.sas     7 giugno 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella6.sas */
/* tabella6.sas    tabella 6.1                              */
/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';         */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';     */
/* FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';  */
LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb'; 
options nocenter;
options pagesize = 200;

data lib.dforces01;
set lib.dforces;
/* missing lavorava al tempo 0 = non lavorava */
if lavorava="." then lavorava=0;
if b8=. then delete;
varn1k1=0; varn1k2=0; varn1k3=0; 
/* raggruppamento dei percorsi attivi per la ricerca del lavoro N1K  */
if n1k_1=1 then varn1k1=1;
if n1k_2=1 then varn1k1=1;
if n1k_3=1 then varn1k2=1;
if n1k_4=1 then varn1k2=1;
if n1k_5=1 then varn1k3=1;
/* invio diretto di curriculum  */
varn1b=0; if n1b=2 then varn1b=1;
run;
/* tabella 6.1   */
proc freq;
tables n1k_1 * tid;
tables n1k_2 * tid;
tables n1k_3 * tid;
tables n1k_4 * tid;
tables n1k_5 * tid;
tables n1k_6 * tid;
tables n1k_7 * tid;
tables n1k_8 * tid;
tables n1k_9 * tid;
run;
/* tabella 6.1.1  */
proc freq;
tables lavorava * varn1k1 * tid;
tables lavorava * varn1k2 * tid;
tables lavorava * varn1k3 * tid;
tables varn1k1 * tid;
tables varn1k2 * tid;
tables varn1k3 * tid;
tables lavorava * varn1b * tid;
tables varn1b * tid;
tables varn1b;
tables n1b;
title 'ricerca di lavoro attiva  ----------non pesata----------------';
run;
proc freq;
tables lavorava * varn1k1 * tid;
tables lavorava * varn1k2 * tid;
tables lavorava * varn1k3 * tid;
tables varn1k1 * tid;
tables varn1k2 * tid;
tables varn1k3 * tid;
tables lavorava * varn1b * tid;
tables varn1b * tid;
title 'ricerca di lavoro attiva  --------------pesata----------------';
weight peso;
run;
