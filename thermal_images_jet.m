%This script creates thermal type 2D images from input text from (3 x 2997) array
%created Octobor 17 2018        %updated October 19th 2018

pause(1);

%global variables
only_serial = false;  %debug replace with type = 'only_serial' or 'uni'
%select file(s) from file browser
[filenames,folder]=uigetfile('*.txt','MultiSelect','on');     % 'input.txt'
app.UIFigure.Visible = 'off';app.UIFigure.Visible = 'on';
if (~filenames)
   return;    %no data, exit gracefully
end

%convert filenames to cell array if not already
if (class(filenames) == 'char') 
    temp = cell(1,1);
    temp{1} = filenames;
    filenames=temp;
end

%main loop
for file_index = 1: length(filenames)        
    %initialize loop variables
    j=1;
    Z = zeros(1,2997);    
    data_writing = false;
    serial = ''; 
    uni_time = '';
    uni_ratio = '';
    format long;

    %open file
    currentfile_base = filenames{file_index};
    currentfile = [folder, currentfile_base];
    fid = fopen(currentfile); 
    raw= fscanf(fid,'%c');
    lines = strsplit(raw,'\n');
    
    %check file type
    if  contains(raw,'Uniform')  
        only_serial = false;
    else 
        only_serial = true;
    end
    
    %data aquisition on single file 
    for i=1: length(lines) 

        % assign serial (only works for TXR right now)
        if strfind( lines{i} ,'TXR')
            tmp = strsplit(lines{i},'TXR'); 
            serial = [strtrim(tmp{2})];
        end
        if only_serial && (strcmp(serial,'') )
            tmp = strsplit(currentfile_base);
            serial = [tmp{2},' ',tmp{3}];
            disp 'serial set using filename'   %debug
            serial 
        end
            
        %assign for 'uniformity time' and 'uniformity ratio'  
        if strfind(  lines{i},'Uniformity time')
             uni_time = strrep(lines{i},' =', ':');
        end
        if strfind(  lines{i},'Uniformity Ratio')
             uni_ratio = strrep(lines{i},' =', ':');
        end

        %check if line is beginning of numeric data    
        if ( starts_180(lines{i}) && ~data_writing)
            data_writing = true;
            disp 'set data_writing to true'
        end

        %check if leaving data
        if ( isempty(lines{i}) || isempty( regexp(lines{i},'\d','ONCE')) )
          data_writing=false; 
        end

        %write data to Z (intensity)
        if (data_writing) 
             spl = strsplit(lines{i}); 
             if (only_serial)
                Z(j) = str2double(spl{4});
             else
                Z(j) = str2double(spl{3});
             end 
             j = j+1; 
        end
    end %data aquisition loop

    disp 'end of data aquisition loop.' 
    disp 'beginning plot'
    
    %display data...imagesc() method  (more pixelated)
    figure 
    hold 'on'

    imagesc([-180:10:180],[-4:0.1:4],reshape(Z,81,37));
    set(gca(),'Ydir','reverse');
    title = setTitle(only_serial,serial,uni_time,uni_ratio);
    annotation('textbox',[0.0,0.94,1.0,0.05],'String',title,'LineStyle','none','BackgroundColor','red' ...
               ,'HorizontalAlignment','center');
    set(gca(),'XLim',[-180,180],'YLim',[-4,4]);
    set(gca(),'Layer','top');
    set(gca(),'TickLength',[0.02,0.02]);
    colormap(jet);
    colorbar();
    xlabel('Transducer Angle'); ylabel('Transducer Length (mm)');
    % optional grid -->  set(gca(),'Layer','top','XGrid','on','YGrid','on','GridLineStyle','-');
    
    %If you prefer smoothed out colors, uncomment lines below.  
    
    %Plot with surf using meshgrid (smoothed out version).
    %surf([-180:10:180],[-4:0.1:4],reshape(Z,81,37),reshape(Z,81,37),'EdgeColor','none','FaceColor','interp');
    %set(gca(),'Ydir','reverse'); 
    %view(2);
    %title = setTitle(only_serial,serial,uni_time,uni_ratio);
    %annotation('textbox',[0.0,0.94,1.0,0.05],'String',title,'LineStyle','none','BackgroundColor','red' ...
    %               ,'HorizontalAlignment','center');
    %set(gca(),'XLim',[-180,180],'YLim',[-4,4]);
    %set(gca(),'Layer','top');
    %set(gca(),'TickLength',[0.02,0.02]);
    % %colormap(jet);
    %colorbar();
    %xlabel('Transducer Angle'); ylabel('Transducer Length (mm)');
   
    %Alternative method
    
    %pcolor method  (smoothed out colors)
    % figure;
    % hold 'on';
    % pcolor([-180:10:180],[-4:0.1:4],reshape(Z,81,37));
    % set(gca(),'Ydir','reverse'); 
    % shading interp;
    %title = setTitle(only_serial,serial,uni_time,uni_ratio);
    %annotation('textbox',[0.0,0.94,1.0,0.05],'String',title,'LineStyle','none','BackgroundColor','red' ...
    %               ,'HorizontalAlignment','center');
    %set(gca(),'XLim',[-180,180],'YLim',[-4,4]);
    %set(gca(),'Layer','top');
    %set(gca(),'TickLength',[0.02,0.02]);
    % %colormap(jet);
    %colorbar();
    %xlabel('Transducer Angle'); ylabel('Transducer Length (mm)');
   
end %file processing loop

%subfunctions 
function out = starts_180(str)
        r1 = regexp(str,'^-180','ONCE');    %regular notation
        r2 = regexp(str,'^-1.80','ONCE');   %scientific notation
        r = ( ~isempty(r1) || ~isempty(r2) );  
        out = r;  
end

function out = setTitle(only_serial,serial,uni_time,uni_ratio)
    if (only_serial)
        title = ['Serial: ',serial];
    else
        title = ['Serial:',serial,'   ',uni_time,'   ',uni_ratio];
    end
    out = title;
end


