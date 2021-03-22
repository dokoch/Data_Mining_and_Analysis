data _NULL_ ;
 file print ;
 set lib2.Lift_&model ;
 if _N_ = 1 then do ;
 put @1 "&model" ;
 put ' ' ;
 put @35'INCREASE IN DEPOSITS' ;
 put ' ' ;
 put @1 '' @40 'Cumulative' @52 'Cumulative' @64 'Cumulative' @76 'Cumulative' ;
 put @1 'Percentile ' @20 'Sum' @30 'Mean' @44 'Sum' @57 'Mean' @66 'Lift' @76'Capture' ;
 put @1 '  ' @76 'Rate(%)'  ;
 put ' ' ;
  end ;
 put @2 dec 4. @15 sum_delbal dollar10.0 @25 mean_delbal dollar10.0
     @38 cumsum dollar12.0 @50 meanc dollar11.0 @64 liftc 6.2 @75 capc 6.1 ;
run ;
