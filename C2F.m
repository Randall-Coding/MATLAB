
function [degF] = C2F(degC)    
    
    %Create new matrix
    rc = size(degC);                
    r = rc(1);
    c = rc(2);
    degF = zeros(r,c,'single');
  
    %Convert and fill in the values of the new matrix
    for x = 1:r
        for y = 1:c 
            degF(x,y) = ( (degC(x,y) * 9/5) + 32 );
        end
    end
end

%Be happy