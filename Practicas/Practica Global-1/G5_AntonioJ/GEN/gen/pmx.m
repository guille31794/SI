function offs=crossover(p,f1,f2)
%% p: two parents to cross
%% f1 & f2: crossover points
%% offs: two offsprings
 N=length(p);
 
 offs = zeros(2,N);
 %% Copy values between f1:f2
 offs(1,f1:f2)=p(2,f1:f2);
 offs(2,f1:f2)=p(1,f1:f2);

 ic = [p(1,f1:f2);p(2,f1:f2)];
 em=find(offs(1,:)==0); %% empty positions to fill up
 p1=1;
 while p1<=2
     p2=mod(p1,2)+1;
     for j=em
        cand = p(p1,j); %%candidate value
        %%  conflicts checking
           if(all((ic(p2,:) ~= cand)))
            offs(p1,j) = cand;
           else
               while(any((ic(p2,:)==cand)))
                   cand=ic(p1,ic(p2,:)==cand);
               end
               offs(p1,j)=cand;
           end
     end
     p1=p1+1;
 end
end