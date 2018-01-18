*---table601.sas  <-  merge6.sas  <--  import61.sas ------------------------------------;
*--- Coerenza dei titoli universitari - le compresenze -----------------------16-07-06--;
/* Campioneforces B8 B8_before B8T0R C1A C2 -C2B- CDE CDE1 CDE1_A CDE1_C CDE1_D CDE1_E */
/* CDE1_F CDE1_G CDE2_I FAC J1 J10 J11 J12 J13 J14 J2 J22 J3 J4 J5 J6 J7 J8 J9         */

*LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces6\work\sas';  
*LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces6\work\sas';  
*FILENAME QBase '\\Kaos\Lan\Users\Mario\forces6\source\RBase070706.mdb';  

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

PROC SORT data=lib.dforces  out=lib.dforces ; BY UID TID; run;
data lib.dforces; set lib.dforces;
by uid;
* toglie dati senza interviste (sono 151) ;
if first.uid and last.uid then delete ;
run;
/* compresenza 1 2   */
PROC SORT data=lib.dforces  out=lib.dforces12 ; BY UID descending TID; run;
data lib.dforces12; set lib.dforces12;
by uid;
retain count comp12 0;
if first.uid=1 then count=1;
else count=count+1;
if first.uid=1 then comp12=0;
if count>1 and TID="T1" and lag(TID)="T2" then comp12=1;
run;
PROC SORT data=lib.dforces12  out=lib.dforces12 ; BY UID TID; run;
data lib.dforces12; set lib.dforces12;
by uid;
retain count 0;
if first.uid=1 then count=1;
else count=count+1;
if count>1 and TID="T2" and lag(TID)="T1" then comp12=1;
run;
data lib.dforces12; set lib.dforces12;
if (TID="T1" or TID="T2") and comp12=1 ; 
drop count comp12; run;

/* compresenza 2 3   */
PROC SORT data=lib.dforces  out=lib.dforces23 ; BY UID descending TID; run;
data lib.dforces23; set lib.dforces23;
by uid;
retain count comp23 0;
if first.uid=1 then count=1;
else count=count+1;
if first.uid=1 then comp23=0;
if count>1 and TID="T2" and lag(TID)="T3" then comp23=1;
run;
PROC SORT data=lib.dforces23  out=lib.dforces23 ; BY UID TID; run;
data lib.dforces23; set lib.dforces23;
by uid;
retain count 0;
if first.uid=1 then count=1;
else count=count+1;
if count>1 and TID="T3" and lag(TID)="T2" then comp23=1;
run;
data lib.dforces23; set lib.dforces23;
if (TID="T2" or TID="T3") and comp23=1 ; 
drop count comp23; run;


/* compresenza 3 4   */
PROC SORT data=lib.dforces  out=lib.dforces34 ; BY UID descending TID; run;
data lib.dforces34; set lib.dforces34;
by uid;
retain count comp34 0;
if first.uid=1 then count=1;
else count=count+1;
if first.uid=1 then comp34=0;
if count>1 and TID="T3" and lag(TID)="T4" then comp34=1;
run;
PROC SORT data=lib.dforces34  out=lib.dforces34 ; BY UID TID; run;
data lib.dforces34; set lib.dforces34;
by uid;
retain count 0;
if first.uid=1 then count=1;
else count=count+1;
if count>1 and TID="T4" and lag(TID)="T3" then comp34=1;
run;
data lib.dforces34; set lib.dforces34;
if (TID="T3" or TID="T4") and comp34=1 ; 
drop count comp34; run;


/* compresenza 4 5   */
PROC SORT data=lib.dforces  out=lib.dforces45 ; BY UID descending TID; run;
data lib.dforces45; set lib.dforces45;
by uid;
retain count comp45 0;
if first.uid=1 then count=1;
else count=count+1;
if first.uid=1 then comp45=0;
if count>1 and TID="T4" and lag(TID)="T5" then comp45=1;
run;
PROC SORT data=lib.dforces45  out=lib.dforces45 ; BY UID TID; run;
data lib.dforces45; set lib.dforces45;
by uid;
retain count 0;
if first.uid=1 then count=1;
else count=count+1;
if count>1 and TID="T5" and lag(TID)="T4" then comp45=1;
run;
data lib.dforces45; set lib.dforces45;
if (TID="T4" or TID="T5") and comp45=1 ; 
drop count comp45; run;

/* compresenza 5 6   */
PROC SORT data=lib.dforces  out=lib.dforces56 ; BY UID descending TID; run;
data lib.dforces56; set lib.dforces56;
by uid;
retain count comp56 0;
if first.uid=1 then count=1;
else count=count+1;
if first.uid=1 then comp56=0;
if count>1 and TID="T5" and lag(TID)="T6" then comp56=1;
run;
PROC SORT data=lib.dforces56  out=lib.dforces56 ; BY UID TID; run;
data lib.dforces56; set lib.dforces56;
by uid;
retain count 0;
if first.uid=1 then count=1;
else count=count+1;
if count>1 and TID="T6" and lag(TID)="T5" then comp56=1;
run;
data lib.dforces56; set lib.dforces56;
if (TID="T5" or TID="T6") and comp56=1 ; 
drop count comp56; run;

/* proc freq data=lib.dforces12; tables tid; run;
proc freq data=lib.dforces23; tables tid; run;
proc freq data=lib.dforces34; tables tid; run;
proc freq data=lib.dforces45; tables tid; run;
proc freq data=lib.dforces56; tables tid; run; */

/* Data lib.dforces12; set lib.dforces12;
if j9 = . then delete; run; */
Data lib.dforces12; set lib.dforces12;
retain j9t1 j9t2 0;
if TID="T1" then j9t1=j9; 
if TID="T2" then j9t2=j9;      run;
proc freq data=lib.dforces12;  /* tabella centrale */
tables j9t2 * j9t1 /agree  printkwt ;
test wtkap;
where TID="T2";
run;
proc freq data=lib.dforces12;
tables j9t2 * j9t1 ;
where TID="T2";
weight peso;
run;
proc freq data=lib.dforces;
tables b8*tid;
tables j9 * tid;
run;
/* calcolo di C e D coerenza di ex occupati e di chi sara' occupato T1 T2 */
Data lib.dforces12; set lib.dforces12;
j90=j9; tid0=tid; 
run;
proc freq data=lib.dforces12;
tables tid;
where j9=.;
run;
proc freq data=lib.dforces12;
tables j9t2;
where tid="T2" and j9t1=.;
run;
proc freq data=lib.dforces12; /*penultima colonna */
tables j9t2;
where tid="T2" and j9t1=. ;
weight peso;
run;
proc freq data=lib.dforces12; /*ultima colonna */
tables j9t2;
where tid="T2" ;
run;
proc freq data=lib.dforces12;
tables j9t2;
where tid="T2"  ;
weight peso;
run;
proc freq data=lib.dforces12;
tables j9t1;
where tid="T1" /*and j9t2=.*/;
run;
proc freq data=lib.dforces12; /* ultima riga */
tables j9t1;
where tid="T1";
weight peso;
run;
Data lib.dforces12; set lib.dforces12;
prova=0;
npo=0;
if j9t1=j90 then prova=1; else prova=0; 
if (j9t1 ne .) and (j9t2 = .) and (tid0="T2") then npo = 1;else npo=0;
run;
proc freq data=lib.dforces12;
tables npo;
run;
proc freq data=lib.dforces12; /*penultima riga */
tables j9t1;
where npo=1;
run;
proc freq data=lib.dforces12; 
tables j9t1;
where npo=1;
weight peso;
run;
/* proc freq data=lib.dforces12;
tables j9t2 * j9t1 /agree (wt=fc) printkwt;
test wtkap;
where TID="T2";
run;*/
