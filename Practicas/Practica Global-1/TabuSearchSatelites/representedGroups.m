function reps = representedGroups(stations, selectedStations, N)
    reps = zeros(1, N);
    notReps = 1:N;
    notReps(selectedStations) = [];
    for n = notReps
        [~,pos] = min_dist(stations(:,n), stations(:, selectedStations));
        reps(n) = selectedStations(pos);
    end
end