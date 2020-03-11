function d = distEuc(X,C)
    %Método de cálculo rápido de distancia euclidea de Chris McCormick
    %adaptado a las nuevas versiones de MATLAB.
    %Ver http://mccormickml.com/2014/08/22/fast-euclidean-distance-calculation-with-matlab-code/
    XX = sum(X.^2, 2);
    XC = X * C';
    CC = sum(C.^2, 2)';
    d = sqrt(CC + XX - 2*XC);
end