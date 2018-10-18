%This script creates thermal type 2D images from input text from (3 x n) array
%created Octobor 17 2018 

%initialize
j=1;
%X = zeros(1,2997);
%Y = zeros(1,2997);
Z = zeros(1,2997);
data_writing = false;
format long;

%open file
fid = fopen('input.txt'); raw= fscanf(fid,'%c');
S = strsplit(raw,'\n');


%main loop 
for i=1: length(S) 
    
    % assign serial (only works for TXR right now
    if strfind( S{i} ,'TXR')
        tmp = strsplit(S{i},'TXR'); 
        serial = ["Serial:" + strtrim(tmp{2})];
    end

    %assign for %'uniformity time' and 'uniformity ratio'  
    if strfind(  S{i},'Uniformity time')
         uni_time = strrep(S{i},' =', ':');
    end
    if strfind(  S{i},'Uniformity Ratio')
         uni_ratio = strrep(S{i},' =', ':');
    end

    %check if line is beginning of numeric data    
    if ( starts_180(S{i}) && ~data_writing)
        data_writing = true;
        disp 'set data_writing to true'
    end

    %check if leaving data
    if ( isempty(S{i}) || isempty( regexp(S{i},'\d','ONCE')) )
      data_writing=false; 
    end

    %write data if applicable
    if (data_writing) 
         %just write to each array X,Y,Z 	      ( vpa(spl{3}))
         spl = strsplit(S{i}); 
         % X(j) = str2double(spl{1}); 
         %Y(j) = str2double(spl{2});
         Z(j) = str2double(spl{3});
         j = j+1; 
    end
end %main for loop

%debug check
disp 'end of main loop.  data should by parsed into arrays' 

% use X, Y, Z in plot meshgrid way.  works fine
%surf([-180:10:180],[-4:0.1:4],reshape(Z,81,37),reshape(Z,81,37),'EdgeColor','none','FaceColor','interp');
%set(gca(),'Ydir','reverse'); 
%view(2);

close all  %debug can remove

%imagesc method
% figure 
% hold 'on'
% % use X, Y, Z in plot (scatter plot method);
% disp 'begining plot'
% imagesc([-180:10:180],[-4:0.1:4],reshape(Z,81,37));
% set(gca(),'Ydir','reverse');
% annotation('textbox',[0.0,0.94,0.5,0.05],'String',serial,'LineStyle','none','BackgroundColor','r');
% annotation('textbox',[0.36,0.94,0.5,0.05],'String',uni_time,'LineStyle','none' ,'BackgroundColor','r');
% annotation('textbox',[0.70,0.94,0.5,0.05],'String',uni_ratio,'LineStyle','none' ,'BackgroundColor','r');
% % pause(2)

%pcolor method, seems to be best
figure;
hold 'on';
pcolor([-180:10:180],[-4:0.1:4],reshape(Z,81,37));
set(gca(),'Ydir','reverse'); 
shading interp;
annotation('textbox',[0.0,0.94,0.5,0.05],'String',serial,'LineStyle','none','BackgroundColor','r');
annotation('textbox',[0.35,0.94,0.5,0.05],'String',uni_time,'LineStyle','none' ,'BackgroundColor','r');
annotation('textbox',[0.69,0.94,0.5,0.05],'String',uni_ratio,'LineStyle','none' ,'BackgroundColor','r');
pause(1);

%subfunctions 
function out = starts_180(str)
        r = regexp(str,'^-180','ONCE');
        r = ~isempty(r);  
        out = r;  
end

%%% more description notes from client
% O data is a cylinder on a raft   360 deg scan .  Angle, Height, Intensity. 
% O display
% O darkblue to red   1 should be the highest
%   executable  (open up a browser to select, GUI)
% O parsing  data starts at -180 
% O numbers after TXR displayed as 'serial number', above chart.
% O 'uniformity time' and 'uniformity ratio' on same line               
    %%%Uniformity time =70.35 sec
    %%%%Uniformity Ratio =0.51353


