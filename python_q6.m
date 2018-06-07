% Python Questions                 Question 6
% Q = sqrt ( (2 * C * D) / H  )   C is 50, H is 30.  
%Take in comma separated string and make into vector of Q
function [] = python_q6 ()
        %initialize values
        C = 50;
        H = 30;
        
        %read data from console
        data = input('Enter a number or list of numbers separated by commas','s');
        data = strip(data);
       
        %split into cell array 
        data = split(data,',');  
        
        %populate Q matrix from cell array
        Q = q6Pop(data,C,H);
               
        %print matrix as ints no decimal values
        Q_int = int32(Q);
        disp (printm(Q_int));
        
        %plot
        p1 = plot([1:size(Q)],Q);
        fig = gcf();
        fig.Name = 'python_q6 Graph';
        fig.NumberTitle = 'off';
        axes = fig.CurrentAxes; 
        axes.Title.String = 'python_q6 Graph';
        axes.XLabel.String = 'Days';
        axes.YLabel.String = 'Jelly Beans';
        
end  %end python_q6

function [Q] = q6Pop(data,C,H)
         
        %make matrix of using size of cell array  
        s = size( data );
        Q = zeros(s);
        
        %check data then populate using Q = sqrt ( (2 * C * D) / H  )
        for i = 1:s
           D = str2num( data{i} ) ;
           if (isempty(D) )       
              warning('Improper data input.  Try again using the format: 1,3,4,5,6,3,4');
              return  %end function if bad data
           else
               Q(i) = sqrt (  (2*C*D) / H ); % Q = sqrt ( (2 * C * D) / H  )
           end 
        end
    end  %end q6Pop()