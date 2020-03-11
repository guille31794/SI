function succesor = generateSuccesor2BR(stations, selectedStations, varLevel, reps)
    %Method 2: varLevel rep becomes the closest of its represented group
    %Binary representation (integer conversion)
    selectedI = find(selectedStations==1);
    group = find(reps==selectedI(varLevel));
    [~,pos] = min_dist(stations(:,selectedI(varLevel)), stations(:, group));
    succesor = selectedStations;
    succesor(selectedI(varLevel)) = 0;
    succesor(group(pos)) = 1;
    
    succesorI = find(succesor==1);
    for n = group
        [~,pos] = min_dist(stations(:,n), stations(:, succesorI));
        reps(n) = succesor(pos);
    end
    [~,pos] = min_dist(stations(:,selectedI(varLevel)), stations(:, succesorI));
    reps(selectedI(varLevel)) = succesorI(pos);
    
end