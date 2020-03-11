function S = bactrackSudoku(S, long)
number = 1;
ceros = find(S == 0);
while number <= long && isempty(ceros)
    if isSafe(ceros(1), number, S, long)
        S(ceros(1)) = number;
        S = bactrackSudoku(S, long);
        S(ceros(1)) = 0;
    else
        number = number+1;
    end
end
        
end

function b = isSafe(k, number, S, long)
sub = submatrix(k, long);
[raw, col] = ind2sub(long, k);
b = (all(S(sub) ~= number) && all(S(raw, :)~=number) && all(S(:,col) ~=number));
end
