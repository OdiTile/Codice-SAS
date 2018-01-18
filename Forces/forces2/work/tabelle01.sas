*--- Captor System data import procedure for SAS release V8 ------------;

/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';
LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';
FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';  */

LIBNAME LIB 'c:\Documents and Settings\barney\Documenti\forces\work\sas';
LIBNAME LIBRARY 'c:\Documents and Settings\barney\Documenti\forces\work\sas';
FILENAME QBase 'c:\Documents and Settings\barney\Documenti\forces\work\db1.mdb';
options nocenter;

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
/* data lib.dforces01; */
/* proc freq; */
/*tables tid  / norow nocol nocum;*/
/*tables lavorava  / norow nocol nocum;*/
/*tables b8 * lavorava * tid;*/
/*tables b8 * tid; */    /* lavorava o meno ai tempi tid */
/*tables lav6 * tid; */  /* cosa faceva 6 mesi prima */
/*tables b8t1 * tid;
tables b8t2 * tid; */
/*tables lav6; */
/* run; */
data lib.dforces02;  /* tengo solo i validi in t3 */
set lib.dforces01;
If tid ^= "T3" then delete;
var02=uid;
keep uid tid var02;
run;
/* proc sort data=lib.dforces01; by uid; run; */
/* proc sort data=lib.dforces02; by uid; run; */
data lib.dforces03;
merge lib.dforces02 lib.dforces01;
/* where var01=var02;*/
by uid; 
run;
data lib.dforces03;
set lib.dforces03;
if var01 ^= var02 then delete;
proc freq;
tables b8 * tid;
run;