 libname tmlib "C:\TextMiner\Public\SASDATA" ; 
 %macro sasdsn(n=,author=); 
 %tmfilter (dataset=Paper&n,
   	   dir=c:\TheBook\EM14.1\TextMiner\TextFiles\Paper&n,
   	   destdir=c:\TextMiner\Public\filteredText,
	   ext=txt,
	   language=english ,
	   numchars=32767,force=1) ;
 data Paper&n ; 
  set Paper&n;
  length AUTHOR $ 16;
  length TEXT_A $ 32767;
  length paper $7 ;
  AUTHOR = "&author" ; 
  TEXT_A = Text ; 
 length Accessed_A 8 Created_A 8 Extension_A $ 32 Filtered_A $ 48 
        Filteredsize_A 8 Language_A $ 7 Modified_A 8 
        Name_A $ 11 omitted_A 8  Size_A 8 
        Truncated_A 8 URI_A $ 60 ;  
       PAPER = "Paper"||"&n"; 
   AUTHOR = "&author" ; 
   TEXT_A = Text ; 
   Accessed_A = Accessed;
   Created_A  = Created ;
   Extension_A = Extension ;
   Filtered_A  = Filtered ;
   Filteredsize_A = Filteredsize; 
   Language_A = Language; 
   Modified_A = Modified ;  
   Name_A     = Name ; 
   omitted_A  = Omitted ; 
   Size_A     = Size ; 
   Truncated_A = Truncated ;  
   URI_A = URI ; 
 drop text Accessed Created Extension  Filtered Filteredsize Language 
      Modified Name Omitted  Size Truncated URI ;  
 run ;  
  %if &n eq 1 %then %do; 
  data tmlib.Federalist;
   set Paper&n;
  run;
 %end ; %else %do; 
  proc append base=tmlib.Federalist data=Paper&n FORCE; run;
 %end ;
 %mend sasdsn ;
%sasdsn(n=1,   Author = HAMILTON);
