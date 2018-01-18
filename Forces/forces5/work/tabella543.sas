*--- Captor System data import procedure for SAS release V8 ------------;
/* tabella 4, 4.1, 4.2     */
   LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces5\work\sas';  
   LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces5\work\sas';  
   FILENAME QBase '\\Kaos\Lan\Users\Mario\forces5\source\RBase.mdb';  

* LIBNAME LIB 'C:\Documents and Settings\barney\dati\lav\forces5\work\sas'; 
* LIBNAME LIBRARY 'C:\Documents and Settings\barney\dati\lav\forces5\work\sas'; 
* FILENAME QBase 'C:\Documents and Settings\barney\dati\lav\forces5\source\RBase.mdb'; 

* LIBNAME LIB 'C:\Documents and Settings\herman\dati\lav\forces5\work\sas'; 
* LIBNAME LIBRARY 'C:\Documents and Settings\herman\dati\lav\forces5\work\sas'; 
* FILENAME QBase 'C:\Documents and Settings\herman\dati\lav\forces5\source\RBase.mdb'; 

options nocenter;
options pagesize = 200;

data lib.dforces01;
set lib.dforces;
/* missing lavorava al tempo 0 = non lavorava */
if lavorava="." then lavorava=0;
if b8=. then delete;
/* cosa fa chi non lavora   */
studia=0;
if ((i1dr^=4) or (i1er^=4) or (i1fr^=4) or (i1gr^=4) or (i1hr^=4)) then studia = 1;
cercalav=0;  /* 0=no 1=si  */
if f4=1 or g3=1 then cercalav =1; 
/* cercalavoro anche C9, ma solo per chi gia lavora e questo non e il caso */
run;
data lib.dforces01;  
set lib.dforces01;
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
run;
proc freq data=lib.dforces01;
tables b8 * tid;
* weight peso;
run;
proc freq data=lib.dforces01;
tables b8 * tid;
weight peso;
run;
proc freq data=lib.dforces01;
tables varb86 * b8*tid;
weight peso;
run;   /* risultati per compilare la tabella 4 */

proc freq data=lib.dforces01; /* totale tab 5 */
tables b8 * tid;
where varb86=1;
run;



