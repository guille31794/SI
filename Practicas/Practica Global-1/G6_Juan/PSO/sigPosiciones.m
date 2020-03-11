function S = sigPosiciones(Pob, V)

    % Suma de posicion + velocidad
    for i = 1:size(Pob,1)
        S(i,:) = permuta(Pob(i,:), V{i});
    end

end

function indv = permuta(indv, perms)
    
    % Aplicamos las velocidades a la población
    for i = 1:size(perms,1)
        indv([perms(i,1) perms(i,2)]) = indv([perms(i,2) perms(i,1)]);
    end

end



