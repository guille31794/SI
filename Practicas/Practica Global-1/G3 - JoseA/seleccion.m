function padres = seleccion(fitPob, k)

tamPob = size(fitPob,1);
padres = zeros(k, 1);

for i = 1:k
   aux = randi(tamPob, round(0.1*tamPob), 1);
   [~, pos] = min(fitPob(aux));
   padres(i) = pos;
    
end