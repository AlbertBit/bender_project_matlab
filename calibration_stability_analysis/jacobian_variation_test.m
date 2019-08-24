clc
close all
load('J_array_4d.mat', 'J_array_2d');

J_array=J_array_2d;

[~,~,~,n]=size(J_array);
values_yd=linspace(1, 0.8, n);
values_zd=linspace(-0.2,0.0, n);

y_d_idx=1;
z_d_idx=3;

right_row_idx=1;
center_row_idx=3;
left_row_idx=5;

for i=1:n
    %z_i variation due to y_d
    stem(values_yd(i),J_array(left_row_idx+1,y_d_idx,i,n),'g');    
    hold on;
    stem(values_yd(i),J_array(center_row_idx+1,y_d_idx,i,n),'r');    
    hold on;
    stem(values_yd(i),J_array(right_row_idx+1,y_d_idx,i,n),'b');    
    hold on;
    
    
    %ylim([-0.7, 0.05])
    %xlim([lb-0.01 ub+0.01])
end
hold off
legend('d(z_{left})/d(y_d)', 'd(z_{center})/d(y_d)', 'd(z_{right})/d(y_d)');
xlabel('y_d configuration[m]') 
ylabel('variation along z') 
saveas(gcf,'yd_configuration_zi_yd.png')

figure
for i=1:n
    %y_i variation due to y_d
    stem(values_yd(i),J_array(left_row_idx,y_d_idx,i,n),'g');    
    hold on;
    stem(values_yd(i),J_array(center_row_idx,y_d_idx,i,n),'r');    
    hold on;
    stem(values_yd(i),J_array(right_row_idx,y_d_idx,i,n),'b');    
    hold on;
    
    
    ylim([-0.2, 0.2])
    %xlim([lb-0.01 ub+0.01])
end
hold off
legend('d(y_{left})/d(y_d)', 'd(y_{center})/d(y_d)', 'd(y_{right})/d(y_d)');
xlabel('y_d configuration[m]') 
ylabel('variation along y') 
saveas(gcf,'yd_configuration_yi_yd.png');

figure
for i=1:n
    %z_i variation due to z_d
    stem(values_zd(i),J_array(left_row_idx+1,z_d_idx,n,i),'g');    
    hold on;
    stem(values_zd(i),J_array(center_row_idx+1,z_d_idx,n,i),'r');    
    hold on;
    stem(values_zd(i),J_array(right_row_idx+1,z_d_idx,n,i),'b');    
    hold on;
    
    
    %ylim([-0.6, 0.6])
    %xlim([lb-0.01 ub+0.01])
end
hold off
legend('d(z_{left})/d(z_d)', 'd(z_{center})/d(z_d)', 'd(z_{right})/d(z_d)');
xlabel('z_d configuration[m]') 
ylabel('variation along z') 
saveas(gcf,'zd_configuration_yi_zd.png')

figure
for i=1:n
    %y_i variation due to z_d
    stem(values_zd(i),J_array(left_row_idx,z_d_idx,n,i),'g');    
    hold on;
    stem(values_zd(i),J_array(center_row_idx,z_d_idx,n,i),'r');    
    hold on;
    stem(values_zd(i),J_array(right_row_idx,z_d_idx,n,i),'b');    
    hold on;
    
    
    %ylim([-0.65, 0.05])
    %xlim([lb-0.01 ub+0.01])
end
legend('d(y_{left})/d(z_d)','d(y_{center})/d(z_d)', 'd(y_{right})/d(z_d)');
xlabel('z_d configuration[m]') 
ylabel('variation along y') 
saveas(gcf,'zd_configuration_zi_zd.png')


    