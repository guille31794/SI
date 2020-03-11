function [SpBest, pBest] = actSpBest(SpBest, pBest, Pob, FitPob)
    
    % Lo pasamos a vector fila
    aux = [pBest';FitPob']; 
    % Tomamos el índice del mínimo
    [~,ind] = min(aux);
    
    for i=1:size(Pob,1)
        % Si el índice es 2, es pq es mejor el de fitpob que el de pBest
        if ind(i) == 2            
            pBest(i) = FitPob(i);
            SpBest(i,:) = Pob(i,:);
        end
    end

end


