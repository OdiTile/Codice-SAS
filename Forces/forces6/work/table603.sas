*---table602.sas <-- table601.sas  <--  merge6.sas  <--  import61.sas ------------------;
*--- Coerenza dei titoli universitari - le compresenze -----------------------16-07-06--;
/* Campioneforces B8 B8_before B8T0R C1A C2 -C2B- CDE CDE1 CDE1_A CDE1_C CDE1_D CDE1_E */
/* CDE1_F CDE1_G CDE2_I FAC J1 J10 J11 J12 J13 J14 J2 J22 J3 J4 J5 J6 J7 J8 J9         */

* LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces6\work\sas';  
* LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces6\work\sas';  
* FILENAME QBase '\\Kaos\Lan\Users\Mario\forces6\source\RBase070706.mdb';  

* LIBNAME LIB 'C:\Documents and Settings\barney\dati\lav\forces5\work\sas'; 
* LIBNAME LIBRARY 'C:\Documents and Settings\barney\dati\lav\forces5\work\sas'; 
* FILENAME QBase 'C:\Documents and Settings\barney\dati\lav\forces5\source\RBase.mdb'; 

* LIBNAME LIB 'C:\Documents and Settings\herman\dati\lav\forces5\work\sas'; 
* LIBNAME LIBRARY 'C:\Documents and Settings\herman\dati\lav\forces5\work\sas'; 
* FILENAME QBase 'C:\Documents and Settings\herman\dati\lav\forces5\source\RBase.mdb';

 LIBNAME LIB 'C:\dati\lav\forces6\work\sas'; 
 LIBNAME LIBRARY 'C:\dati\lav\forces6\work\sas'; 
 FILENAME QBase 'C:\dati\lav\forces6\source\RBase070706.mdb';

options nocenter pagesize=135;

Data lib.dforces; set lib.dforces;
etalcl=0;
if etalaurea <= 22 then etalcl = 22;
if etalaurea = 23 then etalcl = 23;
if etalaurea = 24 then etalcl = 24;
if etalaurea = 25 then etalcl = 25;
if etalaurea = 26 then etalcl = 26;
if etalaurea = 27 then etalcl = 27;
if etalaurea = 28 then etalcl = 28;
if etalaurea >= 29 then etalcl = 29;

run;
proc freq data=lib.dforces;
tables fac * j9;
run;
proc freq data=lib.dforces;
tables fac * j9;
where TID="T4";
run;
/* ========================== */
proc freq data=lib.dforces;
tables ld * j9;
run;
proc freq data=lib.dforces;
tables ld * j9;
weight peso;
run;

proc freq data=lib.dforces;
tables ld * lavorava  * j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables ld * lavorava * j9;
where TID="T4";
weight peso;
run;
proc freq data=lib.dforces;
tables lavorava * j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables lavorava * j9;
weight peso;
where TID="T4";
run;
/* ========================== */
proc freq data=lib.dforces;
tables etalcl * j9;
run;
proc freq data=lib.dforces;
tables etalcl * j9;
weight peso;
run;
proc freq data=lib.dforces;
tables etalcl * j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables etalcl * j9;
where TID="T4";
weight peso;
run;
/* ========================== */
proc freq data=lib.dforces;
tables lavorava * j9;
run;
proc freq data=lib.dforces;
tables lavorava * j9;
weight peso;
run;
/* ========================== */
/* suddivisione per gruppi di facltà */
proc freq data=lib.dforces; /* centrale 6 10*/
tables j9;
where (fac in ("fac06","fac10") and TID="T4");run;
proc freq data=lib.dforces;
tables j9;
weight peso;
where (fac in ("fac06","fac10") and TID="T4");run;
proc freq data=lib.dforces; /* centrale 2 4 9 12*/
tables j9;
where (fac in ("fac02","fac04","fac09","fac12") and TID="T4");run;
proc freq data=lib.dforces;
tables j9;
weight peso;
where (fac in ("fac02","fac04","fac09","fac12") and TID="T4");run;
proc freq data=lib.dforces; /* centrale 1 5 11 13*/
tables j9;
where (fac in ("fac01","fac05","fac11","fac13") and TID="T4");run;
proc freq data=lib.dforces;
tables j9;
weight peso;
where (fac in ("fac01","fac05","fac11","fac13") and TID="T4");run;
proc freq data=lib.dforces; /* centrale 3 7 8*/
tables j9;
where (fac in ("fac03","fac07","fac08") and TID="T4");run;
proc freq data=lib.dforces;
tables j9;
weight peso;
where (fac in ("fac03","fac07","fac08") and TID="T4");run;
proc freq data=lib.dforces; /* centrale tutte*/
tables j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables j9;
where TID="T4";
weight peso;
run;

/* ========================== */
/* I1C stage post lauream */
Data lib.dforces; set lib.dforces;
stagepl=0; /* 1,2,3 =si 4=no */
if i1c in (1, 2, 3) then stagepl=1;
tirocin1=0; /*tirocinio 1=si 0,2 = no */
if tirocin=1 then tirocin1=1;
run;
proc freq data=lib.dforces; /* lavorava al conseguimento */
tables lavorava * j9;
where TID="T4";
run;
proc freq data=lib.dforces; 
tables lavorava * j9;
where TID="T4";
weight peso;
run;
proc freq data=lib.dforces; /* stage in corso */
tables tirocin1 * j9;
where TID="T4";
run;
proc freq data=lib.dforces; 
tables tirocin1 * j9;
where TID="T4";
weight peso;
run;proc freq data=lib.dforces; /* stage post corso */
tables i1 * j9;
where TID="T4";
run;
proc freq data=lib.dforces; 
tables i1 * j9;
where TID="T4";
weight peso;
run;
proc freq data=lib.dforces; /* Universita' di Padova*/
tables j9;
where TID="T4";
run;
proc freq data=lib.dforces; 
tables j9;
where TID="T4";
weight peso;
run;
/* =====================================  */
proc freq data=lib.dforces; 
tables j1;
tables tirocin;  /* 1=si 2=no */
tables tirocin1;
tables tirocin1 * j9;
where TID="T4";
/* weight peso; */
run;
proc freq data=lib.dforces; 
tables I1 * TID;
run;
/* Tabella coerenza-soddisfazione =====================================  */
proc freq data=lib.dforces; 
tables J9 * J1;
where TID="T4";
run;
proc freq data=lib.dforces; 
tables J9 * J1;
where TID="T4";
weight peso;
run;
/* misure di associazione =====================================  */
proc freq data=lib.dforces; 
tables fac * TID;
run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac01";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac02";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac03";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac04";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac05";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac06";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac07";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac08";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac09";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac10";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac11";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac12";weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4" and fac="fac13";weight peso;run;
/*  gruppi di facolta'  ================================ */
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where (fac in ("fac06","fac10") and TID="T4");weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where (fac in ("fac02","fac04","fac09","fac12") and TID="T4");weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where (fac in ("fac01","fac05","fac11","fac13") and TID="T4");weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where (fac in ("fac03","fac07","fac08") and TID="T4");weight peso;run;
proc freq data=lib.dforces; tables J9 * J1 /measures cl ;
where TID="T4";weight peso;run;
/* =========== prove ================ */
proc freq data=lib.dforces; 
tables fac * j9;
* where TID="T4";
weight peso;
run;
