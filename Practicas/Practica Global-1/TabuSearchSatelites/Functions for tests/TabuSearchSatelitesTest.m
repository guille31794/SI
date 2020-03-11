%Idéntico al algoritmo normal, sólo que usando InitializationTest, para
%poder ejecutarse cómodamente con distintos valores iniciales.
function [Best, BestCost, TotalCounter] = TabuSearchSatelitesTest()
    InitializationTest;
    Current = selectedStations;
    Best = Current;
    %Tabulist tiene una casilla para cada estación. Cuando una estación se
    %escoge en algún sucesor, se asigna el valor tabú.
    TabuList = zeros(1, N);
    Tenure = N/2;
    %Contador de iteraciones sin mejora del resultado
    PartialCounter = 1;
    %Contador de iteraciones totales
    TotalCounter = 1;
    %Máximos para ambos contadores
    Max_Partial = 20;
    Max_Total = 500;
    %Valor del estado inicial (y por ahora el mejor)
    CurrentCost = EvaluationI(stations, Current);
    BestCost = CurrentCost;
    while(PartialCounter <= Max_Partial && TotalCounter <= Max_Total)
        %SucsMatrix: columna M+1: la nueva estación del sucesor, M+2: coste, orden ascendiente
        %Orden 2N*M
        SucsMatrix = generateSuccesorMatrix(stations, Current, M);
        while(~isempty(SucsMatrix))
            if(SucsMatrix(1, M+2) < BestCost)
                Current = SucsMatrix(1, 1:M);
                Best = Current;
                CurrentCost = SucsMatrix(1, M+2);
                BestCost = CurrentCost;
                PartialCounter = 1;
                TabuList(SucsMatrix(1,M+1)) = Tenure;
                SucsMatrix = [];
            elseif(TabuList(SucsMatrix(1,M+1)) == 0 && any(Current ~= SucsMatrix(1,1:M)))
                Current = SucsMatrix(1,1:M);
                CurrentCost = SucsMatrix(1, M+2);                                       %#ok<NASGU>
                TabuList(SucsMatrix(1,M+1)) = Tenure;
                SucsMatrix = [];
            else
                SucsMatrix(1,:) = [];
            end 
        end
        tabus = find(TabuList~=0);
        TabuList(tabus) = TabuList(tabus) - 1;
        PartialCounter = PartialCounter+1;
        TotalCounter = TotalCounter+1;
    end
end