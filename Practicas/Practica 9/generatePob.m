function pob = generatePob(nQueens, pobSize)
% pre-alocation for speed
pob = zeros(pobSize, nQueens);
n=1;
rng(1);
while n <= pobSize
    pob(n,:) = randperm(nQueens);
    n = n+1;
end
end