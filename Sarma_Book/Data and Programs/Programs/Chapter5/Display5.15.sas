proc print data=&EM_LIB..mdlcomp_emroc noobs label;
 var cutoff sensitivity oneminusspecificity ;
 where upcase(datarole) = 'VALIDATE' and upcase(model)="NEURAL" and cutoff ne .;
 Title "ROC Table: Validation Data" ;
 label cutoff = "Cutoff" sensitivity = "Sensitivity"
       oneminusspecificity="1-Specificity";
run;
