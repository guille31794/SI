function pob = generatePob(range, pobSize, numberOfRepresenters)
% pre-alocation for speed
pob = zeros(pobSize, numberOfRepresenters);
n = 1;
while n <= pobSize
    pob(n,:) = randperm(range,numberOfRepresenters);
    n = n+1;
end
end