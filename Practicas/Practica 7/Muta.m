function pob = Muta(pob)
pMut = 0.1;
for n=1:length(pob)
    if rand() > pMut
        [~,s] = size(pob);
        r = floor(s/2);
        k = randi(r);
        p = randi([r, s]);
        % swap alleles
        [pob(n,k), pob(n,p)] = deal(pob(n,k), pob(n,p));
    end
end
end