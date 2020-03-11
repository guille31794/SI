function Pos = GeneraPoblacion(M, N, NPoblacion)
    Pos = [];
    while size(Pos,1)<NPoblacion
       aux = randperm(N);
       Pos = [Pos; sort(aux(1,1:M))];
       unique(Pos,'rows');
    end
end