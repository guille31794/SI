function succesor = generateSuccesorB(selectedStations, varLevel, N)
   %Method 1: varLevel rep becomes the next non-rep of the  array.
   
   %Binary representation (best)
   %Order 2N + M
   selectedI = find(selectedStations==1);
   inc = mod(selectedI(varLevel), N) + 1;
   while(selectedStations(inc))
       inc = mod(inc, N) + 1;
   end
   succesor = selectedStations;
   succesor(selectedI(varLevel)) = 0;
   succesor(inc) = 1;
end