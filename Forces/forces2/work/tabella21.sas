*--- Captor System data import procedure for SAS release V8 ------------;
/* tabella 2, 2 con pesi, 3, 3bis, 3 con pesi                           */
/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas'; */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas'; */
/* FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';  */
/* LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces2\work\sas'; */
/* LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces2\work\sas'; */
/* FILENAME QBase '\\Kaos\Lan\Users\Mario\forces2\work\db1.mdb'; */ 

LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb'; 
options nocenter;
options pagesize = 200;

data lib.dforces01;
set lib.dforces;
var01=uid;
if tid="." then delete;
if tid="" then delete; /* 158 non sono missing, sono solo vuoti */
/* missing lavorava al tempo 0 = non lavorava */
if lavorava="." then lavorava=0;
lav6=0;
if tid="T1" then b8t1=b8;
if tid="T2" then b8t2=b8;
/* cosa fa chi non lavora   */
studia=0;
if ((i1dr^=4) or (i1er^=4) or (i1fr^=4) or (i1gr^=4) or (i1hr^=4)) then studia = 1;
if b8=. then delete;  /* validi solo rispondendti a b8 cosa fa? studia o lavora? */
run;
data lib.dforces01;
set lib.dforces01;
retain b8t1  0; 
retain b8t2  0;

if b8=1 then do; 
    if lavorava=1 then lav6=1;
    if lavorava=0 then lav6=0;
    if b8t1=1 then lav6=2;
    if b8t1=2 then lav6=3;
    if b8t1=3 then lav6=4; 
    if b8t2=1 then lav6=5;
    if b8t2=2 then lav6=6;
    if b8t2=3 then lav6=7;    
 end;
run;
 data lib.dforces01; 
 set lib.dforces01;
 cercalav=0;  /* 0=no 1=si  */
 if f4=1 or g3=1 then cercalav =1; 
 /* cercalavoro anche C9, ma solo per chi gia lavora e questo non e il caso */
 run;
 proc freq; 
/*tables tid  / norow nocol nocum;
tables lavorava  / norow nocol nocum; */
tables b8 * lavorava * tid;  
/*tables b8 * tid;     /* lavorava o meno ai tempi tid */
/*tables lav6 * tid;   /* cosa faceva 6 mesi prima */
tables b8t1 * tid;
tables b8t2 * tid; 
tables lav6; 
tables lavorava * b8 * tid;
tables lavorava; 
tables studia * tid;
tables B8 *  tid;
tables B8 * studia * tid;
tables B8 * cercalav * tid;
run; 
proc freq;
tables b8 * tid;
tables lavorava;
tables B8 * studia * tid;
tables B8 * cercalav * tid;
tables lavorava * b8 * tid;
weight peso;
run; 
/* suddivisione non lavora nelle tabelle 3.1 3.2  */
proc freq;
tables lavorava * b8 * tid;
tables lavorava * studia * tid;
tables lavorava * cercalav * tid;
tables lavorava * tid;
run;
proc freq;
tables studia * tid;
tables cercalav * tid;
* where b8=2;
run;
proc freq;
tables studia * tid;
tables cercalav * tid;
* where b8=2;
weight peso;
run;
proc freq;
tables f4 ;
tables g3 ;
where tid="T1";
run;