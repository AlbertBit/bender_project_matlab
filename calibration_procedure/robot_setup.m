clc
clear
close all

lbr = importrobot('iiwa7.urdf');
lbr.DataFormat = 'row';
lbr.Gravity = [0, 0, -9.80665];

n = 100;%????
n_keypoints = 3;
T = 0.005;%sampling time

beam_length = 1.14;%m
beam_radius = 0.032;%m
initial_z = 0.75;
robot_frame_x = 0.15;
fixture = [0.375 0.025; 0.375 -0.025; 0.425 -0.025; 0.425 0.025];

i=i+1;
yd_des_calib = 1;%value(i);
ym_des_calib = 0;
zd_des_calib = 0;
zm_des_calib = 1.5;


base_size = [0.2 0.3 1.5];

ypr_right = [-pi/2, pi/2, 0];
ypr_left = [pi/2, pi/2, 0];
xyz_right = [0, -base_size(2)/2, base_size(3)-0.1];
xyz_left = [0, base_size(2)/2, base_size(3)-0.1];

R_right = eul2rotm(ypr_right);
R_left = eul2rotm(ypr_left);

wf_T_rf_right = [R_right, xyz_right'; 0 0 0 1];
wf_T_rf_left = [R_left, xyz_left'; 0 0 0 1];

fixture_x = 0.8;
fixture_y = -0.1;
fixture_height = 1.5;
    
beam_state_wf_des=fixture_keypoints(fixture_height, fixture_y, n_keypoints);

xyz_0_rf_left = wf_T_rf_left^-1*[ 0.45, 0.6 , 1.45, 1]';
xyz_0_rf_left = xyz_0_rf_left(1:3);
xyz_0_rf_right = wf_T_rf_right^-1*[ 0.45, -0.4 , 1.5, 1]';
xyz_0_rf_right = xyz_0_rf_right(1:3);

load('n_keypoint_variation.mat', 'J_n_03');
J = J_n_03;
