libname tmlib "C:\TextMiner\PUBLIC\SASDATA" ;
  
%tmfilter( dataset=tmlib.text,
    dir=C:\TextMiner\PUBLIC\tmfdir,
    destdir=C:\TextMiner\PUBLIC\tmfdir_filtered,
    numchars=32767,
	url=http://www.constitution.org/fed/federa01.htm,
    depth=0,force=1)  

 /*   url=http://www.constitution.org/fed/federa01.htm,  */

 /*	http://www.constitution.org/fed/federa01.htm */


