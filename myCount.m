function [output] = myCount(raw_cell,Letter)
    
    output = 0;
    rc = size(raw_cell);
    r = rc(1);
    
    if(Letter < 92)
      Letter = lower(Letter); %make lower case letter
    end
    
    for i = 1:r
      if ( isempty(raw_cell{i}) )
          break;  %exit condition
      elseif (raw_cell{i}(1) == char(Letter)|| raw_cell{i}(1) == char(Letter -32)  )  %convert to char
        output = output + 1; 
      end
    end 
end %end myCount(...)