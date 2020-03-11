function [clasificados] = clasifDmin(Distancias)
%clasifDmin recibe las distancias de cada Satélite a cada representante,
%siendo esta Distancias(Distancias es Nrepresentantes x Nsatelites)
    clasificados=[];
    for i=1:size(Distancias,2)
        [~,indice] = min(Distancias(1:size(Distancias,1),i));
        clasificados = [clasificados indice];
    end
end