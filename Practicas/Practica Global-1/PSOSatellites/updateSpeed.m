% Fills speed cell array with new speeds comming from evolution
function speed = updateSpeed(speed, particularBest, globalBest, pob)
    speed(:,1) = updateInertia(speed(:,1));
    speed(:,2) = updateParticularBest(speed(:,2), particularBest, pob);
    speed(:,3) = updateGlobalBest(speed(:,3), globalBest, pob);
end