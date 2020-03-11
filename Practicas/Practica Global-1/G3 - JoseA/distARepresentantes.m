function repDist = distARepresentantes(rep,dist,N)

repDist = zeros(N, 2);

for i=1:N
        [val,pos] = min(dist(i,rep));
        repDist(i,1) = rep(pos);
        repDist(i,2) = val;
end