data mylib.TextTopic_Topics;
 set &em_lib..TextTopic_Topics;
run;
/* table 9.15 */
proc print data=&em_lib..TextTopic_Topics ;
 var _displayCat _topicid _docCutoff _termCutoff _name ;
 Title "Topics and Cutoff Values" ;
run;
