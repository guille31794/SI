function [Padres] = seleccion(Npadres,k,fitPob)
    Padres = [];
    for i=1:Npadres
        padres_i = randperm(Npadres,k);
        [~,indiceEnPob] = min(fitPob(padres_i));
        Padres = [Padres; padres_i(indiceEnPob)];
    end
end