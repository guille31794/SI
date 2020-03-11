function FitPob = EvaluaPoblacion(pob, satelites)
    
    for i=1:size(pob, 1)
        FitPob(i,:) = fix(fEval(pob(i,:), satelites));
    end
    
end

function eval = fEval(espacio, satelites)
    
    espacio = find(espacio == 1);
    representantes = satelites(espacio, :); % Tomamos los repr.
    satelites(espacio, :) = []; % Quitamos los repr. del espacio
    
    N = size(espacio, 1);       % Número de estaciones NO repr.
    M = length(espacio);        % Número de repr.
    
    for i=1:M
        dist(i,:) = d_euclid(satelites', representantes(i, :)');
    end
    
    d = min(dist);  % Vemos cuál es el repr. de cada uno.
    eval = sum(d);  % Sumamos las dist. mín. los sat. a los repr.
    
end


