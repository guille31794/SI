%%
%   MUTACION    -   Muta a la poblaci�n pasada. Consiste en elegir un
%                   representante aleatorio y mutarlo cambiando sus
%                   coordenadas por las de una estaci�n satelital
%                   cualquiera.
%
%       newPobMutada = mutacion(estaciones, newPob, Pmut)    
%
%               estaciones = coordenadas por columna de las estaciones
%               newPob(entrada) = poblaci�n sin mutar(cellarray)
%               Pmut = probabilidad de ser mutado
%               newPob(salida) = poblaci�n ya mutada
%
function newPob = mutacion(estaciones, newPob, Pmut)
%Tama�o de la poblaci�n
N = length(newPob);
%N� de representantes por habitante
M = size(newPob{1}, 2);
%N� de estaciones
E = size(estaciones, 2);

i = 1;
while(i <= N),
    if(rand() <= Pmut),
        a = randi(E);   %Eleccion aleatorio de una estacion
        b = randi(M);   %Elecci�n aleatoria de un representante
        aux = newPob{i};
        aux(:, b) = estaciones(:, a);   %mutaci�n
        newPob{i} = aux;
    end
    i=i+1;
end
