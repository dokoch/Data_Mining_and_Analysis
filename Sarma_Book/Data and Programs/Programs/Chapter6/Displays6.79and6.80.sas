%let AGE= 50;
%let NPRVIO = 2;
%let CRED = 670;
DATA NOMINAL;
 *** Compute Linear Predictor;
drop _TEMP;
drop _LP0  _LP1;
_LP0 = 0;
_LP1 = 0;
AGE = &AGE;
NPRVIO = &NPRVIO;
CRED = &CRED;
***  Effect: AGE ;
_TEMP = AGE ;
_LP0 = _LP0 + (    -0.0323912354634 * _TEMP);
_LP1 = _LP1 + (    -0.0228181055783 * _TEMP);
***  Effect: CRED ;
_TEMP = CRED ;
_LP0 = _LP0 + (   -0.01335715577514 * _TEMP);
_LP1 = _LP1 + (   -0.00448783417963 * _TEMP);
***  Effect: NPRVIO ;
_TEMP = NPRVIO ;
_LP0 = _LP0 + (    0.21864487608312 * _TEMP);
_LP1 = _LP1 + (    0.22396412290576 * _TEMP);
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1 _P2;
drop _LPMAX;
_LPMAX= 0;
_LP0 =     1.59463711057944 + _LP0;
if _LPMAX < _LP0 then _LPMAX = _LP0;
_LP1 =    -0.11855123381699 + _LP1;
if _LPMAX < _LP1 then _LPMAX = _LP1;
_LP0 = exp(_LP0 - _LPMAX);
_LP1 = exp(_LP1 - _LPMAX);
_LPMAX = exp(-_LPMAX);
_P2 = 1 / (_LPMAX + _LP0 + _LP1);
_P0 = _LP0 * _P2;
_P1 = _LP1 * _P2;
_P2 = _LPMAX * _P2;

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
ods html file= "C:\TheBook\EM12.1\REPORTS\Chapter6\Nominal.html";
 proc print data=NOMINAL label noobs;
  title "NOMINAL TAGET";
  title2 "AGE=50,CRED=670 and NPRVIO=2";
  var P_LOSSFRQ2 P_LOSSFRQ1 P_LOSSFRQ0 ;
 run;
 ods html close;

