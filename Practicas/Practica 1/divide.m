function [A, B] = divide(M, N)
porcentajeA = N/100;
nColumnasA = length(M)*porcentajeA;
n = 1:nColumnasA;
    A = M(:, n);
n = nColumnasA+1:length(M);
    B = M(:, n);
plot(A, B, 'o');
xlabel('Matriz A');
ylabel('Matriz B');
end