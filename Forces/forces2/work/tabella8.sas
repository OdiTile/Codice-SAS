/* file tabella8.sas     11 giugno 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella8.sas */
/* tabella8.sas    tabella 8.1 ---                              */
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
el=0;
if etalaurea <= 21 then el=1;
if etalaurea = 22 then el=2;
if etalaurea = 23 then el=3;
if etalaurea = 24 then el=4;
if etalaurea = 25 then el=5;
if etalaurea = 26 then el=6;
if etalaurea = 27 then el=7;
if (28 <= etalaurea <= 29) then el=8;
if (30 <= etalaurea <= 34) then el=9;
if (35 <= etalaurea <= 39) then el=10;
if (40 <= etalaurea <= 44) then el=11;
if (45 <= etalaurea <= 49) then el=12;
if etalaurea >= 50 then el=13;
run;
proc freq;
tables tid * fac * lav;
run;
proc freq;
tables fac * lavorava ;
where tid="T1";
run;
/* tabella 8.2 con valori percentuali pesati   */
/* non serve pesare quando una variabile e la variabile con cui su pesa */
/*proc freq;
tables tid * fac * lav;
weight peso; 
run;
proc freq;
tables fac * lavorava ;
where tid="T1";
weight peso;
run; */
proc freq;
tables etalaurea;
tables el;
where TID = "T1";
weight peso; 
run;
proc means data=lib.dforces01 n  mean;
var etalaurea;
where tid = "T1";
run; 
proc means data=lib.dforces01 n  mean;
var etalaurea;
where tid = "T1";
weight peso; 
run; 

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per fac per la proc mean */
by fac; run;
proc means data=lib.dforces01tid n  mean;
var etalaurea;
by fac;
where tid = "T1";
run; 
proc freq;
tables lav * tid;
run;

proc freq;
tables lav * tid;
weight peso; 
run;
proc freq;
tables lavorava ;
where tid="T1";
run; 
proc freq;
tables lavorava ;
where tid="T1";
weight peso;
run; 