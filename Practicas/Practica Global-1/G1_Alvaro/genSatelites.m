function [Pob, FitPob, iter] = genSatelites(E,NSat,M,NPoblacion,MAX_repeats,operadores)
    MAX_fit = 0;
    MAX_iter=3000;
    Pcross=0.9;
    Pmut=0.1;
    
    if length(operadores)<4
        operadores = [1 1 1 1];
    end
    
    %% Códigos para seleccionar operadores
    OP_SEL = operadores(1);     %1:Roulette 2:Tournament binario 3:Tournament k=3 PD:Uno de cada
    OP_CROSS = operadores(2);   %1:PMX PD:Nada
    OP_MUT = operadores(3);     %1:Regeneración %2:Int flip %3:Int flip 50 PD:Nada
    OP_REP = operadores(4);     %1:Elitismo total %2:Elitismo único 3:Individualismo PD:Reemplazo generacional
    %% Población Inicial
    Pob=genPob(NSat, M, NPoblacion);
    FitPob=evalPob(E, Pob, MAX_fit);
    iter=1;
    repeats=0;
    while iter<=MAX_iter && max(FitPob)<MAX_fit && repeats<MAX_repeats%%<Resto de condiciones de parada>    
        Padres=selection(FitPob, OP_SEL); %% devuelve los indices de los padres que se cruzaran
        %parejas=pairup(Padres,Pcross);
        newPob=crossover(Pob(Padres,:), Pcross, OP_CROSS); %%devuelve nueva poblacion cruzada
        newPobMutada=mutate(newPob,NSat, Pmut, OP_MUT); %%poblacion con mutaciones
        FitMutada=evalPob(E, newPobMutada, MAX_fit);
        FitPobAnt = FitPob;
        [Pob,FitPob]=replacement(Pob,newPobMutada,FitPob,FitMutada, OP_REP);

        iter=iter+1;

        %%%resto de actualizacion variables y condiciones de parada
        if max(FitPobAnt) == max(FitPob)
            repeats = repeats+1;
        else
            repeats = 0;
        end
    end
end

function P = genPob(NSat, M, NPob)
    %Genera NPob vectores de longitud M, cada uno con una permutación
    %aleatoria de los índices de E.
    v = 1:NSat;
    for i=1:NPob
        P(i,:) = v(randperm(length(v), M));
    end
end

function F = evalPob(E, Pob, MAX_fit)
    %Niega el resultado de evalSatel, ya que el algoritmo maximiza.
    for i=1:size(Pob,1)
        F(i,:) = MAX_fit - evalSatel(E,Pob(i,:)); %Declarada en su propio archivo.
    end
end

function S = selection(FitPob, OP_SEL)
    T = size(FitPob,1);
    switch OP_SEL       
        case 1 %Roulette
            S = roulette(FitPob);
        case 2 %Tournament k=2
            S = tournament(FitPob, 2);
        case 3 %Tournament k=3
            S = tournament(FitPob, 3);
        otherwise %Selecciona cada elemento una vez
            S = 1:T;
    end
end

function S = tournament(FitPob, k)
    T = size(FitPob,1);    %Tamaño de poblacion
    for i=1:T
        [~, S(i,:)] = max(FitPob(randperm(T,k)));
    end
end

function S = roulette(FitPob)
    T = size(FitPob,1);
    prob = FitPob / sum(FitPob);
    cumprob = cumsum(prob);
    for i=1:T
        S(i,:) = find(cumprob > rand, 1);
    end
end

function P = crossover(Pob, Pcross, OP_CROSS)
    T = size(Pob,1);    %Tamaño de poblacion
    N = size(Pob,2);    %Nº de centroides
    for i=2:2:T
        pairs(i/2, :) = randperm(T,2);
        if rand<Pcross
            [P(i,:), P(i-1,:)] = crossop(Pob(pairs(i/2,1),:),Pob(pairs(i/2,2),:), Pob, OP_CROSS);
        else
            P(i-1,:) = Pob(pairs(i/2,1),:);
            P(i,:) = Pob(pairs(i/2,2),:);
        end
        
    end
end

function [s1, s2] = crossop(p1, p2, Pob, OP_CROSS)
    N = size(Pob,2);    %Nº de centroides
    switch OP_CROSS
        case 1  %%PMX
            rn = sort(randperm(N,2));
            s = PMX(p1, p2, rn(1), rn(2));
            s1 = s(1,:);
            s2 = s(2,:);
        otherwise
            s1 = p1; s2 = p2;
    end
end

function offs = PMX(p1,p2,f1,f2)
    p = [p1;p2];
    N=length(p);

    offs = zeros(2,N);
    %%Copy values between f1:f2
    offs(1,f1:f2)=p(2,f1:f2);
    offs(2,f1:f2)=p(1,f1:f2);
    
    ic = [p(1,f1:f2);p(2,f1:f2)];
    em=find(offs(1,:)==0); %% empty positions to fill up
    point1=1;
    while point1 <= 2
     point2=mod(point1,2)+1;
     for jj=em
        cand = p(point1,jj); %%candidate value
        %%conflicts checking
        while any(offs(point1,:) == cand)
            cand = ic(point1, ic(point2,:)==cand);
        end
        offs(point1,jj) = cand;
     end
     point1=point1+1;
    end
end

function P = mutate(Pob, NSat, Pmut, OP_MUT)
    T = size(Pob,1);
    for i=1:T
        if rand<Pmut
            P(i,:) = mutop(Pob(i,:), Pob, NSat, OP_MUT);
        else
            P(i,:) = Pob(i,:);
        end
    end
end

function m = mutop(e, Pob, NSat, OP_MUT)
    M = size(Pob,2);
    switch OP_MUT
        case 1 %Regeneración
            m = randperm(NSat,M);
        case 2 %Int Flip
            mutados = rand(1,M)<1/M; %Selecciona los alelos a mutar con probalidad 1/M
            %Comprobación para el improbable caso en el que se selecciona
            %un número de alelos a mutar mayor que el número de valores
            %disponibles.
            if(sum(mutados) > NSat-M)
                mutados = mutados(1:(NSat-M));
            end
            m = e;
            rango = 1:NSat;
            rango(e) = [];  %Elimina los valores del individuo del rango.
            m(mutados) = rango(randperm(length(rango),sum(mutados)));
            %Selecciona un valor individual del rango para cada alelo a
            %mutar.
            
        case 3 %Int Flip 50
            mutados = rand(1,M)<0.5; %Selecciona los alelos a mutar con probalidad 1/M
            %Comprobación para el improbable caso en el que se selecciona
            %un número de alelos a mutar mayor que el número de valores
            %disponibles.
            if(sum(mutados) > NSat-M)
                mutados = mutados(1:(NSat-M));
            end
            m = e;
            rango = 1:NSat;
            rango(e) = [];  %Elimina los valores del individuo del rango.
            m(mutados) = rango(randperm(length(rango),sum(mutados)));
            %Selecciona un valor individual del rango para cada alelo a
            %mutar.
        otherwise
            m = e;
    end
end

function [P, F] = replacement(P1, P2, F1, F2, OP_REP)
    T = size(P1, 1);
    switch OP_REP
        case 1 %Elitismo total
            %Selecciona los NPob mejores individuos.
            PT = [P1 ; P2]; 
            FT = [F1 ; F2];
            [~, order] = sort(FT,'descend');
            PT = PT(order,:); FT = FT(order);
            P = PT(1:T,:); 
            F = FT(1:T);       
        case 2 %Elitismo único 
            %Incluye el mejor individuo de P1 si es mejor que el mejor
            %individuo de P2.
            [~,best] = max(F1);
            [~, order] = sort(F2,'descend');
            if max(F1) > max(F2)
                P2O = P2(order,:); F2O = F2(order);
                P(1,:) = P1(best,:);      F(1,:) = F1(best);
                P(2:T,:) = P2O(1:T-1,:);  F(2:T,:) = F2O(1:T-1);
            else
                P = P2; F = F2;
            end
        case 3 %Individualismo
            %Selecciona los individuos ordenados de mejor a peor, pero nunca
            %selecciona un individuo por enésima vez mientras que quede 
            %alguno que solo se haya seleccionado n-1 veces.
            PT = [P1 ; P2]; 
            FT = [F1 ; F2];
            %Ordena los individuos de ambas poblaciones de mejor a peor.
            [~, order] = sort(FT,'descend');
            PT = PT(order,:); FT = FT(order);
            P = zeros(1,size(P1,2));
            F = zeros(T,1);
            while size(P,1)<T
                current = size(P,1);
                %Considera iguales a individuos con los mismos elementos en
                %distinto orden
                [~,unicos] = unique(sort(PT, 2),'rows');
                %Guarda los individuos únicos de PT y su FT en PU y FU.
                PU = PT(unicos,:);
                FU = FT(unicos);
                %Guarda los individuos de PU y FU que quepan en P y F.
                P(current:T,:) = PU(1:T,:); 
                F(current:T) = FU(1:T);
                %Elimina los individuos seleccionados de PT y FT.
                PT = PT(~unicos,:);
                FT = FT(~unicos);
            end
        otherwise %Reemplazo generacional por defecto
            P = P2; F = F2;
    end
end

