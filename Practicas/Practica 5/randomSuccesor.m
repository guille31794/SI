function succesor = randomSuccesor(current, itLvl)
k = randperm(length(current), 1);
while(k == itLvl)
    k = randperm(length(current), 1);
end
succesor = current;
succesor(k) = current(itLvl);
succesor(itLvl) = current(k);
end