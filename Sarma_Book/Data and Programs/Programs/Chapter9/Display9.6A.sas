
 data tmlib.Federalist2;
  length TEXT $ 32767;
  length Filtered $ 48 
         Filteredsize 8 Language $ 7 Modified 8 
         Name $ 11 omitted 8  Size 8 
         Truncated 8 URI $ 60  
		 Accessed 8 Created 8 Extension $ 32 ;
  set tmlib.Federalist;
  TEXT = TEXT_A;
  drop TEXT_A;
  URI= URI_A;
  drop URI_A;
  Filtered = Filtered_A ;
  drop Filtered_A ; 
  Name =  Name_A ; drop Name_A ;
  Filteredsize = Filteredsize_A ; drop Filteredsize_A;
  Language  = Language_A; drop  Language_A ;
  omitted   = omitted_A ; drop omitted_A;
  Truncated = Truncated_A ; drop Truncated_A;
  Modified = Modified_A; drop Modified_A;
  Size = Size_A; drop Size_A;
  Accessed  = Accessed_A; drop Accessed_A;
  Created = Created_A; drop Created_A;
  Extension= Extension_A; drop Extension_A;
  If author = "HAMILTON" Then TARGET = 1 ; ELSE TARGET = 0 ;   
  if author in ('MADISON_HAMILTON', 'JAY') then delete;                    
 run;
