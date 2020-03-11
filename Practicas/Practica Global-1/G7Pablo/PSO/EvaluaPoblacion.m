function FitPob = EvaluaPoblacion(Pob,CN)
    FitPob = [];
    for i=1:size(Pob,1)
      FitPob = [FitPob; fCost(Pob(i,:), CN)];  
    end
end