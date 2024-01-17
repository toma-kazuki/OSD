%% Set up
clear all; close all;
diary commandlog.txt;

%% Initial Setting

c = [0.02, 0, 0.01, 0.01, 0.01, 0, 0.04, 0.01, 0.03, 0.01];
b = [200; 300; 100; 0; 0; -400; -200];
u = [175, 50, 200, 150, 100, 75, 200, 150, 200, 175];
A = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 1, 1, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 1, 1, 0, 0, 0, 0;
    -1, 0,-1, 0, 0, 0, 1, 1, 0, 0;
     0, 0, 0,-1,-1, 0, 0, 0, 1, 1;
     0,-1, 0, 0, 0, 0,-1, 0,-1, 0;
     0, 0, 0, 0, 0,-1, 0,-1, 0,-1];

%Other Problem
%c = [2, 4, 1, 6, 6, 2, 2, 2, 7];
%b = [0; 0; 0; 0; 4; 4];
%u = [2, 7, 2, 4, 1, 6, 3, 7, 2];
%A = [1, 0,-1,-1, 0, 0, 0, 0, 0;
%     0, 0, 0, 1, 1, 0, 1, 0,-1;
%     0, 1, 1, 0,-1,-1, 0, 0, 0;
%     0, 0, 0, 0, 0, 1,-1, 0,-1;
%     1, 1, 0, 0, 0, 0, 0, 0, 0;
%     0, 0, 0, 0, 0, 0, 0, 1, 1];

options = optimoptions('linprog','Display','iter');

%% Calculation
x = linprog(c,A,b,[],[],u*0,u,options); % https://jp.mathworks.com/help/optim/ug/linprog.html


disp("calculation completed! -> visualization")
%% Post Processing and visualization
J = c * x;
x, J

%saveData(pwd);