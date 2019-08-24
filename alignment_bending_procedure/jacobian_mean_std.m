clc
clear
close all
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


mu_yd=mu(:,1)';
sigma_yd=sigma(:,1)';
mu_zd=mu(:,3)';
sigma_zd=sigma(:,3)';

list = {'yi,right'; 'yi,center'; 'yi,left'; 'zi,right'; 'zi,center'; 'zi,left'};
c = categorical(list, list);

% y_d graph
bar(c,mu_yd)
hold on

er=errorbar(c,mu_yd,-sigma_yd,sigma_yd);
er.LineStyle = 'none';
er.Color = [0 0 0];

%title('effect of y_d on key-points');
ylabel('j_{X,yd}') 

hold off
figure
% z_d graph
bar(c,mu_zd)
hold on

er=errorbar(c,mu_zd,-sigma_zd,sigma_zd);
er.LineStyle = 'none';
er.Color = [0 0 0];

ylabel('j_{X,zd}') 

hold off


