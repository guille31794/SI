%% Datos del problema
N = 500;
M = 40;
val_min = 0;
val_max = 500;
rand('seed',5);
E = randi([val_min,val_max],N,2);
%% Datos para algoritmo gen�tico
NPob = 60;              %Tama�o de poblaci�n.
MAX_repeats = 50;       %M�ximo n�mero de iteraciones sin cambio en la mejor 
                        %fitness de la poblaci�n.
operadores = [1 1 2 1]; %Selectores de operadores gen�ticos. Ver genSatelites.
%% Datos para b�squeda tab�
tenure = 100;           %N�mero de iteraciones en la tabla tab�.
MAX_ISSM = 10;          %M�ximo de iteraciones seguidas sin mejora en la 
                        %funci�n de fitness.

%% Llamadas a las funciones                        
tic();
[p1,f1,it1] = genSatelites(E,N,M,NPob,MAX_repeats,operadores);
t1 = toc();
figure('Name', 'Gen�tico');
plot(E(:,1),E(:,2), '.'); hold on;
[~,ind] = max(f1);
sats = p1(ind,:);
plot(E(sats,1),E(sats,2),'x', 'MarkerSize', 10); hold off;

tic();
[p2,f2,it2] = tabuSatelites(E,N,M,tenure,MAX_ISSM);
t2 = toc();
figure('Name', 'Tab�');
plot(E(:,1),E(:,2), '.'); hold on;
plot(E(p2,1),E(p2,2),'x', 'MarkerSize', 10); hold off;

