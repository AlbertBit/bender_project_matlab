clc
close all
load('matlab.mat');

delta = [0.01, 0.02, 0.03, 0.04, 0.05];
yd = [0.45, 0.57, 0.80];

J = zeros(6,4,15);

J(:,:,1) = J_delta_001_yd_045;
J(:,:,2) = J_delta_002_yd_045;
J(:,:,3) = J_delta_003_yd_045;
J(:,:,4) = J_delta_004_yd_045;
J(:,:,5) = J_delta_005_yd_045;

J(:,:,6) = J_delta_001_yd_057;
J(:,:,7) = J_delta_002_yd_057;
J(:,:,8) = J_delta_003_yd_057;
J(:,:,9) = J_delta_004_yd_057;
J(:,:,10) = J_delta_005_yd_057;

J(:,:,11) = J_delta_001_yd_080;
J(:,:,12) = J_delta_002_yd_080;
J(:,:,13) = J_delta_003_yd_080;
J(:,:,14) = J_delta_004_yd_080;
J(:,:,15) = J_delta_005_yd_080;

for i=1:length(yd)
    figure1=figure
    ttl=sprintf("YD=%f", yd(i));
    xlabel('delta [m]') 
    ylabel('zi/yd') 
    title(ttl);
    for j=1:length(delta)
        de_zi_yd = J(2, 1, (i-1)*j+j);   
        hold on
        plot(delta(j), de_zi_yd, '*', 'Color', 'b');
        xlim([0 0.06])
        ylim([-0.4 0])
        
    end
    saveas(figure1,"./img/"+ttl+".png")
end



J_p = zeros(6,4,15);

J_p(:,:,1) = J_delta_001_yd_045_p;
J_p(:,:,2) = J_delta_002_yd_045_p;
J_p(:,:,3) = J_delta_003_yd_045_p;
J_p(:,:,4) = J_delta_004_yd_045_p;
J_p(:,:,5) = J_delta_005_yd_045_p;

J_p(:,:,6) = J_delta_001_yd_057_p;
J_p(:,:,7) = J_delta_002_yd_057_p;
J_p(:,:,8) = J_delta_003_yd_057_p;
J_p(:,:,9) = J_delta_004_yd_057_p;
J_p(:,:,10) = J_delta_005_yd_057_p;

J_p(:,:,11) = J_delta_001_yd_080_p;
J_p(:,:,12) = J_delta_002_yd_080_p;
J_p(:,:,13) = J_delta_003_yd_080_p;
J_p(:,:,14) = J_delta_004_yd_080_p;
J_p(:,:,15) = J_delta_005_yd_080_p;



for i=1:length(yd)
    figure1=figure
    ttl=sprintf("Jp, YD=%f", yd(i));
    xlabel('delta [m]') 
    ylabel('zi/yd') 
    title(ttl);
    for j=1:length(delta)
        de_zi_yd = J_p(2, 1, (i-1)*j+j);   
        hold on
        plot(delta(j), de_zi_yd, '*', 'Color', 'b');
        xlim([0 0.06])
        ylim([-0.4 0])
    end
    saveas(figure1,"./img/"+ttl+".png")
end


J_m = zeros(6,4,15);

J_m(:,:,1) = J_delta_001_yd_045_m;
J_m(:,:,2) = J_delta_002_yd_045_m;
J_m(:,:,3) = J_delta_003_yd_045_m;
J_m(:,:,4) = J_delta_004_yd_045_m;
J_m(:,:,5) = J_delta_005_yd_045_m;

J_m(:,:,6) = J_delta_001_yd_057_m;
J_m(:,:,7) = J_delta_002_yd_057_m;
J_m(:,:,8) = J_delta_003_yd_057_m;
J_m(:,:,9) = J_delta_004_yd_057_m;
J_m(:,:,10) = J_delta_005_yd_057_m;

J_m(:,:,11) = J_delta_001_yd_080_m;
J_m(:,:,12) = J_delta_002_yd_080_m;
J_m(:,:,13) = J_delta_003_yd_080_m;
J_m(:,:,14) = J_delta_004_yd_080_m;
J_m(:,:,15) = J_delta_005_yd_080_m;

for i=1:length(yd)
    figure1=figure
    ttl=sprintf("Jm, YD=%f", yd(i));
    xlabel('delta [m]') 
    ylabel('zi/yd') 

    title(ttl);
    for j=1:length(delta)
        de_zi_yd = J_m(2, 1, (i-1)*j+j);   
        hold on
        plot(delta(j), de_zi_yd, '*', 'Color', 'b');
        xlim([0 0.06])
        ylim([-0.4 0])
    end
    saveas(figure1,"./img/"+ttl+".png")
end