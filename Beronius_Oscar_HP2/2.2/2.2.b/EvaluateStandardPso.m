function bestIndividual = EvaluateStandardPso(populationSize,dimensions,variableRange,cognitiveComponent,socialComponent,vMax,inertiaWeight,inertiaReduceFactor,inertiaMin,alpha,deltaT,f)

particlePositions = InitializePositions(dimensions, populationSize, variableRange);
particlePositions = fix(particlePositions); %Truncate
particleVelocities = InitializeVelocities(dimensions, populationSize, variableRange, alpha, deltaT, vMax);

particleBest = particlePositions; %Current best position for all particles
particleBestValues = EvaluateParticles(particlePositions,f);
[swarmBestVal, swarmBestIndex] = min(particleBestValues);

swarmBest = particlePositions(swarmBestIndex,:);

for i = 1:200
  %Truncate values before evaluation
  %truncParticleBest = fix(particleBest);
  %truncParticlePositions = fix(particlePositions);

  %Update particle and swarm best
  [particleBestN,swarmBestN] = EvaluateBestPositions(particleBest, particlePositions, swarmBest, f);
  particleBest = particleBestN;
  
  swarmBestNVal = f(swarmBestN);
  if(swarmBestVal < swarmBestNVal)
    disp('error')
  end

  if(swarmBestVal > swarmBestNVal)
    swarmBest = swarmBestN;
    swarmBestVal = f(swarmBest);
  end
  
  %Update velocities and positions
  particleVelocities = UpdateVelocities(particlePositions, particleBest, swarmBest, particleVelocities, inertiaWeight, cognitiveComponent, socialComponent, deltaT, vMax);
  particlePositions = UpdateParticlePositions(particlePositions, particleVelocities, deltaT);
  particlePositions = fix(particlePositions);
  
  if(inertiaWeight > inertiaMin)
    inertiaWeight = inertiaWeight*inertiaReduceFactor;
  end
  
  if(inertiaWeight < inertiaMin)
    inertiaWeight = inertiaMin;
  end
 
end

bestIndividual = [swarmBest,swarmBestVal];
end