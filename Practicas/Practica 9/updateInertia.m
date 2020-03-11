function inertia = updateInertia(inertia)
w = 0.2;
n = 1;
while n <= size(inertia,1)
    m = 1;
    while m <= size(inertia(n,:),2)
        if rand >= w
            % erase the speed change
            inertia{n,m} = [];
            inertia{n,m} = [];
        else
            m = m+2;
        end
    end
    n = n+1;
end
end