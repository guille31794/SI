function res = scumsum(A)
res = A(1, :);
n = 1:size(A);
    res = res + A(n,:);
end