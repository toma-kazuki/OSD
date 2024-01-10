function [cost, profit, valid] = Farm_cost_profit(L,R,N);
    A = L * 2 * R + R * R * pi();
    L = 2 * L + 2 * pi() * R;
    M = 100 * sqrt(A/N);
    cost = 2000 * N + 100 * L;
    profit = 2 * M * N;
    valid = (A/N > 1);
end