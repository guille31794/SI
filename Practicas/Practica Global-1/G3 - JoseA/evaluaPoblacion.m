function fitPob = evaluaPoblacion(distancias, pob, N)

tamPob = size(pob,1);
fitPob = zeros(tamPob, 1);

for i = 1:tamPob
    dAux = distARepresentantes(find(pob(i,:)), distancias, N);
    fitPob(i) = sum(dAux(:,2));
end