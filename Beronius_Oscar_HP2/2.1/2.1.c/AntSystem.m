%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ant system (AS) for TSP.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
profile on %TODO: REMOVE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cityLocation = LoadCityLocations();
numberOfCities = length(cityLocation);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfAnts = 50;  % To do: Set to appropriate value.
alpha = 1.0;        % To do: Set to appropriate value.
beta = 2.0;         % To do: Set to appropriate value.
rho = 0.5;          % To do: set to appropriate value.

% To do: Write the GetNearestNeighbourPathLength function
nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocation);
tau0 = numberOfAnts/nearestNeighbourPathLength;

targetPathLength = 123.0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range = [0 20 0 20];
tspFigure = InitializeTspPlot(cityLocation, range);
connection = InitializeConnections(cityLocation);
pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0);
visibility = GetVisibility(cityLocation);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
minimumPathLength = inf;

iIterations = 0;
bestPath = 0;

while (iIterations < 300) %minimumPathLength > targetPathLength &&
  iIterations = iIterations + 1;
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%
  % Generate paths:
  %%%%%%%%%%%%%%%%%%%%%%%%%%
  
  pathCollection = [];
  pathLengthCollection = [];
  for k = 1:numberOfAnts
    path = GeneratePath(pheromoneLevel, visibility, alpha, beta);
    pathLength = GetPathLength(path,cityLocation);
    if (pathLength < minimumPathLength)
      bestPath = path;
      minimumPathLength = pathLength;
      disp(sprintf('Iteration %d, ant %d: path length = %.5f',iIterations,k,minimumPathLength));
      PlotPath(connection,cityLocation,path);
    end
    pathCollection = [pathCollection; path];
    pathLengthCollection = [pathLengthCollection; pathLength];
  end
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%
  % Update pheromone levels
  %%%%%%%%%%%%%%%%%%%%%%%%%%
  
  deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);
  pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);
end
profile viewer %TODO REMOVE