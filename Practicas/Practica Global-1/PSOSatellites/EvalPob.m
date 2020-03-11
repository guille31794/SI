% Compute fitness from a poblation
function fitpob = EvalPob(pob, stations)
% pre-alocation for speed
fitpob = zeros(size(pob,1),1);
n = 1;
while n <= size(pob,1)
    fitpob(n) = Evaluation(stations, pob(n,:));
    n = n+1;
end
end