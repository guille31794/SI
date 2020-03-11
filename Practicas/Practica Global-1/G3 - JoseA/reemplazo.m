function [newPob, newFitPob] = reemplazo(pob, fitPob, newPobMut, fitPobMut)

total = [pob fitPob; newPobMut fitPobMut];
[~, pos] = sort(total(:, end), 'ascend');
total = total(pos,:);

newPob = total(1:size(pob,1), 1:size(pob,2));
newFitPob = total(1:size(pob,1), size(pob,2)+1);