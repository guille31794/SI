function [DistanciaGlobal] = FitIndiv(Satelites,Representantes)
    distancias = distanciaSatsReps(Satelites,Representantes);
    FitPob = min(distancias);
    DistanciaGlobal = sum(FitPob);%Esta es la distancia que tenemos que minimizar
end