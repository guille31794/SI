%%
%   GENETICE    -   Algoritmo gen�tico
%
%       newS = geneticE(estaciones, nRepresentantes)
%
%               estaciones = coordenadas por columna de las estaciones
%               espaciales
%               nRepresentantes = n�mero de representantes
%               newS = coordenadas del mejor habitante de la poblaci�n
%               obtenida
%
function newS = geneticE(estaciones, nRepresentantes)
N = nRepresentantes;     %N� de representantes
M = 10;             %N� de la poblaci�n
%Probabilidades de
Pcross = 0.9;   %Cruce
Pmut = 0.65;     %Mutaci�n
%Generamos la poblaci�n
%nota: la poblaci�n se almacenar� en cellarrays ya sea la normal, la nueva
%o la mutada
for i = 1:M,
    Pob{i} = elegirRepresentantes(estaciones, N);
end
%Y la evaluamos
FitPob = evalPobRepresentantes(estaciones, Pob);
%Guardamos mejor Fitnes
Peor = 9e10;   %iniciamos ocn un valor muy malo
cont = 0;

itera = 1; MAXitera = 100;
while(itera <= MAXitera && cont == 0),   %cuando poblacion converge
    Peor = max(FitPob);
    Padres = ruleta(FitPob, 10);
    newPob = cruce(Pob, Padres, Pcross);
    newPobMutada = mutacion(estaciones, newPob,Pmut);
    FitMutada = evalPobRepresentantes(estaciones, newPobMutada);
    [Pob, FitPob]=reemplazo(Pob,newPobMutada,FitPob,FitMutada);
    %Si la poblaci�n converge paramos
    %Diremos que la poblaci�n ha convergido cuando el peor fitness de la
    %iteraci�n anterior se repite en la nueva poblaci�n obtenida
    if(any(Peor == FitPob)),
        cont = 0+1;
    end
    itera=itera+1
end
FitPob
%Devolvemos el mejor d ela poblaci�n
[~, ind] = min(FitPob);
newS = Pob{ind};