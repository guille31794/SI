function newPob = Cruce(couples, pob)
newPob = zeros(size(pob,1), size(pob,2));
PCross = 0.0;
% Point to split parents
k = fix(rand()*size(pob,2));
n = 1;
m = 1;
while n <= length(couples)
    if rand() >= PCross
        newPob(m,:) = [pob(couples(n,1), 1:k) pob(couples(n,2), k+1:end)];
        m = m+1;
        newPob(m,:) = [pob(couples(n,2), 1:k) pob(couples(n,1), k+1:end)];
        m = m+1;
    else
        newPob(m,:) = pob(couples(n,1),:);
        m = m+1;
        newPob(m,:) = pob(couples(n,2),:);
        m = m+1;
    end
    n = n+1;
end
end