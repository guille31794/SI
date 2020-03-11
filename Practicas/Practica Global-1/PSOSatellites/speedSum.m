% Function that perform the sum of two speeds without checking indexes
function totalSpeed = speedSum(initSpeed, pobSize)
totalSpeed = cell(pobSize,1);
n = 1;
while n <= pobSize
    if ~isempty(initSpeed{n,2})
        m = 1;
        while m <= size(initSpeed{n,1},1)
            if ~any(initSpeed{n,1}(m,2) == initSpeed{n,2}(:,2))
                totalSpeed{n} = [totalSpeed{n}; initSpeed{n,1}(m,:)];
            end
            m= m+1;
        end
        totalSpeed{n} = [totalSpeed{n}; initSpeed{n,2}];
    else
        totalSpeed{n} = initSpeed{n,1};
    end
    
    if ~isempty(totalSpeed{n})
        m = 1;
        while m <= size(initSpeed{n,3},1)
            if ~any(totalSpeed{n}(:,2) == initSpeed{n,3}(m,2))
                totalSpeed{n} = [totalSpeed{n}; initSpeed{n,3}(m,:)];
            end
            m= m+1;
        end
    else
        totalSpeed{n} = initSpeed{n,3};
    end
    n = n+1;
end
end