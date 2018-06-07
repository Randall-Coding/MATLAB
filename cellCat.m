%for 1-D cell array concatenation.  Horizontal cell array.  
function [newCell] = cellCat (C,c)  
     s = size(C); 
     s = s(2); 
     newCell = cell(1,s+1); 
    
     %set value and end function if empty
     if ( isempty(C) )
         newCell = C;
         newCell{1} = c;
         return;  %end function   
     end
     
     %else loop
     for i = 1:s
        newCell{i} = C{i} ;
     end
        newCell{s+1} = c;
end