function [Pob, FitPob] = Reemplazo(Pob, newPobMutada, FitPob, FitMutada)
    
    % Reemplazo en el cual metemos el mejor de Pob en el peor de PobMut.
    [mejorPob, indMejorPob] = min(FitPob);    
    [~, indPeorMut]= max(FitMutada);

    newPobMutada(indPeorMut, :) = Pob(indMejorPob, :);
    FitMutada(indPeorMut, :) = mejorPob;

    Pob = newPobMutada;
    FitPob = FitMutada;
    
end


%     fp = [Pob FitPob; newPobMutada FitMutada];
%     fp2 = sortrows(fp, size(fp,2));
%     
%     Pob = fp2(1:size(Pob, 1), 1:size(Pob, 2));
%     FitPob = fp2(1:size(Pob,1), size(fp2,2));