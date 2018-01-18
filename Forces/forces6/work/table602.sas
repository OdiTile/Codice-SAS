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

Data lib.dforces23; set lib.dforces23;
retain j9t2 j9t3 0;
if TID="T2" then j9t2=j9; 
if TID="T3" then j9t3=j9;      run;
proc freq data=lib.dforces23; /* tabella centrale */
tables j9t3 * j9t2  /agree  printkwt ;
test wtkap; where TID="T3";
run;
proc freq data=lib.dforces23;
tables j9t3 * j9t2 ;
where TID="T3";
weight peso;
run;
/* calcolo di C e D coerenza di ex occupati e di chi sara' occupato T1 T2 */
Data lib.dforces23; set lib.dforces23;
j90=j9; tid0=tid; /*riporto per comodita'*/
run;
proc freq data=lib.dforces23;
tables tid;
where j9=.;
run;
proc freq data=lib.dforces23; /*penultima colonna */
tables j9t3;
where tid="T3" and j9t2=.;
run;
proc freq data=lib.dforces23;
tables j9t3;
where tid="T3" and j9t2=.;
weight peso;
run;
proc freq data=lib.dforces23; /* ultima colonna */
tables j9t3 ;
where tid="T3"  ;
run;
proc freq data=lib.dforces23; 
tables j9t3 ;
where tid="T3"  ;
weight peso;
run;
/* proc freq data=lib.dforces23;
tables j9t2;
where tid="T2" and j9t3=.;
run; */
Data lib.dforces23; set lib.dforces23;
npo=0;
if (j9t2 ne .) and (j9t3 = .) and (tid0="T3") then npo = 1;else npo=0;
run;
proc freq data=lib.dforces23; /* penultima riga */
tables j9t2;
where npo=1;
run;
proc freq data=lib.dforces23;
tables j9t2;
where npo=1;
weight peso; run;
proc freq data=lib.dforces23; /* ultima riga */
tables j9t2;
where tid="T2";
run;
proc freq data=lib.dforces23; 
tables j9t2;
where tid="T2";
weight peso ; run;

/* periodo 3 4 */
Data lib.dforces34; set lib.dforces34;
retain j9t3 j9t4 0;
if TID="T3" then j9t3=j9; 
if TID="T4" then j9t4=j9;      
j90=j9; tid0=tid; /*riporto per comodita'*/
run;
proc freq data=lib.dforces34;  /* tabella centrale */
tables j9t4 * j9t3  /agree  printkwt ; 
test wtkap; where TID="T4"; run;
proc freq data=lib.dforces34;
tables j9t4 * j9t3 ; where TID="T4"; 
weight peso ; run;
Data lib.dforces34; set lib.dforces34; /* penultima riga */
npo=0;
if (j9t3 ne .) and (j9t4 = .) and (tid0="T4") then npo = 1;else npo=0;
run;
proc freq data=lib.dforces34;
tables j9t3;
where npo=1 ; run;
proc freq data=lib.dforces34;
tables j9t3;
where npo=1 ; weight peso; run;
proc freq data=lib.dforces34; /* ultima riga */
tables j9t3;
where tid="T3"; run;
proc freq data=lib.dforces34; 
tables j9t3;
where tid="T3"; weight peso; run;
proc freq data=lib.dforces34; /* penultima colonna */
tables j9t4 ;
where tid="T4" and j9t3=. ; run;
proc freq data=lib.dforces34;
tables j9t4 ;
where tid="T4" and j9t3=. ; weight peso; run;
proc freq data=lib.dforces34; /* ultima colonna */
tables j9t4 ;
where tid="T4"  ;  run;
proc freq data=lib.dforces34;
tables j9t4 ;
where tid="T4"  ; weight peso; run;
/* periodo 4 5 */
Data lib.dforces45; set lib.dforces45;
retain j9t4 j9t5 0;
if TID="T4" then j9t4=j9; 
if TID="T5" then j9t5=j9;      
j90=j9; tid0=tid; /*riporto per comodita'*/
run;
proc freq data=lib.dforces45;  /* tabella centrale */
tables j9t5 * j9t4  /agree  printkwt ;
test wtkap; where TID="T5"; run;
proc freq data=lib.dforces45; 
tables j9t5 * j9t4 ;
where TID="T5"; weight peso; run;
Data lib.dforces45; set lib.dforces45; /* penultima riga */
npo=0;
if (j9t4 ne .) and (j9t5 = .) and (tid0="T5") then npo = 1;else npo=0;
run;
proc freq data=lib.dforces45;
tables j9t4;
where npo=1 ; run;
proc freq data=lib.dforces45;
tables j9t4;
where npo=1 ; weight peso; run;
proc freq data=lib.dforces45; /* ultima riga */
tables j9t4;
where tid="T4"; run;
proc freq data=lib.dforces45; 
tables j9t4;
where tid="T4"; weight peso; run;
proc freq data=lib.dforces45; /* penultima colonna */
tables j9t5 ;
where tid="T5" and j9t4=. ; run;
proc freq data=lib.dforces45; 
tables j9t5 ;
where tid="T5" and j9t4=. ; weight peso; run;
proc freq data=lib.dforces45; /* ultima colonna */
tables j9t5 ;
where tid="T5"  ; run;
proc freq data=lib.dforces45; 
tables j9t5 ;
where tid="T5"  ; weight peso;  run;

/* periodo 5 6 */
Data lib.dforces56; set lib.dforces56;
retain j9t5 j9t6 0;
if TID="T5" then j9t5=j9; 
if TID="T6" then j9t6=j9;      
j90=j9; tid0=tid; /*riporto per comodita'*/
run;
proc freq data=lib.dforces56; /* tabella centrale */
tables j9t6 * j9t5  /agree  printkwt ;
test wtkap; where TID="T6"; run;
proc freq data=lib.dforces56; 
tables j9t6 * j9t5 ;
where TID="T6"; weight peso ; run;
Data lib.dforces56; set lib.dforces56; /* penultima riga */
npo=0;
if (j9t5 ne .) and (j9t6 = .) and (tid0="T6") then npo = 1;else npo=0;
run;
proc freq data=lib.dforces56;
tables j9t5;
where npo=1 ; run;
proc freq data=lib.dforces56;
tables j9t5;
where npo=1 ; weight peso; run;
proc freq data=lib.dforces56; /* ultima riga */
tables j9t5;
where tid="T5"; run;
proc freq data=lib.dforces56;
tables j9t5;
where tid="T5"; weight peso; run;
proc freq data=lib.dforces56; /* penultima colonna */
tables j9t6 ;
where tid="T6" and j9t5=. ; run;
proc freq data=lib.dforces56;
tables j9t6 ;
where tid="T6" and j9t5=. ; weight peso; run;
proc freq data=lib.dforces56; /* ultima colonna */
tables j9t6 ;
where tid="T6"  ; run;
proc freq data=lib.dforces56; 
tables j9t6 ;
where tid="T6"  ; weight peso; run;
