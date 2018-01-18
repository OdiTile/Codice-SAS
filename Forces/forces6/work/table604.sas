*-table603 <-- table602.sas <-- table601.sas  <--  merge6.sas  <--  import61.sas ---;
*--- Coerenza dei titoli universitari - le compresenze -----------------------26-01-07--;
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

* LIBNAME LIB 'H:\dati\lav\forces6\work\sas'; 
* LIBNAME LIBRARY 'H:\dati\lav\forces6\work\sas'; 
* FILENAME QBase 'H:\dati\lav\forces6\source\RBase070706.mdb';

 LIBNAME LIB 'C:\dati\lav\forces6\work\sas'; 
 LIBNAME LIBRARY 'C:\dati\lav\forces6\work\sas'; 
 FILENAME QBase 'C:\dati\lav\forces6\source\RBase070706.mdb';

options nocenter pagesize=135;

Data lib.dforces; set lib.dforces;
vl=0;
if votolaurea>99 then  vl=1;
run;
proc freq data=lib.dforces;
tables sesso * j9 ;
where TID="T4";
run;
proc freq data=lib.dforces;
tables sesso * j9 ;
where TID="T4"; 
weight peso;
run;
proc freq data=lib.dforces;
tables vl * j9;
where TID="T4" and ld=1;
run;
proc freq data=lib.dforces;
tables vl * j9;
where TID="T4" and ld=1;
weight peso;
run;
/*  -------- prova diversi voti   -------------------*/
Data lib.dforces; set lib.dforces;
vl=0;
if votolaurea>104 then  vl=1;
run;

proc freq data=lib.dforces;
tables vl * j9;
where TID="T4" and ld=1;
run;
proc freq data=lib.dforces;
tables vl * j9;
where TID="T4" and ld=1;
weight peso;
run;
/* --------------------------------------------------*/
proc freq data=lib.dforces;
tables cde * j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables cde * j9;
where TID="T4";
weight peso;
run;

proc freq data=lib.dforces;
tables cde1_c * j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables cde1_c * j9;
where TID="T4";
weight peso;
run;
proc freq data=lib.dforces;
tables cde1_d * j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables cde1_d * j9;
where TID="T4";
weight peso;
run;

Data lib.dforces; set lib.dforces;
tipolav=0;
if cde1_e in (1,2) then  tipolav=1;
if cde1_e in (3,4) then  tipolav=2;
if cde1_e in (5,6,7) then  tipolav=3;
run;
proc freq data=lib.dforces;
tables tipolav * j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables tipolav * j9;
where TID="T4";
weight peso;
run;
proc freq data=lib.dforces;
tables cde_a * j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables cde_a * j9;
where TID="T4";
weight peso;
run;
/* ------------------cultura e tecniche----------------------*/
proc freq data=lib.dforces;
tables j2 * j9; where TID="T4"; run;
proc freq data=lib.dforces;
tables j2 * j9; where TID="T4"; weight peso; run;
proc freq data=lib.dforces;
tables j3 * j9; where TID="T4"; run;
proc freq data=lib.dforces;
tables j3 * j9; where TID="T4"; weight peso; run;
/* ----------competenze utilizzate e mancanti-----------------*/
proc freq data=lib.dforces;
tables j4 * j9; where TID="T4"; run;
proc freq data=lib.dforces;
tables j4 * j9; where TID="T4"; weight peso; run;
proc freq data=lib.dforces;
tables j5 * j9; where TID="T4"; run;
proc freq data=lib.dforces;
tables j5 * j9; where TID="T4"; weight peso; run;
/* ----------capacita' professionali-----------------*/
proc freq data=lib.dforces;
tables j10 * j9; where TID="T4"; run;
proc freq data=lib.dforces;
tables j10 * j9; where TID="T4"; weight peso; run;
proc freq data=lib.dforces;
tables j11 * j9; where TID="T4"; run;
proc freq data=lib.dforces;
tables j11 * j9; where TID="T4"; weight peso; run;
/* ----------importanza degli insegnamenti-----------------*/
proc freq data=lib.dforces;
tables j9 * j6; where TID="T4"; run;
proc freq data=lib.dforces;
tables j9 * j6; where TID="T4"; weight peso; run;
proc means data=lib.dforces;
var j6; class j9 ; where TID="T4"; run;

proc freq data=lib.dforces;
tables j9 * j7; where TID="T4"; run;
proc freq data=lib.dforces;
tables j9 * j7; where TID="T4"; weight peso; run;
proc means data=lib.dforces;
var j7; class j9 ; where TID="T4"; run;

proc freq data=lib.dforces;
tables j9 * j8; where TID="T4"; run;
proc freq data=lib.dforces;
tables j9 * j8; where TID="T4"; weight peso; run;
proc means data=lib.dforces;
var j8; class j9 ; where TID="T4"; run;

proc freq data=lib.dforces;
tables j9 * j13; where TID="T4"; run;
proc freq data=lib.dforces;
tables j9 * j13; where TID="T4"; weight peso; run;
proc means data=lib.dforces;
var j13; /* class j9 ;*/ where TID="T4"; run;

/* ----------Sostituibilita'-----------------*/
proc freq data=lib.dforces;
tables j12 * j9; where TID="T4"; run;
proc freq data=lib.dforces;
tables j12 * j9; where TID="T4"; weight peso; run;
proc freq data=lib.dforces;
tables j14 * j9; where TID="T4"; run;
proc freq data=lib.dforces;
tables j14 * j9; where TID="T4"; weight peso; run;

/*  -------- prova voti in tre classi   -------------------*/
Data lib.dforces; set lib.dforces;
vl=0;
if votolaurea<99 then vl=1;
if (votolaurea >98 and votolaurea <105) then vl=2;
if votolaurea>104 then  vl=3;
run;

proc freq data=lib.dforces;
tables vl * j9;
where TID="T4" and ld=1;
run;
proc freq data=lib.dforces;
tables vl * j9;
where TID="T4" and ld=1;
weight peso;
run;

/*  -------- prepara i dati per laidout   -------------------*/

Data lib.dforces; set lib.dforces;
j9dic=".";
if j9 in (1,2) then j9dic=1;
if j9 in (3,4) then j9dic=2;
j1cl=3; select (j1);
   when (1,2,3)  j1cl=1;
   when (4,5)    j1cl=2;
   when (6,7)    j1cl=3;
   when (8,9,10) j1cl=4; otherwise; end;
j6cl=3; select (j6);
   when (1,2,3)  j6cl=1;
   when (4,5)    j6cl=2;
   when (6,7)    j6cl=3;
   when (8,9,10) j6cl=4; otherwise; end;
j7cl=3; select (j7);
   when (1,2,3)  j7cl=1;
   when (4,5)    j7cl=2;
   when (6,7)    j7cl=3;
   when (8,9,10) j7cl=4; otherwise; end;
j8cl=3; select (j8);
   when (1,2,3)  j8cl=1;
   when (4,5)    j8cl=2;
   when (6,7)    j8cl=3;
   when (8,9,10) j8cl=4; otherwise; end;
j13cl=3; select (j13);
   when (1,2,3)  j13cl=1;
   when (4,5)    j13cl=2;
   when (6,7)    j13cl=3;
   when (8,9,10) j13cl=4; otherwise; end;
j22cl=2; select (j22);
   when (3,5,7)     j22cl=1;
   when (1,10)      j22cl=2;
   when (2,4,6,8,9) j22cl=3; otherwise; end;
run;
proc freq data=lib.dforces;
tables j9;
tables j9dic;
where tid="T4" and j9 ^= .;
run;
/* -----Logistica odd ratio proporzionali -----------------*/
proc logistic data=lib.dforces;
class cde cde1_d cde1_f cde1_g fac j12 j22;
model j9dic (event='2')= cde cde1_c cde1_d cde1_f cde1_g cde2_g cde2_i etalcl fac
j1 j10 j11 j12 j13 j14 j22 j4 j5 j6 j7 j8 lavorava ld sesso stagepl tirocin1 vl ;
run;


/* ------------------ prove --------------------------------*/
proc logistic data=lib.dforces descending;
class fac j12 j22;
model j9 = fac cde2_g cde2_i
j1 j10 j11 j12 j13 j14 j2 j3 j4 j5 j6 j7 j8 j22 lavorava ld sesso stagepl tirocin1 vl ;
where tid="T4" and j9 ^= .;
run;


proc freq data=lib.dforces;
tables cde * tid;
* where TID="T4";
run;
proc freq data=lib.dforces;
tables cde1_a * j9;
where TID="T4";
run;
proc freq data=lib.dforces;
tables j9dic * j6cl;
tables j9dic * j7cl;
tables j9dic * j8cl;
tables j9dic * j13cl;
tables j9dic * j1cl;
where TID="T4";
run;
proc freq data=lib.dforces;
tables cde1_a * tid;
run;
proc freq data=lib.dforces;
tables lavorava * b8;
where fac="fac03" and tid="T4";
run;
