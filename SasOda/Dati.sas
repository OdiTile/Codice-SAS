libname dati "/home/clto9100" ;
run;

data dati.matricedati;
input x;
cards;
1
2
3
;
run;
proc means;
run;
proc print;
run;
