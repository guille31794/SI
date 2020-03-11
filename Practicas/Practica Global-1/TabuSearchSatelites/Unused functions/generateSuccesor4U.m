function succesor = generateSuccesor4U(stations, selectedStations, varLevel)
    succesor = selectedStations;
    represented = representedGroups(stations, selectedStations, length(stations));
    group = find(represented==selectedStations(varLevel));
    %En muy raras ocasiones, una estación puede no tener ningún
    %representante; no se intercambia. También puede tener más de uno a
    %igual distancia, en cuyo caso se escoge uno de ellos sin criterio.
    if(~isempty(group))
        media = sum(stations(:,group), 2)/length(group);
        [~, pos] = min_dist(media, stations(:, group));
        succesor(varLevel) = group(pos(1));
    end