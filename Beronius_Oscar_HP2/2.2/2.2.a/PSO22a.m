alpha = 1;
deltaT = 1;
dimensions = 2;
populationSize = 40;
interval = [-10,10];
criterium = 0.000000001;
cognitiveComponent = 2;
socialComponent = 2;
vMax = 20;
f = @Function;

particlePositions = InitializePositions(dimensions, populationSize, interval);
particleVelocities = InitializeVelocities(dimensions, populationSize, interval, alpha, deltaT);

particleBest = particlePositions;
particleBestValues = EvaluateParticles(particlePositions,f);
[swarmBestVal, swarmBestIndex] = min(particleBestValues);

swarmBest = particlePositions(swarmBestIndex,:);

for i = 1:250 %swarmBest>criterium)
  
  %Update particle and swarm best
  [particleBestN,swarmBestN] = EvaluateBestPositions(particleBest, particlePositions, swarmBestVal, f);
  particleBest = particleBestN;
  swarmBest = swarmBestN;
  swarmBestVal = f(swarmBest);
  
  %Update velocities and positions
  particleVelocities = UpdateVelocities(particlePositions, particleBest, swarmBest, particleVelocities, cognitiveComponent, socialComponent, deltaT, vMax);
  particlePositions = UpdateParticlePositions(particlePositions, particleVelocities, deltaT);
  
  %swarmBest
end

swarmBest







%firstPos = positions(1,:);

%val = f(firstPos)
%values = arrayfun(f,positions)

%values = rowfun(@Function, positions)