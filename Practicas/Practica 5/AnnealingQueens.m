function [current,cost, itLvl] = Annealing(current)
% T = temperature
% deltaE = newCost - currentCost
itLvl = 1;
T = 9999;
T_min = 2;
while(T > T_min && isSafe(current))
    newSuccesor = randomSuccesor(current, itLvl);
    deltaE = fCoste(newSuccesor) - fCoste(current);
    if deltaE < 0
        current = newSuccesor;
    else
        p = exp(deltaE/T);
        if p > rand
            current = newSuccesor;
        end
    end
    enfriar(T);
    itLvl = itLvl+1;
end
cost = fCoste(current);
end