%Takes csv string of numbers and converts into a 1-D matrix
function [mat] = csv2mat(csv)

        csv = strip(csv);
        %split into cell array 
        csv = split(csv,',');  
        
        %make matrix 
        s = size( csv );
        mat = zeros(s);
        
        %check data then populate matrix
        for i = 1:s
           V = str2num( csv{i} ) ;
           if (isempty(V) )       
              warning('Improper data input.  Try again using the format: 1,3,4,5,6,3,4');
              return  %end function if bad data
           else
               mat(i) = V;  %load the matrix
           end 
        end


end