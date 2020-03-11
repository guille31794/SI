function pob = applyChanges(pob, speed)
n = 1;
while n <= length(speed)
    if ~isempty(speed{n})
        m = 1;
        while m <= size(speed{n},1)
            [pob(speed{n}(m,1)), pob(speed{n}(m,2))] = deal(pob(speed{n}(m,2)), pob(speed{n}(m,1)));
            m = m+1;
        end
    end
    n = n+1;
end
end