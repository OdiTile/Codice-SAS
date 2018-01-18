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

/* if tid ="T1" then output;  */
if fgh6 in ('1' ,  '2' ) then output;
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
proc sort data=dforces18;
by uid tid;
run;
data dforces18;
set dforces18;
rif1=0; rif2=0; rif3=0;
/* retain rif1 rif2 rif3 0; */
if (fgh6=1 and tid="T1") then rif1 = 1;
if (fgh6=2 and tid="T1") then rif1 = 2;
if (fgh6=1 and tid="T2") then rif2 = 1;
if (fgh6=2 and tid="T2") then rif2 = 2;
if (fgh6=1 and tid="T3") then rif3 = 1;
if (fgh6=2 and tid="T3") then rif3 = 2;
run;
data dforces18;
set dforces18;
retain rift1 rift2 rift3 0;
if tid="T1" then rift1=fgh6;
if tid="T2" then rift2=fgh6;
if tid="T3" then rift3=fgh6;
run;
data dforces18;
set dforces18;
rif=0;
if rift1=1 then rif=1;
if rift2=1 then rif=1;
if rift3=1 then rif=1;
if (rift1=1 and rift2=1) then rif=2;
if (rift2=1 and rift3=1) then rif=2;
if (rift1=1 and rift3=1) then rif=2;
if (rift1=1 and rift2=1 and rift3=1) then rif=3;
run;

proc freq;
tables rif1;
tables rif2;
tables rif3;
tables rif;
tables fgh6;
tables fac * rif;
run;
proc reg ;      
model rif =  f1 f2 f3  f5 f6 f7 f8 f9  f10 f11 f12 f13
sesso ld  lavorava etalaurea votolaurea 
/  selection = stepwise slentry=0.20 slstay=0.20  include=12 ;
run;