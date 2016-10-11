function bestIndividual = EvaluateStandardPso(populationSize,dimensions,variableRange,cognitiveComponent,socialComponent,vMax,inertiaWeight,inertiaReduceFactor,inertiaMin,alpha,deltaT,f)

particlePositions = InitializePositions(dimensions, populationSize, variableRange);
particleVelocities = InitializeVelocities(dimensions, populationSize, variableRange, alpha, deltaT);

particleBest = particlePositions;
particleBestValues = EvaluateParticles(particlePositions,f);
[swarmBestVal, swarmBestIndex] = min(particleBestValues);

swarmBest = particlePositions(swarmBestIndex,:);

for i = 1:250
  
  %Update particle and swarm best
  [particleBestN,swarmBestN] = EvaluateBestPositions(particleBest, particlePositions, swarmBest, f);
  particleBest = particleBestN;
  swarmBestNVal = f(swarmBestN);
  
  if(swarmBestNVal<swarmBestVal)
    swarmBestVal = swarmBestNVal;
    swarmBest = swarmBestN;
  end
  
  %Update velocities and positions
  particleVelocities = UpdateVelocities(particlePositions, particleBest, swarmBest, particleVelocities, inertiaWeight, cognitiveComponent, socialComponent, deltaT, vMax);
  particlePositions = UpdateParticlePositions(particlePositions, particleVelocities, deltaT);
  
  if(inertiaWeight > inertiaMin)
    inertiaWeight = inertiaWeight*inertiaReduceFactor;
  end
  
  if(inertiaWeight < inertiaMin)
    inertiaWeight = inertiaMin;
  end
  
end

bestIndividual = [swarmBest,swarmBestVal]
end