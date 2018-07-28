function [] = animation_practice()

    close all
    
    l = animatedline;
    % l2 = animatedline(1:10,0.2:0.2:2);
    
    xMax = 100;
    set(gca,'XLim',[0 xMax]);
    set(gca,'YLim',[-1.3 1.3]);
    pause(0.5);
    
    %x = 0:0.5*pi:100*pi; 
    %y = sin(x); 
    x1 = 0;
    y1 = sin(x1); 
    incr = 0.1;        %incrementer 
    
    colors = ["red";"green";"blue";"magenta";"cyan";"black";"red";"green";"blue";"magenta";"cyan";"black"]; 
    wid = 1;
    c = 1;
    
    for i = 1:round(xMax/incr)
        pause(0.01);

        addpoints(l,x1,y1);
        drawnow;
         
        %debug r1 = r1 + 0.2;
        % r2 = r2 + 0.2; 
        % wid = 1 + i/100;    %+ 5/i * (incr/xMax) ;
        wid = 5 ;
        
        x1 = x1 + incr; 
        y1 = sin(x1);
        
        setcolor();
        set(l,'Color',colors( round(c) ),'LineWidth',wid);
    end
    
    
    
   %sub functions 
   function output = setcolor()
         if c > 10 
            c = 1;
         else
            c = c + 1*incr / 10; 
         end
    end   %end setwid() 
end

