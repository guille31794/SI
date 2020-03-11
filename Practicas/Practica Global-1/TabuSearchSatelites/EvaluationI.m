%Método: Calcular distancias de cada no representante a su representante
%más cercana.
%Orden: N*M (en realidad (N-M)*M, pero por simplificar)
function value = EvaluationI(stations, selectedStations)    
    value = 0;
    %Buscar todas las estaciones no representantes
    notReps = 1:length(stations);
    notReps(selectedStations) = [];
    %Calcular las distancias
    for n = notReps
        value = value + min_dist(stations(:,n), stations(:, selectedStations));
    end
end
    