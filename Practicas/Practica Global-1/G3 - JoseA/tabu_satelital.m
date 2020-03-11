function [espacio, representantes, evaluacion] = tabu_satelital(N, M)
tic;

[espacioSatelital, distancias, rep] = inicializa(N, M);

current = zeros(1, N);
current(rep) = 1;
best = current;
bestEval = realmax;
tabuList = zeros(1, N);

castigo = 4;
iter = 0;
maxIter = 200;
iter_rep = 0;
max_iter_rep = 10;

while(iter < maxIter && evalua(best) > 0 && max_iter_rep > iter_rep)
    suc = sucesores(current,distancias,N, M);
    i = suc(1,1);
    j = suc(1,2);
    new = current;
    new([i j]) = new([j i]);
    newEval = suc(1,3);
    suc(1,:) = [];  
    while(~isempty(suc) && ~isequal(current,new))
        if round(newEval/N,2) < round(bestEval/N, 2)
            current = new;
            best = current;
            bestEval = newEval;
            tabuList(i) = castigo;
            tabuList(j) = castigo;
            suc(:) = [];
            iter_rep = 0;
        elseif tabuList(i) == 0 && tabuList(j) == 0
            current = new;
            tabuList(i) = castigo;
            tabuList(j) = castigo;
            suc(:) = [];
            iter_rep = iter_rep+1;
        else
            new([i j]) = current([j i]);
            suc(1,:) = [];
        end
    end %segundo while
    
    iter = iter + 1;
    tabuList(tabuList ~= 0) = tabuList(tabuList~=0) - 1;
    
end %primer while
toc; 
espacio = espacioSatelital;
representantes = find(best == 1);
evaluacion = round(bestEval/N, 2);