function cost = EvalNq(x)
cost = 0;
for n=1:length(x)
    for m=n+1:length(x)
        if abs(m-n) == abs(x(m)-x(n))
            cost = cost+1;
        end
    end
end
end