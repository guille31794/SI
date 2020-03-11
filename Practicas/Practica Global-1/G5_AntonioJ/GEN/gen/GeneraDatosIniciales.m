function [pob] = GeneraDatosIniciales(Nsatelites,Nrepresentantes,Height,Width)
    rand('seed',5);
    pob=Width*rand(2,Nsatelites);
end