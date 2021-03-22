options center ;
proc print data=&EM_LIB..MdlComp_EMRANK label noobs ;
 where upcase(datarole) = "TRAIN" and bin ne . ;
 var bin decile resp respc lift liftc cap capc ;
 title "Lift and Capture Rates: Training Data set";
run;
proc print data=&EM_LIB..MdlComp_EMRANK label noobs;
 where upcase(datarole) = "VALIDATE" and bin ne . ;
 var bin decile resp respc lift liftc cap capc ;
 title "Lift and Capture Rates: Validation Data set";
run;
proc print data=&EM_LIB..MdlComp_EMRANK label noobs;
 where upcase(datarole) = "TEST" and bin ne . ;
 var bin decile resp respc lift liftc cap capc ;
 title "Lift and Capture Rates: Test Data set";
run;
