/* 27 liglio 2004                                                 */
/* per aggiungere i pesi alle elaborazioni sas su indagine forces */
/* nel mio caso le seguenti righe sono state aggiunte alla fine di merge.sas */


data lib.dforces;
set lib.dforces;
if uid="000000" then delete; /* toglie il test */
if tid="." then delete;      /* toglie dati non validi */
if tid="" then delete; /* 158 non sono missing, sono solo non risposte */
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


/* esempio di uso dei pesi                                               */
/*                                                                       */
/* proc freq;                                                            */
/* tables varb86 * b8;                                                   */
/* weight peso;                                                          */
/* run;                                                                  */
