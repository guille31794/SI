function speed = updateSpeed(speed, PobBest, globalBest, pob)
  speed(:,1) = updateInertia(speed(:,1));
  speed(:,2) = updateParticularBest(speed(:,2), PobBest, pob);
  speed(:,3) = updateGlobalBest(speed(:,3), globalBest, pob);
  %speed(:,1) = sumSpeed(speed(:,1), [speed(:,2); speed{:,3}]);
end