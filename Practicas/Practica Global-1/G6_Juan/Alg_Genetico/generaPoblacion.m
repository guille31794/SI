function [satelites, pob] = generaPoblacion(nPob, N, M, lim)

    % Generamos la posición de los satélites que no varía por población
    % La devolveremos en satelites
    for i=1:N
        satelites(i,:) = [rand*lim rand*lim];
    end
  
    % Generamos los representantes iniciales aleatorios    
    for i=1:nPob        
        pob(i, :) = randperm(N, M);
    end
end




