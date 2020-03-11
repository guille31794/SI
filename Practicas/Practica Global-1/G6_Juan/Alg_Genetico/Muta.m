function newPobMutada = Muta(Pmut, newPob)

    % Mutación
    for i=1:size(newPob, 1)
        if rand <= Pmut
            unmuted = newPob(i,:);
            f1 = round((1/3)*length(unmuted));  
            newPobMutada(i,:) = MutaRepre(unmuted, f1);
        else
            newPobMutada(i,:) = newPob(i,:);
        end
    end
end

function muted = MutaRepre(unmuted, f1)
    
    % Busca un ind. aleatorio que no esté en el vector de repr. 
    % insertándolo en una posición aleatoria machacando el valor anterior
    muted = unmuted;
    N = max(unmuted);
    
    it = 1;
    while it <= f1
        aux = randi(N);     % Tomamos un ind. aleatorio
        if isempty(find(unmuted == aux))    % Miramos si se está
            muted(randi(length(unmuted))) = aux;    % Lo insertamos
            it = it + 1;
        end
    end
    
end



