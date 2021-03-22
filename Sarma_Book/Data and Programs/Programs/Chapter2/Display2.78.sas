libname TheBook "C:\TheBook\EM14.1\Data\Chapter2";
run ; 
proc freq data=TheBook.NN_RESP_DATA;
 table RESTYPE*RESP/nopercent norow missing; 
run ;

