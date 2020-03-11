%Pr�ctica Global de Sistemas Inteligentes
%Francisco Javier Jim�nez V�zquez
%%
clear, clc
format long
%%
N = 500;        %N� de estaciones satelitales
M = 40;         %N� de representantes
AXB = [0 500];      %Espacion bidimensional AxB
%Generamos las coordenadas de las N estaciones en AXB
estaciones = generarEstaciones(N, AXB);
%Seleccionamos los M representantes de forma aleatoria
S = elegirRepresentantes(estaciones, M);   %S={R1,R2...RM}
%%
%Annealing
newS = annealingE(estaciones, S);
%Algoritmo Gen�tico
newS2 = geneticE(estaciones, M);