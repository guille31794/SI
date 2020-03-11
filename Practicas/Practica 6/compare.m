% It compares different metaheuristic algorithms included in path
function compare()

maxIt = 1000;

% local search for n=10 and n =30
currentIt = 1;
etLs = 0;
% new version of rand('seed', n)
rng(1);
% pre-alocation for speed
% n = 10 + 2 colums  to store cost and iteration number
lsres = zeros(maxIt, 12);
while currentIt <= maxIt
    tic;
    lsres(currentIt,:) = localSearch(randperm(10));
    etLs = etLs+toc;
    currentIt = currentIt+1;
end
disp('Mean time for local search with n = 10 is: ');
disp(etLs/maxIt);
disp('Mean iteration number: '); 
disp(mean(lsres(:, end)));
disp('Number of times we find solution: ');
disp(length(find(lsres(:,end-1) == 0)));

currentIt = 1;
etLs = 0;
% new version of rand('seed', n)
rng(1);
% pre-alocation for speed
% n = 30 + 2 colums  to store cost and iteration number
lsres = zeros(maxIt, 32);
while currentIt <= maxIt
    tic;
    lsres(currentIt,:) = localSearch(randperm(30));
    etLs = etLs+toc;
    currentIt = currentIt+1;
end
disp('Mean time for local search with n = 30 is: ');
disp(etLs/maxIt);
disp('Mean iteration number: '); 
disp(mean(lsres(:, end)));
disp('Number of times we find solution: ');
disp(length(find(lsres(:,end-1) == 0)));

% Taboo
currentIt = 1;
etTs = 0;
% new version of rand('seed', n)
rng(1);
% pre-alocation for speed
tsres = zeros(maxIt, 14);
while currentIt <= maxIt
    tic;
    tsres(currentIt,:) = TabooQ(10);
    etTs = etTs+toc;
    currentIt = currentIt+1;
end
disp('Mean time for taboo search with n = 10 is: ');
disp(etTs/maxIt);
disp('Mean iteration number: '); 
disp(mean(tsres(:, end)));
disp('Number of times we find solution: ');
disp(length(find(tsres(:,end-1) == 0)));

currentIt = 1;
etTs = 0;
% new version of rand('seed', n)
rng(1);
% pre-alocation for speed
tsres = zeros(maxIt, 34);
while currentIt <= maxIt
    tic;
    tsres(currentIt,:) = TabooQ(30);
    etTs = etTs+toc;
    currentIt = currentIt+1;
end
disp('Mean time for taboo search with n = 30 is: ');
disp(etTs/maxIt);
disp('Mean iteration number: '); 
disp(mean(tsres(:, end)));
disp('Number of times we find solution: ');
disp(length(find(tsres(:,end-1) == 0)));

% Annealing
currentIt = 1;
etAs = 0;
% new version of rand('seed', n)
rng(1);
% pre-alocation for speed
Asres = zeros(maxIt, 12);
while currentIt <= maxIt
    tic;
    Asres(currentIt,:) = AnnealingQ(randperm(10));
    etAs = etAs+toc;
    currentIt = currentIt+1;
end
disp('Mean time for Annealing search with n = 10 is: ');
disp(etAs/maxIt);
disp('Mean iteration number: '); 
disp(mean(Asres(:, end)));
disp('Number of times we find solution: ');
disp(length(find(Asres(:,end-1) == 0)));

currentIt = 1;
etAs = 0;
% new version of rand('seed', n)
rng(1);
% pre-alocation for speed
Asres = zeros(maxIt, 32);
while currentIt <= maxIt
    tic;
    Asres(currentIt,:) = AnnealingQ(randperm(30));
    etAs = etAs+toc;
    currentIt = currentIt+1;
end
disp('Mean time for Annealing search with n = 30 is: ');
disp(etAs/maxIt);
disp('Mean iteration number: '); 
disp(mean(Asres(:, end)));
disp('Number of times we find solution: ');
disp(length(find(Asres(:,end-1) == 0)));

end