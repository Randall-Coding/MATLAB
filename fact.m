function [output] = fact(n) 

        n = int32(n);   % Screen out non-integers
        %Do work
        if (n > 1)
            output = n * fact(n-1) ;       %recursiion     
        else
            output = 1;                         %end recursion 
        end
        
end