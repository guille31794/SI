%% S - Matriz Sudoku
%% number - numero que probar si es seguro
%% ceros - vector de indices de elementos de la matriz sudoku que a�n no tienen valor


function S = bactrackSudoku(S)
number = 1;
ceros = find(S == 0);
while number <= length(S) && not(isempty(ceros))
    if isSafe(ceros(1), number, S)
        S(ceros(1)) = number;
        if length(find(S==0))~=0
            S = bactrackSudoku(S);
            if  length(find(S==0))~=0
                S(ceros(1)) = 0;
            end
        end
    end
    number = number+1;
end      
end

function b = isSafe(k, number, S)
sub = submatrix(k, length(S));
[raw, col] = ind2sub(length(S), k);
b = (all(S(sub) ~= number) && all(S(raw, :)~=number) && all(S(:,col) ~=number));
end
