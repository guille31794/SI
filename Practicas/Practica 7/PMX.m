function offs = PMX(p,f1,f2)
% p = [1 2 3 4 5 6 7 8 9;
%     4 5 2 1 8 7 6 9 3];
% f1=4; f2=7;
N=length(p);

offs = zeros(2,N);
% Copiar valores entre f1:f2 a hijos
offs(1,f1:f2) = p(2,f1:f2);
offs(2,f1:f2) = p(1,f1:f2);

ic = [p(1,f1:f2); p(2,f1:f2)];
em = find(offs(1,:) == 0); % Posiciones vacias a rellenar
p1 = 1;
while p1 <= 2
    p2 = mod(p1,2) + 1;
    for j = em
        cand = p(p1,j); % Valor del candidato
        % Comprobar conflictos
        while any(ic(p2,:) == cand) % Mientras exista un valor conflictivo
            cand = ic(p1,(ic(p2,:) == cand)); % Buscamos el valor conflictivo de ese candidato y lo establecemos como candidato
        end
        offs(p1,j) = cand; % Asignamos a la posicion vacia del hijo evaluada el valor candidato
    end
    p1 = p1 + 1;
end
end

