% function newPob = Cruce(couples, pob)
% % Pre-alocation for speed
% newPob = zeros(size(pob,1), size(pob,2));
% Pcross = 0.9;
% % Crossover points
% f1 = floor(size(pob,2)/5);
% f2 = size(pob,2)-f1;
% for n=1:2:size(pob,1)
%     p = [pob(n, :); pob(n+1,:)];
%     if rand() < Pcross 
%         newPob(n:n+1,:) = OXcrossover(p,f1,f2);
%     else
%         newPob(n:n+1,:) = p;
%     end
% end
% end

function newPob = Cruce(couples, pob)
newPob = zeros(size(pob,1), size(pob,2));
PCross = 0.5;
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
