%Testear el algoritmo tabu search con distintos valores iniciales
%(iteraciones, valor resultado)

totCost = 0;
totIters = 0;
Nums = 100;
for n = 1:Nums
    rng(n);
    [Best, BestCost, iters] = TabuSearchSatelitesTest();
    totCost = totCost + BestCost;
    totIters = totIters + iters;
end

meanIters = totIters/Nums;
meanCost = totCost/Nums;
disp("Media de iteraciones:");
disp(meanIters);
disp("Media de costes:");
disp(meanCost);