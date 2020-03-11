function changes = updateGlobalBest(changes, globalBest, Pob)
for n=1:size(Pob,1)
    changes{n,1} = computeChangesGlobal(Pob(globalBest(2),:),Pob(n,:));
end
end