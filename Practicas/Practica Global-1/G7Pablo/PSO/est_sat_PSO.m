function x = est_sat_PSO()
    rand('seed',5); %Semilla
    %Datos de entrada
    N = 500;
    M = 40;
    range = [0 500];
    NPoblacion = 100;
    CN = [range(1)+(range(2)-range(1))*rand(1,N); range(1)+(range(2)-range(1))*rand(1,N)]'; %Inicializacion de las coordenadas
    w = 0.8; %Cosntante de inercia
    %Constantes de aceleración
    cp = 0.7;
    cg = 0.8;
    %Población inicial
    Pob = GeneraPoblacion(M, N, NPoblacion);
    Vel = iniVel(NPoblacion);
    Fit = EvaluaPoblacion(Pob,CN);
    PBest = Pob; %Mejor local
    GBest = Pob(find(Fit == min(Fit)),:); %Mejor global
    maxIter = 1000; 
    it = 1;
    nc = 0;
    tic;
    %Condiciones de parada: numero maximo de iteraciones y no cambia el
    %mejor fit durante 50 iteraciones
    while it <= maxIter && nc < 50
        newPob = []; newVel = []; newFit = []; 
        minAnt = min(Fit); %Mejor fit de la población anterior
        for i = 1:NPoblacion  
            s1 = mulcv(w, cell2mat(Vel(i))); %Primer sumando de la formula 
            s2 = mulcv(cp*rand, difpp(PBest(i,:), Pob(i,:))); %Segundo sumando de la formula 
            s3 = mulcv(cg*rand, difpp(GBest, Pob(i,:))); %Tercer sumando de la formula
            v = sumavv(s1, sumavv(s2, s3)); %Calculo de la velocidad
            newVel = [newVel; {v}];
            p = sumapv(Pob(i,:), v, N); %Calculo de la nueva posicion
            newPob = [newPob; p];
            f = fCost(p, CN);
            newFit = [newFit; f]; 
            if f < fCost(PBest(i,:), CN) %Actualizacion del mejor local
               PBest(i,:) = p; 
            end
        end
        if min(newFit) < fCost(GBest,CN) %Actualizacion del mejor global
            GBest = newPob(find(newFit == min(newFit)),:);
        end
        Vel = newVel;
        Pob = newPob;
        Fit = newFit;
        it = it+1;
        if minAnt == min(Fit) %Comprobación de si cambia el mejor fit
            nc = nc+1;
        else
            nc = 0;
        end
    end
    t = toc;
    %Grafica para mostrar la solucion
    [~,ind] = min(Fit);
    plot(CN(:,1),CN(:,2),'.b'),hold on;
    plot(CN(Pob(ind,:),1),CN(Pob(ind,:),2),'om');
    legend('Satelites', 'Representantes');
    %Devolvemos la combinacion de satelites que minimizan las distancias
    x = Pob(min(find(Fit == min(Fit))),:);
    disp('Tiempo empleado');
    disp(t);
    disp('Fit de la solucion');
    disp(min(Fit));
end