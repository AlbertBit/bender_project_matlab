%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 02/08/2019 : Master thesis - Alberto REMUS
%
% Subject: Stability analysis of the control schem
%
% Input: Sensitivity Jacobian matrices along the path
%
% Output: 
%   - Stability criterion(a)
%   - 
%
% Authors: Alberto REMUS, Christine CHEVALLEREAU and Stéphane CARO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all

% matrix given by Christine 

% % 1)
% Jes = [0.23 1 -0.15 0; -0.15 0 0.4 1; 0.02 1 -0.45 0; -0.35 0 0 1; -0.2 1 -0.15 0; -0.15 0 -0.4 1];
% Jr = [0.25 1.05 -0.17 0; -0.18 0.7 0.2 1.5; 0.03 1.5 -0.47 0; -0.37 0 0.7 1; -0.2 1 -0.15 0; -0.15 0 -0.4 1];
% eig(Jr*pinv(Jes))
% 
% %2)
% epsi = 0.0001;
% Jes = [0.23 1 -0.15 0; -0.15 0 0.4 1; 0.02 1 -0.45 0; -0.35 0 0 1; -0.2 1 -0.15 0; -0.15 0 -0.4 1];
% Jr = Jes+epsi*(-ones(6,4)+2*rand(6,4));
% eig(Jr*pinv(Jes));

%opposé
% 1)
Jes = [0.23 1 -0.15 0; -0.15 0 0.4 1; 0.02 1 -0.45 0; -0.35 0 0 1; -0.2 1 -0.15 0; -0.15 0 -0.4 1];
Jr = [0.25 1.05 -0.17 0; -0.18 0.7 0.2 1.5; 0.03 1.5 -0.47 0; -0.37 0 0.7 1; -0.2 1 -0.15 0; -0.15 0 -0.4 1];
eig(pinv(Jes)*Jr);

%2)
epsi = 1;
Jes = [0.23 1 -0.15 0; -0.15 0 0.4 1; 0.02 1 -0.45 0; -0.35 0 0 1; -0.2 1 -0.15 0; -0.15 0 -0.4 1];
Jr = Jes+epsi*(-ones(6,4)+2*rand(6,4));
eig(pinv(Jes)*Jr);

% 3)
Jes = [0.23 1 -0.15 0; -0.15 0 0.4 1; 0.02 1 -0.45 0; -0.35 0 0 1; -0.2 1 -0.15 0; -0.15 0 -0.4 1];
eig(pinv(Jes)*Jes);

% matrices given by Alberto

load J_array_zd_delta_03;
Jhat = J_array(:,:,12);
pJhat = pinv(Jhat);
%pJhat = pinv(Jes);

load J_array_yd_delta_03;
%load J_array_zd_delta_03;

sizeJ = size(J_array);
%Jhat = J_array(:,:,sizeJ(3));
%Jhat = J_array(:,:,1);
%Jhat = J_array(:,:,floor(sizeJ(3)/2));
% Jhat = J_array(:,:,12);
% pJhat = pinv(Jhat);

for i = 1 : sizeJ(3)
    toto = pJhat*J_array(:,:,i);
    SM(:,:,i) = (toto + toto')/2;
    E(:,i) = sort(eig(SM(:,:,i)));
    [V(:,:,i),D(:,:,i)] = eig(SM(:,:,i));
end 

E
% epsi2 = 1e-4;
% for i = 1 : sizeJ(3)
%     for j = 1 : 4 
%         if imag(E(j,i)) < -epsi2 || imag(E(j,i)) > epsi2
%             %E(j,i) = NaN;
%             E(j,i) = real(E(j,i));
%         end
%     end
% end
% E

% Workspace boundary
figure(1)
clf
figure(1)
hold on
    plot([1 : sizeJ(3)],[real(E(1,:))],'r+',[1 : sizeJ(3)],[real(E(2,:))],'g+',[1 : sizeJ(3)],[real(E(3,:))],'b+',...
        [1 : sizeJ(3)],[real(E(4,:))],'mo')
%legend('First','Second','Third','Fourth','Fifth','Sixth')
legend('First','Second','Third','Fourth')
xlabel('pose number')
ylabel('eigenvalue')
hold off

