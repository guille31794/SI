%%
%   SUCESORALEATORIO    -   Elige un sucesor de S. Seleccionamos de forma
%                           aleatoria un representante y lo cambiamos
%
%       newS = sucesorAleatorio(estaciones, S)
%
%               estaciones = coordenadas por columna de cada estación
%               S = coordenadas por columna del conjunto de representantes
%               newS = coordenadas por columna del conjunto sucesor de S
%
function newS = sucesorAleatorio(estaciones, S)
newS = S;
N = size(S, 2); %Nº de representantes totales
%Elegimos uno de forma aleatoria
Ri = randi(N);
%Calculamos la distancia euclídia de todos los puntos a cada representante
%para obtener los grupos representados
i = 1;
while(i <= N),
    d(i, :) = distEuclidea(estaciones, S(:, i));
    i=i+1;
end
%Comprobamos a qué representante pertenece cada estación
[~, R] = min(d);
%Nos quedamos con las estaciones que pertenecen al representante
%seleccionado anteriormente
Er = estaciones(:, R == Ri);
%Realizamos la media del conjunto que será el lugar óptimo que minimiza la
%distancia euclídia de dicho grupo seleccionado
media = [mean(Er(1, :)') mean(Er(2, :)')]';
%Recalculamos el grupo del representante elegido pero con la media
%calculada como nuevas coordenadas de dicho representante
S(:, Ri) = media;

i = 1;
while(i <= N),
    d(i, :) = distEuclidea(estaciones, S(:, i));
    i=i+1;
end

[~, R] = min(d);
%Nuevo conjunto del representante Ri
conj = estaciones(:, Ri == R);
%Elegimos la estación más cercana a la media calcula como el nuevo
%representante final
distancias = distEuclidea(conj, S(:, Ri));
[~, index] = min(distancias);
newS(:, Ri) = conj(:, index);