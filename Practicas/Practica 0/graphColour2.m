%Variables:
%k: Nodo al que asignar un color
%x: Vector de nodos soluci�n
%G: Matriz de adyacencia
%m: N�mero de colores
%n: N�mero de nodos
%c: Color que se va a asignar
%s: Booleano que indica si se ha encontrado la soluci�n

function [x, s] = graphColour2(k, x, G, m, n)
    c = 1;
    s = 0;
    while (c <= m && s == 0)
        %Mientras queden colores y no se haya llegado a la soluci�n
        if isSafe(k, c, x, G)
           x(k) = c;
           if k+1 <= n
               [x, s] = graphColour2(k+1, x, G, m, n);
               %No se aumenta el valor de k dentro de esta llamada, porque 
               %esta llamada s�lo le asignar� colores al nodo k, dejando
               %k+1 para las llamadas hijas. El retorno de s indicar� si se
               %ha llegado a una soluci�n final.
           else
               s = 1;
               %Si esta asignaci�n ha sido la �ltima y es v�lida, significa
               %que se ha encontrado una soluci�n, luego devolver� s = 1
           end
        end
        c = c + 1;
        %Esta llamada probar� con otro color si el anterior no ha llevado a
        %ninguna soluci�n.
    end
    if(s == 0)
        x(k) = 0;
        %Si despu�s de hacer el bucle no se ha encontrado soluci�n,
        %significa que una llamada padre debe probar otro color en k-1, as�
        %que �sta llamada debe limpiar el valor de k para devolver un
        %vector limpio (que sea de la forma [1 0 0 0] y no [1 2 3 0] si el
        %padre se ocupa de k = 1, por ejemplo)
    end
end

%Funci�n isSafe es correcta.
function b = isSafe(k, c, x, G)
    indices = find(G(k,:));
    b = all(c ~= x(indices));
end