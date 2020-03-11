function seleccionados = Seleccion(FitPob, k)
% pre-alocation for speed 
seleccionados = zeros(length(FitPob),1);
    for n = 1:length(FitPob)
        aleatorios = randperm(length(FitPob), k);
        seleccionados(n) = aleatorios(find(FitPob(aleatorios)==min(FitPob(aleatorios)), 1));
    end
end
    