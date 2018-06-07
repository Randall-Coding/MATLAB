 %  function to plot is y(t) = 2/9 sqrt(3) * e^(-4t) * sin(wt + pi/3)
 %  looking at plot with different omegas, w.  wi = 4*sqrt(3)
 
 start = clock;
 clf;
 
 omegas = [4 * sqrt(3), 5 * sqrt(3), 10* sqrt(3)...
           , 20 * sqrt(3)] ;  
       
 t = 0:0.01:1.5;
 leg = {};  %legent strings
 
 hold('on');
 
 for w = omegas
     
     y = 2/9 * sqrt(3) * exp(-4 * t).* sin(w*t + pi/3) ;
     plot(t,y,'LineWidth',2);

     leg = cellCat(leg, ['\omega=', num2str( round( w, 2) )] ) ;

 end %for loop
 
 %%%  keyboard ;
 
 legend(leg, 'FontSize',11);
 title('Damping Charts')
 xlabel('time (s)')
 ylabel ('amplitude')
 set(gcf,'NumberTitle','off')
 
 
 hold('off')
 
 elapsed = etime(clock,start)