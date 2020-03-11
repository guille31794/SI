function dEuclideaTotal = fEval(new,coords)
    %Autor: Fernando Medina Delgado (2018)
    for j=1:length(new)
      d(j,:) = d_euclid(coords,new(:,j)); %Distancias euclideas de los representantes respecto de todos los satelites
    end
    dEuclideaTotal = sum(min(d));         %Se suma todas las minimas distancias euclideas
end