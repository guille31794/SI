%%
%   EVALPOBREPRESENTANTES   -   Eval�a cada habitante de la poblaci�n
%                               correspondiente a un conunto S diferente en
%                               cada una. 
%
%       Fit = evalPobRepresentantes(estaciones, Pob)
%
%               estaciones = coordenadas por columna de las estaciones
%               espaciales
%               Pob = [cellarray]poblaci�n, cada habitante es un conunto S
%               de representantes
%               Fit = fitness de cada habitante de la poblaci�n
%
function Fit = evalPobRepresentantes(estaciones, Pob)
M = length(Pob);    %N� de la poblaci�n
%Aplicamos evaluar representantes M veces = n� habitantes
for i = 1:M,
    Fit(i, :) = evalRepresentantes(estaciones, Pob{i});
end