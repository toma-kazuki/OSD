clear all; clf;
L_max = 10;%[m]
R_max = 10;%[m]
N_max = 100;%[#num]
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
            [Cijk, Pijk, Vijk] = Farm_cost_profit(Lijk,Rijk,Nijk);
            l = (i-1) * R_max * N_max + (j-1) * N_max + k;


            Plist(l, :) = [Lijk, Rijk, Nijk, Cijk, Pijk, Vijk];
            %scatter(Pijk, Cijk, "MarkerFaceColor",[Vijk 0 0])
            disp(["calculation:", l, "/", Plot_max]);
        end
    end
end
disp("calculation completed! -> visualization")
point_valid = (Plist(:,6) > 0);
point_invalid = (Plist(:,6) == 0);
%scatter(Plist(:,5), Plist(:,4))
scatter(Plist(point_valid,5), Plist(point_valid,4),"+", "k");
scatter(Plist(point_invalid,5), Plist(point_invalid,4),"+", "r");
plot([1,15000], 100000*[1,1])
savefig("figure.fig")