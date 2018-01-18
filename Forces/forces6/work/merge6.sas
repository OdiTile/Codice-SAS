*--- merge6.sas  <--  import61.sas --------------------------------------;
*--- Coerenza dei titoli universitari ------------------------07-07-06--;
/* Campioneforces B8 B8_before B8T0R C1A C2 -C2B- CDE CDE1 CDE1_A CDE1_C CDE1_D CDE1_E */
/* CDE1_F CDE1_G CDE2_I FAC J1 J10 J11 J12 J13 J14 J2 J22 J3 J4 J5 J6 J7 J8 J9  */

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

options nocenter;

/* primo passo*/ /* Le proc transpose*/
/* fine le proc traspose*/
/*Secondo passo*/
/* 1) Ricodifica delle variabili della sezione I con 1 e 0 compreso gli esperimenti ( p.e.i1b diventa i1br)
2) Correzione dei dati mancanti o errati (p.e dalla L1altro oppure dalla sezione H
3)Se i1_old=1 or i1=2 and i1br=. then tutti 0
4)per gli uid che non appartengono agli esperimenti si segue una procedura trascinando sia 1 che 0
invece per gli esperimenti dal tempo t3 in poi (vale solo per forces1) viene trascianti solo 0*/
/*ricodifica delle varibili della sezione I e degli esperimenti*/
/*terzo passo*/

/* il merge delle librerie*/

data dati_facolta;
merge
/*Sezione B*/
/* lib.b0a lib.b0b lib.b7a lib.b7bbis */
lib.b8 lib.b8_before lib.b8t0r 
/*Sezione C CDE CDE1 CDE2 CDE3*/
lib.c1a lib.c2 lib.c2b
lib.cde lib.cde_a
lib.cde1 lib.cde1_a lib.cde1_c lib.cde1_d lib.cde1_e lib.cde1_f lib.cde1_g
lib.cde2_g lib.cde2_i 
/* lib.fac1 */
/*Sezione F G H FGH*/
/* Sezione I J */
lib.i1 lib.i1c
lib.j1 lib.j10 lib.j11 lib.j12 lib.j13 lib.j14 lib.j2 lib.j22 lib.j3 lib.j4
lib.j5 lib.j6 lib.j7 lib.j8 lib.j9
/*Sezione N*/
lib.Tirocin;
by uid tid;
drop block date ;
run;

proc sort data=dati_facolta;
by uid tid;
run;

/* shift del i1b*/
/*shift i1c*/
/*shift i1d*/
/*shift i1e*/
/*shift i1f*/
/*shift i1g*/
/*shift i1h*/
/*shift i1i*/
/*shift i1j*/
/*shift i1k*/
/*shift i1l*/
/*shift i1m*/
/*shift i1n*/
/*shift i1d*/
/*shift del b8_before in quanto al forces1(T1 e T2) e forces2(T1) B8 aveva solo due opzioni. Nel b8_before
sono stati inseriti questi casi*/

data dati_facolta;
set dati_facolta;
if b8=. then b8=b8_before;
run;

/* shift del cde1_c*/
data dati_facolta;
set dati_facolta;
retain cde1_cx;
if (cde1_c^=. and b8=1) then cde1_cx=cde1_c;
if (tid ='T1' and cde1_c=. and b8=1) then cde1_cx=.;
if (tid^='T1' and  cde1 in (3) and cde1_c=. and b8=1) then cde1_c=cde1_cx;
run;

/* shift del cde1_d */
data dati_facolta;
set dati_facolta;
retain cde1_dx;
if (cde1_d^=. and b8=1) then cde1_dx=cde1_d;
if (tid ='T1' and cde1_d=. and b8=1) then cde1_dx=.;
if (tid^='T1' and  cde1 in (3) and cde1_d=. and b8=1) then cde1_d=cde1_dx;
run;

/* shift del cde1_e*/
data dati_facolta;
set dati_facolta;
retain cde1_ex;
if (cde1_e^=. and b8=1) then cde1_ex=cde1_e;
if (tid ='T1' and cde1_e=. and b8=1) then cde1_ex=.;
if (tid^='T1' and  cde1 in (3) and cde1_e=. and b8=1) then cde1_e=cde1_ex;
run;

/* Primo passo: a partire dalla variabile codifica si controllano le varibili 
della sezione I*/

/* se dice che non ha svolto l'attività di studio negli ultimi 6 mesi vengono compilate
le variabili della sezione I con la loro opzione (No)*/

data lib.dforces; /* merge finale con dati campione */
/* la variabile fac(dati_facolta) viene sovrascritta da fac(campioneforces)  */
merge dati_facolta lib.campioneforces ;
by uid; run;

data lib.dforces;
set lib.dforces;
if uid="000000" then delete; /* toglie il test */
if tid="." then delete;      /* toglie dati non validi */
if tid="" then delete; /* 158 non sono missing, sono solo non risposte */
run;
data lib.dforces;
set lib.dforces;
by uid; /* verificare che vi sia ordinamento su UID */
retain factmp ;
if first.uid then factmp=fac; else fac=factmp;
* propaga la facolta ai tempi successivi a T0 ;
run;
data lib.dforces;
set lib.dforces;
peso=1;
if fac='fac01' then peso=1.010695187;   /* agraria         */
if fac='fac02' then peso=1.743119266;   /* economia        */
if fac='fac03' then peso=1.43373494;    /* farmacia        */
if fac='fac04' then peso=1.651639344;   /* giurisprudenza  */
if fac='fac05' then peso=3.802005013;   /* ingegneria      */
if fac='fac06' then peso=2.130699088;   /* lettere         */
if fac='fac07' then peso=3.46728972;    /* medicina        */
if fac='fac08' then peso=1.30952381;    /* veterinaria     */
if fac='fac09' then peso=4.926829268;   /* psicologia      */
if fac='fac10' then peso=1.842975207;   /* formazione      */
if fac='fac11' then peso=1.623737374;   /* mmffnn          */
if fac='fac12' then peso=3.656565657;   /* scienze pol     */
if fac='fac13' then peso=1.572413793;   /* statistica      */
drop factmp;
run;
proc datasets library=lib;
delete B8 B8t0r B8_before;
delete C1a C2 C2b Campioneforces Cde Cde_a Cde1 Cde1_a Cde1_c Cde1_d cde1_e cde1_f cde1_g cde2_g cde2_i ;
delete Fac ;
delete I1 I1C J1 J10 J11 J12 J13 J14 J2 J22 J3 J4 J5 J6 J7 J8 J9 Tirocin;
run;
/* prove per i dati almalaurea */
proc freq data=lib.dforces; 
tables j1;
tables tirocin;  /* 1=si 2=no */
tables tirocin * j9;
where TID="T4";
/* weight peso; */
run;

