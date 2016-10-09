clear all;
profile on
cityLocations = LoadCityLocations;
nCities = size(cityLocations,1);
pMut = 1/nCities;
pTour = 0.8;
tourSize = 2;
nbrOfIndividuals = 100;
currentGen = zeros(nbrOfIndividuals,nCities);

for i = 1:nbrOfIndividuals
  currentGen(i,:) = randperm(nCities);
end

bestIndividual = currentGen(1,:);
bestFitness = EvaluateIndividual(bestIndividual,cityLocations);

tspFigure = InitializeTspPlot(cityLocations,[0 20 0 20]);
connection = InitializeConnections(cityLocations);
for x = 1:15000
  fitnessList = [];
  bestUpdated = false;
  
  for i = 1:size(currentGen,1)
    currentIndividual = currentGen(i,:);
    fitness = EvaluateIndividual(currentIndividual,cityLocations);
    fitnessList(i) = fitness;
    if(fitness>bestFitness)
      bestFitness = fitness;
      bestIndividual = currentIndividual;
      bestUpdated = true;
      TotalPathLength(bestIndividual,cityLocations)
    end
  end
  
  if(bestUpdated)
    PlotPath(connection,cityLocations,bestIndividual);
  end
  
  nextGen = currentGen;
  
  for i = 1:nbrOfIndividuals
    winnerIndex = TournamentSelect(fitnessList,pTour,tourSize);
    nextGen(i,:) = currentGen(winnerIndex,:);
  end
  
  for i = 1:nbrOfIndividuals
    nextGen(i,:) = Mutate(nextGen(i,:),pMut);
  end
  
  currentGen = nextGen;
  
end

profile viewer   