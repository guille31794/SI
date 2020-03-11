function [ParticularPobBest, FitPobBest] = updateFitPobBest(pob, ParticularPobBest, FitPob, FitPobBest)
n = 1;
while n <= length(FitPob)
    if FitPob(n) <= FitPobBest(n)
        ParticularBest(n,:) = pob(n,:);
        FitPobBest(n) = FitPob(n);
    end
    n = n+1;
end
end