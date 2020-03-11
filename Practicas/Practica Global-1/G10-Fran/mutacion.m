%%
%   MUTACION    -   Muta a la población pasada. Consiste en elegir un
%                   representante aleatorio y mutarlo cambiando sus
%                   coordenadas por las de una estación satelital
%                   cualquiera.
%
%       newPobMutada = mutacion(estaciones, newPob, Pmut)    
%
%               estaciones = coordenadas por columna de las estaciones
%               newPob(entrada) = población sin mutar(cellarray)
%               Pmut = probabilidad de ser mutado
%               newPob(salida) = población ya mutada
%
function newPob = mutacion(estaciones, newPob, Pmut)
%Tamaño de la población
N = length(newPob);
%Nº de representantes por habitante
M = size(newPob{1}, 2);
%Nº de estaciones
E = size(estaciones, 2);

i = 1;
while(i <= N),
    if(rand() <= Pmut),
        a = randi(E);   %Eleccion aleatorio de una estacion
        b = randi(M);   %Elección aleatoria de un representante
        aux = newPob{i};
        aux(:, b) = estaciones(:, a);   %mutación
        newPob{i} = aux;
    end
    i=i+1;
end
