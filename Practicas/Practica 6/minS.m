function [costSuccesor, newX] = minS(x, lvl)
% generate the succesor matrix for this iteration
costMatrix = generateSucesors(x, lvl);
% calculate whether is located the minimum cost from the matrix
[i, ~] = find(min(costMatrix(:,end)));
% creates a vector with minimun succesor from the matrix in this iteration
costSuccesor = costMatrix(i, end);
newX = costMatrix(i, 1:end-1);
end