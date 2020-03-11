function newPob = cross(couples, pob)
% compute crossover points
crossP1 = randi((length(pob)/2));
crossP2 = randi(length(pob));
pCross = 0.5;
while crossP1 >= crossP2 
   crossP1 = randi((length(pob)/2));
   crossP2 = randi(length(pob)); 
end

for n=1:couples(pob)
    rand
    if rand > pCross
        p(1,:) = pob(couples(n,1),:);
        p(2,:) = pob(couples(n,2),:);
        offs = OXcrossover(p ,crossP1, crossP2);
        newPob = [newPob; offs];
    else
        newPob = [newPob; p];
    end
end
end
