function succesor = generateSuccesor2I(stations, selectedStations, varLevel)
    %Method: varLevel rep becomes the closest of its represented group
    %Integer representation (best)
    notReps = 1:length(stations);
    notReps(selectedStations) = [];
    
    [~, pos] = min_dist(stations(:,selectedStations(varLevel)), stations(:,notReps));
    succesor = selectedStations;
    succesor(varLevel) = notReps(pos);
end