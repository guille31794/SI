function [mdist, pos] = max_dist(origin, destinies)
    dist = zeros(1, size(destinies, 2));
    
    for n = 1:length(dist)
        dist(n) = sqrt((origin(1)-destinies(1,n))^2 + (origin(2)-destinies(2,n))^2);
    end
    [mdist, pos] = max(dist);
end