function [itera, meanNpob] = ga()
NReinas= 30; % Numero de Reinas
NPoblacion= 30; % Numero de individuos de la poblacion
% Poblacion Inicial
rng(1);
Pob=GeneraPoblacion(NReinas,NPoblacion);
FitPob = ones(size(Pob,1),1);
itera=1;
meanNpob = 99;
k = randi(floor(NPoblacion/4)); 
MAX_itera = 3000;
cont = 0;
lastIt = 0;
while itera<=MAX_itera && meanNpob > 0 && all(FitPob(1:end) > 0) && cont <= 10
    % Costes de la población
    FitPob=EvaluaPoblacion(Pob);
    Padres=Seleccion(FitPob,k); % devuelve los indices de los padres que se cruzaran
    parejas=Emparejar(Padres); 
    newPob=Cruce(parejas,Pob); % devuelve nueva poblacion cruzada 
    newPobMutada=Muta(newPob); % poblacion con mutaciones 
    FitMutada=EvaluaPoblacion(newPobMutada);
    [Pob,FitPob]=Reemplazo(Pob,newPobMutada,FitPob,FitMutada);
    % actualizacion variables y condiciones de parada
    itera=itera+1;
    meanNpob = mean(FitPob);
    if meanNpob ~= lastIt
        cont = 0;
    end
    lastIt = meanNpob;
    cont = cont+1;
end
end
%disp([Pob FitPob]);