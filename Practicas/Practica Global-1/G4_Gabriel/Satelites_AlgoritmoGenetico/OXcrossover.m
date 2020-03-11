function offs = OXcrossover(parejas,Nparejas,pob,N,f1,f2)
 
 k = 1;
 
 for pareja=1:Nparejas,
 
  p1 = pob(parejas(pareja,1),:);
  p2 = pob(parejas(pareja,2),:);
  h1 = zeros(1,N);
  h2 = zeros(1,N);
  
  h1(f1:f2) = p1(f1:f2);
  h2(f1:f2) = p2(f1:f2);
  
  % Primero los de la derecha, luego izquierda
  posVacias = find(h1 == 0);
  posVacias = [posVacias(posVacias > f2) posVacias(posVacias < f1)];
  candidatos1 = [p2(f2+1:N) p2(1:f2)];
  candidatos2 = [p1(f2+1:N) p1(1:f2)];
  pos = 1;
  posCand = 1;
  
  while any(h1 == 0),
    if ~any(h1(f1:f2) == candidatos1(posCand)),
      h1(posVacias(pos)) = candidatos1(posCand);
      pos = pos + 1;
    end %if
    posCand = posCand + 1;
  end %for
  
  pos = 1;
  posCand = 1;
  
  while any(h2 == 0),
    if ~any(h2(f1:f2) == candidatos2(posCand)),
      h2(posVacias(pos)) = candidatos2(posCand);
      pos = pos + 1;
    end %if
    posCand = posCand + 1;
  end %for
  
  offs(k,:) = h1;
  offs(k+1,:) = h2;
  
  k = k + 2;
 end %for
end %OXcrossover