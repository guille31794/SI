%Igual que Initialization pero sin modificar el rng, para probar con
%distintos valores iniciales.
clear
%Inicialización de los datos para trabajar: vector de estaciones y vector
%de estaciones seleccionadas.
%Opcionalmente, vector auxiliar represented.


%Estaciones totales
N = 500;
%Estaciones seleccionadas
M = 40;
%Espacio para las estaciones
space = [0 500];
%Vector de estaciones; fila 1: coordenada x, fila 2: coordenada y.
stations = zeros(2, N);
for n = 1:N
    stations(1,n) = rand * (space(2) - space(1)) + space(1);
    stations(2,n) = rand * (space(2) - space(1)) + space(1);
end

% %Binary representation
% selectedStations = zeros(1,N);
% selectedStations(1:M) = 1;

 %Integer representation (contiene índices del vector stations, los que se
 %considerarán representados)
selectedStations = 1:M;

%Vector Represented para estado inicial (no hace falta).
%represented = representedGroups(stations, selectedStations, N);
