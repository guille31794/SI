%Práctica Global de Sistemas Inteligentes
%Francisco Javier Jiménez Vázquez
%%
clear, clc
format long
%%
N = 500;        %Nº de estaciones satelitales
M = 40;         %Nº de representantes
AXB = [0 500];      %Espacion bidimensional AxB
%Generamos las coordenadas de las N estaciones en AXB
estaciones = generarEstaciones(N, AXB);
%Seleccionamos los M representantes de forma aleatoria
S = elegirRepresentantes(estaciones, M);   %S={R1,R2...RM}
%%
%Annealing
newS = annealingE(estaciones, S);
%Algoritmo Genético
newS2 = geneticE(estaciones, M);