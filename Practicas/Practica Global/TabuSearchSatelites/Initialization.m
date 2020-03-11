clear

N = 500;
M = 40;
space = [0 500];
rand('seed', 5);
stations = zeros(2, N);
for n = 1:N
    stations(1,n) = rand * (space(2) - space(1)) + space(1);
    stations(2,n) = rand * (space(2) - space(1)) + space(1);
end

% %Binary representation
% selectedStations = zeros(1,N);
% selectedStations(1:M) = 1;

 %Integer representation
selectedStations = 1:M;

%Represented data save
represented = representedGroups(stations, selectedStations, N);
