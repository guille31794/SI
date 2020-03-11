function v = mulcv(c, v)
    i = 1;
    while i <= size(v,1)
        if rand > c
            v(i,:) = [];
        else
            i = i+1;
        end
    end
end





