*--- Captor System data import procedure for SAS release V8 ------------;
/* tabella 4, 4.1, 4.2     */
LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';
LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';
FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';
options nocenter;
options pagesize = 200;

data lib.dforces01;
set lib.dforces;
/* missing lavorava al tempo 0 = non lavorava */
if lavorava="." then lavorava=0;
run;
proc freq;
tables b8 * tid;
tables lavorava * tid;
tables b8 * lavorava * tid;
run;
data lib.dforces01; /* ordina per tid descending per togliere non rispondenti */
set lib.dforces01;
proc sort data=lib.dforces01; by uid descending tid; run;

data lib.dforces02;
set lib.dforces01;  /* dataset per dati longitudinali */
/* tengo tutti i t3 e cancello t2 e t1 che non rispondono a  t3 */
retain vart1 vart2 vart3 0 ;
if tid = "T3" then do; /* versione con output */
   vart3=1; vart2=0; vart1=0; output; end;
if tid = "T2" then do;
  if vart3=1 then do vart2=1; vart1=0; output; end;
  else do vart3=0; vart2=0; vart1=0; end; end;
if tid = "T1" then do;
  if (vart2=1 and vart3=1) then do
    vart3=0; vart2=0; vart1=0; output; end; /* tutto ok, tengo il record */
  else do vart3=0; vart2=0; vart1=0; end; end;
run;
/*proc freq;
tables tid;
run; */
/* data lib.dforces02;  
set lib.dforces02; */
proc sort data=lib.dforces02; by uid tid; run; /* riordino ascendenti */
data lib.dforces02;  
set lib.dforces02; 
/* tengo i t3 che  hanno t1, se serve fare analogo per t2 */
retain vt1 vt2 vt3 0 ; 
if tid = "T1" then do; vt1=1; vt2=0; vt3=0; output; end;
if tid = "T2" then do; vt2=0;  output; end;
if vt1=1 and tid="T3" then do; vt1=0; vt2=0; vt3=1; output; end; 
run;
/* proc freq;
tables tid;
run; */
data lib.dforces02;  
set lib.dforces02;
retain varb81 varb82  varb83 varb86 0; /* varb86 indica cosa faceva 6 mesi prima    */
if tid= "T1" then varb81=b8;
if tid= "T2" then varb82=b8;
if tid= "T3" then varb83=b8;
if tid= "T1" then do;
  if lavorava=0 then varb86=2;
  else varb86=1; end;
if tid= "T2" then varb86=varb81;
if tid= "T3" then varb86=varb82;
/*retain t1b8 t2b8 t3b8;
if tid="T1" and b8=1 then t1b8=1;
if tid="T1" and b8=2 then t1b8=2;
if tid="T2" and b8=1 then t2b8=1;
if tid="T2" and b8=2 then t2b8=2;
if tid="T3" and b8=1 then t3b8=1;
if tid="T3" and b8=2 then t3b8=2; */
run;
proc freq;
tables varb86 * tid;
tables b8 * tid;
tables  b8 * varb86 * tid;
tables lavorava * tid ;
tables b8 * lavorava * tid;
/*tables t1b8 * t2b8;
tables t2b8 * t3b8; */
tables tid * varb86 * b8;
tables tid * varb81 * varb82;
tables tid * varb82 * varb83;
run; 


