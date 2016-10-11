function velocities = UpdateVelocities(particlePositions, particleBest, swarmBest, particleVelocities, inertiaWeight, cognitiveComponent, socialComponent, deltaT, vMax)
  %Iterate over each particle
  for i = 1:size(particlePositions, 1)
    
    %Iterate over each dimension of particle
    for j = 1:size(particlePositions,2)  
      %Update velocity
      r = rand;
      q = rand;
      currentPosition = particlePositions(i,j);
      currentBest = particleBest(i,j);
      dimensionBest = swarmBest(1,j);
      
      velocity = particleVelocities(i,j);
      
      velocity = velocity*inertiaWeight + cognitiveComponent*q*((currentBest - currentPosition)/deltaT) + socialComponent*r*((dimensionBest-currentPosition)/deltaT);
      
      %Restrict velocity
      if norm(velocity) > vMax
        velocity = sign(velocity)*vMax;
      end
      
      velocities(i,j) = velocity;
      
    end
  end
end
