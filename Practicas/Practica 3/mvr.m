function vari = mvr(x, dominios)
% search for the restraints of every region
n = 1;
% prealocation for speed
restraints = zeros(1, length(G));
while n <= length(G)
    restraints(n) = numel(find(dominios(n,:)));
    n = n+1;
end
% search for the less restrained region unnasigned
vari = 0;
while vari == 0
    minimum = find(restraints == min(restraints));
    % in case there are more than one region with the same
    % restraints number, check for everyone if it's unnasigned
    index = 1;
    while index <= length(minimum) && vari == 0
        if x(minimum(index)) == 0
            % return the most restrained region unnasigned
            vari = minimum(index);
        else
            % go to next most restrained region
            restraints(minimum(index)) = 3;
        end
        index = index + 1;
    end
end        
end