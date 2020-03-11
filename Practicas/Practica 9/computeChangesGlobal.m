function [changes, pob] = computeChangesGlobal(globalBest, pob)
changes = [];
for n=1:length(pob)
    if pob(n) ~= globalBest(n)
        index = find(globalBest(n) == pob);
        % Is it necesary to apply changes into pob?
        [pob(n), pob(index)] = deal(pob(index), pob(n));
        changes = [changes; index n];
    end
end