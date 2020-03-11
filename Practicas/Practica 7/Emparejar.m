function couples = Emparejar(Parents)
% Pre-alocation for speed
l = length(Parents);
if mod(l,2) == 1
    l = l+1;
end
couples = zeros(length(Parents)/2, 2);
n = 1;
while l > 1 % /2 maybe?
    crossIndex = randi(l);
    couples(n,1) = Parents(crossIndex);
    l = l-1;
    Parents(crossIndex) = [];
    crossIndex = randi(l);
    couples(n,2) = Parents(crossIndex);
    l = l-1;
    Parents(crossIndex) = [];
    n = n+1;
end
end