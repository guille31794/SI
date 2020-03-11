function selected = selectRoulette(fitness,Nselect)
  chance = fitness / sum(fitness);
  acum = cumsum(chance);
  for k=1:Nselect,
    best = find(acum >= rand());
    selected(k) = best(1);
  end %for
end %selectRuleta