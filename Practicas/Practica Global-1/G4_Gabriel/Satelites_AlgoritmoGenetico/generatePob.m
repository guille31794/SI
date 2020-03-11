function pob = generatePob(N,M,Npob)
  for k=1:Npob,
    pob(k,:) = randperm(N,M);
  end %for
end %generatePob