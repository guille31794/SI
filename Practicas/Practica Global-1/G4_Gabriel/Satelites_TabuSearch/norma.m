function d = norma(x)
    %Autor: Fernando Medina Delgado (2018)
    if size(x,1)==1,
       x=x';
    end;

    d=sqrt(sum(x.*x));
end