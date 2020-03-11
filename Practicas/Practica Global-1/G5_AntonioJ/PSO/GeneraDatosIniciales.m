function [pob] = GeneraDatosIniciales(Nsatelites,Height,Width)
    pob=[];

    Satelites = randi([1 Width],1,Nsatelites);
    Satelites = [Satelites; randi([1 Height],1,Nsatelites)];
    Satelites(:,9)=Satelites(:,1);
    Satelites = unique(Satelites','rows');

    while size(Satelites,1)~=Nsatelites
        relleno = randi([1 Width],1,Nsatelites-size(Satelites,1));
        relleno = [relleno' randi([1 Height],1,Nsatelites-size(Satelites,1))'];
        Satelites = [Satelites; relleno];
        Satelites = unique(Satelites,'rows');
    end
    pob = [pob; Satelites'];
end