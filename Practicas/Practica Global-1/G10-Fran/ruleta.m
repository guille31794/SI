%%
%   RULETA  -   Selecciona los padres por tirada de ruleta
%
%       Padres = ruleta(FitPob, k)
%
%               FitPob = fitness de la población
%               k = nº de padres a elegir
%               Padres = índices de los padres elegidos en formato columna
%
function Padres = ruleta(FitPob, k)
maximo = max(FitPob)*2;
auxFit = maximo - FitPob;
%Obtenemos el '%' acumulado
total = sum(auxFit);
porcentaje = auxFit./total;
acumulado = cumsum(porcentaje);
%Realizamos las tiradas
selec = rand(k, 1);
Padres = zeros(k, 1);
%Escogemos los padres seleccionados
i = 1;
while(i <= k),
    pct = selec(i);
    aux = find(pct >= acumulado);
    Padres(i, :) = (length(aux))+1;
    i=i+1;
end