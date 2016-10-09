function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
  
  sumOfPheromoneLevels = zeros(size(pathCollection,2));
  %Loop over number of ants
  for x = 1:size(pathCollection,1)
    currentAntPath = pathCollection(x,:);
    pheromonesFromCurrentAnt = zeros(size(pathCollection,2)); 
    tourLengthCurrentAnt = pathLengthCollection(x,1);   
    %Loop over path of current ant
    for i = 1:size(currentAntPath,2)-1   
      from = currentAntPath(i);
      to = currentAntPath(i+1);
      pheromonesFromCurrentAnt(from,to) = 1/tourLengthCurrentAnt;
      pheromonesFromCurrentAnt(to,from) = 1/tourLengthCurrentAnt;
    end
    sumOfPheromoneLevels = sumOfPheromoneLevels + pheromonesFromCurrentAnt;
  end
  
  deltaPheromoneLevel = sumOfPheromoneLevels;
end