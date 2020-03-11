function d = d_euclid(x, y)
    %Autor: Fernando Medina Delgado (2018)    
    if size(x,1)~=size(y,1),
       error('Parametros incorrectos');
    end;

    aux=x-y*ones(1,size(x,2));
    d=norma(aux);
end