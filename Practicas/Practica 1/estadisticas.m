function [media, desviacion] = estadisticas(B)
media = mrdivide(sum(B), length(B));
varianza = 0;
n = 1:length(B);
    varianza = varianza + (B(n)-media).^2;
varianza = sum(varianza);
varianza = varianza/length(B);
desviacion = sqrt(varianza);
end