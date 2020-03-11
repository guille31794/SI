classdef satelites
    properties
        numSatelites; % Numero de satelites del problema
        numRepresentantes; % Numero de representantes del problema
        espacio; % Espacio de coordenadas del problema
        distancias; % Distancias entre satelites
        coordenadas; % Coordenadas de los satelites
    end
    
    methods
        function obj = satelites(numSatelites, espacio, numRepresentantes, coord)
            obj.numSatelites = numSatelites;
            obj.numRepresentantes = numRepresentantes;
            obj.espacio = espacio;
            if nargin < 3
                assert(false, 'Los argumentos de entrada no son suficientes.');
            elseif nargin == 3
                rand('seed', 5);
                obj.coordenadas = obj.inicializar_coordenadas();
            else
                assert(all(size(coord) == [2 numSatelites]), 'La matriz coord debe ser de dimension 2 x numSatelites.');
                assert(isempty(find(coord > espacio, 1)), 'Los valores almacenados en coord no estan comprendido en el espacio especificado.');
                obj.coordenadas = coord;
            end
            obj.distancias = obj.inicializar_distancias();
        end
        
        %% Tabu
        function [Solucion, Evaluacion, Iteraciones] = Tabu(obj)
            estado_actual = randi(obj.numSatelites, 1, obj.numRepresentantes);
            Solucion = estado_actual;
            Evaluacion = obj.Evaluar_Satelites(estado_actual);
            lista_tabu = zeros(1, obj.numSatelites);
            Iteraciones_max = obj.numSatelites*10;
            Iter_Sol_max = obj.numSatelites;
            Tenure = obj.numSatelites*0.5;
            Iteraciones = 0;
            iter_sol = 0;
            while Iteraciones < Iteraciones_max && iter_sol < Iter_Sol_max
                Iteraciones = Iteraciones + 1;
                iter_sol = iter_sol + 1;
                sucesores = obj.Sucesores(estado_actual);
                while ~isempty(sucesores)
                    estado_nuevo = sucesores(1,:);
                    if estado_nuevo(1,end) < Evaluacion
                        estado_actual = estado_nuevo(1,1:obj.numRepresentantes);
                        Solucion = estado_actual;
                        Evaluacion = estado_nuevo(1,end);
                        lista_tabu(estado_nuevo(1,end-1)) = Tenure;
                        sucesores = [];
                        iter_sol = 0;
                    elseif lista_tabu(estado_nuevo(1,end-1)) == 0
                        estado_actual = estado_nuevo(1,1:obj.numRepresentantes);
                        lista_tabu(estado_nuevo(1,end-1)) = Tenure;
                        sucesores = [];
                    else
                        sucesores(1,:) = [];
                    end
                end
                tem = find(lista_tabu);
                lista_tabu(tem) = lista_tabu(tem) - 1;
            end
        end
        
        %% Algoritmo Genetico
        function [R,V, iter] = AGestaciones(obj)
            Pcross=0.9;
            Pmut=0.2;
            T=round(1.75*obj.numRepresentantes);
            iter=1;
            sinCambios=1;
            MAX_ITER=500;
            
            RActual = obj.pobInicial(T);
            FitR = obj.evaluaPoblacion(RActual);
            FitAnt = FitR;
            while(sinCambios<=50 && iter<=MAX_ITER)
                Padres = obj.SeleccionarPadres(FitR);
                Parejas = obj.Emparejar(Padres);
                RNuevo = obj.Cruce(Parejas,RActual,Pcross);
                RNuevoMut = obj.Muta(RNuevo,Pmut);
                FitRNuevo = obj.evaluaPoblacion(RNuevoMut);
                [RActual,FitR] = obj.ReemplazoR(RActual,RNuevoMut,FitR,FitRNuevo);
                iter=iter+1;
                if(all(FitAnt==FitR))
                    sinCambios=sinCambios+1;
                else
                    sinCambios=1;
                end
                FitAnt=FitR;
            end
            R=RActual(find(FitR==min(FitR),1),:);
            V=min(FitR);
        end
    end
    
    methods (Access = 'private')
        %% Inicialiacion
        function coord = inicializar_coordenadas(obj)
            coord = zeros(2, obj.numSatelites);
%            assert(obj.espacio*obj.espacio >= obj.numSatelites, 'El espacio no puede contener ese numero de satelites');
            sat = 1;
            while sat <= obj.numSatelites
                cT = randi(obj.espacio, 2, 1);
                if ~any(ismember(coord', cT', 'rows'))
                    coord(:, sat) = cT;
                    sat = sat + 1;
                end
            end
        end
        
        function dists = inicializar_distancias(obj)
            dists = zeros(obj.numSatelites);
            coord = obj.coordenadas;
            for i = 1:obj.numSatelites
                if size(coord,1)~=size(coord(:,i),1)
                    error('Parametros incorrectos');
                end
                aux=coord-coord(:,i)*ones(1,size(coord,2));
                if size(aux,1)==1
                    aux=aux';
                end
                dists(i,:)=sqrt(sum(aux.*aux));
            end
        end
        
        %% Funciones globales
        function Evaluacion = Evaluar_Satelites(obj, Representantes)
            Evaluacion = sum(min(obj.distancias(Representantes,:)));
        end
        
        %% Funciones Tabu
        function sucesores = Sucesores(obj, estado)
            intervalo = 1:obj.numSatelites;
            intervalo(estado) = [];
            sucesores = zeros(obj.numSatelites-obj.numRepresentantes, obj.numRepresentantes + 3);
            ind = 1;
            for i = intervalo
                [~, rep] = min(obj.distancias(estado,i));
                sucesores(ind,1:obj.numRepresentantes) = estado;
                sucesores(ind,rep) = i;
                sucesores(ind,obj.numRepresentantes+1) = rep;
                sucesores(ind,obj.numRepresentantes+2) = i;
                sucesores(ind,obj.numRepresentantes+3) = Evaluar_Satelites(obj,  sucesores(ind,1:obj.numRepresentantes));
                ind = ind +1;
            end
            sucesores = sortrows(sucesores, size(sucesores,2));
        end
        
        %% Funciones Genetico
        function R = pobInicial(obj,T)
            R = zeros(T, obj.numRepresentantes);
            for i = 1:T
                R(i,:) = randperm(obj.numSatelites, obj.numRepresentantes);
            end
        end
        
        function F = evaluaPoblacion(obj, R)
            F = zeros(1, size(R, 1));
            for i = 1:size(R, 1)
                F(i) = obj.Evaluar_Satelites(R(i,:));
            end
        end
        
        function I = SeleccionarPadres(~, FitPob)
            k = 3;
            I = zeros(1, length(FitPob));
            for i = 1:length(FitPob)
                s = zeros(1, k);
                for j = 1:k
                    s(j) = randi(length(FitPob));
                end
                a = FitPob(s);
                [~, y] = min(a);
                I(i) = s(y);
            end
        end
        
        function parejas = Emparejar(~, Padres)
            p = unique(Padres);
            parejas = nchoosek(p,2);
        end
        
        function newPob = Cruce(obj, parejas, Pob, Pcross)
            newPob=[];
            for i=1:size(parejas,1)
                if(1-Pcross>rand)
                    newPob=[newPob;Pob(parejas(i,1),:);Pob(parejas(i,2),:)];
                else
                    p=[Pob(parejas(i,1),:);Pob(parejas(i,2),:)];
                    newPob=[newPob; obj.OX(p)];
                end
            end
        end
        
        function offs = OX(~, p)
            f1=round(length(p)/4);
            f2=round(length(p)/4+length(p)/2);
            N=length(p);
            offs = zeros(2,N);
            offs(1,f1:f2)=p(1,f1:f2);
            offs(2,f1:f2)=p(2,f1:f2);
            p1=1;
            while(p1<=2)
                p2=mod(p1,2)+1;
                j=f2+1;
                k=f2+1;
                while(j~=f1)
                    cand=(p(p2,k)==offs(p1,:));
                    if(~any(cand))
                        offs(p1,j)=p(p2,k);
                        j=mod(j,N)+1;
                    end
                    k=mod(k,N)+1;
                end
                p1=p1+1;
            end
        end
        
        function newPob=Muta(obj, newPob, Pmut)
            f1=round(size(newPob,2)/4);
            f2=round(size(newPob,2)/2+f1);
            for i=1:size(newPob,1)
                if(Pmut>rand)
                    a=mod(newPob(i,f1)+randi(obj.numSatelites), obj.numSatelites)+1;
                    if(isempty(find(a==newPob(i,:), 1)))
                        newPob(i,f1)=a;
                    end
                    b=mod(newPob(i,f2)+randi(obj.numSatelites),obj.numSatelites)+1;
                    if(isempty(find(b==newPob(i,:), 1)))
                        newPob(i,f2)=b;
                    end
                end
            end
        end
        
        function [RES,D] = ReemplazoR(~, Pob, newPobMutada, FitPob, FitPobMutada)
            P=[Pob;newPobMutada];
            F=[FitPob FitPobMutada];
            R=[P F'];
            R=unique(R,'rows');
            R=sortrows(R,size(R,2));
            RES=R(1:length(FitPob),1:size(Pob,2));
            D=R(1:length(FitPob),size(R,2))';
        end
    end
end