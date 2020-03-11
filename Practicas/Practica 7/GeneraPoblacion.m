function pob = GeneraPoblacion(NQueens, habitants)
for n=1:habitants
    pob(n,:) = randperm(NQueens);
end