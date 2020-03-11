%Sólo calcula valor para selectedStates(varLevel).
%Orden: N
function value = HalfEvaluation(stations, selectedStations, varLevel)
    notReps = 1:length(stations);
    notReps(selectedStations) = [];
    value = 0;
    for n = notReps
        value = value + dist_euclid(stations(:, selectedStations(varLevel)), stations(:,n));
    end
end