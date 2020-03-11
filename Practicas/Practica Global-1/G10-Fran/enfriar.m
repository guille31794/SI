%%
%   ENFRIAR     -   Función que enfría la temperatura T
%
%       e = enfriar(T)
%
%               T = temperatura
%               e = temperatura enfriada
%
function e = enfriar(T)

%e=T/(i+1); %%cauchy
e = 0.8*T; %% exponencial