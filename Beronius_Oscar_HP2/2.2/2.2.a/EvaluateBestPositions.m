function [bestPositions,swarmBestNew] = EvaluateBestPositions(oldPositions, newPositions, swarmBest, f)
  oldVals = EvaluateParticles(oldPositions, f);
  newVals = EvaluateParticles(newPositions, f);
  
  nbrOfParticles = length(oldVals);
  
  bestPositions = zeros(size(oldPositions));

  swarmBestVal = f(swarmBest);
  swarmBestNew = swarmBest;
  
  
  
  %Iterate through all particles
  for i = 1:nbrOfParticles 
    oldVal = oldVals(i);
    newVal = newVals(i);
    
    %Add best point of previous and last iteration to return list
    if oldVal < newVal
      bestPositions(i,:) = oldPositions(i,:);
    else
      bestPositions(i,:) = newPositions(i,:);
    end
    
    %Update swarm best if needed
    if oldVal < swarmBestVal
      swarmBestNew = oldPositions(i,:);
    end
      
    if newVal < swarmBestVal
      swarmBestNew = newPositions(i,:);
    end
  end

end