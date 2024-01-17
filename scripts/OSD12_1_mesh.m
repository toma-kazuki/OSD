clear all; close all;
diary commandlog.txt;


N_max = 100;%[m]
R_max = 200;%[m]
N_space = 100;
R_space = 100;
Nlist = linspace(1,N_max,N_space);
Nlist = 1:100;
Rlist = linspace(1,R_max,R_space);
[N,R] = meshgrid(Nlist,Rlist);


%variable respond to L,R
L = calculateLength(N,R,100000);
P = calculateProfit(N,R,100000);
figure;
surf(N,R,L,P);
colorbar;
% Adding labels and title
xlabel("Number of Head [#]");
ylabel("Radius[m]");
zlabel("Length of side[m]");
title("Profit with Cost = 10^5$");
hold off;




figure;
surf(N,R,P);
colorbar;
% Adding labels and title
xlabel("Number of Head [#]");
ylabel("Radius[m]");
zlabel("Total Profit[m]");
title("Profit with Cost = 10^5$");

[C, I] = max(P(:,:))
[ii, jj] = ind2sub(size(P), I)
P(ii,ij)
N

saveData(pwd);