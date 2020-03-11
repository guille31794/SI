function [nuevaGeneracion] = elitista(PoblacionActual,PoblacionGenerada)
    PoblacionTotal=[PoblacionActual;PoblacionGenerada];
    PoblacionTotal=[PoblacionTotal evaluaPoblacion(PoblacionTotal)'];
    PoblacionTotal = unique(PoblacionTotal,'rows');
    [~,ind]=sort(PoblacionTotal(:,size(PoblacionTotal,2)),'ascend');
    indNuevaGeneracion = ind(1:size(PoblacionActual,1));
    nuevaGeneracion = PoblacionTotal(indNuevaGeneracion,1:size(PoblacionTotal,2)-1);
end