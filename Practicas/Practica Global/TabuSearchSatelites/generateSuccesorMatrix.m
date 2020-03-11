%Crea matriz de sucesores a partir de selectedStations.
%Orden: M*2N
function sucsMatrix = generateSuccesorMatrix(stations, selectedStations, valueFather, M)
    sucsMatrix = zeros(M, M+2);
    N = length(stations);
    %Calcular el representante de cada estación no seleccionada
    represented = representedGroups(stations, selectedStations, N);
    for varLevel = 1:M
        %Generar un sucesor
        sucsMatrix(varLevel, 1:M) = generateSuccesor4(stations, selectedStations, represented, varLevel);
        %Registrar cambio de padre a sucesor
        sucsMatrix(varLevel, M+1) = sucsMatrix(varLevel, varLevel);
        %Calcular valor de sucesor
        sucsMatrix(varLevel, M+2) = EvaluationI(stations, sucsMatrix(varLevel, 1:M));
    end
    %Ordenar los sucesores de menor a mayor valor
    sucsMatrix = sortrows(sucsMatrix, M+2);
end
    
    