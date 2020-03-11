function [nuevaGeneracion] = reemplazo(PoblacionActual,PoblacionGenerada,Satelites)
    PoblacionTotal=[PoblacionActual;PoblacionGenerada];
    PoblacionTotal = unique(PoblacionTotal,'rows');
    FitPob=[];
    for i=1:size(PoblacionTotal,1)
        FitPob = [FitPob; FitIndiv(Satelites,PoblacionTotal(i,:))];
    end
    PoblacionTotal = [PoblacionTotal FitPob];
    [~,ind]=sort(PoblacionTotal(:,size(PoblacionTotal,2)),'ascend');
    indNuevaGeneracion = ind(1:size(PoblacionActual,1));
    nuevaGeneracion = PoblacionTotal(indNuevaGeneracion,1:size(PoblacionTotal,2)-1);
end