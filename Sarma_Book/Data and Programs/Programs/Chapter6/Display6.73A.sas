libname lib2 "c:\TheBook\EM14.1\Reports\Chapter6";
run;
%let model= Model_C1;
 
data Reg_Validate;
 set &EM_LIB..Reg_Validate;
 delbal=exp(ldelbal);
run;
proc sort data=Reg_Validate out=validate;
 by descending p_ldelbal ;
run ;
proc sql noprint;
 select count(*) into : nv1 from
 work.validate ;
quit ;
%let scale = 10000000;
data validate ;
 retain count 0 ;
 set validate ;
 count+1 ;
 if count < (1/20)*&nv1  then dec=5; else
 if count < (2/20)*&nv1  then dec=10 ; else
 if count < (3/20)*&nv1  then dec=15 ; else
 if count < (4/20)*&nv1  then dec=20 ; else
 if count < (5/20)*&nv1  then dec=25 ; else
 if count < (6/20)*&nv1  then dec=30 ; else
 if count < (7/20)*&nv1  then dec=35; else
 if count < (8/20)*&nv1  then dec=40 ; else
 if count < (9/20)*&nv1  then dec=45 ; else
 if count < (10/20)*&nv1 then dec=50 ; else
 if count < (11/20)*&nv1 then dec=55 ; else
 if count < (12/20)*&nv1 then dec=60 ; else
 if count < (13/20)*&nv1 then dec=65 ; else
 if count < (14/20)*&nv1 then dec=70 ; else
 if count < (15/20)*&nv1 then dec=75 ; else
 if count < (16/20)*&nv1 then dec=80 ; else
 if count < (17/20)*&nv1 then dec=85 ; else
 if count < (18/20)*&nv1 then dec=90 ; else
 if count < (19/20)*&nv1 then dec=95 ; else
 dec = 100 ;
 run ;
