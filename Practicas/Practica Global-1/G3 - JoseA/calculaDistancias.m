function distancias = calculaDistancias(espacio, N)

distancias = zeros(N);

for i=1:N
    for j=1:N
        distancias(i,j) = euclidea(espacio(i,1:2),espacio(j,1:2));
    end
end