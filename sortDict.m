%Sorts a lists of words that all have the same first letter  
%  Cell array, C, should be n X 1 dimensions
%  Output is the sorted cell array
%  Varargin should be letter position.  Indicates which letter to sort by, 1st, second, third, etc.

% Takes in an unsorted dictionary cell array.  Each cell is a group of
% words with same first letter.  a,b,c,d....   Output is a sorted
% dictionary
function [output] = sortDict(C,varargin)
    
    if(nargin > 2)
        throw(MException('sortDict() exception','Too many input args into sortDict'));
    end

    if(nargin == 2)
        letter_position = int32(varargin{1})  ;
    end

    if(nargin == 1)
        letter_position = 2 ;
    end

    rc = size(C);
    size_C = rc(1)   ;
    output = cell(size_C,1);  %new cell array
    i_put = 1;  % index for new array
    matches = 0;
    matched = false;  %check for repeats

    %Select search based on letter position
    if(letter_position == 2 )       
        secondLetter() ;
    else    
        nextLetters(C,letter_position);
    end
        
    
    %%Nested functions
    function [] = secondLetter()
        % disp('calling secondLetter()')%%%
        
        i_put = 1;
        
        %length loop pass  
         for i = 1: (size_C)  
                %check word range
                if ( size(C{i}) < letter_position )
                    output{i_put} = C{i};
                    i_put = 1 + i_put; 
                end             
         end
        
        % abc loop pass 
        for abc = int32(97:122)              
            matches = 0;  %reset matches
            for i = 1: (size_C)  
                %check word length and skip short.  
                if ( size(C{i}) < letter_position) 
                   continue;   %skip that word 
                end
                if ( C{i}(letter_position) == char(abc) || C{i}(letter_position) == char(abc-32) )
                    output{i_put} = C{i};
                    i_put = 1 + i_put;
                    matches = 1 + matches;
                end             
            end
            if (matches > 1)
                matched = true ;
            end               
        end
        
        %recursion or stopping condition
        if (matched == true)
           output = sortDict(output,letter_position+1);  
        else
            % recursion done  
        end
    end %end secondLetter()
   
 % nextLetters(C,n): Counts range where previous letter same.  Names should be in order by 1st then 2nd letter already.  
   % then uses switcher(C,range) to switch them up      
    function [] = nextLetters(C, letter_position)
       % disp('calling nextletters')%%%
        
        work_range = [1,1]; 
        nexter = 1;  %reset range     
        i_put = 1;   %reset i_put 
        
        
        for i = 1: (size_C)
                  work_range = [i,i];  %reset range
                   
                %check word length and skip short.  
                word_length = size(C{i});
                word_length = word_length(2);
                if ( word_length < letter_position) 
                    %%% disp('Im skipping!');
                    continue;   %skip that word 
                end 
                   
                  %skip matches already found
                   if (nexter > 1)    
                      nexter = nexter -1 ;  
                      continue;             %skip based on while loop nexter
                   end
                              
                  %this means the last one is by itself and is skipped
                  if (i == size_C)
                     continue;   %skip
                  end
                  
                  %find range
                  while (lower ( C{i}(letter_position - 1) ) == lower ( C{i+1}(letter_position - 1) ) )
                        work_range(2) = work_range(2) + 1;
                        i = i + 1;  
                        nexter = nexter + 1;
                        if(i == size_C)
                            break   %end loop if out of range
                        end
                   end
                    
                    %if we have range, sort range with switcher()
                    %pass if r(1) == r(2) then no matches
                    if  ( work_range(1) < work_range(2) )  
                        C = switcher(work_range,C);             %recursion
                    end                 
            end  % end for loop
           
            output = C;
            % disp( 'Done with nextLetter()' );  %%%  
    end   %end nextLetters()
    
    function [C2] = switcher(r,C)
        %disp( ['Switcher(r,C) called.  Range is : [', num2str(r(1)), ',' , num2str(r(2)), ']' ] );  %%% 
        %r must be a range [x,x+y]
        Cpy = C;
        i_put = r(1);
        matched = false;  %reset stopper
        
        %length loop pass.  Words that are too short to the top of subdivision  
        for i = r(1) : r(2)   
                %check word size
                if ( size(C{i}) < letter_position )
                    Cpy{i_put} = C{i};
                    i_put = 1 + i_put; 
                end             
         end
        
        % abc loop on focused range r
        for abc = int32(97:122)            
            matches = 0;           %reset matches
            for i = r(1) : r(2)   
                 
                %length check 
                if ( size(C{i}) < letter_position )
                   continue;   %skip this word
                end   
                
                %else order by letter  
                if ( C{i}(letter_position) == char(abc) || C{i}(letter_position) == char(abc-32) )
                    Cpy{i_put} = C{i};
                    i_put = 1 + i_put;
                    matches = 1 + matches;
                end             
            end
            
            %break loop if swapping is done
            if (i_put > r(2) )
               break;    
            end
            
            %check matches
            if (matches > 1)
                matched = true ;
            end    
        end  %end for loop    
        
        %recursion / stopping condition
        if (matched)
           nextLetters(Cpy,letter_position+1);  
        else
            output = Cpy;   %update sortDict() output array
        end
        C2 = output;   %%% consider revising
    end  %end switcher()


end % end sortDict(C)