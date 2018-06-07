%returns a copy of the cell without empty trailing cells
function [tC] = trimCell(C,varargin)
        
        if  isempty(varargin)  
            
            n = this_count(C)  %%%%%%%%%%%%%%%%%%%
            tC = cell(n,1);

            for i = 1:n
               tC{i} = C{i}; 
            end
            %%%disp('No arg condition')
            return;          
        end
        
        if nargin > 2
            warning('too many arguments into trimCell(...) returning cell array as is' );
            tC = C;
            return
        end
        
        if( nargin == 2 && isnumeric(varargin{1})  )
            n = int32(varargin{1});
            tC = cell(n,1);

            for i = 1:n
               tC{i} = C{i}; 
            end          
        end
        
        
        
        %%Sub functions
    function [output] = this_count(C)
        output = 0;
        rc = size(C);
        r = rc(1);

        for ii = 1:r
            if ( isempty(C{ii}) )
                continue;  %go to next cell
            else  
                output = output + 1;
            end
        end 
    end

end %end trimCell.m