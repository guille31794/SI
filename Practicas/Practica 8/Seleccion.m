function parents = Seleccion(FitPob, k)
% pre-alocation for speed 
parents = zeros(length(FitPob),1);
    for n = 1:length(FitPob)
        random = randperm(length(FitPob), k);
        parents(n) = random(find(FitPob(random)==max(FitPob(random)), 1));
    end
end