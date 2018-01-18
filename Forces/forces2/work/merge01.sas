LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';
LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';
FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';
options nocenter;

/* modifica compioneforces per il merge */
DATA LIB.campioneforces;
SET lib.campioneforces;
olduid = uid;
uid = matricola; RUN;

proc sort data=lib.campioneforces;
by uid ;
run;

/* primo passo*/ /* Le proc transpose*/

proc transpose data= lib.N1C out=lib.N1C_MCOLS prefix=N1C_;
by uid tid block;
var n1c;
id N1C;
run;


data lib.n1c_mcols;
set lib.n1c_mcols;
array rr{*} n1c_1-n1c_10;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= lib.N1K out=lib.N1K_MCOLS prefix=N1K_;
by uid tid block;
var n1k;
id N1K;
run;



data lib.n1k_mcols;
set lib.n1k_mcols;
array rr{*} n1k_1-n1k_9;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= lib.N3A out=lib.N3A_MCOLS prefix=N3A_;
by uid tid block;
var n3a;
id N3A;
run;


data lib.n3a_mcols;
set lib.n3a_mcols;
array rr{*} n3a_1-n3a_15;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;  /* fine le proc traspose*/

/*Secondo passo*/

/*terzo passo*/ /* il merge delle librerie*/

data lib.dati_facolta;
merge
/*Sezione B*/
lib.b8 lib.b8_before 
/*Sezione F G H FGH*/
lib.fgh6
/*Sezione N*/
lib.n1b lib.n1b_old lib.n1c_mcols lib.n1bbis lib.n1d lib.n1d1 lib.n1f 
lib.n1f1 lib.n1g lib.n1h lib.n1h1 lib.n1j  lib.n1k_mcols lib.n1l
lib.n1m lib.n2 lib.n2b lib.n2bbis lib.n2d  lib.n3 lib.n3a_mcols 
lib.n5 lib.n5_1 lib.n5_2 ;
by uid tid;
drop block date ;
run;

proc sort data=lib.dati_facolta;
by uid tid;
run;
/*shift del b8_before in quanto al forces1(T1 e T2) e forces2(T1) B8 aveva solo due opzioni. Nel b8_before
sono stati inseriti questi casi*/
data lib.dati_facolta;
set lib.dati_facolta;
if b8=. then b8=b8_before;
run;
data lib.dforces; /* merge finale con dati campione */
merge lib.dati_facolta lib.campioneforces;
by uid; run;


