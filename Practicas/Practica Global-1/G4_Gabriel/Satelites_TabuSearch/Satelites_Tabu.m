%Autor: Fernando Medina Delgado (2018)
close all;
clear;
clc;

tic;
rand('seed',5);
N = 500;
M = 40;

coords = floor(N*rand(2,N)); %Coordenadas de los 500 satelites
current = coords(:,1:M); %40 primeros satélites
best = current;

T = 50;%Ternure
t = 1;
tabu_list = zeros(1,T);
Max_iterations = 1000;
iterations = 1;
flag1 = 5;% iteraciones maxima si no cambia ni el actual ni el mejor
currentChange = false;
flag3 = 80; % iteraciones maximas si cambia el actual sin cambiar el mejor

plot(coords(1,:),coords(2,:),'*');hold on;
cont=1;%Seleccionar los sucesores de cada satelite reprensentante
while(iterations <= Max_iterations && flag1>0 && flag3>0)
    % plot(coords(1,:),coords(2,:),'*');hold on;
    [dEuclideaActual, clase] = Sucesores(current,coords);
    if iterations == 1
        dEuclideaMejor = dEuclideaActual;
    end
    currentChange=false;
    p = 1;
    while(currentChange==false && length(clase) ~= 0 && p~=length(clase))
      new = current;
      for k=1:M
          ind = find(clase==k);
          new(:,k) = coords(:,ind(mod(cont,length(ind))+1));
      end
      cont = cont + 1;
      dEuclideaNueva = fEval(new,coords);
      if (dEuclideaNueva < dEuclideaMejor)
          dEuclideaMejor = dEuclideaNueva;
          current = new;
          best = current;
          tabu_list(t) = dEuclideaNueva;
          currentChange = true;
          clase = [];
          flag1 = 5;
          flag3 = 80;
      else
          flag2 = false;
          for k=1:T
              if dEuclideaNueva == tabu_list(k)
                  flag2=true;
                  k=T+1;
              end
          end
          
          if(flag2~=true) %SI NO ES TABU
              current = new;
              tabu_list(t) = dEuclideaNueva;
              currentChange = true;
              clase = [];
              flag3 = flag3-1;
              flag1 = 5;
          else %SI ES TABU
              p = p + 1;
              flag1 = flag1 - 1;
          end
      end
      t = t+1;
      if(t > T)
          t = 1;
      end
      iterations = iterations + 1;
      % plot(best(1,:),best(2,:),'.r','MarkerSize',10);hold off;
      % pause
    end
end
plot(best(1,:),best(2,:),'.r','MarkerSize',15);hold off;
axis([-10 N+10 -10 N+10]);
disp('Iteraciones: ');
disp(iterations);
toc
