%Genera un número round(M/4)*M de sucesores a partir de current siguiendo 
%siguiente patrón: El primer representante se intercambia con los primeros round(M/4)
%no representantes, el segundo representate se intercambia con los
%siguientes round(M/4) no representates y asi hasta que se llega al
%último no representado y se vuelve a comenzar por el primero. Con esto logramos
%buena diversificación en los sucesores y eficiencia ya que no tenemos que
%generar los M*(N-M) sucesores(todos) de un estado.
function suc = sucesores(current,distancias,N,M)
    suc = zeros(M*round(M/4), 3);

    unos = find(current == 1); 
    ceros = find(current == 0);
    ind = 1;
    j=-1;
    
    for i = 1:M
        cont = 1;
        while(cont <= round(M/4))
           copia = current;
           pos = mod(i+j, N-M)+1;
           copia([unos(i) ceros(pos)]) = copia([ceros(pos) unos(i)]);
           dAux = distARepresentantes(find(copia), distancias, N); 
           
           suc(ind, 1) = unos(i);
           suc(ind, 2) = ceros(pos);
           suc(ind, 3) = evalua(dAux(:,2));
           ind = ind+1;
           cont = cont+1;
           j = j+1;
        end
    end
    suc = sortrows(suc, 3);
% end