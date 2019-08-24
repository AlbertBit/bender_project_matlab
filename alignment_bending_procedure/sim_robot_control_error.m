close all
T=0.005;


simtime=6;
time_span = linspace(0, simtime, length(error_norm));

figure
plot(time_span, error_norm);
xlim([0, simtime]);
legend('error norm');
xlabel('time [s]') 
ylabel('error [m]') 

figure

for i=1:2:size(error_yz,2)
    plot(time_span, error_yz(:,i));
    hold on
end
hold off
xlim([0, simtime]);
legend('y_{left}', 'y_{center}', 'y_{right}');
xlabel('time [s]') 
ylabel('error [m]') 

figure

for i=2:2:size(error_yz,2)
    plot(time_span, error_yz(:,i));
    hold on
end
hold off

xlim([0, simtime]);
legend('z_{left}', 'z_{center}', 'z_{right}');
xlabel('time [s]') 
ylabel('error [m]') 
