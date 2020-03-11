function pob = mutate(pob,Npob,N,M,mutChance)
  for k=1:Npob,
    if rand() < mutChance,
      s = randi(M);
      % find all sats that aren't selected, then choose one at random
      v = [1:N];
      cand = v(~ismember(v,pob(k,:)));
      pob(k,s) = cand(randi(length(cand)));
    end %if
  end %for
end %mutate