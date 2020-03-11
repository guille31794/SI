function Pob = generaPob(Npob, N, M)
    for i=1:Npob
        Pob(i,:) = randperm(N, M);
    end
end