% Taboo search for N-Queens
% tl - taboo list, maxIT - max number of iteration, currIt - current
% iteration, tenure - time is assigned to taboo list, tc - taboo counter

function [best] = TabooQ(initX)
ten = initX-1;
currIt = 1;
current = [randperm(initX) 0 0 0];
current(end-2) = EvalNq(current(1:end-3)); 
best = current;
tl = zeros(length(best)-3);
maxIt = 10;
while currIt < maxIt && best(end-2) ~= 0
    sucMatrix = succesors(current(1:end-3));
    while ~isempty(sucMatrix)
        if sucMatrix(1, end-2) < best(end-2)
            current = sucMatrix(1,:);
            best = current;
            currIt = 0;
            sucMatrix(1,:) = [];
        else
            if tl(sucMatrix(1,end-1),sucMatrix(1,end)) == 0
                current = sucMatrix(1, :);
                tl(sucMatrix(1,end-1),sucMatrix(1,end)) = ten;
                sucMatrix(1,:) = [];
            else
                sucMatrix(1,:) = [];
            end
        end 
    end
    currIt = currIt+1;
    taboos = find(tl);
    tl(taboos) = tl(taboos)-1;
end
best = [best currIt];
end