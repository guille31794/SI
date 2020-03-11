function e = evalSatel(E, Rep)
    for i=1:length(Rep)
        d(i,:) = distEuc(E,E(Rep(i),:)); %Declarada en su propio archivo.
    end
    e = sum(min(d,[],1));
end