*--- Captor System data import procedure for SAS release V8 ------------;

LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';
LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';
FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';
options nocenter;
options pagesize = 200;

data lib.dforces01;
set lib.dforces;
/* missing lavorava al tempo 0 = non lavorava */
if lavorava="." then lavorava=0;
/* If tid ^= "T3" then delete; */ /* tengo i validi in t3 */
/* varuid = uid; */
/* keep uid tid b8 varuid; */
run;
proc sort data=lib.dforces01; by uid tid; run; 
data lib.dforces01;
set lib.dforces01;
retain varb81 varb82  varb83 varb86 0;
if tid= "T1" then varb81=b8;
if tid= "T2" then varb82=b8;
if tid= "T3" then varb83=b8;
if tid= "T1" then do;
  if lavorava=0 then varb86=2;
  else varb86=1; end;
if tid= "T2" then varb86=varb81;
if tid= "T3" then varb86=varb82;

run;

data lib.dforces01;
set lib.dforces01;
proc freq;
tables varb86 * tid;
tables b8 * tid;
tables  b8 * varb86 * tid;
tables lavorava * tid ;
run;
 
/* proc sort data=lib.dforces01; by uid tid; run; */ 
/* proc sort data=lib.dforces; by uid; run; */
/* data lib.dforces02;
merge lib.dforces lib.dforces01;
by uid; 
run;
data lib.dforces02;
set lib.dforces02;
proc freq;
tables b8 * tid;
run; */