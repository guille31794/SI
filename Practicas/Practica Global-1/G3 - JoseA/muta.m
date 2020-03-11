%Muta los cromosomas de newPob que sean elegidos por la probabilidad Pmut
%intercambiando un bit a 0 por otro a 1
function newPobMut = muta(newPob, Pmut)

newPobMut = newPob;

for i = 1:size(newPobMut,1)
    if rand < Pmut
        ceros = find(newPobMut(i,:)==0);
        unos  = find(newPobMut(i,:)==1);

        swap1 = ceros(randi(length(ceros)));
        swap2 = unos(randi(length(unos)));

        newPobMut(i, [swap1 swap2]) = newPobMut(i, [swap2 swap1]); 
    end
end
