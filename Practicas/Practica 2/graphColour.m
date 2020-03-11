function x = graphColour(k, m, n, G, x)
c = 1;
while c <= m && any(x == 0)
    if isSafe(k, c, G, x)
       x(k) = c;
       if k+1 <= n
           k = k+1;
           x = graphColour(k, m, n, G, x);
       end
    end
    c = c+1;
end
end

function b = isSafe(k, c, G, x)
ind = find(G(k,:));
b = all(x(ind) ~= c);
end