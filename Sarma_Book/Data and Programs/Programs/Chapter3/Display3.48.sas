proc freq data=&EM_IMPORT_DATA;
 table CVAR03 G_CVAR03/ missing;
 table CVAR03*G_CVAR03/ nrow nocol nopercent missing ;
run;
