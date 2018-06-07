function [] = printc(c)

    if(iscell(c))
        s = size (c);
        n = s(2);
        output = '{';      %add {
         
        for i = 1:n
            pair = c{i};
            for j = 1:2
                output = [output, num2str( pair(1,j) ) ]; 
                if(j == 1)
                    output = [output, ' :' ];       %add :       
                else
                    output = [output, ', ' ];        %add ,
                end
            end
        end
               output = strip(output,'right');   %remove extra ' ' 
               output = strip(output,'right' , ','); %remove extra ','
               output = [output, '}' ]; %add }
               
               %print output
               disp(output);
    %%Error handling           
    else
        %leaving and warning
        warning('Input was no a cell function printc().  Use a cell instead');
    end
    
end