% Initialice almost all variables needed for the
% algorithm
N = 500;
M = 50;
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
% 1º position: fitness, 2º position: index in pob
globalBest = [min(fitParticularBest) find(min(fitParticularBest) == fitParticularBest,1)];
% cell array to clasify speed
speed = cell(pobSize,3);
