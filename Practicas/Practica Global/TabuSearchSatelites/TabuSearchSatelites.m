function [Best, BestCost, TotalCounter] = TabuSearchSatelites()
    Initialization;
    Current = selectedStations;
    Best = Current;
    TabuList = zeros(1, N);
    Tenure = N;
    PartialCounter = 1;
    TotalCounter = 1;
    Max_Partial = 50;
    Max_Total = 10000;
    CurrentCost = EvaluationI(stations, Best);
    BestCost = CurrentCost;
    while(PartialCounter <= Max_Partial && TotalCounter <= Max_Total)
        %SucsMatrix: columna M+1: varLevel, M+2: coste, orden ascendiente
        %Orden 2N*M
        SucsMatrix = generateSuccesorMatrix(stations, Current, CurrentCost, M);
        while(~isempty(SucsMatrix))
            if(SucsMatrix(1, M+2) < BestCost)
                Current = SucsMatrix(1, 1:M);
                Best = Current;
                CurrentCost = SucsMatrix(1, M+2);
                BestCost = CurrentCost;
                PartialCounter = 1;
                %Update TabuList
                TabuList(SucsMatrix(1,M+1)) = Tenure;
                SucsMatrix = [];
            elseif(TabuList(SucsMatrix(1,M+1)) == 0 & any(Current ~= SucsMatrix(1,1:M)))
                Current = SucsMatrix(1,1:M);
                CurrentCost = SucsMatrix(1, M+2);
                %Update Tabulist
                TabuList(SucsMatrix(1,M+1)) = Tenure;
                SucsMatrix = [];
            else
                SucsMatrix(1,:) = [];
            end 
        end
        %update TabuList
        tabus = find(TabuList~=0);
        TabuList(tabus) = TabuList(tabus) - 1;
        PartialCounter = PartialCounter+1;
        TotalCounter = TotalCounter+1;
    end
end