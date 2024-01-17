function [length_mesh] = calculateLength(number_mesh,radius_mesh,cost_limitation);
    length_mesh = cost_limitation/200 - pi .* radius_mesh - 10 .* number_mesh;
end