%%
%   REEMPLAZO   -   Reemplazamos la población actual por una nueva
%                   generación formada por los mejores habitantes de la
%                   vieja y nueva población.
%
%       [Pob, FitPob] = reemplazo(Pob, newPobMutada, FitPob, FitMutada)
%               
%                   Pob = población actual(cellarray)
%                   newPobMutada = población obtenida del cruce y mutación
%                   anteriormente realizados(cellarray)
%                   FitPob = fitness de Pob
%                   FitMutada = fitness de newPobMutada
%
function [Pob, FitPob] = reemplazo(Pob, newPobMutada, FitPob, FitMutada)
N = length(Pob);    %Tamaño de la población
auxPob = {Pob{:} newPobMutada{:}};
auxFit = [FitPob; FitMutada];
%Ordenamos de meor a peor fitness (en este caso de menor (arriba) a mayor
%(abajo) coste
[~, index] = sort(auxFit);
%Seleccionamos los mejores
ind = index(1:N);
Pob = auxPob(ind);
FitPob = auxFit(ind, :);