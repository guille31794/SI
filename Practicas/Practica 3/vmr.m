function valores = vmr(posibles, dominios)
% check for the most restrainted value (colour)
n = 1;
% prealocating memory
restraint = zeros(1, length(dominios));
% got to compare posible values with restraint vector, being
% the posible values, index from restraint vector
while n <= size(dominios)
   restraint(n) = numel(find(dominios(:,n))); 
end
if length(posibles) < 3
    n = 1;
    % prealocatin memory
    posibleRestraints = zeros(1, length(posibles));
    while n <= length(posibles)
        posibleRestraints(n) = restraint(posibles(n));
        n = n+1;
    end
    minimum = find(posibleRestraints == min(posibleRestraints));
    valores = posibles(minimum(1));
else
    valores = find(restraint == min(restraint));
end
end