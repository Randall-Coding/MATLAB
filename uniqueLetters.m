%Function uniqueLetters()
% search for unique letters in cell array and output number of unique
% letters
function [letters] = uniqueLetters(C)
    letters = cell(26,1);    
    n = 0;
    rc = size(C);  
    
    %Search through each letter of the alphabet
    for abc = int32(97:122)   % lowercase, use subtraction for capital letters 97-32=65 
        
        %if there is a match for the letter, increment then break loop to
        %...next letter
        for i = 1:rc
            first = C{i}(1);  
            if  (first == abc || first == abc - 32)  % lower or upper case letters
               n = n + 1;
               letters{n} = abc;
               break;
            end
        end
    end
    if (n == 0) 
           warning('Improper input string.  Names must begin with letters'); 
    end
    
    %trim cell
    letters = trimCell(letters,n);
end