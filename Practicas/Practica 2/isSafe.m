function b = isSafe(k, c, n)
b = true;
i = 0:n;
    if eq(G(k,i), 1) && eq(c, x(i))
        b = false;
    end    
end