function [pob,fitness,iter]  = SatGA(N,M,coords,Npob,mutChance,crossChance,maxIter,maxIterChange,draw)
  
  iter = 0;
  iterChange = 0;
  pob = generatePob(N,M,Npob);
  fitness = evaluatePob(coords,pob,Npob,M,N);
  [lastBest,pos] = min(fitness);
  maxNpairs = round(Npob/2);
  f1 = round(M/3);
  f2 = M - round(M/3);
  
  if draw,
    hold on;
    h1 = plot(coords(:,1),coords(:,2),'r.');
    h2 = plot(coords(pob(pos,:),1),coords(pob(pos,:),2),'b*');
    legend('Sats','Selected');
    hold off;
    waitforbuttonpress;
  end %if
  
  while iterChange < maxIterChange && iter < maxIter,
    
    selected = selectRoulette(fitness,Npob);
    [pairs,Npairs] = emparejar(selected,crossChance,maxNpairs);
    
    offspring = OXcrossover(pairs,Npairs,pob,M,f1,f2);
    Noffspring = Npairs * 2;
    offspring = mutate(offspring,Noffspring,N,M,mutChance);
    offsFitness = evaluatePob(coords,offspring,Noffspring,M,N);
    
    pob = reemplazoElitista(pob,offspring,fitness,offsFitness,Npob);
    fitness = evaluatePob(coords,pob,Npob,M,N);
    
    [newBest,pos] = min(fitness);
    if lastBest ~= newBest,
      lastBest = newBest;
      iterChange = 0;
    else
      iterChange = iterChange + 1;
    end %if-else
    
    if draw,
      delete(h1);
      delete(h2);
      hold on;
      h1 = plot(coords(:,1),coords(:,2),'r.');
      h2 = plot(coords(pob(pos,:),1),coords(pob(pos,:),2),'b*');
      hold off;
      waitforbuttonpress;
    end %if
    
    iter = iter + 1;
  end %while
end %SatGA