function fitpob = EvalPob(pob)
c = 27;
fitpob = zeros(size(pob,1),1);
for n=1:size(pob,1)
    fitpob(n) = WeightBag(pob(n,:));
    if fitpob(n) > c
        fitpob(n) = 0;
    end
end