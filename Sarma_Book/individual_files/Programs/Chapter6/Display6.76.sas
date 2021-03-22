/* save the score rankings table from the resuts window in a directory 
   such as mylib below. Then run the program in a sas window */ 
libname mylib "C:\TheBook\Em14.1\Reports\Chapter6";
 
%macro lifts(model=);
data train(rename=(liftc=liftc_train capc=capc_train))
     validate(rename=(liftc=liftc_valid capc=capc_valid)) ; 
     set mylib.Model_&model._ScoreRankings (keep=decile bin datarole liftc capc);

  if upcase(dataRole)='TRAIN'  then output train; else 
  if upcase(dataRole) = 'VALIDATE' then output validate; 
  if decile = 0 then delete ;
  drop datarole ; 
run;

data both ; 
  *retain decile bin liftc_train  liftc_valid capc_train capc_valid ; 
  merge train validate ; 
  by decile ; 
   if decile = 0 then delete ;
  label liftc_train = "Cumulative Lift Training"  
        capc_train = "Cumulative % Captured Response Training"
        liftc_valid = "Cumulative Lift Validation"  
        capc_valid = "Cumulative % Captured Response Validation"  
        decile = "Percentile";
        
run ; 
title "Model_&model";
proc print data=both noobs label split="/"  ; 
  var bin decile liftc_train  liftc_valid capc_train capc_valid ; 
run ;
%mend lifts; 
%*lifts(model=B1); 
%*lifts(model=B2); 
%lifts(model=B3); 
  
