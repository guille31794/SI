function succesor = generateSuccesor2IR(stations, selectedStations, varLevel, reps)
    %Method: varLevel rep becomes the closest of its represented group
    %Integer representation
    group = find(reps==selectedStations(varLevel));
    [~,pos] = min_dist(stations(:,selectedStations(varLevel)), stations(:, group));
    succesor = selectedStations;
    succesor(varLevel) = group(pos);
    
    for n = group
        [~,pos] = min_dist(stations(:,n), stations(:, succesor));
        reps(n) = succesor(pos);
    end
    [~,pos] = min_dist(stations(:,selectedStations(varLevel)), stations(:, succesor));
    reps(selectedStations(varLevel)) = succesor(pos);
end