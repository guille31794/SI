function [changes, Pob] = updateGlobalBest(changes, globalBest, Pob)
cg = 0.5;
for n=1:size(Pob,1)
    if rand >= cg
    [changes{n,1} , Pob(n,:)] = computeChangesGlobal(Pob(globalBest(2),:),Pob(n,:));
    end
end
end