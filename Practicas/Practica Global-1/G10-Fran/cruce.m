%%
%   CRUCE   -   Realiza el emparejamiento y cruce de los padres
%
%       newPob = cruce(Pob, Padres, Pcross)
%
%               Pob = población(cellarray)
%               Padres = índice de los padres en formato columna
%               Pcross = probabilidad de cruce
%               newPob = nueva población obtenida(cellarray)
%
function newPob = cruce(Pob, Padres, Pcross)
N = size(Padres, 1);    %Nº de padres
newPob = {};
k = 1;
for i = 1:N-1,
    for j = i+1:N,
        %Evitamos emparejar un padre consigo mismo
        if(Padres(i) ~= Padres(j)),
            P1 = Pob{Padres(i)};
            P2 = Pob{Padres(j)};
            %Si estamos dentro de la probabilidad cruzamos ambos padres
            if(rand() <= Pcross),
                newPob(k:k+1) = cruceSimple(P1, P2);
                k=k+2;
            else    %Si no los padres pasan a formar parte de la nueva poblacion
                newPob(k:k+1) = {P1; P2};
                k=k+2;
            end
        end
    end %fin for
end %fin for