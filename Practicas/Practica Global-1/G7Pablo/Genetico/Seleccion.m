function Padres = Seleccion(FitPob)
    tot = sum(FitPob);
    Prob = [FitPob/tot cumsum(FitPob/tot)];
    Padres = [];
    while size(Padres,1)<ceil(size(FitPob,1)/2)
        ale = rand();
        p = min(find(Prob(:,2)>=ale));
        if isempty(find(Padres == p))
            Padres = [Padres; p];
        end
    end
end







