%%
%   EVALREPRESENTANTE   -   Evalúa cómo de de buenos son losrepresentantes
%                           elegidos, a menor coste mejores serán estos
%
%       coste = evalRepresentantes(estaciones, S)
%
%               estaciones = coordenadas por columna de las estaciones
%               S = coordenadas por columna del conjunto de representantes
%               coste = Evaluación de los representantes dados
%
function coste = evalRepresentantes(estaciones, S)
%Nº de representantes
N = size(S, 2);
%Calculamos la distancia euclídia de todos los puntos a cada representante
i = 1;
while(i <= N),
    d(i, :) = distEuclidea(estaciones, S(:, i));
    i=i+1;
end
%Comprobamos a qué representante pertenece cada estación
[~, R] = min(d);
%Calculmos el costo = sumatorio de las distancias euclídias de cada punto a
%su representante, cuanto menor sea el costo mejores son los representantes
j = 1; coste = 0;
while(j <= N),
    coste = coste + sum(distEuclidea(estaciones(:, j == R), S(:, j)));
    j=j+1;
end