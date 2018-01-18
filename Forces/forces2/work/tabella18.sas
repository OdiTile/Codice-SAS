/* file tabel8.sas     20 luglio 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella18.sas */
/* tabella18.sas    tabella 18                              */
/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';         */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';     */
/* FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';  */
LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas'; 
LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb'; 
/* LIBNAME LIB '\\Kaos\Lan\Users\Mario\forces2\work\sas'; 
 LIBNAME LIBRARY '\\Kaos\Lan\Users\Mario\forces2\work\sas'; 
 FILENAME QBase '\\Kaos\Lan\Users\Mario\forces2\work\db1.mdb'; */
options nocenter;
options pagesize = 200;

data lib.dforces01;
set lib.dforces;
/* missing lavorava al tempo 0 = non lavorava */
if lavorava="." then lavorava=0;
if b8=. then delete;
lav=0;
if b8=1 then lav=1;
run;
data dforces18;
set lib.dforces01;
/*Variabili dummy per la facolta' di provenienza. Riferimento e' Statistica = fac13  */
f1=0; f2=0; f3=0; f4=0; f5=0; f6=0; f7=0; f8=0; f9=0; f10=0; f11=0; f12=0; f13=0;
if fac = "fac01" then f1=1;
if fac = "fac02" then f2=1;
if fac = "fac03" then f3=1;
if fac = "fac04" then f4=1;
if fac = "fac05" then f5=1;
if fac = "fac06" then f6=1;
if fac = "fac07" then f7=1;
if fac = "fac08" then f8=1;
if fac = "fac09" then f9=1;
if fac = "fac10" then f10=1;
if fac = "fac11" then f11=1;
if fac = "fac12" then f12=1;
if fac = "fac13" then f13=1;

if tid ="T1" then output;
run;
data dforces18;
set dforces18;
/* pric indica il numero di percorsi di ricerca attiva del lavoro */
pric=0; 
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
run;
/*
proc freq;
tables pric * tid;
tables fac * pric;
run; */
/* escludo f8 Medicina Veterinaria   */
/* proc reg;  
model pric = f1 f2 f3 f4 f5 f6 f7 f9  f10 f11 f12 f13 
sesso ld lav lavorava etalaurea votolaurea 
/ selection = stepwise slentry = 0.15 slstay = 0.2 include = 12;
run; */
/*
proc sort data=dforces17; by pric; run;
*/
/* proc freq;
tables fac;
where pric = 0 ; 
run;  */
/* proc freq;
tables fac * pric; 
run;  */
 /* variabile obiettivo FGH6 */
 /* non serve descending perche' ho gia' si=1 no=2 */
proc logistic descending ;      
model fgh6 =  f1 f2 f3 f4 f5 f6 f7 f8  f10 f11 f12 f13 
sesso ld lav lavorava etalaurea votolaurea 
/ link = logit selection = stepwise slentry=0.20 slstay=0.20  include=12  details ;
run;
proc freq;
tables fac * fgh6;
run;