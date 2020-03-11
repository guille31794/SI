function s = sino(m)
    if(size(m) >= 2)
        disp('La matriz tiene mas de dos filas')
        s=m(1,:)==m(2,:);
    else
        disp('Error, la matriz debe tener dos filas')
    end
end