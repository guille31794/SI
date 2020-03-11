clear
rand('seed',5)

N = 500;
M = 40;

[espacioSatelital, representantes, evaluacion] = tabu_satelital(N, M)
%[espacioSatelital, representantes, evaluacion] = genetico_satelital(N, M)


plot(espacioSatelital(:,1),espacioSatelital(:,2),'.');hold on;
plot(espacioSatelital(representantes,1),espacioSatelital(representantes,2),'ro');hold off;


