function [x,current] = localSearch(x)
lvl = 1;
% initialization
current = fCoste(x);
% calculate the minimum cost posible in 5 five iterations
while lvl <= length(x) && current ~= 0
    % aux vector to undone the process if there's no new minimum during
    % iteration
    xi = x;
    [neighbor, x] = minS(x,lvl);
    if neighbor(1, length(neighbor)) < current
        current = neighbor;
    else
        x = xi;
    end
    lvl = lvl+1;
end
end