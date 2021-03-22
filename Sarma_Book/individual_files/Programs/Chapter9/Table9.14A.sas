proc sql ; 
  create table S_tmout_normalized as 
   select * from &EM_LIB..TextTopic_tmout_normalized
    where _termnum_ in (8296,15608); 
quit ;
/* Table 9.14A */
proc print data=S_tmout_normalized noobs;
  title1 "The Term 'abandon' in the Document-Term Matrix";  
  title2 "(texttopic_tmout_normalized)" ;  
run; 
