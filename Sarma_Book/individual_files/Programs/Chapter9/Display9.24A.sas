libname mylib "C:\TheBook\EM14.1\Data\Chapter9";
run;
data mylib.TEXTFILTER_TERMS;
 set &EM_LIB..TEXTFILTER_TERMS;
run;
/* Table 9.9 */
proc print data=&EM_LIB..TEXTFILTER_TERMS;
 VAR KEY TERM ROLE FREQ NUMDOCS weight keep _ISPAR PARENT PARENT_ID;
 where term in ('abandon' 'abandoned' 'abandoning');
 title "&EM_LIB..TEXTFILTER_TERMS";
run;
data mylib.TEXTFILTER_TERMS_TMF;
 set &EM_LIB..TEXTFILTER_TERMS_TMF;
run;
/*table 9.10 */
proc print data=&EM_LIB..TEXTFILTER_TERMS_TMF;
 VAR KEY TERM ROLE FREQ NUMDOCS weight keep _ISPAR PARENT PARENT_ID;
 where term in ('abandon' 'abandoned' 'abandoning');
 title "&EM_LIB..TEXTFILTER_TERMS_TMF";
run;
title;
proc sql;
 create table mylib.TFTERMS  as
 select DISTINCT term, key, role from &EM_LIB..TEXTFILTER_TERMS_TMF   ;
quit;

proc sql;
 create table mylib.TERMS  as
 select DISTINCT term, key, role from &EM_LIB..TEXTFILTER_TERMS   ;
quit;
/*Table 9.11 */
proc print data=mylib.TERMS;
 where term in ('abandon' 'abandoned' 'abandoning');
 title " TEXT FILTER: DISTINCT TERMS (&EM_LIB..TEXTFILTER_TERMS)";
run;
