function total = sigVelocidades(Vi, SpBest, SgBest, Pob, w, cp, cg)

    for i = 1:size(Pob,1)
        % w*Vi
        wVi = Calc_Prod(Vi{i}, w);
        
        % vel1 = SpBest - Si, y vel2 = SgBest - Si
        vel1 = Calc_Dif(SpBest(i,:), Pob(i,:));
        vel2 = Calc_Dif(SgBest, Pob(i,:));
       
        % velP = cp * rp * vel1, y velG = cg * rg * vel2
        velP = Calc_Prod(vel1, cp*rand);                   
        velG = Calc_Prod(vel2, cg*rand);    
        
        % sumaTot = wVi + velP + velG
        sumAux = Calc_Sum(velP, velG);
        total{i} = Calc_Sum(wVi, sumAux);
    end

end

function wVi = Calc_Prod(Vi, w)
    % Tomamos size(V,1) aleatorios
    rands = rand(1,size(Vi,1));
    % Buscamos los inds. de los rands que sean menores que w 
    inds = find(rands < w);
    % Metemos en wVi las velocidades de esos inds.
    wVi = Vi(inds,:);
end

function sum = Calc_Sum(V1, V2)
    
    sum = [];
    % Comprobamos qué velocidad tiene mayor y cual tiene menor tam
    if size(V1,1) <= size(V2, 1)
        mayor = V2; menor = V1;
    else
        mayor = V1; menor = V2;
    end
    
    % Vamos guardando en sum las velocidades de mayor y menor,
    % aplicando transitividad
    for i=1:size(menor,1)
        subm = [mayor(i,:); menor(i,:)];
        if all(all(subm == subm'))
            sum(i,:) = [subm(1,1) subm(2,2)];
        else
            sum(i,:) = mayor(i,:);
        end
        
    end
    
    % Metemos lo que falte en sum 
    sum = [sum; mayor(size(menor,1)+1:end,:)];

end




function dif = Calc_Dif(Sk, Sj)

    n = length(Sj);

    indk = find(Sk == 1); indj = find(Sj == 1);
    % Intercambia los unos de Sk por sus indices y los unos de Sj por los
    % índices de Sk para que los dos vectores tengan los mismos números
    for i = 1:length(indk)  
        Sk(:,indk(i)) = indk(i);
        Sj(:,indj(i)) = indk(i);
    end
    
    % Intercambia la pos. i con la pos. en la que del valor de Sj(i) en Sk
    x = 1;
    dif = [];
    while ~isequal(Sk,Sj)
        if Sk(n) ~= Sj(n) && Sk(n) ~= 0
            pos = find(Sj == Sk(n));
            Sj([pos n]) = Sj([n pos]); 
            dif(x,:) = sort([n pos]);
            x = x+1;
        end
        n = n - 1;
    end

end
