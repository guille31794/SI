% GA for bag problem
% The representation of every individual is binary
% number of objects to choose
N = 12;
% maximum capacity of the bag
c = 27;
% utility of i-esimum object
u = [10 5 7 6 9 2 4 8 9 8 3 10];
% Size of poblation
Npob = 10;
% Poblacion Inicial 
Pob=GeneraPoblacion(N,Npob);
meanNpob = 0;
itera=1;
k = randi(floor(Npob/4));
MAX_itera = 3000;
FitPob = zeros(Npob, 1);
% variable for time
t = 0;
%t1 = clock;
%t2 = clock;
while itera<=MAX_itera && meanNpob < c-2 && all(FitPob(1:(end/2)) ~= c)%&& etime(t1,t2) < 10 
    % Costes de la población
    FitPob=EvalPob(Pob);
    Padres=Seleccion(FitPob,k); % devuelve los indices de los padres que se cruzaran
    parejas=Emparejar(Padres); 
    newPob=Cruce(parejas,Pob); % devuelve nueva poblacion cruzada 
    newPobMutada=Muta(newPob); % poblacion con mutaciones 
    FitMutada=EvalPob(newPobMutada);
    [Pob,FitPob]=Reemplazo(Pob,newPobMutada,FitPob,FitMutada); % I have
%     to implement elitism
% actualizacion variables y condiciones de parada
    itera=itera+1;
    meanNpob = mean(FitPob);
    %t2 = clock;
end