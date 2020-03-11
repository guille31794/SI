function newPobMutada = Muta(newPob,Pmut)
    newPobMutada = [];
    p1 = round(((size(newPob,2)/2)-1)*rand() + 1);
    p2 = round((size(newPob,2)-((size(newPob,2)/2)+1))*rand() + ((size(newPob,2)/2)+1));
    for i=1:size(newPob,1)
       if rand()<Pmut
           aux = newPob(i,:);
           aux(1,p1:p2)=fliplr(aux(1,p1:p2));
           newPobMutada = [newPobMutada; aux];
       else
           newPobMutada = [newPobMutada; newPob(i,:)];
       end
    end
end