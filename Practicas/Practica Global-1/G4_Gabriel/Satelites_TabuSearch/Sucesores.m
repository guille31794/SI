function [dEuclideaTotal, clase] = Sucesores(current,coords)
    %Autor: Fernando Medina Delgado (2018)
    for j=1:length(current)
      d(j,:) = d_euclid(coords,current(:,j)); %Distancias euclideas de los representantes respecto de todos los satelites
    end
    [~,clase]=min(d);                         %Se recoge las minimas distancias euclideas de cada satelite representante (Sucesores)
    dEuclideaTotal = sum(min(d));             %Se suma todas las minimas distancias euclideas
end