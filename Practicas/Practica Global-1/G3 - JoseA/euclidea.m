function d = euclidea(coord1, coord2)
    d = sqrt((coord2(1,1) - coord1(1,1))^2 + (coord2(1,2) - coord1(1,2))^2);
end