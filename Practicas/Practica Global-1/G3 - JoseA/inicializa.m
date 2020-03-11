function [espacioSatelital, distancias, representantes] = inicializa(N, M)

espacioSatelital = round(rand(N,2)*N,2);
distancias = calculaDistancias(espacioSatelital, N);
representantes = randperm(N,M);