function pob = applyChanges(pob, speed)
n = 1;
if ~isempty(speed{n})
    m = 1;
    while m <= size(speed{n},1)
        pob(speed{1}(m,1)) = speed{1}(m,2);
        m = m+1;
    end
end
end