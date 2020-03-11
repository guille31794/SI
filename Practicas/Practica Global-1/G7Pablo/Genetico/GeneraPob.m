function Pob = GeneraPob(M, N, NPoblacion)
   Pob = [];
   for i=1:NPoblacion 
       aux = randperm(N);
       Pob = [Pob; aux(1:M)];
   end

end