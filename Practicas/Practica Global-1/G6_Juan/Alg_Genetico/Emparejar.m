function p = Emparejar(padres)

    aux = unique(padres);       % Tomamos los padres sin repetir
    comb = nchoosek(aux', 2);   % Hacemos las comb. de �stos
    
    % Elegimos la mitad del tam. de la poblaci�n
    if size(comb, 1) < round(length(padres)/2) 
        ind = randi(size(comb,1), 1, round(length(padres)/2));
    else
        ind = randperm(size(comb,1), round(length(padres)/2));
    end
    
    p = comb(ind,:); 
end









