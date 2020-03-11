%%
%   ANNEALINGE   -   Algoritmo simulado del annealing
%
%       actual = annealingE(estaciones, S)
%
%               estaciones = coordenadas por columna de las estaciones
%               S = coordenadas por columna del conjunto de representantes
%               actual = mejor conjunto de representantes encontrado
%
function actual = annealingE(estaciones, S)
actual = S;
%Inicializamos T y Tmin
T = 1e12;
Tmin = 1;
%Inicialización previa para comprobación de la condición de parada
deltaE = 1e6;
dEanterior = 0;
cont = 0;
%Mientras exista un deltaE bueno que sea mejor que el anterior seguimos
%iterando
while(T >= Tmin && cont == 0),
    dEanterior = deltaE;
    nuevo = sucesorAleatorio(estaciones, actual);
    deltaE = evalRepresentantes(estaciones, nuevo) - evalRepresentantes(estaciones, actual);
    if(deltaE < 0),
        actual = nuevo;
        %Si la mejora del deltaE aceptado es ínfima respecto al anterior
        %deltaE aceptado entonces paramos
        if(abs(dEanterior - deltaE) < 1),
            cont = 1;
        end
    elseif(rand() < exp(-deltaE/T)),
        actual = nuevo;
    end
T = enfriar(T);
end