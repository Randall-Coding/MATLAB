%This function takes an array of numbers and outputs an array of their
%respective factorial
function [output_m]  =  factm(m) 
     
    rc = size(m);
    r = rc(1);
    c = rc(2);
    output_m = zeros(r,c);

    for x = 1:r
        for y = 1:c 
            output_m(x,y) = fact( m(x,y) );   % calling fact(n) for each element
        end
    end
end