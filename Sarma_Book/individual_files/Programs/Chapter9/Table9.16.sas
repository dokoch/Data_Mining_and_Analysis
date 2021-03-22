data mylib.TextTopic_train;
 set &em_lib..TextTopic_train;
run;
/* Table 9.16 */
proc print data=&em_lib..TextTopic_train (obs=15) noobs;
 var  Paper TextTopic_Raw1 TextTopic_1 TextTopic_Raw2 TextTopic_2 TextTopic_Raw3 TextTopic_3 target;
 title "Output data set created by Text Topic node (Selected columns)";
run;
