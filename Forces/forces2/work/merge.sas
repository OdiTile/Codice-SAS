LIBNAME LIB 'c:\temp\analisi\sas';
LIBNAME LIBRARY 'c:\temp\analisi\sas';
FILENAME QBase 'c:\temp\analisi\Mdb\RBase.mdb';
options nocenter;


/* primo passo*/
/* Le proc transpose*/

proc transpose data= lib.CDE_D out=CDE_D_MCOLS prefix=CDE_D_;
by uid tid block;
id CDE_D;
var cde_d;
run;

data cde_d_mcols;
set cde_d_mcols;
array rr{*} cde_d_1-cde_d_12;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

proc transpose data= lib.E3 out=E3_MCOLS prefix=E3_;
by uid tid block;
var e3;
id E3;
run;


data e3_mcols;
set e3_mcols;
array rr{*} e3_1-e3_11;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= F3 out=F3_MCOLS prefix=F3_;
by uid tid block;
var f3;
id F3;
run;


data f3_mcols;
set f3_mcols;
array rr{*} f3_1-f3_13;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.FGH8 out=FGH8_MCOLS prefix=FGH8_;
by uid tid block;
var fgh8;
id FGH8;
run;



data fgh8_mcols;
set fgh8_mcols;
array rr{*} fgh8_1-fgh8_10;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.G2 out=G2_MCOLS prefix=G2_;
by uid tid block;
var g2;
id G2;
run;


data g2_mcols;
set g2_mcols;
array rr{*} g2_1-g2_16;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

proc transpose data= work.j11a out=J11A_MCOLS prefix=j11a_;
by uid tid block;
var j11a;
id j11a;
run;



data j11a_mcols;
set j11a_mcols;
array rr{*} j11a_1-j11a_16;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.j6a1 out=J6A1_MCOLS prefix=j6a1_;
by uid tid block;
var j6a1;
id j6a1;
run;


data j6a1_mcols;
set j6a1_mcols;
array rr{*} j6a1_1-j6a1_19;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.j7a3 out=J7A3_MCOLS prefix=j7a3_;
by uid tid block;
var j7a3;
id j7a3;
run;


data j7a3_mcols;
set j7a3_mcols;
array rr{*} j7a3_1-j7a3_19;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.JA9 out=JA9_MCOLS prefix=JA9_;
by uid tid block;
var ja9;
id JA9;
run;

data ja9_mcols;
set ja9_mcols;
array rr{*} ja9_1-ja9_8;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

/*
proc transpose data= work.k4 out=k4_MCOLS prefix=k4_;
by uid tid block;
var k4;
id k4;
run;*/


proc transpose data= work.N1C out=N1C_MCOLS prefix=N1C_;
by uid tid block;
var n1c;
id N1C;
run;


data n1c_mcols;
set n1c_mcols;
array rr{*} n1c_1-n1c_10;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.N1K out=N1K_MCOLS prefix=N1K_;
by uid tid block;
var n1k;
id N1K;
run;



data n1k_mcols;
set n1k_mcols;
array rr{*} n1k_1-n1k_9;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.N3A out=N3A_MCOLS prefix=N3A_;
by uid tid block;
var n3a;
id N3A;
run;


data n3a_mcols;
set n3a_mcols;
array rr{*} n3a_1-n3a_15;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


/*

proc transpose data= work.p1 out=p1_MCOLS prefix=p1_;
by uid tid block;
var xx;
id p1;
run;


proc transpose data= work.p1a out=p1a_MCOLS prefix=p1a_;
by uid tid block;
var xx;
id p1a;
run;



proc transpose data= work.p1aa out=p1aa_MCOLS prefix=p1aa_;
by uid tid block;
var xx;
id p1aa;
run;*/


proc transpose data= work.p1comp_mancanti out=p1comp_mancanti_MCOLS prefix=p1comp_mancanti_;
by uid tid block;
var p1comp_mancanti;
id p1comp_mancanti;
run;



data p1comp_mancanti_mcols;
set p1comp_mancanti_mcols;
array rr{*} p1comp_mancanti_mcols_1-p1comp_mancanti_mcols_124;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;



proc transpose data= work.p1e out=P1E_MCOLS prefix=p1e_;
by uid tid block;
var p1e;
id p1e;
run;



data p1e_mcols;
set p1e_mcols;
array rr{*} p1e_1-p1e_18;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;



proc transpose data= work.p1f out=P1F_MCOLS prefix=p1f_;
by uid tid block;
var p1f;
id p1f;
run;


data p1f_mcols;
set p1f_mcols;
array rr{*} p1f_1-p1f_22;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.p1g out=P1G_MCOLS prefix=p1g_;
by uid tid block;
var p1g;
id p1g;
run;


data p1g_mcols;
set p1g_mcols;
array rr{*} p1g_1-p1g_9;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;



proc transpose data= work.p1I out=P1I_MCOLS prefix=p1I_;
by uid tid block;
var p1i;
id p1I;
run;


data p1i_mcols;
set p1i_mcols;
array rr{*} p1i_1-p1i_12;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.p1p out=P1P_MCOLS prefix=p1p_;
by uid tid block;
var p1p;
id p1p;
run;


data p1p_mcols;
set p1p_mcols;
array rr{*} p1p_1-p1p_14;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
run;


proc transpose data= work.p1t out=P1T_MCOLS prefix=p1t_;
by uid tid block;
var p1t;
id p1t;
run;


data p1t_mcols;
set p1t_mcols;
array rr{*} p1t_1-p1t_26;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.p2a out=P2a_MCOLS prefix=p2a_;
by uid tid block;
var p2a;
id p2a;
run;


data p2a_mcols;
set p2a_mcols;
array rr{*} p2a_1-p2a_22;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.p2b out=P2b_MCOLS prefix=p2b_;
by uid tid block;
var p2b;
id p2b;
run;

data p2b_mcols;
set p2b_mcols;
array rr{*} p2b_1-p2b_11;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data=work.P2c out=p2c_MCOLS prefix=p2c_;
by uid tid block;
var p2c;
id p2c;
run;

data p2c_mcols;
set p2c_mcols;
array rr{*} p2c_1-p2c_9;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;



proc transpose data= work.p2d out=P2d_MCOLS prefix=p2d_;
by uid tid block;
var p2d;
id p2d;
run;

data p2d_mcols;
set p2d_mcols;
array rr{*} p2d_1-p2d_8;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.p2e out=P2e_MCOLS prefix=p2e_;
by uid tid block;
var p2e;
id p2e;
run;

data p2e_mcols;
set p2e_mcols;
array rr{*} p2e_1-p2e_11;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

proc transpose data= work.p2f out=P2f_MCOLS prefix=p2f_;
by uid tid block;
var p2f;
id p2f;
run;


data p2f_mcols;
set p2f_mcols;
array rr{*} p2f_1-p2f_23;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

proc transpose data= work.p2g out=P2g_MCOLS prefix=p2g_;
by uid tid block;
var p2g;
id p2g;
run;

data p2g_mcols;
set p2g_mcols;
array rr{*} p2g_1-p2g_9;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;



proc transpose data= work.Q1B out=Q1B_MCOLS prefix=Q1B_;
by uid tid block;
var q1b;
id Q1B;
run;


data q1b_mcols;
set q1b_mcols;
array rr{*} q1b_1-q1b_24;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

proc transpose data= lib.Q1B1 out=Q1b1_MCOLS prefix=Q1B1_;
by uid tid block;
var q1b1;
id Q1B1;
run;

data q1b1_mcols;
set q1b1_mcols;
array rr{*} q1b1_1-q1b1_29;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

proc transpose data= lib.Q1B10 out=Q1B10_MCOLS prefix=Q1B10_;
by uid tid block;
var q1b10;
id Q1B10;
run;

data q1b10_mcols;
set q1b10_mcols;
array rr{*} q1b10_1-q1b10_22;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;
proc transpose data= work.Q1B2 out=Q1b2_MCOLS prefix=Q1B2_;
by uid tid block;
var q1b2;
id Q1B2;
run;

data q1b2_mcols;
set q1b2_mcols;
array rr{*} q1b2_1-q1b2_52;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;
proc transpose data= work.Q1B3 out=Q1b3_MCOLS prefix=Q1B3_;
by uid tid block;
var q1b3;
id Q1B3;
run;

data q1b3_mcols;
set q1b3_mcols;
array rr{*} q1b3_1-q1b3_20;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

proc transpose data= work.Q1B4 out=Q1B4_MCOLS prefix=Q1B4_;
by uid tid block;
var q1b4;
id Q1B4;
run;


data q1b4_mcols;
set q1b4_mcols;
array rr{*} q1b4_1-q1b4_28;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.Q1B7 out=Q1b7_MCOLS prefix=Q1B7_;
by uid tid block;
var q1b7;
id Q1B7;
run;


data q1b7_mcols;
set q1b7_mcols;
array rr{*} q1b7_1-q1b7_39;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;


proc transpose data= work.q1b9 out=Q1b9_MCOLS prefix=q1b9_;
by uid tid block;
var q1b9;
id q1b9;
run;

data q1b9_mcols;
set q1b9_mcols;
array rr{*} q1b9_1-q1b9_31;
do i=1 to dim(rr);
if rr{i}^=. then rr{i}=1;
else rr{i}=0;
end;
run;

proc transpose data= work.T1A out=T1A_MCOLS prefix=T1A_;
by uid tid block;
var t1a;
id T1A;
run;

data t1a_mcols;
set t1a_mcols;
array rr{*} t1a_1-t1a_4;
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

/*ricodifica delle varibili della sezione I e degli esperimenti*/

data dati_facolta;
set dati_facolta;
if i1b in (3) then i1br=0;
if i1b in (1,2) then i1br=1;
if i1c in (1,2,3) then i1cr=1;
if i1c in (4) then i1cr=0;
if i1d in (1,2,3) then i1dr=1;
if i1d in (4) then i1dr=0;
if i1e in (3) then i1er=0;
if i1e in (1,2) then i1er=1;
if i1f in (3) then i1fr=0;
if i1f in (1,2) then i1fr=1;
if i1g in (3) then i1gr=0;
if i1g in (1,2) then i1gr=1;
if i1h in (3) then i1hr=0;
if i1h in (1,2) then i1hr=1;
if i1i in (1,2,3) then i1ir=1;
if i1i in (4) then i1ir=0;
if i1j in (1,2,3) then i1jr=1;
if i1j in (4) then i1jr=0;
if i1k in (1,2,3) then i1kr=1;
if i1k in (4) then i1kr=0;
if i1l in (1,2,3) then i1lr=1;
if i1l in (4) then i1lr=0;
if i1m in (1,2,3) then i1mr=1;
if i1m in (4) then i1mr=0;
if i1n in (3) then i1nr=0;
if i1n in (1,2) then i1nr=1;

if (i1b_alt3_t2 in (1,3) and i1br=.) then i1br=1;
if (i1b_alt3_t2 in (2,4) and i1br=.) then i1br=0;
if (i1c_alt3_t2 in (1,3) and i1cr=.) then i1cr=1;
if (i1c_alt3_t2 in (2,4) and i1cr=.) then i1cr=0;
if (i1d_alt3_t2 in (1,3) and i1dr=.) then i1dr=1;
if (i1d_alt3_t2 in (2,4) and i1dr=.) then i1dr=0;
if (i1e_alt3_t2 in (1,3) and i1er=.) then i1er=1;
if (i1e_alt3_t2 in (2,4) and i1er=.) then i1er=0;
if (i1f_alt3_t2 in (1,3) and i1fr=.) then i1fr=1;
if (i1f_alt3_t2 in (2,4) and i1fr=.) then i1fr=0;
if (i1g_alt3_t2 in (1,3) and i1gr=.) then i1gr=1;
if (i1g_alt3_t2 in (2,4) and i1gr=.) then i1gr=0;
if (i1h_alt3_t2 in (1,3) and i1hr=.) then i1hr=1;
if (i1h_alt3_t2 in (2,4) and i1hr=.) then i1hr=0;
if (i1i_alt3_t2 in (1,3) and i1ir=.) then i1ir=1;
if (i1i_alt3_t2 in (2,4) and i1ir=.) then i1ir=0;
if (i1j_alt3_t2 in (1,3) and i1jr=.) then i1jr=1;
if (i1j_alt3_t2 in (2,4) and i1jr=.) then i1jr=0;
if (i1k_alt3_t2 in (1,3) and i1kr=.) then i1kr=1;
if (i1k_alt3_t2 in (2,4) and i1kr=.) then i1kr=0;
if (i1l_alt3_t2 in (1,3) and i1lr=.) then i1lr=1;
if (i1l_alt3_t2 in (2,4) and i1lr=.) then i1lr=0;
if (i1m_alt3_t2 in (1,3) and i1mr=.) then i1mr=1;
if (i1m_alt3_t2 in (2,4) and i1mr=.) then i1mr=0;
if (i1n_alt3_t2 in (1,3) and i1nr=.) then i1nr=1;
if (i1n_alt3_t2 in (2,4) and i1nr=.) then i1nr=0;
run;




/*terzo passo*/
/* il merge delle librerie*/

data dati_facolta;
merge
/*Sezione B*/
lib.b8 lib.b8_before  lib.b7b  lib.b7bbis lib.b7b1 lib.b7cc_t1 lib.b7c lib.b7cbis 

/*Sezione I*/
lib.i1_old lib.i1 lib.i1b /*lib.i1bbis*/  lib.i1b_alt3_t2 lib.i1c lib.i1c_alt3_t2 lib.i1d lib.i1d_alt3_t2 lib.i1e lib.i1e_alt3_t2
lib.i1f lib.i1f_alt3_t2 lib.i1g lib.i1g_alt3_t2 lib.i1h lib.i1h_alt3_t2 lib.i1i lib.i1i_alt3_t2 lib.i1j
lib.i1j_alt3_t2 lib.i1k lib.i1k_alt3_t2 lib.i1l lib.i1l_alt3_t2 lib.i1m lib.i1m_alt3_t2 lib.i1n lib.i1n_alt3_t2
lib.i1nuno lib.i1ndue  lib.i1p lib.i2 lib.i2bis

/*Sezione C CDE CDE1 CDE2 CDE3*/
lib.c1 lib.c1a lib.c1b lib.c2 lib.c2_alt1_t2 lib.c3  lib.c4i_old lib.c9

lib.cde lib.cde_due lib.cde_tre lib.cde_quat lib.cde_cinq lib.cde_a lib.cde_b lib.cde_bbis lib.cde_c lib.cde_d_mcols lib.cde_dbis;

/*lib.cde1 lib.cde1_a lib.cde1_b lib.cde1_c lib.cde1_d lib.cde1_e lib.cde1_ebis lib.cde1_f lib.cde1_g
lib.cde1_h lib.cde1_hbis lib.cde1_i lib.cde1_ibis

lib.cde2 lib.cde2_a lib.cde2_b lib.cde2_b1 lib.cde2_c lib.cde2_d lib.cde2_e lib.cde2_ebis lib.cde2_f
lib.cde2_g lib.cde2_gbis lib.cde2_i

lib.cde3 lib.cde3_a lib.cde3_b lib.cde3_c lib.cde3_d lib.cde3_dbis lib.cde3_e lib.cde3_f lib.cde3_fbis
lib.cde3_g lib.cde3_gbis lib.cde3_h*/
/*Sezione E*/

/*lib.e1 lib.e2 lib.e2a lib.e2b lib.e2c lib.e2d lib.e2dbis lib.e2e lib.e2f lib.e2fa lib.e2g lib.e2gbis
lib.e2h lib.e2hbis lib.e3_mcols lib.e3bis lib.e3a lib.e4*/

/*Sezione F G H FGH*/
/*lib.f1a lib.f1b  lib.f1b_t2 lib.f1b_alt1_t2 lib.f1b_alt2_t2 lib.f1b_alt3_t2  lib.f1c_alt1_t2 lib.f1c_alt2_t2 lib.f1c_alt3_t2 lib.f2 lib.f2a lib.f3_mcols lib.f3bis lib.f4 lib.f5 lib.fgh6 lib.fgh7 lib.fgh8_mcols lib.fgh8bis lib.fghl6alt23_t2 lib.fghl6x1_t2 lib.fghl6x2_t2 lib.fghl6x3_t2

lib.g1 lib.g2_mcols lib.g2bis lib.g3 lib.g3a lib.g3b lib.g3c lib.g4 ;*/

/*lib.h1 lib.h1bis lib.h2 lib.h2bis lib.h3 lib.h3a lib.h3abis lib.h4 lib.h5 lib.h5bis lib.h5a lib.h5abis

lib.fgh6 lib.fgh7 lib.fgh8_mcols lib.fgh8bis */

/*Sezione  J*/
/*lib.j1 lib.j1_alt1_t2 lib.j1_alt2_t2 lib.j1balt2_t2 lib.j2 lib.j2_alt2_t2 lib.j2_alt3_t2 lib.j2b_alt2_t2 
lib.j2a lib.j3 lib.j3_alt2_t2 lib.j3_alt3_t2 lib.j3b_alt2_t2 lib.j4 lib.j5 lib.j6 lib.j6a1_mcols lib.j6a1_old 
lib.j6a1al lib.j6_alt1_t2 lib.j6_alt2_t2 lib.j6b_alt1_t2 lib.j6auno lib.j6adue lib.j6atre lib.j7 lib.j7_alt1_t2 
lib.j7_alt2_t2 lib.j7b_alt2_t2 lib.j7a1a lib.j7a1b lib.j7a1c lib.j7a1d lib.j7a2a lib.j7a2b lib.j7a2c 
lib.j7a2d lib.j7a2e lib.j7a2f lib.j7a3_mcols lib.j7a3_old lib.j7a3al lib.j7a4_civile lib.j7a4_ind lib.j7a4_inf
lib.j7a4c lib.j7a4d lib.j7a5a lib.j7a5b lib.j7a5c lib.j7a5d lib.j7a5e lib.j7a5f lib.j7a5g lib.j7ah lib.j7a5i 
lib.j7a5l lib.j7a5m lib.j7a5n lib.j7a5o lib.j7b lib.j8 lib.j8_alt1_t2 lib.j8_alt2_t2 lib.j8b_alt2_t2 lib.j9
lib.ja9_mcols lib.ja9bis lib.j9_alt2_t2 lib.j9_alt3_t2 lib.j9b_alt2_t2 lib.j10 lib.j10_alt2_t2 lib.j10_alt3_t2
lib.j10balt2_t2 lib.j11 lib.j11a_mcols lib.j11abis lib.j11a1 lib.j11a1a lib.j11a1b lib.j11a1c lib.j11a1d lib.j11a1e
lib.j11a1f lib.j11a1g lib.j11a1h lib.j11a1i lib.j11a1l lib.j11a1m lib.j12 lib.j13 lib.j13_alt1_t2
lib.j13_alt2_t2 lib.j13balt2_t2 lib.j14 lib.j22*/

/*Sezione K e KJ*/
/*lib.k1 lib.k1_alt1_t2 lib.k1_alt2_t2 lib.k1b_t2 lib.k2 lib.k3 lib.k4_mcols lib.k5j15 lib.k5j15_pre_T2 lib.k6j16 lib.k7j17 lib.k7aj17a lib.k8j18 lib.k8aj18a lib.k9j19 lib.k9aj19a lib.k10j20 lib.k10aj20a lib.k11j21*/

/*Sezione L*/
/*lib.l1 lib.l1altro lib.l2 lib.l2bis lib.l3 lib.l3a lib.l3b lib.l3c lib.l4 lib.l4a lib.l4bis lib.l5*/ 


/*Sezione N*/
/*lib.n1b lib.n1b_old lib.n1c_mcols lib.n1bbis lib.n1d lib.n1d1 lib.n1f lib.n1f1 lib.n1g lib.n1h lib.n1h1 lib.n1j  lib.n1k_mcols lib.n1l
lib.n1m lib.n2 lib.n2b lib.n2bbis lib.n2d  lib.n3 lib.n3a_mcols lib.n5 lib.n5_1 lib.n5_2 */

/*Sezione P*/
/*
lib.p1 lib.p1a lib.p1aa lib.p1e_mcols lib.p1ebis lib.p1f_mcols lib.p1fbis lib.p1g_mcols lib.p1gbis lib.p1i_mcols lib.p1ibis
lib.p1p_mcols lib.p1pbis  lib.p1sa lib.p1sb lib.p1sc lib.p1sd lib.p1se lib.p1sf lib.p1sg lib.p1sh
lib.p1si lib.p1sl lib.p1sm lib.p1sn lib.p1so lib.p1sp lib.p1sq lib.p1sr lib.p1ss lib.p1st 
lib.p1su lib.p1sv lib.p1sw lib.p1sy lib.p1sz 
lib.p1t_mcols lib.p1tbis lib.p2a_mcols lib.p2abis lib.p2b_mcols lib.p2bbis lib.p2c_mcols lib.p2cbis lib.p2d_mcols lib.p2dbis 
lib.p2e_mcols lib.p2ebis lib.p2f_mcos lib.p2fbis lib.p2g_mcols lib.p2gbis 
*/

/*lib.P1Agr_1 lib.P1Agr_2 lib.P1Agr_3 lib.P1Agr_4 lib.P1Agr_5 lib.P1Agr_6 lib.P1Agr_7 lib.P1Agr_8
lib.P1Agr_9 lib.P1Agr_10 lib.P1Agr_11 lib.P1Agr_12 lib.P1Agr_13 lib.P1Agr_14 lib.P1Agr_15

lib.p1ec_1 lib.p1ec_2 lib.p1ec_3 lib.p1ec_4 lib.p1ec_5 lib.p1ec_6 lib.p1ec_7 lib.p1ec_8 lib.p1ec_9
lib.p1ec_10 lib.p1ec_11 lib.p1ec_12 lib.p1ec_13 lib.p1ec_15 lib.p1ec_16 lib.p1ec_17 lib.p1ec_18
lib.p1ec_19 lib.p1ec_20 lib.p1ec_21

lib.p1farm_1 lib.p1farm_2 lib.p1farm_3 lib.p1farm_4 lib.p1farm_5 lib.p1farm_6 lib.p1farm_7
lib.p1farm_8 lib.p1farm_9 lib.p1farm_10 lib.p1farm_11 lib.p1farm_12

lib.p1gr_1 lib.p1gr_2 lib.p1gr_3 lib.p1gr_4 lib.p1gr_5 lib.p1gr_6 lib.p1gr_7 lib.p1gr_8 lib.p1gr_9
lib.p1gr_10 lib.p1gr_11 lib.p1gr_12 lib.p1gr_13 lib.p1gr_14 lib.p1gr_15 lib.p1gr_16 lib.p1gr_17 lib.p1gr_18

lib.p1Ing_1 lib.p1Ing_2 lib.p1Ing_3 lib.p1Ing_4 lib.p1Ing_5 lib.p1Ing_6 lib.p1Ing_7 lib.p1Ing_8
lib.p1Ing_9 lib.p1Ing_10 lib.p1Ing_11 lib.p1Ing_12 lib.p1Ing_13 lib.p1Ing_14 lib.p1Ing_15 lib.p1Ing_16

lib.p1Lett_1 lib.p1Lett_2 lib.p1Lett_3 lib.p1Lett_4 lib.p1Lett_5 lib.p1Lett_6 lib.p1Lett_7 lib.p1Lett_8
lib.p1Lett_9 lib.p1Lett_10 lib.p1Lett_11

lib.p1psico_1 lib.p1psico_2 lib.p1psico_3 lib.p1psico_4 lib.p1psico_5 lib.p1psico_6 lib.p1psico_7 lib.p1psico_8
lib.p1psico_9 lib.p1psico_10 lib.p1psico_11 lib.p1psico_12 lib.p1psico_13 lib.p1psico_14 lib.p1psico_15
lib.p1psico_16 lib.p1psico_17 lib.p1psico_18 lib.p1psico_19 lib.p1psico_20

lib.P1SF_1 lib.P1SF_2 lib.P1SF_3 lib.P1SF_4 lib.P1SF_5 lib.P1SF_6 lib.P1SF_7 lib.P1SF_8 lib.P1SF_9
lib.P1SF_10 lib.P1SF_11 lib.P1SF_12 lib.P1SF_13 lib.P1SF_14 lib.P1SF_15 lib.P1SF_16 lib.P1SF_17
lib.P1SF_18 lib.P1SF_19 lib.P1SF_20 lib.P1SF_21

lib.P1SM_1 lib.P1SM_2 lib.P1SM_3 lib.P1SM_4 lib.P1SM_5 lib.P1SM_6 lib.P1SM_7 lib.P1SM_8 lib.P1SM_9 lib.P1SM_10
lib.P1SM_11 lib.P1SM_12 lib.P1SM_13 lib.P1SM_14 lib.P1SM_15

lib.P1SP_1 lib.P1SP_2 lib.P1SP_3 lib.P1SP_4 lib.P1SP_5 lib.P1SP_6 lib.P1SP_7 lib.P1SP_8 lib.P1SP_9
lib.P1SP_10 lib.P1SP_11 lib.P1SP_12 lib.P1SP_13 lib.P1SP_14 lib.P1SP_15 lib.P1SP_16 lib.P1SP_17

lib.P1SS_1 lib.P1SS_2 lib.P1SS_3 lib.P1SS_4 lib.P1SS_5 lib.P1SS_6 lib.P1SS_7 lib.P1SS_8 lib.P1SS_9 lib.P1SS_10
lib.P1SS_11 lib.P1SS_12 lib.P1SS_13 lib.P1SS_14 lib.P1SS_15 lib.P1SS_16 lib.P1SS_17 lib.P1SS_18
lib.P1SS_19

lib.P1Veter_1 lib.P1Veter_2 lib.P1Veter_3 lib.P1Veter_4 lib.P1Veter_5 lib.P1Veter_6 lib.P1Veter_7
lib.P1Veter_8 lib.P1Veter_9 lib.P1Veter_10 lib.P1Veter_11

lib.p1comp_mancanti_mcols lib.p1comp_mancanti1*/

/*Sezione  Q*/

/*lib.q_professioni lib.q_professioni1 lib.q_professioni2 lib.q_settore lib.q_settore_bis
lib.q1a lib.q1a_old lib.q1abis1 lib.q1abis2 lib.q1ac lib.q1acbis lib.q1ad lib.q1adbis
lib.q1ae lib.q1aebis lib.q1af lib.q1afbis lib.q1ag lib.q1b_mcols

lib.q1b1_mcols lib.q1b1bis lib.q1b2_mcols lib.q1b2bis lib.q1b3_mcols lib.q1b3bis lib.q1b4_mcols lib.q1b4bis
lib.q1b5 lib.q1b5bis lib.q1b6 lib.q1b6bis lib.q1b7_mcols lib.q1b7bis lib.q1b8 lib.q1b8bis
lib.q1b9_mcols lib.q1b9bis lib.q1b10_mcols lib.q1b10bis lib.q1bis
lib.q1ba  lib.q1babis lib.q1c lib.q1ca lib.q1cabis*/

/* Sezione T*/
/*lib.t1 lib.t1a_mcols lib.t1aal lib.t2 lib.t3 lib.t3a lib.t4 lib.t5 lib.t6 lib.t7*/


/*  altri Data Set da aggiungere nel merge*/
/* lib.studio */

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

data dati_facolta;
set dati_facolta;
if (b7cc_t1=2 and b7cbis=.) then b7cbis=0;
run;

data dati_facolta;
set dati_facolta;
retain b7cbisx;
if (b7cbis^=. ) then  b7cbisx=b7cbis;
if (tid='T1' and b7cbis=.) then b7cbisx=.;
if (tid^='T1' and  b7c=1 and b7cbis=.) then b7cbis=b7cbisx;
run; 


data dati_facolta;
set dati_facolta;
retain b7bbisx;
if (b7bbis^=. ) then  b7bbisx=b7bbis;
if (tid='T1' and b7bbis=.) then b7bbisx=.;
if (tid^='T1' and b7bbis=. and b7b=2) then b7bbis=b7bbisx;
run;

data dati_facolta;
set dati_facolta;
retain b7cbisx;
if (b7cbis^=. ) then  b7cbisx=b7cbis;
if (tid='T1' and b7cbis=.) then b7cbisx=.;
if (tid^='T1' and b7cbis=. and b7c=1) then b7cbis=b7cbisx;
run;


/* shift del cde*/
data dati_facolta;
set dati_facolta;
retain cdex;
if (cde^=. and b8=1) then cdex=cde;
if (tid ='T1' and cde=. and b8=1) then cdex=.;
if (tid^='T1' and  c3 in (1,4) and cde=. and b8=1) then cde=cdex;
run;
/* shift del cde_a*/
data dati_facolta;
set dati_facolta;
retain cde_ax;
if (cde_a^=. and b8=1) then cde_ax=cde_a;
if (tid ='T1' and cde_a=. and b8=1) then cde_ax=.;
if (tid^='T1' and  c3 in (4) and cde_a=. and b8=1) then cde_a=cde_ax;

run;
/* shift del cde_c*/
data dati_facolta;
set dati_facolta;
retain cde_cx;
if (cde_c^=. and b8=1) then cde_cx=cde_c;
if (tid ='T1' and cde_c=. and b8=1) then cde_cx=.;
if (tid^='T1' and  c3 in (4) and cde_c=. and b8=1) then cde_c=cde_cx;

run;




/*Compilazione del cerca lavoro non necessaria per le facolta*/
/*
data dati_facolta;
set dati_facolta;
if (f4=1 or g3=1 or H4=1) then cerca=1;
if (cerca=. and f4=2) then cerca=0;
if (cerca=. and g3=2) then cerca=0;
if (cerca=. and H4=2) then cerca=0;
run;

*/

/* shift del cde1_c*/
data dati_facolta;
set dati_facolta;
retain cde1_cx;
if (cde1_c^=. and b8=1) then cde1_cx=cde1_c;
if (tid ='T1' and cde1_c=. and b8=1) then cde1_cx=.;
if (tid^='T1' and  cde1 in (3) and cde1_c=. and b8=1) then cde1_c=cde1_cx;
run;

/* shift del cde1_d*/
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
/* shift del cde2*/
data dati_facolta;
set dati_facolta;
retain cde2x;
if (cde2^=. and b8=1) then cde2x=cde2;
if (tid ='T1' and cde2=. and b8=1) then cde2x=.;
if (tid^='T1' and  c4i_old=2 and cde2=. and b8=1) then cde2=cde2x;
run;

/*Creazione della variabile Posizione */
/*data dati_facolta;
set dati_facolta;
if (cde1_f^=. and b8=1) then posizione=cde1_f;
if (cde1_g^=. and b8=1) then posizione=cde1_g+7;
if (cde1_i^=. and b8=1) then posizione=cde1_i+15;

run;
*/
/*shift della cde1_h*/
data dati_facolta;
set dati_facolta;
if (cde1_h^=. and b8=1) then cde1_hx=cde1_h;
if (tid ='T1' and cde1_h=. and b8=1) then cde1_hx=.;
if (tid^='T1' and  cde1 in (3) and cde1_h=. and b8=1) then cde1_h=cde1_hx;
run;

/* shift della posizione*/
/*
data dati_facolta;
set dati_facolta;
retain posizionex;
if posizione^=. then posizionex=posizione;
if (tid ='T1' and posizione=.) then posizionex=.;
if (tid^='T1' and  cde1 in (3) and posizione=.) then posizione=posizionex;
run;
*/

/*Inserimento degli esperimenti del k5j15*/
data dati_facolta;
set dati_facolta;
retain k5j15x;
/*if k5J15^=. then k5j15x=k5j15;*/
if (tid='T1') then k5j15x=k5j15;
if (tid='T2' and k5j15_pre_t2=2 and k5j15=.) then k5j15=k5j15x;
run;




PROC IMPORT OUT=campioneforces DATATABLE='campioneforces' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID ;


PROC IMPORT OUT=studio DATATABLE='studio' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID TID ;

PROC IMPORT OUT=ril2bisF1 DATATABLE='ril2bisF1' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID ;

PROC IMPORT OUT=ril2bisF2 DATATABLE='ril2bisf2' DBMS=ACCESS2000 REPLACE;
DATABASE=QBase;
PROC SORT; BY UID ;


/* creazione della variabile Lavorava*/
/*
data inizio2;
merge dati_facolta ril2bisF1 ril2bisF2 campioneforces ;
by uid;
drop block date xx facolta corsodilaurea sesso Name DataNascita DataLaurea Residenza AnnoImmatricolazione Lavorava;
run;
proc sort data=inizio2;
by uid;
run;
data inizio2;
set inizio2;
if (ril2bisF1 in (1,2)) then lavorava=1;
if (ril2bisF1=3) then lavorava=0;
if (ril2bisF2=1) then lavorava=1;
if (ril2bisF2 in (2,3)) then lavorava=0;
run;
*/

/* correzione dei dati della sezione I a partire dalla L1altro e H2bis e H2 viene utilizzato la variabile
codifica che si trova nella tabella studio*/


data dati_facolta;
set dati_facolta;
if (codifica=1 and i1br^=1) then i1br=1;
if (codifica=2 and i1er^=1) then i1er=1;
if (codifica=3 and i1ir^=1) then i1ir=1;
if (codifica=4 and i1fr^=1) then i1fr=1;
if (codifica=5 and i1gr^=1) then i1gr=1;
if (codifica=6 and i1hr^=1) then i1hr=1;
if (codifica=7 and i1cr^=1) then i1cr=1;
if (codifica=8 and i1lr^=1) then i1lr=1;
if (codifica=9 and i1dr^=1) then i1dr=1;
if (codifica=10 and i1kr^=1) then i1kr=1;
if (codifica=11 and i1jr^=1) then i1jr=1;
if (codifica=12 and i1nr^=1) then i1nr=1;
if (codifica=100 and i1_old=1) then i1_old=2;

run;
/*
3)Se i1_old=1 or i1=2 and i1br=. then tutti 0
4)per gli uid che non appartengono agli esperimenti si segue una procedura trascinando sia 1 che 0
invece per gli esperimenti dal tempo t3 in poi (vale solo per forces1) viene trascianti solo 0*/
*/

data dati_facolta;
set dati_facolta;
if ((i1_old=1 or i1=2) and i1br=.) then i1br=0;
if ((i1_old=1 or i1=2) and i1cr=.) then i1cr=0;
if ((i1_old=1 or i1=2) and i1dr=.) then i1dr=0;
if ((i1_old=1 or i1=2) and i1er=.) then i1er=0;
if ((i1_old=1 or i1=2) and i1fr=.) then i1fr=0;
if ((i1_old=1 or i1=2) and i1gr=.) then i1gr=0;
if ((i1_old=1 or i1=2) and i1hr=.) then i1hr=0;
if ((i1_old=1 or i1=2) and i1ir=.) then i1ir=0;
if ((i1_old=1 or i1=2) and i1jr=.) then i1jr=0;
if ((i1_old=1 or i1=2) and i1kr=.) then i1kr=0;
if ((i1_old=1 or i1=2) and i1lr=.) then i1lr=0;
if ((i1_old=1 or i1=2) and i1mr=.) then i1mr=0;
if ((i1_old=1 or i1=2) and i1nr=.) then i1nr=0;
run;


/* shift del i1br*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1brx;
if i1br=0 then i1brx=i1br;
if (tid>'T2' and i1br=. and i1_old=2) then i1br=i1brx;
end;

else do;
retain i1bx ;
if (i1b^=.) then i1bx=i1b;
if (tid='T1' and i1b=.) then i1bx=.;
if (tid^='T1' and i1b=. and i1_old=2 and i1bx in (1,3)) then i1br=0;
if (tid^='T1' and i1b=. and i1_old=2 and i1bx in (2)) then i1br=1;

end;

run;

/*shift i1c*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1crx;
if i1cr=0 then i1crx=i1cr;
if (tid>'T2' and i1cr=. and i1_old=2) then i1cr=i1crx;
end;

else do;
retain i1cx ;
if (i1c^=.) then i1cx=i1c;
if (tid='T1' and i1c=.) then i1cx=.;
if (tid^='T1' and i1c=. and i1_old=2 and i1cx in (1,4)) then i1cr=0;
if (tid^='T1' and i1c=. and i1_old=2 and i1cx in (2,3)) then i1cr=1;

end;

run;


/*shift i1d*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1drx;
if i1dr=0 then i1drx=i1dr;
if (tid>'T2' and i1dr=. and i1_old=2) then i1dr=i1drx;
end;

else do;
retain i1dx ;
if (i1d^=.) then i1dx=i1d;
if (tid='T1' and i1d=.) then i1dx=.;
if (tid^='T1' and i1d=. and i1_old=2 and i1dx in (1,4)) then i1dr=0;
if (tid^='T1' and i1d=. and i1_old=2 and i1dx in (2,3)) then i1dr=1;

end;

run;


/*shift i1e*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1erx;
if i1er=0 then i1erx=i1er;
if (tid>'T2' and i1er=. and i1_old=2) then i1er=i1erx;
end;

else do;
retain i1ex ;
if (i1e^=.) then i1ex=i1e;
if (tid='T1' and i1e=.) then i1ex=.;
if (tid^='T1' and i1e=. and i1_old=2 and i1ex in (1,3)) then i1er=0;
if (tid^='T1' and i1e=. and i1_old=2 and i1ex in (2)) then i1er=1;

end;

run;



/*shift i1f*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1frx;
if i1fr=0 then i1frx=i1fr;
if (tid>'T2' and i1fr=. and i1_old=2) then i1fr=i1frx;
end;

else do;
retain i1fx ;
if (i1f^=.) then i1fx=i1f;
if (tid='T1' and i1f=.) then i1fx=.;
if (tid^='T1' and i1f=. and i1_old=2 and i1fx in (1,3)) then i1fr=0;
if (tid^='T1' and i1f=. and i1_old=2 and i1fx in (2)) then i1fr=1;

end;

run;


/*shift i1g*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1grx;
if i1gr=0 then i1grx=i1gr;
if (tid>'T2' and i1er=. and i1_old=2) then i1gr=i1grx;
end;

else do;
retain i1gx ;
if (i1g^=.) then i1gx=i1g;
if (tid='T1' and i1g=.) then i1gx=.;
if (tid^='T1' and i1g=. and i1_old=2 and i1gx in (1,3)) then i1gr=0;
if (tid^='T1' and i1g=. and i1_old=2 and i1gx in (2)) then i1gr=1;

end;

run;


/*shift i1h*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1hrx;
if i1hr=0 then i1hrx=i1hr;
if (tid>'T2' and i1hr=. and i1_old=2) then i1hr=i1hrx;
end;

else do;
retain i1hx ;
if (i1h^=.) then i1hx=i1h;
if (tid='T1' and i1h=.) then i1hx=.;
if (tid^='T1' and i1h=. and i1_old=2 and i1hx in (1,3)) then i1hr=0;
if (tid^='T1' and i1h=. and i1_old=2 and i1hx in (2)) then i1hr=1;

end;

run;



/*shift i1i*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1irx;
if i1ir=0 then i1irx=i1ir;
if (tid>'T2' and i1ir=. and i1_old=2) then i1ir=i1irx;
end;

else do;
retain i1ix ;
if (i1i^=.) then i1ix=i1i;
if (tid='T1' and i1i=.) then i1ix=.;
if (tid^='T1' and i1i=. and i1_old=2 and i1ix in (1,4)) then i1ir=0;
if (tid^='T1' and i1i=. and i1_old=2 and i1ix in (2,3)) then i1ir=1;

end;

run;


/*shift i1j*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1jrx;
if i1jr=0 then i1jrx=i1jr;
if (tid>'T2' and i1jr=. and i1_old=2) then i1jr=i1jrx;
end;

else do;
retain i1jx ;
if (i1j^=.) then i1jx=i1j;
if (tid='T1' and i1j=.) then i1jx=.;
if (tid^='T1' and i1j=. and i1_old=2 and i1jx in (1,4)) then i1jr=0;
if (tid^='T1' and i1j=. and i1_old=2 and i1jx in (2,3)) then i1jr=1;

end;

run;


/*shift i1k*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1krx;
if i1er=0 then i1krx=i1kr;
if (tid>'T2' and i1kr=. and i1_old=2) then i1kr=i1krx;
end;

else do;
retain i1kx ;
if (i1k^=.) then i1kx=i1k;
if (tid='T1' and i1k=.) then i1kx=.;
if (tid^='T1' and i1k=. and i1_old=2 and i1kx in (1,4)) then i1kr=0;
if (tid^='T1' and i1e=. and i1_old=2 and i1kx in (2,3)) then i1kr=1;

end;

run;


/*shift i1l*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1krx;
if i1kr=0 then i1krx=i1kr;
if (tid>'T2' and i1kr=. and i1_old=2) then i1kr=i1krx;
end;

else do;
retain i1kx ;
if (i1k^=.) then i1kx=i1k;
if (tid='T1' and i1k=.) then i1kx=.;
if (tid^='T1' and i1k=. and i1_old=2 and i1kx in (1,4)) then i1kr=0;
if (tid^='T1' and i1k=. and i1_old=2 and i1kx in (2,3)) then i1kr=1;

end;

run;


/*shift i1m*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1mrx;
if i1mr=0 then i1mrx=i1mr;
if (tid>'T2' and i1mr=. and i1_old=2) then i1mr=i1mrx;
end;

else do;
retain i1mx ;
if (i1m^=.) then i1mx=i1m;
if (tid='T1' and i1m=.) then i1mx=.;
if (tid^='T1' and i1m=. and i1_old=2 and i1mx in (1,4)) then i1mr=0;
if (tid^='T1' and i1m=. and i1_old=2 and i1mx in (2,3)) then i1mr=1;

end;

run;


/*shift i1n*/
data dati_facolta;
set dati_facolta;
if (uid in ('394784','376934','348352','388433','394133','385926','396834','384761','416802','404867','359073','369677','424342',
'380316','339044','381335','404960','391439','354646','327645','394148','419389','338393','394862','410605','321785',
'356375','354849','355323','381420','322756','361790','370975','371685','368346','407304','366286','379520','376754',
'425344','426324','372506','380287','346693','357902','345490','411126','366688','427282','359729','425584','367851',
'265269','387136','376569','262525','394057','388286','405083','395958','400910','347143','355144','417363','372683',
'357489','396312','366452','367804','383744','428808','394564','423966','389353','279243','340160','345647','406159',
'425898','353210','371906','379030','390787','371268','426382','367357','425783','385067','395233','381751','415981',
'272884','376693','356736','398127','366342','385400','373610','381688','347009','327126','410563','372530','373958',
'408010','424951','410268','366116','359551','399757','419049','379244','360923','261773','303948','371989','379157',
'368871','384819','356845','395010','388007','396780','347506','411694','366883','296772','393813','358077','423801',
'395550','391603','320306','360841','357258','343474','386872','414217','351906','366201','393960','319779','382523',
'383559','356074','374199','428831','342880','381826','349333','383956','323113','380329','396044','368356','388788',
'384938','409170','348386','387531','401266','355105','356039','345080','414538','375081','381048','383954','389440',
'396540','368723','399609','367957','393585','404644','399088','386566','372828','411959','233022','324695','322561',
'303784','397380','394430','323633','409455','426827','384893','389260','425022','361688','409252','358208','369865',
'369606','370481','355383','380604','398677','322680','303758','273463','404743','370606','393555','390315','366063',
'352554','370280','385162','393817','375563','390356','375414'))
then do;
retain i1nrx;
if i1nr=0 then i1nrx=i1nr;
if (tid>'T2' and i1nr=. and i1_old=2) then i1nr=i1nrx;
end;

else do;
retain i1nx ;
if (i1n^=.) then i1nx=i1n;
if (tid='T1' and i1n=.) then i1nx=.;
if (tid^='T1' and i1n=. and i1_old=2 and i1nx in (1,3)) then i1nr=0;
if (tid^='T1' and i1n=. and i1_old=2 and i1nx in (2)) then i1nr=1;

end;

run;

/*shift delle attività*/

data dati_facolta;
set dati_facolta;
retain q1b5x;
if (q1b5^=. and b8=1) then q1b5x=q1b5;
if (tid ='T1' and q1b5=. and b8=1) then q1b5x=.;
if (tid^='T1' and  c2 in (3,4) and q1b5=. and b8=1) then q1b5=q1b5x;

run;


/*
data dati_facolta;
set dati_facolta;
retain q1b5bisx;
if (q1b5=18 and q1b5bis^=. and b8=1) then q1b5bisx=q1b5bis;
if (tid ='T1' and q1b5=. and b8=1) then q1b5bisx=.;
if (tid^='T1' and  c2 in (3,4) and q1b5=. and b8=1) then q1b5=q1b5x;

run;*/



data dati_facolta;
set dati_facolta;
retain q1bisx;
if (q1bis^= ' '  and b8=1) then q1bisx=q1bis;
if (tid ='T1' and q1bis=' '  and b8=1) then q1bisx=' ' ;
if (tid^='T1' and  c2 in (3,4) and q1bis=' '  and b8=1) then q1bis=q1bisx;

run;


data dati_facolta;
set dati_facolta;
retain q1dx;
if (q1d^=. and b8=1) then q1dx=q1d;
if (tid ='T1' and q1d=. and b8=1) then q1dx=.;
if (tid^='T1' and  c2 in (3,4) and q1d=. and b8=1) then q1d=q1dx;

run;


data dati_facolta;
set dati_facolta;
retain q1cax;
if (q1ca^=. and b8=1) then q1cax=q1ca;
if (tid ='T1' and q1ca=. and b8=1) then q1cax=.;
if (tid^='T1' and  c2 in (3,4) and q1ca=. and b8=1) then q1ca=q1cax;

run;

data dati_facolta;
set dati_facolta;
retain q1bax;
if (q1ba^=. and b8=1) then q1bax=q1ba;
if (tid ='T1' and q1ba=. and b8=1) then q1bax=.;
if (tid^='T1' and  c2 in (3,4) and q1ba=. and b8=1) then q1ba=q1bax;

run;

data dati_facolta;
set dati_facolta;
retain q1agx;
if (q1ag^=. and b8=1) then q1agx=q1ag;
if (tid ='T1' and q1ag=. and b8=1) then q1agx=.;
if (tid^='T1' and  c2 in (3,4) and q1ag=. and b8=1) then q1ag=q1agx;

run;


data dati_facolta;
set dati_facolta;
retain q1ex;
if (q1e^=. and b8=1) then q1ex=q1e;
if (tid ='T1' and q1d=. and b8=1) then q1ex=.;
if (tid^='T1' and  c2 in (3,4) and q1e=. and b8=1) then q1e=q1ex;

run;

