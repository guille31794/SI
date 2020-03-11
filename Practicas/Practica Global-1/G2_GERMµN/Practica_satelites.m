function [Solucion, Evaluacion, Coordenadas] = Practica_satelites(algoritmo, numSatelites, espacio, numRepresentantes, coord)
if nargin < 4
    assert(false,'Los argumentos de entrada no son suficientes.');
elseif nargin == 4
    obj = satelites(numSatelites, espacio, numRepresentantes);
else
    obj = satelites(numSatelites, espacio, numRepresentantes, coord);
end
Coordenadas = obj.coordenadas;
if algoritmo == 1
    [Solucion, Evaluacion] = obj.Tabu();
else
    [Solucion, Evaluacion] = obj.AGestaciones();
end
end