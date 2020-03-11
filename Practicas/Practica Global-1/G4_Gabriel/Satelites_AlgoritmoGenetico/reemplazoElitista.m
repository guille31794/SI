function nuevaPob = reemplazoElitista(pob,hijos,fitnessPob,fitnessHijos,NPob)
  
  pobCombinada = [pob;hijos];
  fitnessCombinada = [fitnessPob fitnessHijos];
  
  for k=1:NPob,
    [val,ind] = min(fitnessCombinada);
    nuevaPob(k,:) = pobCombinada(ind,:);
    fitnessCombinada(ind) = inf;
  end %for
end %reemplazoElitista