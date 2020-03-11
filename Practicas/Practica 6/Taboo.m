% Taboo search 
% tl - taboo list, maxIT - max number of iteration, currIt - current
% iteration, tenure - time is assigned to taboo list, tc - taboo counter
% call: b = Taboo([1 0 0 1 0], 25, 4);
function best = Taboo(initX, maxIT, ten)
tl = zeros(length(initX));
currIt = 1;
tenure = ten;
current = [initX 0];
best = current;
tc = 1;
newCurrent = current;
while currIt < maxIT
    sucMatrix = xor(current(1:end-1), eye(length(current)-1));
    sucMatrix = sortMatrixByCost(sucMatrix);
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