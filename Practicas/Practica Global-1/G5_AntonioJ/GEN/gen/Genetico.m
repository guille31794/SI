%%DATOS INICIALES DEL PROBLEMA

%Para representar los sat�lites usamos una matriz de 2xN, siendo N el
%n�mero de sat�lites. De manera que en cada columna est�n la coordenada x e
%y de la posici�n en el espacio del sat�lite i-�simo.
Height = 500;
Width = 500;
Nsatelites = 500;
Nrepresentantes = 40;
Nindividuos = 50;
[Satelites] = GeneraDatosIniciales(Nsatelites,Nrepresentantes,Height,Width);
minimos = [];
%%Fin de generaci�n de datos iniciales
j=1;NoMejora=1;mejor=Inf;
tic;
while j<1000 && NoMejora<4
    %Representaci�n de un individuo: Vector de 1xNsatelites en el que se
    %guarda el indice del representante de cada sat�lite
    %Representaci�n de una poblaci�n: Matriz en la que cada fila es un
    %individuo
    %Primera generacion
    Pob = [];
    for i=1:Nindividuos
        Pob = [Pob; randperm(Nsatelites,Nrepresentantes)];
    end
    %fin Primera generaci�n

    %FitPob 
    FitPob=[];
    for i=1:Nindividuos
        FitPob = [FitPob; FitIndiv(Satelites,Pob(i,:))];
    end
    
    %Seleccionar Padres
    padres = seleccion(Nindividuos,5,FitPob);
    %Emparejar
    parejas = emparejar(padres,Nindividuos);
    %Cruzar
    NuevaGeneracion=[];
    for i=1:(Nindividuos/2)
        f1 = randi(Nrepresentantes);
        f2 = randi(Nrepresentantes);
        while f1==f2 && f1
            f1 = randi(Nrepresentantes);
        end
        NuevaGeneracion = [ NuevaGeneracion; pmx(Pob(parejas(i,:),:),f1,f2)];
    end
    %NuevaGeneracion

    %Mutar
    for i=1:size(NuevaGeneracion,1)
        if(rand() > 0.635)
            genMutando = randi(Nrepresentantes);
            NuevoGen = randi(Nsatelites);
            NuevaGeneracion(i,genMutando) = NuevoGen;
        end
    end
    %Reemplazo
    Pob = reemplazo(Pob,NuevaGeneracion,Satelites);
    
    j=j+1;
    PobBest = min(FitPob);
    if mejor > PobBest
        mejor = PobBest;
        NoMejora = 0;
    else
        NoMejora = NoMejora + 1;
    end
end
timeMedio= toc
