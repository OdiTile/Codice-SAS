*--- Captor System data import procedure for SAS release V8 ------------;
/* file tabella5.sas                                                    */
/* calcolo valori tabella 5.1 - 5.2       02-02-06                      */
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
retain varb81 varb82  varb83 varb84 varb85  0; /* determina cosa faceva 6 mesi prima */
varb86=0;                                 /* varb86 indica cosa faceva 6 mesi prima  */
if tid="T1" then do;
  if b8=1 then varb81=1; else varb81=2; end;
if tid="T2" then do;
  if b8=1 then varb82=1; else varb82=2; end;
if tid="T3" then do;
  if b8=1 then varb83=1; else varb83=2; end;
if tid="T4" then do;
  if b8=1 then varb84=1; else varb84=2; end;
if tid="T5" then do;
  if b8=1 then varb85=1; else varb85=2; end;

if tid= "T1" then do;
  if lavorava=0 then varb86=2;
  else varb86=1; end;
if tid= "T2" then varb86=varb81;
if tid= "T3" then varb86=varb82;
if tid= "T4" then varb86=varb83;
if tid= "T5" then varb86=varb84;
if tid= "T6" then varb86=varb85; 
cl=0; if c2 in (2, 3) then cl=1;  /*cambiato lavoro  */
run;

proc freq data=lib.dforces01; /* tabella 5 riga 7  */
tables varb86 * cl * tid;
run;
proc freq data=lib.dforces01;
tables varb86 * cl * tid;
weight peso;
run;









/* tabella 5.2  */
data lib.dforces01; /* ordina per tid descending per togliere non rispondenti */
set lib.dforces01;
proc sort data=lib.dforces01; by uid descending tid; run;
/* 	abbiamo compresenza tra t0 e t1 -- dataset lib.dforces01 */
/*	compresenza t1 e t2             -- dataset lib.dforces02 */
/*	compresenza t2 e t3             -- dataset lib.dforces03 */
data lib.dforces02;
set lib.dforces01;  /* dataset per dati longitudinali elimina a ritroso*/
retain vart2 0 ;
if tid='T2' then do; vart2=1; output; end;
if tid='T1' and vart2=1 then do; vart2=0; output; end;
run;
data lib.dforces03;
set lib.dforces01;  /* dataset per dati longitudinali */
retain vart3 0;
if tid='T3' then do; vart3=1; output; end;
if tid='T2' and vart3=1 then do; vart3=0; output; end;
run;
proc sort data=lib.dforces01; by uid tid; run; /* riordino ascendenti */
proc sort data=lib.dforces02; by uid tid; run;
proc sort data=lib.dforces03; by uid tid; run;
data lib.dforces02;
set lib.dforces02;  /* dataset per dati longitudinali elimina in avanti*/
retain vart1 0 ;
if tid='T1' then do; vart1=1; output; end;
if tid='T2' and vart1=1 then do; vart1=0; output; end;
run;
data lib.dforces03;
set lib.dforces03;  /* dataset per dati longitudinali */
retain vart2 0;
if tid='T2' then do; vart2=1; output; end;
if tid='T3' and vart2=1 then do; vart2=0; output; end;
data lib.dforces01;
set lib.dforces01;
/*  tab 5.2 indica cl verso 6 mesi prima  */
/* devo confrontare tempi diversi per cl e cde1_f */
retain cde1_f1 cde1_f2 cde1_f3 cde1_f6 0 ; /*posizione professionale */
if tid= "T1" then cde1_f1=cde1_f; 
if tid= "T2" then cde1_f2=cde1_f;
if tid= "T3" then cde1_f3=cde1_f;
run;
data lib.dforces01;
set lib.dforces01;
retain cde1_d1 cde1_d2 cde1_d3 cde1_d6 0 ; /* rapporto di lavoro     */
if tid= "T1" then cde1_d1=cde1_d;
if tid= "T2" then cde1_d2=cde1_d;
if tid= "T3" then cde1_d3=cde1_d;
run;
data lib.dforces01;
set lib.dforces01;
retain j111 j112 j113 j116 0; /* attivita svolta specifica  */
if tid= "T1" then j111=j11;
if tid= "T2" then j112=j11;
if tid= "T3" then j113=j11;
run;
data lib.dforces01;
set lib.dforces01;
if tid= "T1" then cde1_f6=cde1_f1; 
if tid= "T2" then cde1_f6=cde1_f1;
if tid= "T3" then cde1_f6=cde1_f2;

if tid= "T1" then cde1_d6=cde1_d1;
if tid= "T2" then cde1_d6=cde1_d1;
if tid= "T3" then cde1_d6=cde1_d2;

if tid= "T1" then j116=j111;
if tid= "T2" then j116=j111;
if tid= "T3" then j116=j112; 
run;
proc freq;
tables j11 * tid;
tables cl * cde1_d * tid;
tables b8 * j11 * tid;
tables cde1_f;
run;
/* calcolo sulla posizione di arrivo  */
/* proc freq;  
tables cl * tid;
tables cl * cde1_f6 * tid;
tables cl * cde1_d6 * tid;
tables cl * j116 * tid;
run; 
proc freq;
tables cl * cde1_f6 * tid;
tables cl * cde1_d6 * tid;
tables cl * j116 * tid;
weight peso;
run;  */
proc freq;
tables cl * tid;
tables cl * cde1_f * tid;
tables tid * cde1_f * cl;
tables cl * cde1_d * tid;
tables tid * cde1_d * cl;
tables cl * j11 * tid;
tables tid * j11 * cl;
run; 
proc freq;
/* tables cl * cde1_f * tid;
tables cl * cde1_d * tid;
tables cl * j11 * tid; */
tables tid * cde1_f * cl;
tables tid * cde1_d * cl;
tables tid * j11 * cl;
weight peso;
run;

data lib.dforces01;
set lib.dforces01;
run;
proc freq;
tables cde1_d * cl ;
where tid = "T1";
run;
proc freq;
tables cde1_d * cl ;
where tid = "T2";
run;
proc freq;
tables cde1_d * cl ;
where tid = "T3";
run;

proc freq;
tables cde1_d * cl ;
where tid = "T1";
weight peso;
run;
proc freq;
tables cde1_d * cl ;
where tid = "T2";
weight peso;
run;
proc freq;
tables cde1_d * cl ;
where tid = "T3";
weight peso;
run;

data lib.dforces01;
set lib.dforces01;
run;
proc freq;
tables j11 * cl ;
where tid = "T1";
run;
proc freq;
tables j11 * cl ;
where tid = "T2";
run;
proc freq;
tables j11 * cl ;
where tid = "T3";
run;

proc freq;
tables j11 * cl ;
where tid = "T1";
weight peso;
run;
proc freq;
tables j11 * cl ;
where tid = "T2";
weight peso;
run;
proc freq;
tables j11 * cl ;
where tid = "T3";
weight peso;
run;

proc freq;
tables cde1_d * tid;
tables j11 * tid;
where b8=1 and tid = "T1";
run;
proc freq;
tables cde1_d * tid;
tables j11 * tid;
where b8=1 and tid = "T2";
run;
proc freq;
tables cde1_d * tid;
tables j11 * tid;
where b8=1 and tid = "T3";
run;

proc freq data=lib.dforces01; /*righe 1 2 3 tabella 5 */
tables tid * cde1_d * cl ;
run;
proc freq;
tables tid * cde1_d * cl ;
weight peso;
run;
