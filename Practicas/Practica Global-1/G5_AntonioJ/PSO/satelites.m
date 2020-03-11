clear; close all; clc;
NSatelites = 400; % Número de satélites
NRepresentantes = 40;  % Número de representantes
C = 500; % Espacio de coordenadas
Npob = 60; % Tamaño de la población
MAX_ITERA = 1000;
rand('seed', 5);
w = 0.5; cp = 0.1; cg = 0.4;

%Generamos las coordenadas de los satelites
Satelites = GeneraDatosIniciales(NSatelites, C, C);

%Generamos la población inicial
for i=1:Npob
    Pob(i,:) = sort(randperm(NSatelites, NRepresentantes));
end

%Evaluamos cada individuo de la población
for i=1:size(Pob,1)
    FitPob(i,:) = FitIndiv(Satelites, Pob(i,:));
end


Spbest = [Pob FitPob];                      % Spbest = [individuo fitness]

[minimo, gbest] = min(FitPob);
Sgbest = [Pob(gbest, :) minimo];            % Sgbest = [mejor_individuo fitness]

for i=1:Npob
    vi{i} = zeros(1,NRepresentantes);
end

itera = 0;
best = gbest;
no_mejora = 0;
tic;
while itera < MAX_ITERA && no_mejora <=100
    vk = next_vk(Pob, vi, w, cp, cg, Spbest, Sgbest);
    Pob = next_sk(Pob, vk, NSatelites);
    for i=1:size(Pob,1)
        FitPob(i,:) = FitIndiv(Satelites, Pob(i,:));
    end
    Spbest = calc_pbest(Spbest, [Pob FitPob]);
    [~, ind] = min(Spbest(:,end));
    Sgbest = Spbest(ind,:);
    min_act = min(FitPob);
    if minimo > min_act
        [minimo, best] = min(FitPob);
        no_mejora = 0;
        mejor = Pob(best,:);
    else
        no_mejora = no_mejora + 1;
    end
    
    itera = itera + 1;
end
t = toc;
disp(t);
% plot(Satelites(1,:), Satelites(2,:), '.b'); hold on;
% plot(Satelites(1,mejor), Satelites(2,mejor), '*r');
% cercano = kmeans(Satelites, NRepresentantes);
% distancia = [];
% for i=1:size(cercano,2)
%     distancia = [distancia; d_euclid(Satelites, cercano(:,i))];
% end
% sum(min(distancia))
% plot(cercano(1,:), cercano(2,:), 'og');
minimo/NSatelites












