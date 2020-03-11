%Crea un sucesor de selectedStations.
%Método: tomar el más cercano de la media de representados
%selectedStations(varLevel).
%Orden: N

%Si no tuviera el vector auxiliar represented, tendría que calcular primero las
%distancias de todas las estaciones a todas las representantes para sacar el grupo de selected(varLevel) 
%de orden N*M.
%Gracias al vector auxiliar represented, paso de orden N*M a N en peor caso
%(en realidad N - M, pero por simplificar)
function succesor = generateSuccesor4(stations, selectedStations, represented, varLevel)
    succesor = selectedStations;
    group = find(represented==selectedStations(varLevel));
    %En muy raras ocasiones, una estación puede no tener ningún
    %representante; no se intercambia. También puede tener más de uno a
    %igual distancia, en cuyo caso se escoge uno de los dos sin criterio.
    if(~isempty(group))
        media = sum(stations(:,group), 2)/length(group);
        [~, pos] = min_dist(media, stations(:, group));
        succesor(varLevel) = group(pos(1));
    end