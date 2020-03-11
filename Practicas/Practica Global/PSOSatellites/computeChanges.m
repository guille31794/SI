function changes = computeChanges(pobBest, pob)
changes = [];
cp = 0.2;
for n=1:length(pob)
    if rand() >= cp
        if pob(n) ~= pobBest(n)
            % 1º position = index, 2º position = content from best
            changes = [changes; n pobBest(n)];
        end
    end
end
end