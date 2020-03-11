function v = sumavv(v1, v2)
    v = [];
    for i = 1:min(size(v1,1),size(v2,1))
        if ~isempty(intersect(v1(i,:),v2(i,:)))
            int = find(v2(i,:)==v1(i,1));
            if isempty(int)
                j = mod(min(find(v2(i,:) == v1(i,2))),2)+1;
                v = [v; v1(i,1) v2(i,j)];
            else
                j = mod(min(find(v2(i,:) == v1(i,1))),2)+1;
                v = [v; v1(i,2) v2(i,j)];
            end
        else
            v = [v; v1(i,:)];
        end
    end
    if size(v1,1) ~= size(v2,1)
        if size(v1,1) > size(v2,1)
           v = [v; v1(size(v2,1)+1:size(v1,1),:)];
        else
           v = [v; v2(size(v1,1)+1:size(v2,1),:)];
        end
    end
end