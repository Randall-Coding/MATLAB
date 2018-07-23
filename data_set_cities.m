function [] = data_set_cities(varargin) 

    close(gcf)
    load 'cities.mat' ;  %  variables: names (of cities), categories (1-9), ratings (1-9) for each city.  
                         %  cities.mat is part of the data sets included in Statistics and Machine Learning Toolbox 
    
     if (length(varargin) == 1)
       i = varargin{1};
    else
        i = 1;     
    end
    
    categories = cellstr(categories);
    categories = categorical(categories);
    
    
    bar(categories,ratings(i,:));
    
    my_title = ['Quality of life rating for: ', names(i,:)];  
    title( my_title, 'Units','normalized','Position', [0.7,1],'HorizontalAlignment', 'center' );  
end