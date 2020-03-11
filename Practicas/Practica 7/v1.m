%function offs=??crossover(p,f1,f2)
%% p: two parents to cross
%% f1 & f2: crossover points
%% offs: two offsprings

p = [1 2 3 4 5 6 7  8 9;  
       4 5 2 1 8 7 6  9 3]  ;
  f1=4; f2=7;
 N=length(p);
 
 offs = zeros(2,N);
 %% Copy values between f1:f2
 offs(1,f1:f2)=p(2,f1:f2);
 offs(2,f1:f2)=p(1,f1:f2);

 ic = [p(1,f1:f2);p(2,f1:f2)];
 em=find(offs(1,:)==0); %% empty positions to fill up
 p1=1;
 
     p2=mod(p1,2)+1;
     for j=em
        cand = p(p1,j); %%candidate value
        %%  conflicts checking

        offs(p1,j) = cand;
     end
     p1=p1+1;


 offs
%end

