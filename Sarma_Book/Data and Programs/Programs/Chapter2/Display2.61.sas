/* You can run this code from the SAS code node */
proc print data=&EM_LIB..tsdc_decompout label noobs; 
 var STATE Product MNTH_YR _SEASON_ SC SA ORIGINAL _NAME_ ; 
 where STATE = "CT" and Product = "A";
run;
