 * Table 9.7 ; 
proc print data=mylib.Textparsing_Tmout;
 where key in (8296,15608,12281);
 title "&EM_LIB..TEXTPARSING_TMOUT";
run;
proc sql ;
 create table mylib.termdoc as
  select a.* , b.term,b.Role
  from mylib.Textparsing_tmout as a left join mylib.terms as b
  on a.key = b.key
  order by term , document ;
quit;
 * Table 9.8 ;
proc print data=mylib.termdoc ;
 title "TERM_DOCUMENT MATRIX ";
 where term in ('abandon', 'abandoned', 'abandoning');
run;
proc sort data=mylib.termdoc out=termdocs ;
by key document ;
run;
proc transpose data=termdocs out=mylib.termdocmatrix(drop=_name_) prefix=DOC;
 var count ;
 by key  ;
 id document ;
run;
