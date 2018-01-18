/* file tabella6.sas     7 giugno 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella7.sas */
/* tabella7.sas    tabella 7                              */
/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';         */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';     */
/* FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';  */
/* LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';        
 LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';    
 FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb'; */
 LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces2\work\sas';
LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces2\work\sas';
FILENAME QBase '\\Kaos\Lan\Users\Mario\forces2\work\db1.mdb'; 
options nocenter;
options pagesize = 200;

data lib.dforces01;
set lib.dforces;
/* missing lavorava al tempo 0 = non lavorava */
if lavorava="." then lavorava=0;
if b8=. then delete;
varn1k1=0; varn1k2=0; varn1k3=0;
/* raggruppamento dei percorsi attivi per la ricerca del lavoro N1K  */
if n1k_1=1 then varn1k1=1;
if n1k_2=1 then varn1k1=1;
if n1k_3=1 then varn1k2=1;
if n1k_4=1 then varn1k2=1;
if n1k_5=1 then varn1k3=1;
/* invio diretto di curriculum  */
varn1b=0; if n1b=2 then varn1b=1;
run;
data lib.dforces01;
set lib.dforces01;
/* pric indica il numero di percorsi di ricerca attiva del lavoro */
retain prict10 prict20 prict30 prict11 prict21 prict31 0 ;
pric=0; mpric=0;
If n1k_1=1 then pric = pric + 1;
If n1k_2=1 then pric = pric + 1;
If n1k_3=1 then pric = pric + 1;
If n1k_4=1 then pric = pric + 1;
If n1k_5=1 then pric = pric + 1;
If n1k_6=1 then pric = pric + 1;
If n1b=2 then pric = pric + 1;
if n1d in ('1','2') then pric = pric + 1;
If n1d=3 then pric = pric + 2;
If n1f in ('1','2','3','4','5') then pric = pric + 1;
If n1m in ('2','3','4','5') then pric = pric + 1;
if (tid = "T1" & lavorava=1) then prict11 = prict11 + pric;
if (tid = "T1" & lavorava=0) then prict10 = prict10 + pric;
if (tid = "T2" & lavorava=1) then prict21 = prict21 + pric;
if (tid = "T2" & lavorava=0) then prict20 = prict20 + pric;
if (tid = "T3" & lavorava=1) then prict31 = prict31 + pric;
if (tid = "T3" & lavorava=0) then prict30 = prict30 + pric;
pub=0; priv=0; est=0; aut=0; totatt=0;
if n1m in ( 2 , 3 , 4 , 5 , 6 ) then pub=1;
if n1a = 1 then priv=1;
if n3 in ( 1 , 2 , 3 ) then est=1;
if n1a = 2 then aut=1;

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
proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per pub tid per la proc mean */
by varb86 tid; run;
proc freq;
tables pric * tid ;
run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by varb86 tid;
weight peso;
run;

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per pub tid per la proc mean */
by pub tid; run;
/*data lib.dforces01tid;
set lib.dforces01tid;
if pub=1 then output;
run; */
proc means data=lib.dforces01tid n sum mean;
var pric;
by pub tid;
weight peso;
run;
data lib.dforces01tid;
set lib.dforces01tid;
totatt=.;
if (pub =1 or priv=1 or est=1 or aut=1) then totatt=pub + priv + est + aut;
attiv=0;
if pub=1 then attiv=1;
if priv=1 then attiv=2;
if est=1 then attiv=3;
if aut=1 then attiv=4;
run;
proc freq;
tables pric * tid;
* where pub = 1;
run;
proc freq;
tables pub * tid;
tables totatt * tid;
tables attiv * tid;
run;

/* proc freq;
tables pric * tid ;
weight peso;
run; */
proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per pub tid per la proc mean */
by tid lavorava; run;

proc means data=lib.dforces01tid n sum mean;
var pric;
by tid lavorava;
* where pric ^= 0;
weight peso;
run;
proc freq data=lib.dforces01tid;
tables pric * tid;
run;
proc freq data=lib.dforces01tid;
tables pric * tid;
weight peso;
run;

proc means data=lib.dforces01tid n sum mean;
var prict2;
by tid lavorava;
* where pric ^= 0;
weight peso;
run;
proc freq data=lib.dforces01tid;
tables prict2 * tid;
run;
proc freq data=lib.dforces01tid;
tables prict2 * tid;
weight peso;
run;

proc means data=lib.dforces01tid n sum mean;
var prict3;
by tid lavorava;
* where pric ^= 0;
weight peso;
run;
proc freq data=lib.dforces01tid;
tables prict3 * tid;
run;
proc freq data=lib.dforces01tid;
tables prict3 * tid;
weight peso;
run;

proc sort data=lib.dforces01 out=lib.dforces01;
by uid tid ; run;

data lib.dforces01;
set lib.dforces01;
retain prict2 prict3 0;
if tid="T1" then do; 
	prict2=pric;
	prict3=pric;
end;
if tid="T2" then do; 
	prict2=prict2+pric;
	prict3=prict3+pric;
end;
if tid="T3" then do; 
	prict3=prict3+pric;
end;
if prict2>10 then prict2=10;
if prict3>10 then prict3=10;
run;
proc freq data=lib.dforces01;
tables pric * lavorava;
where tid ="T1";
weight peso;
run;
proc freq data=lib.dforces01;
tables prict2 * lavorava;
where tid="T2";
weight peso;
run;
proc freq data=lib.dforces01;
tables prict3 * lavorava;
where tid="T3";
weight peso;
run;
proc freq;
tables pric;
where tid= "T1";
run;
proc freq;
tables prict2;
where tid= "T2";
run;
proc freq;
tables prict3;
where tid= "T3";
run;
**********************  compresenze totali **************;
proc sort data=lib.dforces01 out=lib.dforces05;
by uid descending tid ; run;

data lib.dforces04;
set lib.dforces05;
retain vart3 0;
if tid='T3' then do; vart3=1; output; end;
if tid='T2'  and vart3=1 then  do; vart3=0; output; end;
if tid='T1' then output;
run;

data lib.dforces04;
set lib.dforces04;
retain vart2 0;
if tid='T3' then output;
if tid='T2'  then  do; vart2=1; output; end;
if ( tid='T1'  and vart2=1) then  do; vart2=0; output; end;
run;
data lib.dforces05;
set lib.dforces05;
retain vart2 0;
if tid='T3' then output;
if tid='T2'  then  do; vart2=1; output; end;
if ( tid='T1'  and vart2=1) then  do; vart2=0; output; end;
run;
proc freq data=lib.dforces05;
tables b8 * tid;
run;
proc freq data=lib.dforces04;
tables b8 * tid;
run;
proc sort data=lib.dforces04 out=lib.dforces04;  /* compresenze t1 - t2 - t3 */
by uid tid ; run;
proc sort data=lib.dforces05 out=lib.dforces05;  /* compresenza t1 - t2 */
by uid tid ; run;
proc freq data=lib.dforces04;
tables pric * tid;
run;
******************************  tempo t0 - t3 **************;
data lib.dforces04;
set lib.dforces04;
retain prict3 0;
if tid="T1" then do; 
	prict3=pric;
end;
if tid="T2" then do; 
	prict3=prict3+pric;
end;
if tid="T3" then do; 
	prict3=prict3+pric;
end;
if prict3>12 then prict3=12;
run;
proc freq data=lib.dforces04;
tables prict3 * tid;
run;
proc freq data=lib.dforces04;
tables prict3 * tid;
weight peso;
run;
proc freq data=lib.dforces04;
tables prict3 * lavorava;
where tid='T3';
run;
proc freq data=lib.dforces04;
tables prict3 * lavorava;
where tid='T3';
weight peso;
run;
******************************  tempo t0 - t2 **************;
data lib.dforces05;
set lib.dforces05;
retain prict2 0;
if tid="T1" then do; 
	prict2=pric;
end;
if tid="T2" then do; 
	prict2=prict2+pric;
end;
 /* if tid="T3" then do; 
	prict3=prict3+pric;
end; */
if prict2>12 then prict2=12;
run;
proc freq data=lib.dforces05;
tables prict2 * tid;
where tid='T2';
run;
proc freq data=lib.dforces05;
tables prict2 * tid;
where tid='T2';
weight peso;
run;
proc freq data=lib.dforces05;
tables prict2 * lavorava;
where tid='T2';
run;
proc freq data=lib.dforces05;
tables prict2 * lavorava;
where tid='T2';
weight peso;
run;
******************************  tempo t0 - t1 **************;
proc freq data=lib.dforces01;
tables pric * tid;
run;
proc freq data=lib.dforces01;
tables pric * tid;
weight peso;
run;
proc freq data=lib.dforces01;
tables pric * lavorava;
where tid='T1';
run;
proc freq data=lib.dforces01;
tables pric * lavorava;
where tid='T1';
weight peso;
run;
********************************;
proc freq data=lib.dforces;
* tables n1k_1 * tid;
tables n1b * tid;
tables n1d * tid;
tables n1f * tid;
tables n1m * tid;
 where tid='T1';
* weight peso;
run;