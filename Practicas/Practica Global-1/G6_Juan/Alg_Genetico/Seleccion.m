function padres = Seleccion(FitPob)

    % Selección por ruleta, proporcional
    tot = sum(FitPob);                      % Total del fitness
    prob = [FitPob/tot cumsum(FitPob/tot)]; % Normal y acumulada
    
    for i=1:length(FitPob)
        padres(i,:) = min(find(prob(:,2) >= rand));
    end    
end






