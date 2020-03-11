function parejas = Emparejar(Padres, NPoblacion)
    
    parejas = [];
    comb = nchoosek(Padres,2);
    comb = unique(comb,'rows');
    i = 1;
    
    while size(parejas,1) < ceil(NPoblacion/2)
        if  comb(i,1) ~= comb(i,2) %&& rand < Pcross
            parejas = [parejas; comb(i,:)];
            comb(i,:) = [];
        end 
        i = mod(i,size(comb,1))+1;
    end

end 











