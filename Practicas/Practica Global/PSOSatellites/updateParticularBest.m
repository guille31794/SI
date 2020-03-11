function particularBest = updateParticularBest(particularBest, PobBest, Pob)
for n=1:size(particularBest,1)
    particularBest{n,1} = computeChanges(PobBest(n,:),Pob(n,:));
end
end