function sk = next_sk(Pob, vk, NSatelites)
    for i=1:size(Pob,1)
        sk(i,:) = Pob(i,:) + vk{i};
        sk_unico = unique(sk(i,:));
        eliminados = size(sk,2) - size(sk_unico,2);
        while eliminados ~=0
            ri = randi(NSatelites);
            if ri ~= all(sk_unico)
                sk_unico = [sk_unico ri];
                eliminados = eliminados - 1;
            end
        end
        fueraRango = find(sk_unico < 1 | sk_unico > NSatelites);
        for j=1:length(fueraRango)
            ri = randi(NSatelites);
            while ri == any(sk_unico)
                ri = randi(NSatelites);
            end
            sk_unico(fueraRango(j)) = ri;
        end
        sk(i,:) = sort(sk_unico);
    end
end