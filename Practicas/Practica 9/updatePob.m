function pob = updatePob(speed, pob)
n = 1;
while n <= size(pob,1)
    pob(n,:) = applyChanges(pob(n,:), speed(n,:));
    n = n+1;
end
end