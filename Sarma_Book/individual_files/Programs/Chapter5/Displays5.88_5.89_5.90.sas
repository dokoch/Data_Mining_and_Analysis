libname lib2 'C:\TheBook\EM14.1\DATA\Chapter5' ;
run ;
options center ;
data lib2.Ch5_risk_NN_train ;
 set &EM_import_data;
run;
data lib2.Ch5_risk_NN_validate ;
 set &EM_import_validate ;
run;
 
data lib2.Ch5_risk_NN_test ;
 set &EM_import_test ;
run;
                                                                                       																												
 %macro lifts(ds=);
 data &ds ;
  set lib2.ch5_risk_NN_&ds ;
  keep p_lossfrq0 p_lossfrq1 p_lossfrq2 lossfrq expected_lfrq;
  expected_lfrq = 0*p_lossfrq0 + 1*p_lossfrq1 + 2*p_lossfrq2 ;
 run ;
 proc sort data=&ds;
  by descending expected_lfrq;
 run ;
proc sql noprint;
 select count(*) into : nv1 from
 work.&ds ;
quit ;
data &ds ;
 retain count 0 ;
 set &ds ;
 count+1 ;
 if count < (1/20)*&nv1 then perc=5; else
 if count < (2/20)*&nv1 then perc=10 ; else
 if count < (3/20)*&nv1 then perc=15 ; else
 if count < (4/20)*&nv1 then perc=20 ; else
 if count < (5/20)*&nv1 then perc=25 ; else
 if count < (6/20)*&nv1 then perc=30 ; else
 if count < (7/20)*&nv1 then perc=35; else
 if count < (8/20)*&nv1 then perc=40 ; else
 if count < (9/20)*&nv1 then perc=45 ; else
 if count < (10/20)*&nv1 then perc=50 ; else
 if count < (11/20)*&nv1 then perc=55 ; else
 if count < (12/20)*&nv1 then perc=60 ; else
 if count < (13/20)*&nv1 then perc=65 ; else
 if count < (14/20)*&nv1 then perc=70 ; else
 if count < (15/20)*&nv1 then perc=75 ; else
 if count < (16/20)*&nv1 then perc=80 ; else
 if count < (17/20)*&nv1 then perc=85 ; else
 if count < (18/20)*&nv1 then perc=90 ; else
 if count < (19/20)*&nv1 then perc=95 ; else
 perc = 100 ;
 run ;
proc means data=&ds noprint ;
  class perc ;
  var lossfrq ;
  output out= outsum sum(lossfrq) = sum_lossfrq mean(lossfrq)=mean_lossfrq;
run ;
data Total(keep=sum_lossfrq mean_lossfrq 
     rename=(sum_lossfrq=Tot_lossfrq mean_lossfrq=GRM))
     deciles ;
  set outsum ;
  if _TYPE_ = 0 then output Total;
  else output deciles ;
run ;
data tables ;
 set deciles ;
 if _N_ = 1 then set total ;
run;
data lib2.Ch5_risk_Lift_NN_&ds ;
 set tables ;
 retain cumsum 0 nobs 0;
 cumsum + sum_lossfrq ;
 capc = cumsum/tot_lossfrq ;
 gmean = tot_lossfrq/&nv1 ;
 nobs+_freq_ ;
 meanc = cumsum/nobs ;
 liftc = meanc/GRM;
 label perc='Percentile'
       Mean_lossfrq='Lossfrq Mean'
       Meanc='Lossfrq Cumulative Mean'
       liftc ='Cumulative Lift' ;
 RUN;
 proc print data=lib2.ch5_risk_Lift_NN_&DS label noobs ;
    var perc mean_lossfrq meanc liftc ;
 Title1 "             Loss Frequency: &DS" ;
 Title2  ;
RUN;


%mend lifts ;
 %lifts(ds=TRAIN);
 %lifts(ds=VALIDATE);
 %lifts(ds=TEST) ;
 
