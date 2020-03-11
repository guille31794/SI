function vari = heuristicGrade(G, x)
% search for the restraints of every region
n = 1;
% prealocation for speed
restraints = zeros(1, length(G));
while n <= length(G)
    restraints(n) = numel(find(G(n,:)));
    n = n+1;
end
% search for the most restrained region unnasigned
vari = 0;
while vari == 0
    maximum = find(restraints == max(restraints));
    % in case there are more than one region with the same
    % restraints number, check for everyone if it's unnasigned
    index = 1;
    while index <= length(maximum) && vari == 0
        if x(maximum(index)) == 0
            % return the most restrained region unnasigned
            vari = maximum(index);
        else
            % go to next most restrained region
            restraints(maximum(index)) = 0;
        end
        index = index + 1;
    end
end
end