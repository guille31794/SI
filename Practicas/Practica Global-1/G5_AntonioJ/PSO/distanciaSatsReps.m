function [DistanciaSatRepi] = distanciaSatsReps(Satelites,IndicesReps) 
%En DistanciaSatRepi queda en cada columna la distancia del satélite
%iésimo respecto de cada representante(fila1=distancia a representante 1, fila 2 distancia a representante 2,...)   
    DistanciaSatRepi = [];
    for i=1:size(IndicesReps,2)
        DistanciaSatRepi = [DistanciaSatRepi; d_euclid(Satelites,Satelites(:,IndicesReps(i)))];
        if(IndicesReps(i) < 0 || IndicesReps(i) > 500)
            IndicesReps(i)
        end
    end
end