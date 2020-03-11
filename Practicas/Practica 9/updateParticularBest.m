function particularBest = updateParticularBest(particularBest, PobBest, Pob)
cp = 0.5;
for n=1:size(particularBest,1)
    if rand >= cp
        particularBest{n,1} = computeChanges(PobBest(n,:),Pob(n,:));
    end
end
end