% x -> Asignaci�n de regiones: AO TN AS Q NGS V T
% vari -> indica la siguiente region a asignar

function [vari]=selecciona_var_no_asignada(x, dominios, G, caso)
%% devuelve la siguiente variable no asignada seg�n criterio
noasig=find(x==0);
if ~isempty(noasig)
    switch(caso)
    case 1 
    %%% Asigna la siguiente variable no asignada
    vari = noasig(1);
    case 2
    %%% Grado Heur�stico: Asigna variable que participa en m�s restricciones
    vari = heuristicGrade(G, x);
    case 3
    %%% MVR: Asigna la variable con menos valores restantes
    vari = mvr(x, dominios);
    otherwise
    vari=0;
    end
end
end
