function changes = computeChangesGlobal(globalBest, pob)
changes = [];
cg = 0.2;
for n=1:length(pob)
    if rand >= cg
        if pob(n) ~= globalBest(n)
            % 1� position = index, 2� position = content from best
            changes = [changes; n globalBest(n)];
        end
    end
end