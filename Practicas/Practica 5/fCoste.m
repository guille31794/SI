function [e]=fCoste(x)

%%% problema de planificacion de tareas
%%% matriz donde cada fila representa un trabajador y cada columna el
%%% tiempo que tarda en realizar la tarea
A=[             12          43           15            7
                9           10            6            4
                5           13           29            2
                4           11           17            9 ];

e=sum(diag(A(1:4,x)));
end