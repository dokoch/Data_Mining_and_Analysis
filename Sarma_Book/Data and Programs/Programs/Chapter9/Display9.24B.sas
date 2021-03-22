data mylib.TextFilter_Transaction ;
 set  &EM_LIB..TextFilter_Transaction ;
run;
 /*Table 9.12 */
proc print data=mylib.TextFilter_Transaction   ;
 where _termnum_  in (8296,15608,12281);
 title "&EM_LIB..TEXTFILTER_TRANSACTION";
run;
title;
data TextFilter_Transaction ;
 set &EM_LIB..TextFilter_Transaction ;
 rename _termnum_ = key;
 rename _document_ = document;
 rename _count_ = count ;
run;
proc sql ;
 create table TFTERMDOC as
  select a.* , b.term,b.Role
  from TextFilter_Transaction as a left join mylib.TFTERMS as b
  on a.key = b.key
  order by term , document ;
quit;
