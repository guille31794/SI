% PSO Implementation for satelites problem
clearvars; clc;
Initialization;
it = 0;
prevFitParticularBest = fitParticularBest;
totalIt = 0;
tic;
while it <= 10 && totalIt <= 500 && globalBest(1) > 11600
    % Inertia applied over current speed
    speed = Inertia(speed);
    % computation of speed equation
    speed = updateSpeed(speed, particularBest, globalBest, pob);
    % speed sum
    totalSpeed = speedSum(speed, pobSize);
    % Position update
    pob = updatePob(totalSpeed,pob);
    fitpob = EvalPob(pob, stations);
    [particularBest, fitParticularBest] = updateFitPobBest(pob, particularBest, fitpob, fitParticularBest);
    globalBest = [min(fitParticularBest) find(min(fitParticularBest) == fitParticularBest,1)];
    if prevFitParticularBest == fitParticularBest
        it = it+1;
    else
        it = 0;
        prevFitParticularBest = fitParticularBest;
    end
    totalIt = totalIt+1;
end
t = toc;
plot(stations(1,:), stations(2,:), '.b');
hold on;
plot(stations(1,pob(globalBest(2),:)), stations(2,pob(globalBest(2),:)), 'or');
hold off;
disp('Time to compute problem measured in seconds:');
disp(t);