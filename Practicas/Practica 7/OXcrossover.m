function offs=OXcrossover(p,f1,f2)

% p: two parents to cross
% f1 & f2: crossover points
% offs: two offsprings
  
% N -> length of poblation
N=length(p);
 
% pre-alocation for speed
offs = zeros(2,N);
 
% inheriting from both parents
offs(1,f1:f2)=p(1,f1:f2);
offs(2,f1:f2)=p(2,f1:f2);


 p1=1;
 while p1<=2
     p2=mod(p1,2)+1;
     j=f2+1;  
     k=f2+1;
     while j~=f1
        % conflicts checking
        cand = (p(p2,k) == offs(p1,:));
        if cand == 0
            offs(p1,j)=p(p2,k);
            % laps to loop
            j=mod(j,N)+1;
        end
        k=mod(k,N)+1;
     end
     p1=p1+1;
 end
end
 
 
 