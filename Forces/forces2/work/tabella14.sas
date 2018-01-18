/* file tabella14.sas     2 luglio 2004                      */
/* sequenza import021.sas  -  merge021.sas  -  tabella14.sas */
/* tabella14.sas    tabella 14.1 ---                              */
/* LIBNAME LIB 'c:\Documenti\dati\forces\work\sas';         */
/* LIBNAME LIBRARY 'c:\Documenti\dati\forces\work\sas';     */
/* FILENAME QBase 'c:\Documenti\dati\forces\work\db1.mdb';  */
/*   LIBNAME LIB 'C:\Documents and Settings\barney\Documenti\forces2\work\sas'; 
   LIBNAME LIBRARY 'C:\Documents and Settings\barney\Documenti\forces2\work\sas';
   FILENAME QBase 'C:\Documents and Settings\barney\Documenti\forces2\work\db1.mdb';  */
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
lav=0;
if b8=1 then lav=1;
studia=0;
if ((i1dr^=4) or (i1er^=4) or (i1fr^=4) or (i1gr^=4) or (i1hr^=4)) then studia = 1;
 cercalav=0;  /* 0=no 1=si  */
 if f4=1 or g3=1 then cercalav =1; 
 /* cercalavoro anche C9, ma solo per chi gia lavora e questo non e il caso */
/* variabili per la tabella 14.2 */
 riflav=0; if (lavorava=1 and fgh6=1 and tid='T1') then riflav=1;
 rifnlav=0; if (lavorava=0 and fgh6=1 and tid='T1') then rifnlav=1;
run;
/* data lib.dforces01; */
/* set lib.dforces01;  */
/* variabili per tab 14.2 - pesata */
/* riflavp=0; if (lavorava=1 and fgh6=1 and tid='T1') then riflavp=1;  */
/* rifnlavp=0; if (lavorava=0 and fgh6=1 and tid='T1') then rifnlavp=1; */
/* weight peso; */
/* run;         */
/* tabelle 14.1 e 14.2 */
proc freq;
title 'fgh8_1=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_1=1 and tid="T1");
run; 
proc freq;
title 'fgh8_2=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_2=1 and tid="T1");
run; 
proc freq;
title 'fgh8_3=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_3=1 and tid="T1");
run; 
proc freq;
title 'fgh8_4=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_4=1 and tid="T1");
run; 
proc freq;
title 'fgh8_5=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_5=1 and tid="T1");
run; 
proc freq;
title 'fgh8_6=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_6=1 and tid="T1");
run; 
proc freq;
title 'fgh8_7=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_7=1 and tid="T1");
run; 
proc freq;
title 'fgh8_8=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_8=1 and tid="T1");
run; 
proc freq;
title 'fgh8_9=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_9=1 and tid="T1");
run; 
proc freq;
title 'fgh8_10=1';
tables lavorava * ld;
where (fgh6=1 and fgh8_10=1 and tid="T1");
run; 

proc freq;
title 'tabelle riassuntive ';
tables fgh6 * tid ;
tables lavorava * fgh6 * tid;
tables fgh8_1 * tid ;
tables fgh8_2 * tid ;
tables fgh8_3 * tid ;
tables fgh8_4 * tid ;
tables fgh8_5 * tid ;
tables fgh8_6 * tid ;
tables fgh8_7 * tid ;
tables fgh8_8 * tid ;
tables fgh8_9 * tid ;
tables fgh8_10 * tid;
run;


proc freq;
tables fgh8_1*tid;
where tid='T1';
run;

proc freq;
title 'totale delle risposte';
tables lavorava * ld;
where (fgh6=1 and tid="T1");
run; 
/* tabella delle percentuali pesate */
proc freq;
title 'fgh8_1=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_1=1 and tid="T1");
weight peso;
run; 
proc freq;
title 'fgh8_2=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_2=1 and tid="T1");
weight peso;
run; 
proc freq;
title 'fgh8_3=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_3=1 and tid="T1");
weight peso;
run; 
proc freq;
title 'fgh8_4=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_4=1 and tid="T1");
weight peso;
run; 
proc freq;
title 'fgh8_5=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_5=1 and tid="T1");
weight peso;
run; 
proc freq;
title 'fgh8_6=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_6=1 and tid="T1");
weight peso;
run; 
proc freq;
title 'fgh8_7=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_7=1 and tid="T1");
weight peso;
run; 
proc freq;
title 'fgh8_8=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_8=1 and tid="T1");
weight peso;
run; 
proc freq;
title 'fgh8_9=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_9=1 and tid="T1");
weight peso;
run; 
proc freq;
title 'fgh8_10=1 - percentuali pesate';
tables lavorava * ld;
where (fgh6=1 and fgh8_10=1 and tid="T1");
weight peso;
run; 

proc freq;
title 'tabelle riassuntiva dei totali - pesata ';
tables lavorava * fgh6 * tid ;
weight peso;
run; 
proc freq;
tables fgh8_1 * riflav;
run;
proc freq;
title ' percentuali totali - pesate ';
tables fgh8_1 * riflav;
tables fgh8_2 * riflav;
tables fgh8_3 * riflav;
tables fgh8_4 * riflav;
tables fgh8_5 * riflav;
tables fgh8_6 * riflav;
tables fgh8_7 * riflav;
tables fgh8_8 * riflav;
tables fgh8_9 * riflav;
tables fgh8_10 * riflav;
tables fgh8_1 * rifnlav;
tables fgh8_2 * rifnlav;
tables fgh8_3 * rifnlav;
tables fgh8_4 * rifnlav;
tables fgh8_5 * rifnlav;
tables fgh8_6 * rifnlav;
tables fgh8_7 * rifnlav;
tables fgh8_8 * rifnlav;
tables fgh8_9 * rifnlav;
tables fgh8_10 * rifnlav;
weight peso;
run;
proc freq;
title ' percentuali laurea diploma - pesate ';
tables ld * fgh8_1 * riflav;
tables ld * fgh8_2 * riflav;
tables ld * fgh8_3 * riflav;
tables ld * fgh8_4 * riflav;
tables ld * fgh8_5 * riflav;
tables ld * fgh8_6 * riflav;
tables ld * fgh8_7 * riflav;
tables ld * fgh8_8 * riflav;
tables ld * fgh8_9 * riflav;
tables ld * fgh8_10 * riflav;
tables ld * fgh8_1 * rifnlav;
tables ld * fgh8_2 * rifnlav;
tables ld * fgh8_3 * rifnlav;
tables ld * fgh8_4 * rifnlav;
tables ld * fgh8_5 * rifnlav;
tables ld * fgh8_6 * rifnlav;
tables ld * fgh8_7 * rifnlav;
tables ld * fgh8_8 * rifnlav;
tables ld * fgh8_9 * rifnlav;
tables ld * fgh8_10 * rifnlav;
weight peso;
run;
***************************************************************;
proc freq;
tables lavorava * ld * fgh8_3;
where fgh6=1 and tid='T1';
weight peso;
run;
proc freq;
tables tid * fgh8_8 * ld;
where fgh6=1 ;
weight peso;
run;
proc freq;
tables fgh8_1 * ld;
tables fgh8_2 * ld;
tables fgh8_3 * ld;
tables fgh8_4 * ld;
tables fgh8_5 * ld;
tables fgh8_6 * ld;
tables fgh8_7 * ld;
tables fgh8_8 * ld;
where fgh6=1 and tid='T1';
weight peso;
run;