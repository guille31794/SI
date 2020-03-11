%Crea un sucesor de selectedStations.
%Método: tomar el más lejano de los representados por
%selectedStations(varLevel).
%Orden: N

%Si no tuviera el vector auxiliar represented, tendría que calcular primero las
%distancias de todas las estaciones a todas las representantes para sacar el grupo de selected(varLevel) 
%de orden N*M.
%Gracias al vector auxiliar represented, paso de orden N*M a N en peor caso
%(en realidad N - M, pero por simplificar)
function succesor = generateSuccesor3(stations, selectedStations, represented, varLevel)
    succesor = selectedStations;
    group = find(represented==selectedStations(varLevel));
    [~, pos] = max_dist(stations(:,selectedStations(varLevel)), stations(:, group));
    %En muy raras ocasiones, una estación puede no tener ningún
    %representante; no se intercambia. También puede tener más de uno a
    %igual distancia, en cuyo caso se escoge uno de los dos sin criterio.
    if(~isempty(pos))
        succesor(varLevel) = group(pos(1));
    end
end