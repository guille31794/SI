%Calcula valor de un estado.
%Orden: N*M (en realidad (N-M)*M, pero por simplificar)
function value = Evaluation(stations, selectedStations, represented)
    value = 0;
    for m = selectedStations
        for n = find(represented==m)
            value = value + dist_euclid(stations(:,m), stations(:,n));
        end
    end
end