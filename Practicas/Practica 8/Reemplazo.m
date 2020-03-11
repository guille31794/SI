function [newPob, newFitPob] = Reemplazo(pob, mutatedPob, FitPob, MutatedFitPob)
% Pre-alocation for speed
newFitPob = zeros(size(FitPob));
newPob = zeros(size(pob,1), size(pob,2));
% number of members in a pob
n = length(FitPob);
it = 1;
while it < n 
    mm = max(MutatedFitPob);
    mp = max(FitPob);
    if mm >= mp
        index = find(mm == MutatedFitPob);
        newFitPob(it) = MutatedFitPob(index(1,1));
        newPob(it, :) = mutatedPob(index(1,1),:);
        MutatedFitPob(index(1,1)) = 0;
        mutatedPob(index(1,1),:) = 0;
    else
        index = find(mp == FitPob);
        newFitPob(it) = FitPob(index(1,1));
        newPob(it, :) = pob(index(1,1),:);
        FitPob(index(1,1)) = 0;
        mutatedPob(index(1,1), :) = 0;
    end
    it = it+1;
end
end