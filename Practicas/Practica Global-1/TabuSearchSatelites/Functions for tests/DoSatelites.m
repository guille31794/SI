clear
clc
%Llamar al algoritmo una vez y dibujar resultado.
Initialization;
[Best, BestCost, iters] = TabuSearchSatelites();

plot(stations(1,:), stations(2,:), '.b');hold on;
plot(stations(1,Best), stations(2,Best), 'or'); hold off;