function newPob = Cruce(parejas, pob)
    
    % Generamos una nueva pob. cruzada empleando el cruce OX
    newPob = [];
    for i=1:size(parejas,1)
        
        % Tomamos los dos padres
        p1 = pob(parejas(i,1), :);
        p2 = pob(parejas(i,2), :);
        
        % Tomamos los dos puntos de cruce
        f1 = round((1/3)*length(p1));
        f2 = round((2/3)*length(p2));
        
        h = OX([p1; p2], f1, f2);                 
        newPob = [newPob; h];    
    end
end




