function [pob, FitPob] = GeneraPoblacion(objectNumber, habitants)
n = 1;
% Maximum capacity of bag
c = 27;
% pre-alocation for speed 
pob = zeros(habitants,objectNumber);
FitPob = zeros(habitants, 1);
while n <= habitants
    pob(n,:) = randi([0 1], objectNumber,1);
    FitPob(n,:) = WeightBag(pob(n,:));
    if FitPob(n,:) <= c
        n = n+1;
    end
end