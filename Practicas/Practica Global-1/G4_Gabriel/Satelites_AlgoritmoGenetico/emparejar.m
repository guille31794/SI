function [parejas,Nparejas] = emparejar(padres,Pcross,NparejasMax)
  
  pos = 2;
  Npadres = length(padres);
  Nparejas = 1;
  
  % At least 1 pair is always generated
  pareja1 = padres(randi(Npadres));
  pareja2 = padres(randi(Npadres));
  while pareja2 == pareja1,
    pareja2 = padres(randi(Npadres));
  end %while
  parejas(1,:) = [pareja1 pareja2];
  
  % Up to a certain ampount will be paired, based on chance
  for k=2:NparejasMax,
    if rand() < Pcross,
      pareja1 = padres(randi(Npadres));
      pareja2 = padres(randi(Npadres));
      while pareja2 == pareja1,
        pareja2 = padres(randi(Npadres));
      end %while
      parejas(pos,:) = [pareja1 pareja2];
      pos = pos + 1;
      Nparejas = Nparejas + 1;
    end %if
  end %for
end %emparejar