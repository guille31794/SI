function Fit = EvaluaPoblacion(Pob)
n = 1;
% Pre-alocation for speed
Fit = zeros(size(Pob,1), 1);
    while n <= size(Pob,1)
        Fit(n) = EvalNq(Pob(n,:));
        n = n+1;
    end
end