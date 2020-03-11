function p = sumapv(p, v, N)
    pos = zeros(1,N);
    pos(p) = 1;
    for i=1:size(v,1)
        pos([v(i,1) v(i,2)]) = pos([v(i,2) v(i,1)]); 
    end
    p = find(pos);
end