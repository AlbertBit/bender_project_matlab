%% calibration joint values
%file_name='joint_positions_calibration.txt';
q_gazebo_calibration_left = q_calibration_left;
q_gazebo_calibration_right = q_calibration_right;

q_gazebo_calibration_left(:,2) = -q_gazebo_calibration_left(:,2);
q_gazebo_calibration_left(:,4) = -q_gazebo_calibration_left(:,4);
q_gazebo_calibration_left(:,6) = -q_gazebo_calibration_left(:,6);
q_gazebo_calibration_left(:,7) = q_gazebo_calibration_left(:,7)-pi/4;

q_gazebo_calibration_right(:,2) = -q_gazebo_calibration_right(:,2);
q_gazebo_calibration_right(:,4) = -q_gazebo_calibration_right(:,4);
q_gazebo_calibration_right(:,6) = -q_gazebo_calibration_right(:,6);

[n_calibration,~] = size(q_calibration_left);
n_calibration=1;
f_calibration = fopen(file_name,'wt');

fprintf(f_calibration, '%d\n',n_calibration);
for ii = 1:n_calibration
    fprintf(f_calibration,'%g\t',[q_gazebo_calibration_left(ii,:), q_gazebo_calibration_right(ii,:)]);
    fprintf(f_calibration,'\n');
end
fclose(f_calibration);


%% motion
% 
% q_gazebo_left = q_left;
% q_gazebo_right = q_right;
% 
% q_gazebo_left(:,2) = -q_gazebo_left(:,2);
% q_gazebo_left(:,4) = -q_gazebo_left(:,4);
% q_gazebo_left(:,6) = -q_gazebo_left(:,6);
% 
% q_gazebo_right(:,2) = -q_gazebo_right(:,2);
% q_gazebo_right(:,4) = -q_gazebo_right(:,4);
% q_gazebo_right(:,6) = -q_gazebo_right(:,6);
% 
% [n,~] = size(q_calibration_left);
% 
% 
% f = fopen('joint_positions.txt','wt');
% 
% 
% 
% 
% fprintf(f, '%d\n',n);
% for ii = 1:n
%     fprintf(f,'%g\t',[q_gazebo_left(ii,:), q_gazebo_right(ii,:)]);
%     fprintf(f,'\n');
% end
% fclose(f);