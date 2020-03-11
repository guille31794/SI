function [x] = localSearch(x)
lvl = 1;
% initialization
currentCost = EvalNq(x);
% calculate the minimum cost posible in length(x) iterations
while lvl <= length(x) && currentCost ~= 0 
    % aux vector to undone the process if there's no new minimum during
    % iteration
    xi = x;
    [neighbor, x] = minS(x,lvl);
    if neighbor < currentCost
        currentCost = neighbor;
    else
        x = xi;
    end
    lvl = lvl+1;
end
x = [x currentCost lvl-1];
end