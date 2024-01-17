function profit_mesh = calculateProfit(number_mesh,radius_mesh,cost_limitation);
    length_mesh = calculateLength(number_mesh,radius_mesh,cost_limitation);
    index = length_mesh > 0;

    % Lengthが0以上の要素以外は全て0にしてしまう。
    length_mesh = length_mesh .* index;
    number_mesh = number_mesh .* index;
    radius_mesh = radius_mesh .* index;


    area_mesh = length_mesh .* 2 .* radius_mesh + radius_mesh .* radius_mesh .* pi();
    milkproduction_mesh = 100 .* realsqrt(area_mesh ./ number_mesh);
    profit_mesh = 2 .* milkproduction_mesh .* number_mesh;
    %surf(number_mesh,radius_mesh,length_mesh,profit_mesh);
    %surf(number_mesh,radius_mesh,profit_mesh);
end