function pob = Muta(pob)
pMut = 0.5;
for n=1:size(pob,1)
    if rand() > pMut
        [~,s] = size(pob);
        k = randi((s/2));
        p = randi([s/2, s]);
        % swap alleles
        [pob(n,p), pob(n,k)] = deal(pob(n,k), pob(n,p));
    end
end
end