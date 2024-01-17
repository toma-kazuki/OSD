function [cost, profit, density] = Farm_cost_profit(lengh_side,radius,number_head);
    area_farm = lengh_side * 2 * radius + radius * radius * pi();
    length_circum = 2 * lengh_side + 2 * pi() * radius;
    M = 100 * sqrt(area_farm/number_head);
    cost = 2000 * number_head + 100 * length_circum;
    profit = 2 * M * number_head;
    density = area_farm/number_head; %should be > 1
end