function [MinPob] = est_sat_Genetico()
    
    %Semilla    
    rand('seed',5); 
    
    %Datos de entrada
    N = 500;
    M = 40;
    %N = ;
    %M = ;
    range = [0 500];
    %CN representa las coordenadas de los satelites generadas de forma
    %aleatoria:
    CN = [range(1)+(range(2)-range(1))*rand(1,N); range(1)+(range(2)-range(1))*rand(1,N)]'; 
    NPoblacion = 100;
    Pmut = 0.1;    
    
    %Poblacion inicial:   
    Pob = GeneraPob(M, N, NPoblacion);
    FitPob = EvaluaPoblacion(Pob, CN);
        
    FitAnt = []; 
    i = 1;
    nejem = 0;
    MaxItera = 500;
    
    tic; %Medimos el tiempo
    %Como condiciones de parada usamos un iterador (i) para asegurarnos que
    %no se hace mas que MaxItera y 'nejem' que lo usamos para que, en el
    %caso de que no se mejore la Poblacion, no se haga mas de 100 veces.
   
    
    while i < MaxItera && nejem < 100
        %Le asignamos a FitAnt el minimo de FitPob para compararlo con el
        %FitPob actual y comprobar si se ha mejorado
        FitAnt = min(FitPob);
        
        Padres = Seleccion(FitPob);
        parejas = Emparejar(Padres, NPoblacion);
        newPob = CruceOX(parejas,Pob);
        newPobMutada=Muta(newPob,Pmut);
        FitMutada=EvaluaPoblacion(newPobMutada,CN);
        [Pob,FitPob]=Reemplazo(Pob,newPobMutada,FitPob,FitMutada,CN);
          
        if min(FitPob) == FitAnt  
            nejem = nejem + 1; 
        else 
            nejem = 0;
        end 
        
        i = i + 1;
    end 
    t = toc;
    %Grafica para mostrar el resultado
    [~,ind] = min(FitPob);
    plot(CN(:,1),CN(:,2),'.b'),hold on;
    plot(CN(Pob(ind,:),1),CN(Pob(ind,:),2),'om');
    legend('Satelite','Representantes');
    
    %Devolvemos la poblacion con el minimo coste
    MinFitPob = min(FitPob);
    MinPob = Pob(min(find(FitPob == MinFitPob)),:);
    
    disp('Tiempo empleado');
    disp(t);
    disp('Fit de la solucion');
    disp(MinFitPob);
    
end 