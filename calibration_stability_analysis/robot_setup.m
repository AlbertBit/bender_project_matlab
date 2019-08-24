clc
clear
close all

lbr = importrobot('iiwa7.urdf');
lbr.DataFormat = 'row';
lbr.Gravity = [0, 0, -9.80665];

n = 100;
num_elements = 12;
T = 0.005;

offset = 0.137; %gripper length
beam_length = 1.14;%m
beam_radius = 0.032;%m
initial_z = 0.75;
robot_frame_x = 0.15;
fixture = [0.275 0.025; 0.275 -0.025; 0.325 -0.025; 0.325 0.025];
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

delta_u  = [0 0 0 0]';
motion_in_depth = 0;

fixture_height = 1.5;
    
xm_des_calib=0.45;
ym_des_calib = 0;
zm_des_calib = 1.25;
theta_m_des_calib = 0;
theta_m_des = 0;
    
offset_yd = 0.04;
offset_ym = 0.05;
    
n=11;
value_yd=linspace(1, 0.8, n);
value_zd=linspace(-0.2,0.0, n);
J_array=zeros(6,4,n^2);

ypr_0=[0 pi 0]';

for i=1:n
    for j=1:n
    
        disp((((i-1)*n+j)/(n*n))*100);
        yd_des_calib = value_yd(i);
        zd_des_calib = value_zd(j);
        xyz_0_rf_left = wf_T_rf_left^-1*[xm_des_calib, ym_des_calib+yd_des_calib/2+offset_yd, zm_des_calib+zd_des_calib/2, 1]';
        xyz_0_rf_left = xyz_0_rf_left(1:3);
        xyz_0_rf_right = wf_T_rf_right^-1*[xm_des_calib, ym_des_calib-yd_des_calib/2-offset_yd, zm_des_calib-zd_des_calib/2, 1]';
        xyz_0_rf_right = xyz_0_rf_right(1:3);

        sim('calibration_jacobian_n_3.slx');


        compute_jacobian

        J_array(:,:,(i-1)*n+j)=J;
    end
end
