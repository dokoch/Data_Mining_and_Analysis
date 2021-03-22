proc print data=&em_lib..neural_plotds noobs label;
 var _ITER_ _ASE_ _VASE_ ;
 where 41 le _ITER_ le 60;
run;
