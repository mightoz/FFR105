clear all;
profile on
cityLocations = LoadCityLocations;
nCities = size(cityLocations,1);
pMut = 1/nCities;
pTour = 0.8;
tourSize = 2;
nbrOfIndividuals = 100;


tspFigure = InitializeTspPlot(cityLocations,[0 20 0 20]);
connection = InitializeConnections(cityLocations);

for trial = 1:3
  currentGen = zeros(nbrOfIndividuals,nCities);
  
  %Initialize all individuals to nearest neighbor path, starting from a
  %random city.
  for i = 1:nbrOfIndividuals
    currentGen(i,:) = GetNearestNeighbourPath(cityLocations);
  end
  
  %Shuffle 3-10 edges of all individuals except first.
  for i = 2:nbrOfIndividuals
    path = currentGen(i,:);
    currentGen(i,:) = Shuffle(path);
  end
  
  bestIndividual = currentGen(1,:);
  bestFitness = EvaluateIndividual(bestIndividual,cityLocations);
  
  for x = 1:5000
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
        bestPathLength = TotalPathLength(bestIndividual,cityLocations);
        disp(sprintf('Trial %d, Generation %d, Individual %d: path length = %.5f',trial,x,i,bestPathLength));
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
end

profile viewer   