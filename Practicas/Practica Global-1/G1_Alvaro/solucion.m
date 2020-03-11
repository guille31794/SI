%% Datos del problema
N = 500;
M = 40;
val_min = 0;
val_max = 500;
rand('seed',5);
E = randi([val_min,val_max],N,2);
%% Datos para algoritmo genético
NPob = 60;              %Tamaño de población.
MAX_repeats = 50;       %Máximo número de iteraciones sin cambio en la mejor 
                        %fitness de la población.
operadores = [1 1 2 1]; %Selectores de operadores genéticos. Ver genSatelites.
%% Datos para búsqueda tabú
tenure = 100;           %Número de iteraciones en la tabla tabú.
MAX_ISSM = 10;          %Máximo de iteraciones seguidas sin mejora en la 
                        %función de fitness.

%% Llamadas a las funciones                        
tic();
[p1,f1,it1] = genSatelites(E,N,M,NPob,MAX_repeats,operadores);
t1 = toc();
figure('Name', 'Genético');
plot(E(:,1),E(:,2), '.'); hold on;
[~,ind] = max(f1);
sats = p1(ind,:);
plot(E(sats,1),E(sats,2),'x', 'MarkerSize', 10); hold off;

tic();
[p2,f2,it2] = tabuSatelites(E,N,M,tenure,MAX_ISSM);
t2 = toc();
figure('Name', 'Tabú');
plot(E(:,1),E(:,2), '.'); hold on;
plot(E(p2,1),E(p2,2),'x', 'MarkerSize', 10); hold off;

