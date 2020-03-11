%%
%   DISTEUCLIDEA    -   Calcula la distancia euclídia de los puntos a P
%
%       distancias = distEuclidea(puntos, P)
%
%               puntos = coordenadas de los puntos por columna
%               P = coordenadas del punto por columna
%
function distancias = distEuclidea(puntos, P)
N = length(P);
i = 1; distancias = 0;
while(i <= N),
    aux = (puntos(i, :) - P(i)).^2;
    distancias = distancias + aux;
    i=i+1;
end
distancias = sqrt(distancias);