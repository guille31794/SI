%%
%   CRUCESIMPLE  -   Realiza el cruce simple entre dos padres
%
%       hijos = cruceSimple(P1, P2)
%
%               P1 = primer padre, coordenadas por columna del conjunto de
%               representantes
%               P2 = segundo padre
%               hijos = hijos obtenidos por el cruce de los padres(cellarray)
%
function hijos = cruceSimple(P1, P2)
%Obtenemos el número de representantes que hay
N = size(P1, 2);
%Generamos un punto aleatorio de corte
corte = randi(N);
%Realizamos el intercambio de partes en dicho punto
hijos = {[P1(:, 1:corte) P2(:, corte+1:N)]; [P2(:, 1:corte) P1(:, corte+1:N)]};
