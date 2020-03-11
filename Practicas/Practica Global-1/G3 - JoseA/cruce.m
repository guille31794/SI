function newPob = cruce(parejas, pob, M)

tamNewPob = size(parejas,1);
tamIndv = size(pob, 2);
newPob = zeros(1, tamIndv);

pc = round(0.5 * tamIndv);

for i = 1:tamNewPob
     hijo1 = [pob(parejas(i,1), 1:pc-1) pob(parejas(i,2), pc:end)];
     hijo2 = [pob(parejas(i,2), 1:pc-1) pob(parejas(i,1), pc:end)];
     
     %si hay M representantes es un hijo válido
     if length(find(hijo1)) == M
         newPob = [newPob; hijo1];
     end
     if length(find(hijo2)) == M
         newPob = [newPob; hijo2];
     end
         
end
newPob(1,:) = [];
