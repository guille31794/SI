function fitness = evaluatePob(coords,pob,Npob,M,N)
  for k=1:Npob,
    minDist(1:N) = inf;
    for m=1:M,
      dist = sqrt(sum((coords - coords(pob(k,m),:)).^2'));
      pos = find(dist < minDist);
      minDist(pos) = dist(pos);
    end %for
    fitness(k) = sum(minDist);
  end %for
end %evaluatePob

%% This optimizes GLOBAL distances
%function fitness = evaluatePob(coords,pob,Npob,M,N)
  %fitness = zeros(1,Npob);
  %for k=1:Npob,
    %for m=1:M,
      %fitness(k) = fitness(k) + sum(sqrt(sum((coords - coords(pob(k,m),:)).^2))');
    %end %for
  %end %for
%end %evaluatePob

