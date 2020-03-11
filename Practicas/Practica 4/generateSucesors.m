function s = generateSucesors(x, k)
    
% save parametric overload
    CostMatrix =[12 43 15 7
                9 10 6 4
                5 13 29 2
                4 11 17 9 ];
% memory prealocation            
    s = zeros(length(CostMatrix), length(CostMatrix)+1);
% diferent permutations of vector x
    for n=1:length(CostMatrix)
        xi = x;
        xi(n) = x(k);
        xi(k) = x(n);
        s(n, 1:length(CostMatrix)) = xi;
        s(n, length(CostMatrix)+1) = fCoste(xi);
    end
end
        
    
    