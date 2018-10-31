function [] = animate(type,fig_width,fig_height,filenames,folder,outname,framerate)

%%debug presets
%[filenames,folder]=uigetfile('*.txt','MultiSelect','on');  %%debug
%fig_width = 400;
%fig_height = 200;
%type.colormap = 'jet';
%outname = 'default'; 
%%debug presets

    pause(1); 
    %exit is no files selected
    if strcmp(class(filenames),'double')
        disp 'filenames is empty, quitting function animate(..)'
        return;  %debbug exit for real app
    end
    
    %set variables
    video = VideoWriter(outname,'MPEG-4');
    %video = VideoWriter(outname,'Uncompressed AVI');
    video.FrameRate = framerate;
    fig = figure ('Name','Creating Video','NumberTitle','off','OuterPosition',[300,200,fig_width,fig_height]); 
    frames = getframe(fig); 
    pause(1);
    only_serial = false;  
    
    %convert filenames to cell array if not already
    if strcmp(class(filenames), 'char') 
        temp = cell(1,1);
        temp{1} = filenames;
        filenames=temp;
    end
    
    %make array of uniform times
    uni_times = get_uni_times(filenames,folder);
    
    %combine with file names
    filenames = [filenames',uni_times'];  
    %sort by lowest to highest
    filenames = sortrows(filenames,2,'ascend'); 
    
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
        fig.Visible = 'off';
        fig.Visible = 'on';
        imagesc([-180:10:180],[-4:0.1:4],reshape(Z,81,37));
        title = setTitle(only_serial,serial,uni_time,uni_ratio);
        annotation('textbox',[0.0,0.94,1.0,0.05],'String',title,'LineStyle','none','BackgroundColor','red' ...
                   ,'HorizontalAlignment','center','VerticalAlignment','middle');
        set(gca(),'Ydir','reverse');
        set(gca(),'XLim',[-180,180],'YLim',[-4,4]);
        set(gca(),'Layer','top');
        set(gca(),'TickLength',[0.02,0.02]); 
        colormap(type.colormap); 
        colorbar();
        xlabel('Transducer Angle'); ylabel('Transducer Length (mm)');
        set(gcf(),'Name','Creating Video','NumberTitle','off');
        frames(file_index) = getframe(gcf);
        %pause(0.1)
         
        % optional grid -->  set(gca(),'Layer','top','XGrid','on','YGrid','on','GridLineStyle','-');

        %Alternative Method, if you prefer smoothed out colors  

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

        %Alternative method #2.  Smoothed colors and less processing 

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
    fclose(fid); 
    end %main loop / file processing
    
    
    %animate 
    open(video);
    writeVideo(video,frames);
    close(video);
    disp 'Video writing complete' 
    close(gcf);
    
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

    function out = get_uni_times(filenames,folder)
        %all files loop
        times = cell(1,length(filenames)); 
        
        for file_index = 1: length(filenames)        
            %initialize loop variables
            j=1;       
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

            %data aquisition on single file 
            for i=1: length(lines) 
                %assign for 'uniformity time' and 'uniformity ratio'  
                if strfind(  lines{i},'Uniformity time') 
                     spl = strsplit(lines{i},'Uniformity time =');
                     spl = strsplit(spl{2},'sec');
                    
                     uni_time = str2double(spl{1});
                     if isempty(times{file_index})
                        times{file_index} = uni_time;
                     end
                end
            end %for loop single
        end %for loop all files
        out = times;
    end %get_uni_times()
end  %animate(..) 
