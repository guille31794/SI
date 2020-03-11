function w = WeightBag(p)
% Weight of i-esimum object 
objectWeight = [3 10 12 2 4 9 5 8 12 18 1 11];
ind= find(p);
w = sum(objectWeight(ind));  %#ok<FNDSB>
end