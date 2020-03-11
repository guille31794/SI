function succesor = generateSuccesor2B(stations, selectedStations, varLevel)
    %Method: varLevel rep becomes the closest of its represented group
    %Integer representation
    selectedI = find(selectedStations==1);
    notReps = 1:length(stations);
    notReps(selectedI) = [];
    
    [~, pos] = min_dist(stations(:,selectedI(varLevel)), stations(:,notReps));
    succesor = selectedStations;
    succesor(selectedI(varLevel)) = 0;
    succesor(notReps(pos)) = 1;
end