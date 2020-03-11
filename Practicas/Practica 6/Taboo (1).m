% Taboo search 
% tl - taboo list, maxIT - max number of iteration, currIt - current
% iteration, tenure - time is assigned to taboo list, tc - taboo counter
% call: b = Taboo([1 0 0 1 0], 25, 4);
function best = Taboo(initX, it, ten)
tl = zeros(length(initX));
maxIT = it;
currIt = 1;
tenure = ten;
current = initX;
best = current;
tc = 1;
newCurrent = current;
while currIt < maxIT
    sucMatrix = succesor(current);
    sucMatrix = sortMatrixByCost(sucMatrix);
    disp(sucMatrix);
    while ~isempty(sucMatrix) && (isequal(current, newCurrent))
        if evalSAT(sucMatrix(1,:)) < evalSAT(best)
            newCurrent = sucMatrix(1,:);
            best = newCurrent;
            tl(tc) = tenure;
            sucMatrix(1,:) = [];
        else
            if tl(tc) == 0
                newCurrent = sucMatrix(1,:);
                tl(tc) = tenure;
                sucMatrix(1,:) = [];
            else
                sucMatrix(1,:) = [];
            end
        end
        tc = tc+1;
        current = newCurrent;
    end
    currIt = currIt+1;
    tc = 1;
    % decrease taboo list
    taboos = find(tl ~= 0);
    n = 1:length(taboos);
        tl(taboos(n)) = tl(taboos(n))-1;
end
end