function [s, c, iter] = tabuSatelites(E, N, M, tenure, max_best_counter)
%max_best_counter es el máximo número de iteraciones seguidas sin mejorar.
    current = randperm(N,M);
    best = current;
    taboo_list = zeros(N,1);
    
    taboo_list(current) = tenure;
    iter = 1;
    best_counter = 0; %numero de iteraciones seguidas sin mejorar
    maxiter = 1000; %límite de iteraciones
    %evalSatel declarada en su propio archivo-
    while evalSatel(E, best)~=0 && iter < maxiter && best_counter < max_best_counter
        %[S, s_ind, val] = succesors(E, current);
        [S, s_ind, val] = partialSuccesors(E, current,mod(iter,M)+1);
        %guarda el orden de menor a mayor de los sucesores en s_order
        [~,s_order] = sort(val);
        S = S(s_order,:);
        s_ind = s_ind(s_order);
        s_count = 1;
        found = false;
        while ~found && s_count <= length(S)
            new = S(s_count, :);
            if evalSatel(E, new) < evalSatel(E, best)
                current = new;
                best = current;
                %El valor del elemento que se intercambió para crear 
                %S(s_count) se usa como índice en la tabla tabú.
                taboo_list(s_ind(s_count)) = tenure;
                best_counter = 0;
                found = true;                
            else
                %Para simplificar el uso de la lista tabú, los valores
                %menores que 0 también se tratan como ceros.
                if taboo_list(s_ind(s_count)) <= 0
                    current = new;
                    taboo_list(s_ind(s_count)) = tenure;
                    found = true;
                    best_counter = best_counter + 1;
                else
                    s_count = s_count+1;
                end %if
            end %if
        end %while
        taboo_list = taboo_list - 1;
        iter = iter + 1;
    end %while
    s = best;
    c = evalSatel(E, s);
end



function [S, s_ind, val] = succesors(E, X)
    % S: Lista de sucesores
    % s_ind: Guarda el elemento que se ha cambiado, para luego acceder a la
    %        tabla tabú.
    % val: Lista de valores de la función de evaluación para sucesores
    NSat = size(E,1);
    M = length(X);
    S = zeros(M*(NSat-M), length(X));
    s_ind = zeros(M*(NSat-M),1);
    val = zeros(M*(NSat-M),1);
    for i=1:length(X)
        rango = 1:NSat;
        rango(X) = [];
        for j=1:length(rango)
            s = X;
            dim = [NSat-M, M];
            s(i) = rango(j);
            S(sub2ind(dim,j,i),:) = s;
            s_ind(sub2ind(dim,j,i)) = X(i);
            val(sub2ind(dim,j,i)) = evalSatel(E, s);
        end
    end
end


function [S, s_ind, val] = partialSuccesors(E, X, index)
    % S: Lista de sucesores
    % s_ind: Guarda el elemento que se ha cambiado, para luego acceder a la
    %        tabla tabú.
    % val: Lista de valores de la función de evaluación para sucesores
    NSat = length(E);
    M = length(X);
    S = zeros((NSat-M), length(X));
    s_ind = zeros((NSat-M),1);
    val = zeros((NSat-M),1);
    rango = 1:NSat; %Crea un rango con todos los elementos posibles.
    rango(X) = []; %Elimina los elementos de X del rango.
    for j=1:length(rango)
        s = X;
        s(index) = rango(j);
        S(j,:) = s;
        s_ind(j) = X(index); %Guarda el elemento intercambiado en s_ind.
        val(j) = evalSatel(E, s);
    end
end
