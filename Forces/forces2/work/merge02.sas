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
by uid ; run;

/* primo passo*/ /* Le proc transpose*/

proc transpose data= lib.CDE_D out=CDE_D_MCOLS prefix=CDE_D_;
by uid tid block;
id CDE_D;
var cde_d;
run;

data lib.cde_d_mcols;
set cde_d_mcols;
array rr{*} cde_d_1-cde_d_12;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= lib.F3 out=F3_MCOLS prefix=F3_;
by uid tid block;
var f3;
id F3;
run;


data lib.f3_mcols;
set f3_mcols;
array rr{*} f3_1-f3_13;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= lib.FGH8 out=FGH8_MCOLS prefix=FGH8_;
by uid tid block;
var fgh8;
id FGH8;
run;



data lib.fgh8_mcols;
set fgh8_mcols;
array rr{*} fgh8_1-fgh8_10;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= lib.N1C out=N1C_MCOLS prefix=N1C_;
by uid tid block;
var n1c;
id N1C;
run;


data lib.n1c_mcols;
set n1c_mcols;
array rr{*} n1c_1-n1c_10;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= lib.N1K out=N1K_MCOLS prefix=N1K_;
by uid tid block;
var n1k;
id N1K;
run;



data lib.n1k_mcols;
set n1k_mcols;
array rr{*} n1k_1-n1k_9;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= lib.N3A out=N3A_MCOLS prefix=N3A_;
by uid tid block;
var n3a;
id N3A;
run;


data lib.n3a_mcols;
set n3a_mcols;
array rr{*} n3a_1-n3a_15;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

/* fine le proc traspose*/
/*Secondo passo*/
/* 1) Ricodifica delle variabili della sezione I con 1 e 0 compreso gli esperimenti ( p.e.i1b diventa i1br)
2) Correzione dei dati mancanti o errati (p.e dalla L1altro oppure dalla sezione H
3)Se i1_old=1 or i1=2 and i1br=. then tutti 0
4)per gli uid che non appartengono agli esperimenti si segue una procedura trascinando sia 1 che 0
invece per gli esperimenti dal tempo t3 in poi (vale solo per forces1) viene trascianti solo 0*/
/*terzo passo*/
/* il merge delle librerie*/

data dati_facolta;
merge
/*Sezione B*/
lib.b8 lib.b8_before  

/*Sezione C CDE CDE1 CDE2 CDE3*/
lib.c2 
lib.cde_d_mcols lib.cde_dbis

lib.cde1_c lib.cde1_d lib.cde1_e lib.cde1_ebis 

/*Sezione F G H FGH*/
lib.f1a lib.f1b   lib.f1b_alt1_t2 lib.f1b_alt2_t2 lib.f1b_alt3_t2   lib.f3_mcols lib.f3bis 
lib.fgh6 lib.fgh8_mcols lib.fgh8bis 


/*Sezione N*/
lib.n1b lib.n1b_old lib.n1c_mcols lib.n1bbis lib.n1d lib.n1d1 lib.n1f lib.n1f1 lib.n1g lib.n1h lib.n1h1 lib.n1j  lib.n1k_mcols lib.n1l
lib.n1m lib.n2 lib.n2b lib.n2bbis lib.n2d  lib.n3 lib.n3a_mcols lib.n5 lib.n5_1 lib.n5_2 ;


by uid tid;
drop block date ;
run;

proc sort data=dati_facolta;
by uid tid;
run;



/*shift del b8_before in quanto al forces1(T1 e T2) e forces2(T1) B8 aveva solo due opzioni. Nel b8_before
sono stati inseriti questi casi*/

data dati_facolta;
set dati_facolta;
if b8=. then b8=b8_before;
run;




/* shift del cde1_c*/
data dati_facolta;
set dati_facolta;
retain cde1_cx;
if (cde1_c^=. and b8=1) then cde1_cx=cde1_c;
if (tid ='T1' and cde1_c=. and b8=1) then cde1_cx=.;
if (tid^='T1' and  cde1 in (3) and cde1_c=. and b8=1) then cde1_c=cde1_cx;
run;

/* shift del cde1_d */
data dati_facolta;
set dati_facolta;
retain cde1_dx;
if (cde1_d^=. and b8=1) then cde1_dx=cde1_d;
if (tid ='T1' and cde1_d=. and b8=1) then cde1_dx=.;
if (tid^='T1' and  cde1 in (3) and cde1_d=. and b8=1) then cde1_d=cde1_dx;
run;

/* shift del cde1_e*/
data dati_facolta;
set dati_facolta;
retain cde1_ex;
if (cde1_e^=. and b8=1) then cde1_ex=cde1_e;
if (tid ='T1' and cde1_e=. and b8=1) then cde1_ex=.;
if (tid^='T1' and  cde1 in (3) and cde1_e=. and b8=1) then cde1_e=cde1_ex;
run;

data lib.dforces; /* merge finale con dati campione */
merge dati_facolta lib.campioneforces;
by uid; run;

data lib.dforces;
set lib.dforces;
if uid="000000" then delete; /* toglie il test */
if tid="." then delete;      /* toglie dati non validi */
if tid="" then delete; /* 158 non sono missing, sono solo vuoti */
peso=1;
if fac='fac01' then peso=1.010695187;   /* agraria         */
if fac='fac02' then peso=1.743119266;   /* economia        */
if fac='fac03' then peso=1.43373494;    /* farmacia        */
if fac='fac04' then peso=1.651639344;   /* giurisprudenza  */
if fac='fac05' then peso=3.802005013;   /* ingegneria      */
if fac='fac06' then peso=2.130699088;   /* lettere         */
if fac='fac07' then peso=3.46728972;    /* medicina        */
if fac='fac08' then peso=1.30952381;    /* veterinaria     */
if fac='fac09' then peso=4.926829268;   /* psicologia      */
if fac='fac10' then peso=1.842975207;   /* formazione      */
if fac='fac11' then peso=1.623737374;   /* mmffnn          */
if fac='fac12' then peso=3.656565657;   /* scienze pol     */
if fac='fac13' then peso=1.572413793;   /* statistica      */
run;

