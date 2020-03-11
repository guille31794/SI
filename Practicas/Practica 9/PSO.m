clearvars; clc;
% Number of queens
nQueens = 10;
pobSize = 10;
pob = generatePob(nQueens, pobSize);
fitpob = EvalPob(pob);
PobBest = pob;
FitPobBest = fitpob;
% 1º position: fitness, 2º position: index in pob
globalBest = [min(FitPobBest) find(min(FitPobBest) == FitPobBest,1)];
% cell array to store every speed of every member from poblation
speedCell = cell(pobSize,3);
speedSum = zeros(pobSize, 1);
% Stop condition: 1000 updates without improvement
it = 0;
prevFitPobBest = FitPobBest;
itTotales = 0;
while min(FitPobBest) ~= 0 && it <= 210
    speedCell = Inertia(speedCell);
    speedCell = updateSpeed(speedCell,PobBest, globalBest, pob);
    totalSpeed = sumSpeed(speedCell);
    pob = updatePob(speedCell, pob);
    fitpob = EvalPob(pob);
    [PobBest, FitPobBest] = updateFitPobBest(pob, PobBest, fitpob, FitPobBest);
    globalBest = [min(FitPobBest) find(min(FitPobBest) == FitPobBest,1)];
    if prevFitPobBest == FitPobBest
        it = it+1;
    else
        it = 0;
        prevFitPobBest = FitPobBest;
    end
    itTotales = itTotales+1;
end