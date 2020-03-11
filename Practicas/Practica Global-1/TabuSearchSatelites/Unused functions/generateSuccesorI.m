function succesor = generateSuccesorI(selectedStations, varLevel, N)
   %Integer representation (takes twice as much as binary)
   %Order M^2 + M
   inc = mod(selectedStations(varLevel), N) + 1;
   while(any(selectedStations==inc))
       inc = mod(inc, N) + 1;
   end
   succesor = selectedStations;
   succesor(varLevel) = inc;
end