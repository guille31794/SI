% x - Current vector, k - variable to change
% last 3 colums from sucMatrix storage cost, and exchange values (n & k) 
function sucMatrix = succesors(x)
% memory prealocation. +3 because we need additional information 
% sum(1:(length(x)-1) represents the number of posible permutations without
% repetition
sucMatrix = zeros(sum(1:(length(x)-1)), length(x)+3);
counter = 1;
% diferent permutations of vector x
for n=1:length(x)
    for k = n+1:length(x)
        xi = x;
        xi(n) = x(k);
        xi(k) = x(n);
        sucMatrix(counter, 1:length(x)) = xi;
        sucMatrix(counter, length(x)+1) = EvalNq(xi);
        % Info needed later. Exact position where every queen is
        sucMatrix(counter, length(x)+2) = n;
        sucMatrix(counter, length(x)+3) = k;
        counter = counter +1;
    end
end
% x is not succesor from itself
% Order sucMatrix by cost
sucMatrix = sortrows(sucMatrix, length(x)+1);
end