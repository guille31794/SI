clear all; close all; clc;
rand('seed', 5);

N = 500;            % Número de estaciones
M = 40;             % Número de representantes
lim = 500;          % Límite del espacio AxB

w = 0.5; cp = 0.3; cg = 0.9;

MaxItera = 1000;    % Número máximo de iteraciones
nPob = 50;          % Tamaño de la población

% Generamos la primera pob. y la evaluamos
[satelites, Pob] = generaPoblacion(nPob, N, M, lim);
FitPob = EvaluaPoblacion(Pob, satelites);

pBest = FitPob;
SpBest = Pob;
[gBest, indi] = min(FitPob);
SgBest = Pob(indi,:);

% Ponemo todas las velocidades iniciales a [1, 1]
for i = 1:nPob
    V{i} = ones(1,2);
end

gBestAnt = 0;
aux = 0;
iter = 1;
while iter <= MaxItera && aux < 100
    
    V = sigVelocidades(V, SpBest, SgBest, Pob, w, cp, cg);
    Pob = sigPosiciones(Pob, V);
    FitPob = EvaluaPoblacion(Pob, satelites);
    
    [SpBest, pBest] = actSpBest(SpBest, pBest, Pob, FitPob);
    [gBest, indi] = min(pBest);
    SgBest = SpBest(indi,:);
    
    if gBestAnt == gBest
        aux = aux + 1;
    else
        aux=0;
    end
    
    gBestAnt = gBest;
    iter = iter + 1;
end

%% Pintamos los satelites y sus representantes
plot(satelites(:,1), satelites(:,2), '.'); hold on;
aux = find(SgBest);
plot(satelites(aux, 1), satelites(aux, 2), 'or');
legend('Satélites', 'Representantes');
title('Espacio');