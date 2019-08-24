function data = extract_data_from_file(path) 

    data=[];
    fileID=fopen(path);
    while ~feof(fileID) 
        
        str=fgetl(fileID);
        split_str=split(strtrim(str));
        
        data_row=[];
        for i=1:length(split_str)
            data_row=[data_row, str2double(split_str(i))];
        end
        
        
        data=[data;data_row];
    end
    fclose(fileID);
    
end