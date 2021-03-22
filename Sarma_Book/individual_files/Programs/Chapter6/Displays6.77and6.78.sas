%let AGE = 50;
%let NPRVIO = 2;
%let CRED = 670;

*** Compute Linear Predictor;
Data ordinal;
 AGE=&AGE;
 NPRVIO = &NPRVIO;
 CRED=&CRED;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AGE ;
_TEMP = AGE ;
_LP0 = _LP0 + (   -0.02307201027961 * _TEMP);

***  Effect: CRED ;
_TEMP = CRED ;
_LP0 = _LP0 + (   -0.00498225050304 * _TEMP);

***  Effect: NPRVIO ;
_TEMP = NPRVIO ;
_LP0 = _LP0 + (    0.22524384228134 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1 _P2;
_TEMP =    -2.88399896897927 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_TEMP =     0.21333987443107 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P1 = _TEMP / (1 + _TEMP);
end;
else _P1 = 1 / (1 + exp(-_TEMP));
_P2 = 1.0 - _P1;
_P1 = _P1 - _P0;

*** Posterior Probabilities and Predicted Level;
label P_LOSSFRQ2 = 'Predicted: LOSSFRQ=2' ;
label P_LOSSFRQ1 = 'Predicted: LOSSFRQ=1' ;
label P_LOSSFRQ0 = 'Predicted: LOSSFRQ=0' ;
P_LOSSFRQ2 = _P0;
_MAXP = _P0;
_IY = 1;
P_LOSSFRQ1 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
P_LOSSFRQ0 = _P2;
if (_P2 >  _MAXP + 1E-8) then do;
   _MAXP = _P2;
   _IY = 3;
end;
run;

ods listing;
ods html file="C:\TheBook\EM12.1\Reports\Chapter6\Ordinal.html";
proc print data=ORDINAL label noobs;
title "ORDINAL TARGET" ;
title2 "AGE=50, CRED=670 and NPRVIO=2";
var P_LOSSFRQ2 P_LOSSFRQ1 P_LOSSFRQ0;
run;
ods html close;
