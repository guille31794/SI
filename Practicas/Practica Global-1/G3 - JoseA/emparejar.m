function parejas = emparejar(padres, Pcross)

parejas = padres(rand(length(padres),1) < Pcross);

if mod(length(parejas), 2)
    parejas = parejas(1:end-1);
end

parejas = reshape(parejas, length(parejas)/2, 2);