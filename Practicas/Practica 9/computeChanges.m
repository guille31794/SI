function changes = computeChanges(pobBest, pob)
changes = [];
for n=1:length(pob)
    if pob(n) ~= pobBest(n)
        index = find(pobBest(n) == pob);
        changes = [changes; index n];
    end
end