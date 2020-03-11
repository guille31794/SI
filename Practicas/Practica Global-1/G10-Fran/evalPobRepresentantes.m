%%
%   EVALPOBREPRESENTANTES   -   Evalúa cada habitante de la población
%                               correspondiente a un conunto S diferente en
%                               cada una. 
%
%       Fit = evalPobRepresentantes(estaciones, Pob)
%
%               estaciones = coordenadas por columna de las estaciones
%               espaciales
%               Pob = [cellarray]población, cada habitante es un conunto S
%               de representantes
%               Fit = fitness de cada habitante de la población
%
function Fit = evalPobRepresentantes(estaciones, Pob)
M = length(Pob);    %Nº de la población
%Aplicamos evaluar representantes M veces = nº habitantes
for i = 1:M,
    Fit(i, :) = evalRepresentantes(estaciones, Pob{i});
end