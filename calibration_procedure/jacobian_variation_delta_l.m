clc
close all
load('J_array_delta_l.mat');

[~,n]=size(J_array_delta_l);

lb=0.005;
ub=0.07;

values=linspace(lb, ub, n);

y_d_idx=1;
z_d_idx=3;

right_row_idx=1;
center_row_idx=3;
left_row_idx=5;

for i=1:n
    
    J=J_array_delta_l{i};
    
    %z_i variation due to y_d
    stem(values(i),J(left_row_idx+1,y_d_idx),'g');    
    hold on;
    stem(values(i),J(center_row_idx+1,y_d_idx),'r');    
    hold on;
    stem(values(i),J(right_row_idx+1,y_d_idx),'b');    
    hold on;
    
    
    %ylim([-0.7, 0.05])
    xlim([lb-0.005 ub+0.005])
end
hold off
legend('d(z_{left})/d(y_d)', 'd(z_{center})/d(y_d)', 'd(z_{right})/d(y_d)');
xlabel('delta_l[m]') 
ylabel('variation along z') 
saveas(gcf,'delta_l_zi_yd.pdf')

figure
for i=1:n
    J=J_array_delta_l{i};
    %y_i variation due to y_d
    stem(values(i),J(left_row_idx,y_d_idx),'g');    
    hold on;
    stem(values(i),J(center_row_idx,y_d_idx),'r');    
    hold on;
    stem(values(i),J(right_row_idx,y_d_idx),'b');    
    hold on;
    
    
    %ylim([-0.2, 0.2])
    xlim([lb-0.005 ub+0.005])
end
hold off
legend('d(y_{left})/d(y_d)', 'd(y_{center})/d(y_d)', 'd(y_{right})/d(y_d)');
xlabel('delta_l[m]') 
ylabel('variation along y') 
saveas(gcf,'delta_l_yi_yd.pdf');

figure
for i=1:n
    J=J_array_delta_l{i};
    %z_i variation due to z_d
    stem(values(i),J(left_row_idx+1,z_d_idx),'g');    
    hold on;
    stem(values(i),J(center_row_idx+1,z_d_idx),'r');    
    hold on;
    stem(values(i),J(right_row_idx+1,z_d_idx),'b');    
    hold on;
    
    
    %ylim([-0.6, 0.6])
   xlim([lb-0.005 ub+0.005])
end
hold off
legend('d(z_{left})/d(z_d)', 'd(z_{center})/d(z_d)', 'd(z_{right})/d(z_d)');
xlabel('delta_l[m]') 
ylabel('variation along z') 
saveas(gcf,'delta_l_yi_zd.pdf')

figure
for i=1:n
    J=J_array_delta_l{i};
    %y_i variation due to z_d
    stem(values(i),J(left_row_idx,z_d_idx),'g');    
    hold on;
    stem(values(i),J(center_row_idx,z_d_idx),'r');    
    hold on;
    stem(values(i),J(right_row_idx,z_d_idx),'b');    
    hold on;
    
    
    %ylim([-0.65, 0.05])
    xlim([lb-0.005 ub+0.005])
end
legend('d(y_{left})/d(z_d)','d(y_{center})/d(z_d)', 'd(y_{right})/d(z_d)');
xlabel('delta_l[m]') 
ylabel('variation along y') 
saveas(gcf,'delta_l_zi_zd.pdf')


    