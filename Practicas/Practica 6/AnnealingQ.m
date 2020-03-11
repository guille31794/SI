function current = AnnealingQ(current)
% T = temperature
% deltaE = newCost - currentCost
itLvl = 1;
T = 9999;
T_min = 2;
while T > T_min && EvalNq(current) > 1 && itLvl < 10 %length(current)
    newSuccesor = randomSuccesor(current, itLvl);
    deltaE = EvalNq(newSuccesor) - EvalNq(current);
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
current  = [current EvalNq(current) itLvl];
end