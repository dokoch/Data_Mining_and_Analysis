proc freq data=&em_lib..TextCluster2_Train;
 table TextCluster2_cluster_*target/missing nopercent nocol;
run;
