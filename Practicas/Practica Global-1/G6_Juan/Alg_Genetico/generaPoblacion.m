function [satelites, pob] = generaPoblacion(nPob, N, M, lim)

    % Generamos la posici�n de los sat�lites que no var�a por poblaci�n
    % La devolveremos en satelites
    for i=1:N
        satelites(i,:) = [rand*lim rand*lim];
    end
  
    % Generamos los representantes iniciales aleatorios    
    for i=1:nPob        
        pob(i, :) = randperm(N, M);
    end
end




