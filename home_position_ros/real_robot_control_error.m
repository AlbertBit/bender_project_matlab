close all
clear
path_alignment_error='./real_robot_data/alignment_error.txt';
path_beam_markers='./real_robot_data/beam_markers.txt';
path_fixture_markers='./real_robot_data/fixture_markers.txt';
path_current_input='./real_robot_data/current_input.txt';
path_robot_end_effectors='./real_robot_data/robot_end_effectors.txt';


T=0.005;


%% robot end error
offset_z_left=0.27;
offset_z_right=0.21;

ee_positions=extract_data_from_file(path_robot_end_effectors);
ee_positions(:,2) = ee_positions(:,2)+offset_z_left;
ee_positions(:,4) = ee_positions(:,4)+offset_z_right;

total_time=length(ee_positions)*T;
time_span = linspace(0, total_time, length(ee_positions));


y_d=ee_positions(:,1)-ee_positions(:,3);
y_m=0.5*(ee_positions(:,1)+ee_positions(:,3));
z_d=ee_positions(:,2)-ee_positions(:,4);
z_m=0.5*(ee_positions(:,2)+ee_positions(:,4));

figure
plot(time_span, y_d);
xlim([0, total_time]);
legend('y_d evolution');
xlabel('time [s]') 
ylabel('y_d [m]') 

figure
plot(time_span, y_m);
xlim([0, total_time]);
legend('y_m evolution');
xlabel('time [s]') 
ylabel('y_m [m]') 

figure
plot(time_span, z_d);
xlim([0, total_time]);
legend('z_d evolution');
xlabel('time [s]') 
ylabel('z_d [m]') 

figure
plot(time_span, z_m);
xlim([0, total_time]);
legend('z_m evolution');
xlabel('time [s]') 
ylabel('z_m [m]') 



%% alignment error norm
errors=extract_data_from_file(path_alignment_error);
%total_time=length(errors)*T;
time_span = linspace(0, total_time, length(errors));
figure
plot(time_span, errors);
xlim([0, total_time]);
legend('alignment error norm');
xlabel('time [s]') 
ylabel('error norm [m]') 

%% beam/fixture error
beam_markers=extract_data_from_file(path_beam_markers);
fixture_markers=extract_data_from_file(path_fixture_markers);

markers_error=fixture_markers-beam_markers;

%total_time=length(beam_markers)*T;
time_span = linspace(0, total_time, length(beam_markers));

figure

for i=1:2:size(markers_error,2)
    plot(time_span, markers_error(:,i));
    hold on
end
hold off
xlim([0, total_time]);
legend('y_{left}', 'y_{center}', 'y_{right}');
xlabel('time [s]') 
ylabel('error [m]') 

figure

for i=2:2:size(markers_error,2)
    plot(time_span, markers_error(:,i));
    hold on
end
hold off

xlim([0, total_time]);
legend('z_{left}', 'z_{center}', 'z_{right}');
xlabel('time [s]') 
ylabel('error [m]') 
