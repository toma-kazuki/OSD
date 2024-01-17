clear all; close all;
diary commandlog.txt;
%% Initial Setting
fun = @fun_profit;
x0 = [10,10,10];
A = [200 * pi, 200, 2000;
     0, 0, 0;
     0, 0, 0];
b = [100000, 0, 0];
lb = 0*x0;

x = fmincon(fun,x0,A,b,[],[],lb,[],[]);
J = fun_profit(x);
x,-J


function f = fun_profit(x)
    area_farm = x(2) * 2 * x(1) + x(1) * x(1) * pi();
    M = 100 * sqrt(area_farm/x(3));
    profit = 2 * M * x(3);
    f = -profit;
end
