function [filenames, uni_times] = sort_by_unitimes(filenames,folder)
  
    if strcmp(class(filenames),'double')
        return;  %debbug exit for real app
    end
    
    %set variables
    app.UIFigure.Visible = 'off';app.UIFigure.Visible = 'on';
    
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
    mixed = sortrows(filenames,2,'ascend'); 
    filenames = mixed(:,1)' ;
    uni_times = mixed(:,2)' ;

    %%subfunctions 
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
                     spl{1};
                     uni_time = str2double(spl{1})
                     if isempty(times{file_index})
                        times{file_index} = uni_time;
                     end
                end
            end %for loop single
        end %for loop all files
        out = times;
    end %get_uni_times()
end