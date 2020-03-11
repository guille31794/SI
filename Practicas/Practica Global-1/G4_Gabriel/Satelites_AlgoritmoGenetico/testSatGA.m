close all;
clear all;
clc;

tic;
rand('seed',5);

N = 500;
M = 40;
MaxCoords = N;
coords = randi(MaxCoords,N,2) + rand(N,2) - rand(N,2);
Npob = 35;
mutChance = 0.2;
crossChance = 0.9;
maxIter = 1000;
maxIterChange = 10;
draw = 0;

[pob,fitness,iter]  = SatGA(N,M,coords,Npob,mutChance,crossChance,maxIter,maxIterChange,draw);

[val,pos] = min(fitness);
sol = pob(pos,:);

if ~draw,
  hold on;
  plot(coords(:,1),coords(:,2),'r.','MarkerSize',10);
  plot(coords(sol,1),coords(sol,2),'b*');
  legend('Sats','Selected');
  hold off;
end %if
disp('Iterations: ');
disp(iter);
toc