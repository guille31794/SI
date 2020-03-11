%%
%   ELEGIRREPRESENTANTES  - Selecciona M representantes aleatorios de las 
%                           estaciones dadas
%       
%       coordenadas = elegirRepresentantes(estaciones, M)
%
%               estaciones = coordenadas por columna de las estaciones
%               M = n�mero de representantes a elegir
%               coordenadas = coordenadas por columna de loas estaciones
%               elegidas como representantes
%
function coordenadas = elegirRepresentantes(estaciones, M)
%Elegimos M estaciones al azar
N = size(estaciones, 2);    %N� de estaciones
index = randperm(N, M);
coordenadas = estaciones(:, index);