/* 4 giugno 04                              */
/* elaborazione per analisi longitudinale   */
/* f. guralumi                              */ 
/*                                          */
LIBNAME LIB 'c:\temp\analisi\sas';
LIBNAME LIBRARY 'c:\temp\analisi\sas';
FILENAME QBase 'c:\temp\analisi\Mdb\RBase.mdb';
options nocenter;
data dati;
merge lib.b8 lib.b8_before;
by uid tid ;
run;
proc sort;
by uid descending tid;
run;

data dati;
set dati;
if  b8=. then b8=b8_before;
run;
data dati;
set dati;
x1=0;
retain b8t3;
retain b8t2;


if (tid='T3') 
		then do;
			if (b8=1)
				then do;
				   b8t3=1;
				   end;
			else do;
				   b8t3=0;
				   b8t2=0;
				   end;
		  end;
		
if (tid='T2') 
		then do;
			if (b8=1) 
					then do;
						if (b8t3=1)
							then do;
								b8t2=b8;
								x1=1;
								b8t3=0;
							end;
						 else do;
						    b8t2=1;
							b8t3=0;
						  end;

				
		 			end;

			else do;
				   b8t3=0;
				   b8t2=0;
				   end;
		  end;

if (tid='T1') 
		then do;
			if (b8=1) 
					then do;
						if (b8t2=1) then do;
								x1=1;
								b8t2=0;
								b8t3=0;
								end;
						else do;
				   			b8t3=0;
				   			b8t2=0;
				   		end;	
						
					end;
			else do;
			   b8t3=0;
    		   b8t2=0;
			end;	

				
		 end;

			

run;


proc freq;
tables x1*tid /nopercent nocum norow nocol;
where x1=1;

run;

proc freq;
tables b8*tid /nopercent nocum norow nocol;
run;

proc freq;
tables b8*tid /nopercent nocum norow nocol;
where x1=1;
run;
