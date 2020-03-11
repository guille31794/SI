function [distance, vC] = eucl(M, V)
%%n = 1:length(M);
    vC = (M-V).^2;
distance = sum(vC);
distance = sqrt(distance);
distance = min(distance);
end