%function takes in one or more lines of text, outputs that text in all caps
function [] = python_q9(varargin)
    
    if(isempty(varargin))
        fname = 'sample.txt';
    else
        fname = varargin{1};
    end
    
    T = readtable(fname,'HeaderLines',0,'ReadVariableNames',false,'Delimiter','\n');

    S = T.Var1;

    for i = 1:length(S)  
       if(~isempty(S{i})) 
            disp( upper(S{i}) ); 
       else
           disp(" ");
       end
    end
    
    writetable(T,'new1.txt','QuoteStrings',false,'WriteVariableNames',false);
end %end python_q9