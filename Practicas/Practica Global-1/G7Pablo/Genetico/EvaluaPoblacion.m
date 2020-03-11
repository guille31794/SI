function FitPob = EvaluaPoblacion(Pob, CN)    
    FitPob = [];
    for i = 1:size(Pob,1)
        aux = Pob(i,:);
        FitPob = [FitPob; fCost(aux,CN)];
    end
    
end