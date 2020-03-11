function [espacioSatelital, representantes, evaluacion] = genetico_satelital(N, M)
tic;

[espacio, distancias, ~] = inicializa(N,M);

Npoblacion = 200;
Pcross = 0.99;
Pmut = 0.30;

iter = 1;
MAX_iter = 200;
repetido = 1;
MAX_repetido = 10;

bestAll = realmax;
bestAllpos = 1;

pob = generaPoblacion(M, N, Npoblacion);
fitPob = evaluaPoblacion(distancias, pob, N);


    
while iter <= MAX_iter && repetido <= MAX_repetido 

    padres = seleccion(fitPob, 0.8*Npoblacion);
    
    parejas = emparejar(padres, Pcross);
    newPob = cruce(parejas, pob, M);
    newPobMut = muta(newPob, Pmut);
    fitPobMut = evaluaPoblacion(distancias, newPobMut, N);
    
    [pob, fitPob] = reemplazo(pob, fitPob, newPobMut, fitPobMut);
    
    iter = iter+1;
    
    currentBest = fitPob(1);
    currentPos = 1;
    
    if round(currentBest/N, 2) < round(bestAll/N, 2)
        bestAll = currentBest;
        bestAllpos = currentPos;
        repetido = 1;
    else
        repetido = repetido+1;
    end
    
    
end
toc;
espacioSatelital = espacio;
representantes = find(pob(bestAllpos, :) == 1);
evaluacion = round(fitPob(bestAllpos)/N,2);
