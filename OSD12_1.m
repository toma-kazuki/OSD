clear all; close all;
L_max = 100;%[m]
R_max = 100;%[m]
N_max = 1000;%[#num]
Llist = 1:L_max;
Rlist = 1:R_max;
Nlist = 1:N_max;
Plot_max = L_max*R_max*N_max;
Plist = zeros(Plot_max,6);

hold on
for i = 1:L_max
    for j = 1:R_max
        for k = 1:N_max
            Lijk = Llist(i);
            Rijk = Rlist(j);
            Nijk = Nlist(k);
            [Cijk, Pijk, Dijk] = Farm_cost_profit(Lijk,Rijk,Nijk);
            l = (i-1) * R_max * N_max + (j-1) * N_max + k;


            Plist(l, :) = [Lijk, Rijk, Nijk, Cijk, Pijk, log10(Dijk)];
            %scatter(Pijk, Cijk, "MarkerFaceColor",[Dijk 0 0])
            disp(["calculation:", l, "/", Plot_max]);
        end
    end
end
disp("calculation completed! -> visualization")
point_valid = (Plist(:,6) > 0);
point_invalid = (Plist(:,6) <= 0);
%scatter(Plist(:,5), Plist(:,4))
%scatter(Plist(point_valid,5), Plist(point_valid,4),"+", "k");
%scatter(Plist(point_invalid,5), Plist(point_invalid,4),"+", "r");
hold off
% Creating the scatter plot
figure;
plot_palate_color(Plist(point_valid,5), Plist(point_valid,4),squeeze(Plist(point_valid,1)), "Profit[$]", "Cost[$]", "Length", 'Profit-Cost Palate Mapping');
plot_palate_color(Plist(point_valid,5), Plist(point_valid,4),squeeze(Plist(point_valid,2)), "Profit[$]", "Cost[$]", "Radius", 'Profit-Cost Palate Mapping');
plot_palate_color(Plist(point_valid,5), Plist(point_valid,4),squeeze(Plist(point_valid,3)), "Profit[$]", "Cost[$]", "Number of head", 'Profit-Cost Palate Mapping');
plot_palate_color(Plist(point_valid,5), Plist(point_valid,4),squeeze(Plist(point_valid,4)), "Profit[$]", "Cost[$]", "Cost", 'Profit-Cost Palate Mapping');
plot_palate_color(Plist(point_valid,5), Plist(point_valid,4),squeeze(Plist(point_valid,5)), "Profit[$]", "Cost[$]", "Profit", 'Profit-Cost Palate Mapping');
plot_palate_color(Plist(point_valid,5), Plist(point_valid,4),squeeze(Plist(point_valid,6)), "Profit[$]", "Cost[$]", "Density", 'Profit-Cost Palate Mapping');
%plot([1,15000], 100000*[1,1])
%savefig("figure.fig")