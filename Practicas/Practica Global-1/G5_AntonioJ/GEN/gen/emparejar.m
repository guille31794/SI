function [parejas] = emparejar(individuosPreSeleccionados,Nparejas)
    indivNoRepetidos=unique(individuosPreSeleccionados);
    parejasNoDef=nchoosek(indivNoRepetidos,2);
    parejas = parejasNoDef( randperm(size(parejasNoDef,1),Nparejas) , :);%para recoger el numero de parejas necesario, no más
end