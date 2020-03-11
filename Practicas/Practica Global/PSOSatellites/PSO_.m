% PSO Implementation for satelites problem
function globalBest = PSO_()

% Initialice almost all variables needed for the
% algorithm
N = 400;
M = 40;
space = [0 500];
% modern version of rand('seed',5), recommended by Matlab
rng(5);
stations = zeros(2, N);
for n = 1:N
    stations(1,n) = rand * (space(2) - space(1)) + space(1);
    stations(2,n) = rand * (space(2) - space(1)) + space(1);
end

% Pob setting
pobSize = 250;
pob = generatePob(N, pobSize, M);
% Represented data save
n = 1;
represented = zeros(pobSize, N);
while n <= pobSize
    represented(n,:) = representedGroups(stations, pob(n,:), N);
    n = n+1;
end
fitpob = EvalPob(pob, stations);
% initial particular best
particularBest = pob;
fitParticularBest = fitpob;
% 1� position: fitness, 2� position: index in pob
globalBest = [min(fitParticularBest) find(min(fitParticularBest) == fitParticularBest,1)];
% cell array to clasify speed
speed = cell(pobSize,3);

it = 0;
prevFitParticularBest = fitParticularBest;
totalIt = 0;
tic;
while it <= 10 && totalIt <= 500 && globalBest(1) > 12300
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
disp('Time to compute problem measured in minutes:');
disp(t/60);
end