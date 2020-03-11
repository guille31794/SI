%%
%   REEMPLAZO   -   Reemplazamos la poblaci�n actual por una nueva
%                   generaci�n formada por los mejores habitantes de la
%                   vieja y nueva poblaci�n.
%
%       [Pob, FitPob] = reemplazo(Pob, newPobMutada, FitPob, FitMutada)
%               
%                   Pob = poblaci�n actual(cellarray)
%                   newPobMutada = poblaci�n obtenida del cruce y mutaci�n
%                   anteriormente realizados(cellarray)
%                   FitPob = fitness de Pob
%                   FitMutada = fitness de newPobMutada
%
function [Pob, FitPob] = reemplazo(Pob, newPobMutada, FitPob, FitMutada)
N = length(Pob);    %Tama�o de la poblaci�n
auxPob = {Pob{:} newPobMutada{:}};
auxFit = [FitPob; FitMutada];
%Ordenamos de meor a peor fitness (en este caso de menor (arriba) a mayor
%(abajo) coste
[~, index] = sort(auxFit);
%Seleccionamos los mejores
ind = index(1:N);
Pob = auxPob(ind);
FitPob = auxFit(ind, :);