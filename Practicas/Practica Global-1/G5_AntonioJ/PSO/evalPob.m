function FitPob = evalPob(x, y, Pob)
    for i=1:length(x)
        punto = [x(i) y(i)]; % Coordenada de un satélite
        for j=1:size(Pob,1)
            distancia = [];
            for k=1:size(Pob,2)
                 distancia(k) = pdist([punto; Pob(j,k)]); % Medimos las distancias hasta los representantes actuales
            end
            [~, ind] = min(distancia);
            
        end
    end

end