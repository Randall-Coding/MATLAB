function [] = tic_toc 
    
    close all;
    
    tic
    x = 1:100;
    toc
    
    tic
    y = sin(x);
    toc
    
    tic
    plot(x,y)
    toc
    

end