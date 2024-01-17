clear all; close all;
diary commandlog.txt;


L_max = 200;%[m]
R_max = 200;%[m]
N_max = 40;%[#num]
L_space = 100;
R_space = 100;
N_space = 6;
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
index_valid = logical((Plist(:,6) > 0) .* (Plist(:,4) < 100000));
disp(["valid rate: ", sum(index_valid), "/", Plot_max])


plot_palate_color(Plist(index_valid,5), Plist(index_valid,4),squeeze(Plist(index_valid,1)), "Profit[$]", "Cost[$]", "Length", 'Profit-Cost Palate Mapping');
plot_palate_color(Plist(index_valid,5), Plist(index_valid,4),squeeze(Plist(index_valid,2)), "Profit[$]", "Cost[$]", "Radius", 'Profit-Cost Palate Mapping');
plot_palate_color(Plist(index_valid,5), Plist(index_valid,4),squeeze(Plist(index_valid,3)), "Profit[$]", "Cost[$]", "Number of head", 'Profit-Cost Palate Mapping');
%plot_palate_color(Plist(index_valid,5), Plist(index_valid,4),squeeze(Plist(index_valid,4)), "Profit[$]", "Cost[$]", "Cost", 'Profit-Cost Palate Mapping');
%plot_palate_color(Plist(index_valid,5), Plist(index_valid,4),squeeze(Plist(index_valid,5)), "Profit[$]", "Cost[$]", "Profit", 'Profit-Cost Palate Mapping');
plot_palate_color(Plist(index_valid,5), Plist(index_valid,4),squeeze(Plist(index_valid,6)), "Profit[$]", "Cost[$]", "Density", 'Profit-Cost Palate Mapping');


saveData(pwd);