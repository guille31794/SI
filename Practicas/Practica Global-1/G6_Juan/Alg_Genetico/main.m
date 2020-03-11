clear all; close all;  clc;
rand('seed', 5);

N = 500;            % N�mero de estaciones
M = 40;             % N�mero de representantes
lim = 500;          % L�mete del espacio AxB

MaxItera = 1000;    % N�mero m�ximo de iteraciones
nPob = 50;          % Tama�o de la poblaci�n
Pmut = 0.1;         % Probabilidad de mutaci�n

% Generamos la primera pob. y la evaluamos
[satelites, Pob] = generaPoblacion(nPob, N, M, lim);
FitPob = EvaluaPoblacion(Pob, satelites);

FitPobAnt = 0;
continua  = 0;
iter = 1;
while iter <= MaxItera && continua < 150
    
    % Hacemos las operaciones del alg. gen. a partir de la 1era pob.
    padres  = Seleccion(FitPob);    
    parejas = Emparejar(padres);    
    
    newPob  = Cruce(parejas, Pob);      
    newPobMutada = Muta(Pmut, newPob);
    FitMutada = EvaluaPoblacion(newPobMutada, satelites);
    
    [Pob, FitPob] = Reemplazo(Pob, newPobMutada, FitPob, FitMutada);
    
    % Actualizamos el resto de variables
    iter = iter + 1;

    if FitPobAnt == min(FitPob)
        continua = continua + 1;
    else
        continua = 0;
    end
    
    FitPobAnt = min(FitPob);
   
end

%% Pintamos los satelites y los representantes
plot(satelites(:,1), satelites(:,2), '.'); hold on;
[~, ind] = min(FitPob);
plot(satelites(Pob(ind,:), 1), satelites(Pob(ind,:), 2), 'or');
legend('Sat�lites', 'Representantes');
title('Espacio');