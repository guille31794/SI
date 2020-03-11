function [Pob,FitPob] = Reemplazo(Pob,newPobMutada,FitPob,FitMutada,CN)
    aux = [Pob FitPob; newPobMutada FitMutada];
    tam = size(Pob,1);
    len = size(Pob,2);
    aux = sortrows(aux,size(Pob,2)+1);
    Pob = [];
    i = 1;
    j = tam;
    while size(Pob,1)<tam
        Pob = aux(i:j,1:len);
        unique(Pob,'rows');
        i = j+1;
        j = j + (j - size(Pob,1));
    end
    FitPob = EvaluaPoblacion(Pob,CN);
end