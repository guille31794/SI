function valores=orden_valores_dominio(vari, caso, dominios)
% function orden_valores_dominio(vari,…)
% devuelve la lista de valores ordenados según caso
valores=0;
posibles= find(dominios(vari, :));% indices posibles
if ~isempty(posibles)
    switch(caso)
    case 1
    % Asigna el siguiente valor no asignado
    valores = posibles(1);
    case 2
    % Valor menos restringido, el que aparece en el dominio 
    % de menos variables
    valores = vmr(posibles, dominios);
    otherwise
    valores=0;
    end
end
end