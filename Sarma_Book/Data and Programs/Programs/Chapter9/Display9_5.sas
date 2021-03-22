
 libname tmlib "C:\TheBook\EM14.1\TextMiner\SASDATA" ; 
 %tmfilter (dataset=tmlib.federa,
   	   dir=C:\TheBook\EM14.1\TextMiner\Textfiles,
   	   destdir=C:\TheBook\EM14.1\TextMiner\Filtered,
	   ext=txt,
	   language=english ,
	   numchars=32767,force=1) 
;
