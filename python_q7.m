% Python Questions                 Question 7
%  
function [] = python_q7() 
    
    %Obtain X,Y then convert to matrix
    csv = input('Input number value for X and Y using format: X,Y','s');
    XY = csv2mat(csv);
    
    %Convert to scalar
    X = int32(XY(1));
    Y = int32(XY(2));
    
    %Create matrix
    mat = zeros(X,Y);
    
    %Populate based in M(i,j) = i*j (0 base, so using a and b).
    a = 0; b = 0; 
    for i = 1:X
       for j = 1:Y
           mat(i,j) = (a*b);
           b = b +1;
       end       
        b = 0;  %reset b
        a = a + 1;
    end
    
    %Print matrix
    disp( printm(mat));
end % end python_q7 