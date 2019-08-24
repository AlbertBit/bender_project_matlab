clc
clear
close all

lbr = importrobot('iiwa7.urdf');
lbr.DataFormat = 'row';
lbr.Gravity = [0, 0, -9.80665];

n = 100;
T = 0.005;

offset = 0.137; %gripper length
beam_length = 1.14;%m
beam_radius = 0.032;%m
initial_z = 0.75;
robot_frame_x = 0.15;
fixture = [0.275 0.025; 0.275 -0.025; 0.325 -0.025; 0.325 0.025];
yd_des_calib = 0.9;
ym_des_calib = 0;
zd_des_calib = 0;
zm_des_calib = 1.5;
theta_m_des_calib = 0;
delta_u  = [0 0 0 0]';
motion_in_depth = 0;

fixture_height = 1.5;
base_size = [0.2 0.3 1.5];

% you have to impose the constraint on the z because what it is need to
% be controlled is the position of the mid point of the ee
ypr_right = [-pi/2, pi/2, 0];
ypr_left = [pi/2, pi/2, 0];    
%ypr_right = [pi/2, -pi/2, 0];
%ypr_left = [-pi/2, -pi/2, 0];
xyz_right = [0, -base_size(2)/2, base_size(3)-0.1];
xyz_left = [0, base_size(2)/2, base_size(3)-0.1];

R_right = eul2rotm(ypr_right);
R_left = eul2rotm(ypr_left);

wf_T_rf_right = [R_right, xyz_right'; 0 0 0 1];
wf_T_rf_left = [R_left, xyz_left'; 0 0 0 1];

xyz_0_rf_left = wf_T_rf_left^-1*[ 0.45, 0.5 , 1.5, 1]';
xyz_0_rf_left = xyz_0_rf_left(1:3);
xyz_0_rf_right = wf_T_rf_right^-1*[ 0.45, -0.5 , 1.5, 1]';
xyz_0_rf_right = xyz_0_rf_right(1:3);

delta_span=linspace(0.005,0.05,10)+0.05;
J_array_delta_l2=cell(1,length(delta_span));
prog_name='calibration_jacobian_n_3.slx';

for i=1:length(delta_span)

    delta_l=delta_span(i);
    sim(prog_name);

    compute_jacobian

    J_array_delta_l2{i}=J;

end
