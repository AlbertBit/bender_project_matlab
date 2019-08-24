    path2pc='./jacobian_20190701/';
    %extract files
    pcs = dir(fullfile(path2pc,'*.txt'));

    J_experiments=zeros(6,4,length(pcs));
    for i = 1:length(pcs)
        
        
        fileID = fopen(strcat(path2pc,pcs(i).name));
        size = fscanf(fileID, '%d', [1,2]);
        J = fscanf(fileID, '%f', [size(2),size(1)])';
        J_experiments(:,:,i)=J;
        fclose(fileID);

    end 
    
    
    mu=mean(J_experiments,3);
    
    
    sigma=std(J_experiments,0,3);


