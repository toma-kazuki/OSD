clear all; close all;
diary commandlog.txt;
%% Initial Setting
fun = @fun_profit;
x0 = [10,10,10];
A = [200 * pi, 200, 2000;
     0, 0, 0;
     0, 0, 0];
b = zeros(100,3);
b(:,1) = 10000:10000:1000000;
lb = 0*x0;
xlist = zeros(100,3);
Jlist = zeros(100,1);
Clist = zeros(100,1);

for i = 1:100
    x = fmincon(fun,x0,A,b(i,:),[],[],lb,[],[]);
    J = fun_profit(x);
    C = fun_cost(x);
    xlist(i,:) = x;
    Jlist(i,:) = -J;
    Clist(i,:) = C;
    lb = x;
end

L_max = 1000;%[m]
R_max = 1000;%[m]
N_max = 400;%[#num]
L_space = 100;
R_space = 100;
N_space = 10;
Llist = linspace(1,L_max,L_space);
Rlist = linspace(1,R_max,R_space);
Nlist = linspace(1,N_max,N_space);
Plot_max = L_space*R_space*N_space;
Plist = zeros(Plot_max,6);

for i = 1:L_space
    for j = 1:R_space
        for k = 1:N_space
            Lijk = Llist(i);
            Rijk = Rlist(j);
            Nijk = Nlist(k);
            [Cijk, Pijk, Dijk] = Farm_cost_profit(Lijk,Rijk,Nijk);
            l = (i-1) * R_space * N_space + (j-1) * N_space + k;


            Plist(l, :) = [Lijk, Rijk, Nijk, Cijk, Pijk, log10(Dijk)];
            %scatter(Pijk, Cijk, "MarkerFaceColor",[Dijk 0 0])
            disp(["calculation:", l, "/", Plot_max]);
        end
    end
end
disp("calculation completed! -> visualization")
%% Post Processing
% Limitation
% Cost cannot exceed $100,000.
% Density should be above 1 m2 / head. log10 process
index_valid = logical((Plist(:,6) > 0) .* (Plist(:,4) < 1000000));
disp(["valid rate: ", sum(index_valid), "/", Plot_max])

plot_palate_color(Plist(index_valid,5), Plist(index_valid,4),squeeze(Plist(index_valid,2)), "Profit[$]", "Cost[$]", "Radius", 'Profit-Cost Palate Mapping');
%plot_palate_color(Plist(index_valid,5), Plist(index_valid,4),squeeze(Plist(index_valid,3)), "Profit[$]", "Cost[$]", "Number of head", 'Profit-Cost Palate Mapping');
hold on;
scatter(Jlist,Clist)
return

function f = fun_profit(x)
    area_farm = x(2) * 2 * x(1) + x(1) * x(1) * pi();
    M = 100 * sqrt(area_farm/x(3));
    profit = 2 * M * x(3);
    f = -profit;
end

function cost = fun_cost(x)
    cost = 2000 * x(3) + 200 * x(2) + 200 * pi() * x(1);
end
