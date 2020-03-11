function pob = generaPoblacion(N, M, Npoblacion)

pob = zeros(Npoblacion, N);

for i = 1:Npoblacion
   reps = randperm(500, 40);
   pob(i, reps) = 1;
end
