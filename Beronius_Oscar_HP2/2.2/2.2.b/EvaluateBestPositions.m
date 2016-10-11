function [bestPositions,swarmBest] = EvaluateBestPositions(oldPositions, newPositions, oldSwarmBest, f)
  oldVals = EvaluateParticles(oldPositions, f);
  newVals = EvaluateParticles(newPositions, f);
  
  nbrOfParticles = length(oldVals);
  
  bestPositions = zeros(size(oldPositions));
  
  swarmBest = oldSwarmBest;
  swarmBestVal = f(swarmBest);
  
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
      swarmBest = oldPositions(i,:);
    end
      
    if newVal < swarmBestVal
      swarmBest = newPositions(i,:);
    end
    
  end

end