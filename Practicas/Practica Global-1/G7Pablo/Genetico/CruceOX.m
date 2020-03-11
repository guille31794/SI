function newPob = CruceOX(parejas,Pob)
newPob = [];
N = size(Pob,2);
f1 = round(((size(Pob,2)/2)-1)*rand() + 1);
f2 = round((size(Pob,2)-((size(Pob,2)/2)+1))*rand() + ((size(Pob,2)/2)+1));
for i = 1:size(parejas,1)
   p = [Pob(parejas(i,1),:);Pob(parejas(i,2),:)];
   offs = zeros(2,N);
   offs(1,f1:f2) = p(1,f1:f2);
   offs(2,f1:f2) = p(2,f1:f2);
   p1 = 1;
   while p1<=2
       p2 = mod(p1,2)+1;
       j = mod(f2,N)+1;
       k = mod(f2,N)+1;
       while j~=f1
          if(all((p(p2,k)== offs(p1,:))==0))
             offs(p1,j)=p(p2,k);
             j = mod(j,N)+1;
          end
          k = mod(k,N)+1;
       end
       p1 = p1+1;
   end
   newPob = [newPob; offs];
end
end