%Variables:
%k: Nodo al que asignar un color
%x: Vector de nodos solución
%G: Matriz de adyacencia
%m: Número de colores
%n: Número de nodos
%c: Color que se va a asignar
%s: Booleano que indica si se ha encontrado la solución

function [x, s] = graphColour2(k, x, G, m, n)
    c = 1;
    s = 0;
    while (c <= m && s == 0)
        %Mientras queden colores y no se haya llegado a la solución
        if isSafe(k, c, x, G)
           x(k) = c;
           if k+1 <= n
               [x, s] = graphColour2(k+1, x, G, m, n);
               %No se aumenta el valor de k dentro de esta llamada, porque 
               %esta llamada sólo le asignará colores al nodo k, dejando
               %k+1 para las llamadas hijas. El retorno de s indicará si se
               %ha llegado a una solución final.
           else
               s = 1;
               %Si esta asignación ha sido la última y es válida, significa
               %que se ha encontrado una solución, luego devolverá s = 1
           end
        end
        c = c + 1;
        %Esta llamada probará con otro color si el anterior no ha llevado a
        %ninguna solución.
    end
    if(s == 0)
        x(k) = 0;
        %Si después de hacer el bucle no se ha encontrado solución,
        %significa que una llamada padre debe probar otro color en k-1, así
        %que ésta llamada debe limpiar el valor de k para devolver un
        %vector limpio (que sea de la forma [1 0 0 0] y no [1 2 3 0] si el
        %padre se ocupa de k = 1, por ejemplo)
    end
end

%Función isSafe es correcta.
function b = isSafe(k, c, x, G)
    indices = find(G(k,:));
    b = all(c ~= x(indices));
end