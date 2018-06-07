% Python questions           Question 1

% Find the numbers 2000 to 3200 print all the values divisible by seven but
% not five.  Print in comma separated line

function [] = python_q1( )
    min = int32(2000);   % min
    max = int32(3200);   % max
    roughsize_ans = int32(  (max-min + 1) / 7 );   %estimated array size
    answer = zeros(1,roughsize_ans);      %rough pre-allocated array
    
    %check the array if div by 7 and not 5
    counter = 1;
    for r = min:max
       if ( div7(double(r)) && ~ div5(double(r)) )
          answer(counter) = r ;
          counter = counter + 1;
       end
    end
    counter = counter - 1;
    answer_final = resize_array(answer, counter);      %final truncated array
    %print
    string_data = printm(answer_final);
    disp( [ 'python_q1 answer: ', string_data] ) ;
    
    function [answer_div7] = div7(n)  
        double(n);
        answer_div7 = (  (n/7 - round(n/7)) ==  0  ) ;        
    end

    function [answer_div5] = div5(n)
       answer_div5 = (  (n/5 - round(n/5) ) == 0 ) ; 
    end     
end