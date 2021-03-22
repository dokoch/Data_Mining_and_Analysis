data mylib.Textparsing_tmout;
 set &em_lib..Textparsing_tmout;
 rename _Termnum_ = key;
 rename _document_ = document;
 rename _count_ = count;
run;
 proc sql;
 create table mylib.terms as
 select distinct term, key, Role
from &em_lib..Textparsing_terms;
quit;
* Table 9.5 ; 
proc print data=mylib.TextParsing_Terms;
 VAR KEY TERM ROLE FREQ NUMDOCS keep _ISPAR PARENT PARENT_ID;
 where term in ('abandon' 'abandoned' 'abandoning');
 title '&EM_LIB..TEXTPARSING_TERMS';
run;
 * Table 9.6;
proc print data=mylib.terms;
 where term in ('abandon' 'abandoned' 'abandoning');
 title " DISTINCT TERMS";                                   
run;
