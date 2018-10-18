%This script creates thermal type 2D images from input text from (3 x 2997) array
%created Octobor 17 2018 

[filenames,folder]=uigetfile('*.txt','MultiSelect','on');     % 'input.txt'
pause(1);
app.UIFigure.Visible = 'off';app.UIFigure.Visible = 'on';

%no data, exit gracefully
if (~filenames)
   return; 
end
%convert to cell array if needed
if (class(filenames) == 'char') 
    temp = cell(1,1);
    temp{1} = filenames;
    filenames=temp;
end

for file_index = 1: length(filenames)        
    j=1;
    Z = zeros(1,2997);    
    data_writing = false;
    format long;

    %open file
    currentfile = [folder, filenames{file_index}];
    fid = fopen(currentfile); 
    raw= fscanf(fid,'%c');
    S = strsplit(raw,'\n');


    %data aquisition loop (single file) 
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
             spl = strsplit(S{i}); 
             Z(j) = str2double(spl{3});
             j = j+1; 
        end
    end %data aquisition loop

    
    disp 'end of data aquisition loop.  data should by parsed into arrays' 
    disp 'begining plot'
    
    
    %imagesc method  (more pixelated)
    figure 
    hold 'on'

    imagesc([-180:10:180],[-4:0.1:4],reshape(Z,81,37));
    set(gca(),'Ydir','reverse');
    annotation('textbox',[0.0,0.94,0.5,0.05],'String',serial,'LineStyle','none','BackgroundColor','r');
    annotation('textbox',[0.36,0.94,0.5,0.05],'String',uni_time,'LineStyle','none' ,'BackgroundColor','r');
    annotation('textbox',[0.70,0.94,0.5,0.05],'String',uni_ratio,'LineStyle','none' ,'BackgroundColor','r');
    set(gca(),'XLim',[-180,180],'YLim',[-4,4]);
    set(gca(),'Layer','top');
    set(gca(),'TickLength',[0.02,0.02]);
    colormap(jet);
    colorbar();
    xlabel('Transducer Angle'); ylabel('Transducer Length (mm)');
    % grid -->  set(gca(),'Layer','top','XGrid','on','YGrid','on','GridLineStyle','-');
    
    %old way (commented out) plot with surf using meshgrid (smoothed out version).
    %surf([-180:10:180],[-4:0.1:4],reshape(Z,81,37),reshape(Z,81,37),'EdgeColor','none','FaceColor','interp');
    %set(gca(),'Ydir','reverse'); 
    %view(2);
    % annotation('textbox',[0.0,0.94,0.5,0.05],'String',serial,'LineStyle','none','BackgroundColor','r');
    % annotation('textbox',[0.35,0.94,0.5,0.05],'String',uni_time,'LineStyle','none' ,'BackgroundColor','r');
    % annotation('textbox',[0.69,0.94,0.5,0.05],'String',uni_ratio,'LineStyle','none' ,'BackgroundColor','r');

    
    %pcolor method  (smoothed out colors)
    % figure;
    % hold 'on';
    % pcolor([-180:10:180],[-4:0.1:4],reshape(Z,81,37));
    % set(gca(),'Ydir','reverse'); 
    % shading interp;
    % annotation('textbox',[0.0,0.94,0.5,0.05],'String',serial,'LineStyle','none','BackgroundColor','r');
    % annotation('textbox',[0.35,0.94,0.5,0.05],'String',uni_time,'LineStyle','none' ,'BackgroundColor','r');
    % annotation('textbox',[0.69,0.94,0.5,0.05],'String',uni_ratio,'LineStyle','none' ,'BackgroundColor','r');

end %file processing loop

%subfunctions 
function out = starts_180(str)
        r = regexp(str,'^-180','ONCE');
        r = ~isempty(r);  
        out = r;  
end


