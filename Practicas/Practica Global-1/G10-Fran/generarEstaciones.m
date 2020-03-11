%%
%   GENERARESTACIONES   -   Genera de forma aleatoria N coordenadas 
%                           situadas en el espacio bidimensional AB
%
%       coordenadas = generarEstaciones(N, AB)
%           
%               N = Número de estaciones a generar
%               AB = Espacio bidimensional entre n y m de forma [n m]
%               coordenadas = voordenadas por columna de cada estación
%               generada
%               
function coordenadas = generarEstaciones(N, AB)
%Inicializamos la semilla
rand('seed', 5);
%Generamos los puntos(estaciones)
coordenadas = (AB(2) - AB(1))*rand(2, N) + AB(1);