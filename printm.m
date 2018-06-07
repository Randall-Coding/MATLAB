function [output] = printm(m) 
    rc = size(m);
    r = rc(1);
    c = rc(2);
    
    n1 = 1;
    n2 = 1;
    
    output = '' ;     %Initialize char string  %%% pre-allocation is preferred
   
    while(n1 <= r) 
       while(n2 <= c)    
           if (n1 == 1 && n2 == 1)
               output = [output, num2str( m(n1,n2))];
           else    
           output  = [output,',', num2str( m(n1,n2))];
           end
           
           n2 = n2 + 1;    %incement n2
       end
            n2 = 1;    % reset n2
            n1 = n1+1;   % increment n1 / ending condition
    end
end