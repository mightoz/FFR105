function bestIndividual = EvaluateStandardPso(populationSize,dimensions,variableRange,cognitiveComponent,socialComponent,vMax,inertiaWeight,inertiaReduceFactor,inertiaMin,alpha,deltaT,f)

particlePositions = InitializePositions(dimensions, populationSize, variableRange);
particleVelocities = InitializeVelocities(dimensions, populationSize, variableRange, alpha, deltaT);

particleBest = particlePositions; %Current best particle position
particleBestValues = EvaluateParticles(particlePositions,f);
[swarmBestVal, swarmBestIndex] = min(particleBestValues);

swarmBest = particlePositions(swarmBestIndex,:);

for i = 1:2500 
  %Truncate values before evaluation
  truncParticleBest = fix(particleBest);
  truncParticlePositions = fix(particlePositions);
  
  %Update particle and swarm best
  [particleBestN,swarmBestN] = EvaluateBestPositions(truncParticleBest, truncParticlePositions, swarmBestVal, f);
  particleBest = particleBestN;
  swarmBest = swarmBestN;
  swarmBestVal = f(swarmBest);
  
  %Update velocities and positions
  particleVelocities = UpdateVelocities(particlePositions, particleBest, swarmBest, particleVelocities, inertiaWeight, cognitiveComponent, socialComponent, deltaT, vMax);
  particlePositions = UpdateParticlePositions(particlePositions, particleVelocities, deltaT);
  
  if(inertiaWeight > inertiaMin)
      inertiaWeight = inertiaWeight*inertiaReduceFactor;
  end
 
end

bestIndividual = [swarmBest,swarmBestVal];
end