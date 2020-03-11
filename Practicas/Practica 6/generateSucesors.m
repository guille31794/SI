function sucMatrix = generateSucesors(x, k)
% memory prealocation            
    sucMatrix = zeros(length(x), length(x)+1);
% diferent permutations of vector x
    for n=1:length(x)
        xi = x;
        xi(n) = x(k);
        xi(k) = x(n);
        sucMatrix(n, 1:length(x)) = xi;
        sucMatrix(n, end) = EvalNq(xi);
    end
    sucMatrix(1,:) = [];
end
        
    
    