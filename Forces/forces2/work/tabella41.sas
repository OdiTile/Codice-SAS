*--- Captor System data import procedure for SAS release V8 ------------;
/* tabella 4, 4.1, 4.2     */
/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';        */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';    */
/* FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb'; */
LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb'; 
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
retain varb81 varb82  varb83  0; /* determina cosa faceva 6 mesi prima      */
varb86=0;                        /* varb86 indica cosa faceva 6 mesi prima  */
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
retain studia1 studia2  studia3  0; /* determina se studiava 6 mesi prima       */
studia6=0;                          /* studia6 indica se studiava 6 mesi prima  */
if tid= "T1" then studia1=studia;
if tid= "T2" then studia2=studia;
if tid= "T3" then studia3=studia;
                              /* non ha significato vedere a 6 mesi prima da T1 */
if tid= "T2" then studia6=studia1;
if tid= "T3" then studia6=studia2;
run;
data lib.dforces01;  
set lib.dforces01;
retain cercalav1 cercalav2  cercalav3 0; /* determina se cercava lavoro 6 mesi prima */
cercalav6=0;                      /* cercalav6 indica se cercava lavoro 6 mesi prima */
if tid= "T1" then cercalav1=cercalav;
if tid= "T2" then cercalav2=cercalav;
if tid= "T3" then cercalav3=cercalav;
                                   /* non ha significato vedere a 6 mesi prima da T1 */
if tid= "T2" then cercalav6=cercalav1;
if tid= "T3" then cercalav6=cercalav2;
run;
/*proc freq;*/    
/* verifica prima di togliere le mancate compresenze */
/* le non compresenze vengono eliminate automaticamente */
/*tables studia6 * b8 * tid; */
/*tables cercalav6 * b8 * tid; */
/*run; */
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
proc freq;
tables studia6 * b8 * tid;
tables cercalav6 * b8 * tid;
tables b8 * tid;
tables tid * lavorava * b8;
title 'compresenza t0 - t1 ';
run; 
proc freq;
tables studia6 * b8 * tid;
tables cercalav6 * b8 * tid;
tables b8 * tid;
tables tid * lavorava * b8;
title 'compresenza t0 - t1 --------------pesata----------------';
weight peso;
run; 
data lib.dforces02;  
set lib.dforces02;
proc freq;
tables studia6 * b8 * tid;
tables cercalav6 * b8 * tid;
tables b8 * tid;
tables tid * varb86 * b8;
title 'compresenza t1 - t2 ';
run; 
proc freq;
tables studia6 * b8 * tid;
tables cercalav6 * b8 * tid;
tables b8 * tid;
tables tid * varb86 * b8;
title 'compresenza t1 - t2  --------------pesata----------------';
weight peso;
run; 
proc freq;
tables studia6 * b8;
title 'compr t1 - t2  percentuale che studiava 6 mesi prima, pesata ';
where tid = "T2";
weight peso;
run;
proc freq;
tables cercalav6 * b8;
title 'compr t1 - t2  percentuale che cercava lavoro 6 mesi prima, pesata ';
where tid = "T2";
weight peso;
run;
data lib.dforces03;  
set lib.dforces03;
proc freq;
tables studia6 * b8 * tid;
tables cercalav6 * b8 * tid;
tables b8 * tid;
tables tid * varb86 * b8;
title 'compresenza t2 - t3 ';
run; 
proc freq;
tables studia6 * b8;
tables cercalav6 * b8;
tables b8 * tid;
tables tid * varb86 * b8;
title 'compresenza t2 - t3  --------------pesata----------------';
weight peso;
run; 
proc freq;
tables studia6 * b8;
tables cercalav6 * b8;
tables tid * varb86 * b8;
title 'compresenza t2 - t3  ';
where tid = "T3";
run; 
proc freq;
tables studia6 * b8;
tables cercalav6 * b8;
tables varb86 * b8;
title 'compresenza t2 - t3  --------------pesata----------------';
where tid = "T3";
weight peso;
run; 
proc freq;
tables studia6 * b8;
title 'compr t2 - t3  percentuale che studiava 6 mesi prima, pesata ';
where tid = "T3";
weight peso;
run;
proc freq;
tables cercalav6 * b8;
title 'compr t2 - t3  percentuale che cercava lavoro 6 mesi prima, pesata ';
where tid = "T3";
weight peso;
run;

data lib.dforces03;  
set lib.dforces03;
proc freq;
tables studia6 *tid;
tables cercalav6 * tid;
where b8=1;
run;
proc freq;
tables studia6 *tid;
tables cercalav6 * tid;
where b8=1;
weight peso;
run;

data lib.dforces01;  
set lib.dforces01;
proc freq;
tables varb86 *tid;
tables lavorava * tid;
where b8=1;
run;
proc freq;
tables varb86 *tid;
tables lavorava * tid;
where b8=1;
weight peso;
run;

data lib.dforces01;  
set lib.dforces01;
proc freq;
tables b8 *tid;
where varb86=1;
run;
proc freq;
tables b8 *tid;
where varb86=1;
weight peso;
run;
proc freq;
tables b8 *tid;
where varb86=2;
run;
proc freq;
tables b8 *tid;
where varb86=2;
weight peso;
run;

data lib.dforces03;  
set lib.dforces03;
proc freq;
tables b8 * studia6 *tid;
tables b8 * cercalav6 * tid;
run;
proc freq;
tables b8 * studia6 *tid;
tables b8 * cercalav6 * tid;
weight peso;
run;
proc freq;
tables varb86 * tid;
where b8=1;
run;
proc freq;
tables varb86 *tid;
where b8=1;
weight peso;
run;