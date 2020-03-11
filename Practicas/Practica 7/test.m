% test
clearvars;
clc;
n = 0;
tic;
it = 0;
cost = 0;
while n < 1000
    [solit, solcost] = ga();
    cost = cost + solcost;
    it = it + solit;
    n = n+1;
end
t = toc;
disp(t);
disp(it/1000);
disp(cost/1000);