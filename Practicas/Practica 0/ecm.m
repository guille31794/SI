function res = ecm(x, z) 
    sumatorio = sum(x - z);
    potencia = sumatorio^2;
    res = potencia/length(x);
end