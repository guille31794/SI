function [succesor, newX] = minS(x, lvl)
% generate the succesor matrix for this iteration
costMatrix = generateSucesors(x, lvl);
% calculate whether is located the minimum cost from the matrix
minimum = find(costMatrix == min(costMatrix(:, length(costMatrix))));
[i , ~] = ind2sub(size(costMatrix), minimum);
% creates a vector with minimun succesor from the matrix in this iteration
succesor = costMatrix(i, length(costMatrix));
newX = costMatrix(i, :);
newX(length(newX)) = [];
end