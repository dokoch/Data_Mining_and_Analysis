libname  mylib 'C:\TheBook\EM14.1\Data\Chapter9' ;
run ;
proc sql ; 
 create table mylib.topic_terms as 
 select distinct(_TERMNUM_) as TERMNUM 
 from &EM_LIB..texttopic_tmout_normalized ;
quit;
data mylib.texttopic_tmout_normalized; 
 set &EM_LIB..texttopic_tmout_normalized;
run;
/*Table 9.14 */ 
proc print data=&EM_LIB..texttopic_tmout_normalized (obs=10);  
  title1 "Selected Elements of the Document-Term Matrix"; 
  title2 "(texttopic_tmout_normalized)" ;  
 run; 

