function sortMatrix = sortMatrixByCost(sucMatrix)
% Prealocation for speed
[r, c] = size(sucMatrix);
costMatrix = zeros(r,c+1);
sortMatrix = zeros(r,c+1);
for n = 1:length(sucMatrix)
    costMatrix(n,:) = [ sucMatrix(n,:) evalSAT(sucMatrix(n,:))];
end
% it last to sort the matrix
[r, ~] = size(costMatrix);
counter = 1;
for n = 1:r
    minimum = min(costMatrix);
    [minRow, ~] = find(costMatrix == minimum(length(minimum)));
    if counter == r
        sortMatrix(n,:) = costMatrix(1,:);
    else
        sortMatrix(n,:) = costMatrix(minRow,:);
        costMatrix(minRow,:) = [];
    end
    counter = counter +1;
end
end