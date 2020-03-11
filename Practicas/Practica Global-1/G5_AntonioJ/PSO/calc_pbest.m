function mejor = calc_pbest(Spbest, Pob)
    for i=1:size(Spbest,1)
        if(Spbest(i,end) > Pob(i,end))
            mejor(i,:) = Spbest(i,1:end);
        else
            mejor(i,:) = Pob(i,1:end);
        end
    end
end