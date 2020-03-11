function m=submatrix(k,N)
%% devuelve la submatriz donde se encuentra k
%% N matriz cuadrada
n=sqrt(N); 
%% crea submatrices de nx n elementos con distinto numero para identificarlas
aa=[];
aa=kron(1:n,ones(n,n));
b=aa;
for i=1:n-1
    b=[b;aa+n*i];
end
vv=b(k);
m=find(b==vv);
end

