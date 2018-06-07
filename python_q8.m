% Python Questions                 Question 8
% takes in a string of comma separated names via console, 
%..then sorts alphabetically and prints
function [] = python_q8 ()

%Take names
words_str = input('Enter a comma separated list of names:','s');
raw_cell = split(words_str,','); 
rc = size(raw_cell);
r = rc(1);   
c = rc(2);  

% Check each word and count different letters.
unique_Letters = uniqueLetters(raw_cell);

% Make alphabet cell array of n cells ^ from count.  Cell of cells  
size_Letters = size(unique_Letters);
alphabet = cell(size_Letters);      

% Make cell array for each letter and populate.  %Tag at the end  
makeCells();

% Sort:
% sort each cell array alphabet{n} = sortDict(alphabet{n})
for i = 1:size_Letters
    alphabet{i} = sortDict(alphabet{i});   
end

% sort by third or fourth letter if check == again.  Recursive call
% output = sortDict(alphabet)
disp(' '   );
% print list of names
for i = 1:size_Letters
  
    disp(['Cell number: ',num2str(i),' is']); 
    disp(alphabet{i})    
end    
    
    function [] = makeCells()
        % Make cell array for each letter and populate.  %Tag at the end  
        for i = 1 : size_Letters(1)        
            n_count = myCount(raw_cell,unique_Letters{i});
            alphabet{i} = cell(n_count,1);     

            %Populate from input
            n = 1;   %reset n  
            for j = 1:r
               if(lower (raw_cell{j}(1) ) == char(unique_Letters{i}))
                   alphabet{i}{n} = raw_cell{j}; 
                   n = n + 1;   % increment n               
               end
            end %end for#2
        end % end for#1 
    end  % end Make Cells       
    
end %end python_q8()