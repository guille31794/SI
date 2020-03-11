function vk = next_vk(Pob, vi, w, cp, cg, Spbest, Sgbest)
%     vi = w*vi + cp*rand*(Spbest(i,1:size(Pob,2)-si)) + cg*rand*(Sgbest(1:size(Pob,2)-si)
    for i=1:size(Pob,1)
        wvi = calc_prod(w, vi{i}); %w*wi
        vel1 = calc_dif(Spbest(i,1:size(Pob,2)), Pob(i,:)); % (Spbest(i,1:size(Pob,2)-si)
        vel2 = calc_dif(Sgbest(1:size(Pob,2)), Pob(i,:)); % (Sgbest(i,1:size(Pob,2)-si)
        velP = calc_prod(cp*rand, vel1); % cp*rand*(Spbest(i,1:size(Pob,2)-si))
        velG = calc_prod(cg*rand, vel2); % cg*rand*(Sgbest(1:size(Pob,2)-si)
        sum1 = calc_sum(wvi, velP); %w*vi + cp*rand*(Spbest(i,1:size(Pob,2)-si))
        vk{i} = calc_sum(sum1, velG); %w*vi + cp*rand*(Spbest(i,1:size(Pob,2)-si)) + cg*rand*(Sgbest(1:size(Pob,2)-si)
    end
end

function wvi = calc_prod(w, vi)
    r = rand(1,size(vi,2));
    ind = find(r < w);
    for i=1:size(vi,2)
        if all(i~=ind)
            wvi(i) = 0;
        else
            wvi(i) = vi(i);
        end
    end
end

function vel = calc_dif(sk, sj)
    vel = sk - sj;
end

function suma = calc_sum(vk, vj)
    suma = vk + vj;
end



