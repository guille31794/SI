function speed = updateInertia(speed)
% Inertia coefficient
w = 0.3;
n = 1;
while n <= size(speed,1)
    m = 1;
    while m <= size(speed(n,:),2)
        if rand >= w
            % erase the speed change
            speed{n,m} = [];
            speed{n,m} = [];
        else
            m = m+2;
        end
    end
    n = n+1;
end
end