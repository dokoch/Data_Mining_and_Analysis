proc freq  data=&EM_LIB..TextCluster_TRAIN;
 table TextCluster_cluster_*target /nopercent nocol;
run;
