%%
%   EVALREPRESENTANTE   -   Eval�a c�mo de de buenos son losrepresentantes
%                           elegidos, a menor coste mejores ser�n estos
%
%       coste = evalRepresentantes(estaciones, S)
%
%               estaciones = coordenadas por columna de las estaciones
%               S = coordenadas por columna del conjunto de representantes
%               coste = Evaluaci�n de los representantes dados
%
function coste = evalRepresentantes(estaciones, S)
%N� de representantes
N = size(S, 2);
%Calculamos la distancia eucl�dia de todos los puntos a cada representante
i = 1;
while(i <= N),
    d(i, :) = distEuclidea(estaciones, S(:, i));
    i=i+1;
end
%Comprobamos a qu� representante pertenece cada estaci�n
[~, R] = min(d);
%Calculmos el costo = sumatorio de las distancias eucl�dias de cada punto a
%su representante, cuanto menor sea el costo mejores son los representantes
j = 1; coste = 0;
while(j <= N),
    coste = coste + sum(distEuclidea(estaciones(:, j == R), S(:, j)));
    j=j+1;
end