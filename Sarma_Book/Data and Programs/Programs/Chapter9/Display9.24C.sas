/* Table 9.13 */
proc print data=TFTERMDOC ;
 title "TEXT FILTER TERM_DOCUMENT MATRIX ";
 var Key Document count Term Role ;
 where term in ('abandon', 'abandoned', 'abandoning');
run;
title;

proc sort data=TFTERMDOC out=TFTERMDOC2 ;
by key document ;
run;

proc transpose data=TFTERMDOC2 out=TFtermdocmatrix(drop=_name_) prefix=DOC;
 var count ;
 by key  ;
 id document ;
run;
