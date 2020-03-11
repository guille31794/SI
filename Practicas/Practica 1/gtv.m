function [Vg, Vl] = gtv(a , b, N)
A = rand(1, N); %%Genero vector de 5 elementos aleatorios
Ig = find(A > a); %%Extraigo los mayores que a que hay en A
n = 1:length(Ig);
    Vg = A(Ig(n));
Il = find(A < b);
n = 1:length(Il);
    Vl = A(Il(n));
end