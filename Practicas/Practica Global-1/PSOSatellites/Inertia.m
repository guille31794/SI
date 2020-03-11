function speed = Inertia(speed)
n = 1;
while n <= size(speed,1)
    speed{n,1} = [speed{n,1}; speed{n,2}; speed{n,3}]; 
    n = n+1;
end