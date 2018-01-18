/* file tabella6.sas     7 giugno 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella7.sas */
/* tabella7.sas    tabella 7                              */
/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';         */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';     */
/* FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';  */
LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas'; 
LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb'; 
/* LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces2\work\sas'; */
/* LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces2\work\sas'; */
/* FILENAME QBase '\\Kaos\Lan\Users\Mario\forces2\work\db1.mdb'; */
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
pub=0; priv=0; est=0; aut=0;
if n1m in ( 2 , 3 , 4 , 5 , 6 ) then pub=1;
if n1a = 1 then priv=1;
if n3 in ( 1 , 2 , 3 ) then est=1;
if n1a = 2 then aut=1;
run;
/*proc freq;
tables pric;
tables pric * tid;
run;*/
/*proc print;
var prict11 prict10 prict21 prict20 prict31 prict30;
run;*/

 proc freq data=lib.dforces01;
tables pub * pric * tid;
tables priv *   tid;
tables est *  tid;
tables aut *  tid;
run;  

/* tabella 7.3  ----------------valori assoluti -------------------------*/
proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per pub tid per la proc mean */
by pub tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by pub tid;
run;

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per priv tid per la proc mean */
by priv tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by priv tid;
run; 

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per est tid per la proc mean */
by est tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by est tid;
run; 

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per aut tid per la proc mean */
by aut tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by aut tid;
run; 
proc freq;
tables n1a * tid ;
tables priv;
tables aut;
run;

/* tabella 7.3  ----------------valori pesati -------------------------*/
proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per pub tid per la proc mean */
by pub tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by pub tid;
weight peso;
run;

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per priv tid per la proc mean */
by priv tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by priv tid;
weight peso;
run; 

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per est tid per la proc mean */
by est tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by est tid;
weight peso;
run; 

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per aut tid per la proc mean */
by aut tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by aut tid;
weight peso;
run; 
/* tabella 7.1 --------------valori assoluti -------------------*/
proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per lavorava tid per la proc mean */
by lavorava tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by lavorava tid;
run; 

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per tid per la proc mean */
by tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by tid;
run;
/* tabella 7.1 --------------valori pesati -------------------*/
proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per lavorava tid per la proc mean */
by lavorava tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by lavorava tid;
weight peso;
run; 

proc sort data=lib.dforces01 out=lib.dforces01tid;
/*ordinamento per tid per la proc mean */
by tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by tid;
weight peso;
run; 
/* tabella 7.2 --------------valori assoluti -------------------*/
data lib.dforces02;
set lib.dforces02;
/* pric indica il numero di percorsi di ricerca attiva del lavoro */
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

proc sort data=lib.dforces02 out=lib.dforces02tid;
/*ordinamento per varb86 tid per la proc mean */
by varb86 tid; run;
proc means data=lib.dforces02tid n sum mean;
var pric;
by varb86 tid;
run; 

proc sort data=lib.dforces02 out=lib.dforces02tid;
/*ordinamento per tid per la proc mean */
by tid; run;
proc means data=lib.dforces02tid n sum mean;
var pric;
by tid;
run;
/* tabella 7.2 --------------valori pesati -------------------*/
data lib.dforces03;
set lib.dforces03;
/* pric indica il numero di percorsi di ricerca attiva del lavoro */
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
proc sort data=lib.dforces03 out=lib.dforces03tid;
/*ordinamento per lavorava tid per la proc mean */
by varb86 tid; run;
proc means data=lib.dforces03tid n sum mean;
var pric;
by varb86 tid;
* weight peso;
run; 

proc sort data=lib.dforces03 out=lib.dforces03tid;
/*ordinamento per tid per la proc mean */
by tid; run;
proc means data=lib.dforces01tid n sum mean;
var pric;
by tid;
weight peso;
run;

