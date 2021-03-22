proc format ;
value clfmt
1 = 'Decision 1: P_resp1 >= P_resp0'
0 = 'Decision 0: P_resp1 <  P_resp0';
value $pfmt
'1' = 'Decision 1: Profit under decision 1 >= Profit under decision 0'
'0' = 'Decision 0: Profit under decision 1 <  Profit under decision 0' ;
run;
data temp ;
 set &EM_LIB..score_SCORE;
 CL = P_resp1 ge p_resp0;
run;

ods html file='C:\Thebook\EM14.1\Reports\Chapter4\Chapter4_Dec1.html' ;
 proc freq data=&EM_LIB..score_SCORE;
 table D_resp /nopercent norow nocol ;
 title 'Decisions Based on Profit Maximization' ;
format d_resp $pfmt.;
run;
ods html close;
ods html file='C:\Thebook\EM14.1\Reports\Chapter4\Chapter4_Dec2.html' ;
 proc freq data=TEMP;
 table cl*EM_CLASSIFICATION /nopercent norow nocol ;
 title 'Decisions Based on Maximum Posterior Probability' ;
format cl clfmt.;
run;
ods html close;
