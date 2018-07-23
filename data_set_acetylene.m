function [] = data_set_acetylene()

    load acetylene.mat;

    disp('This is acetylene data');

    plot(x1,y);
    pause(1);
    figure;
    plot(x2,y);
    pause(1);
    figure;
    plot(x3,y);

    option = ' ';  

    while option ~= 'q'  
        option = input('press q to close graphs','s');
    end

   close all;

end 