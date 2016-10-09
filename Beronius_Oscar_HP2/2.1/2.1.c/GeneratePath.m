function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
  startingCity = ceil(rand(1)*size(pheromoneLevel,1));
  tabuList = startingCity;
  
  while(length(tabuList)<50)
    currentCity = tabuList(end);
    probabilities = MovementProbabilities(pheromoneLevel,visibility,alpha,beta,tabuList,currentCity);   
    nextCity = RouletteWheelSelect(probabilities);
    tabuList(end+1) = nextCity;
  end
  path = tabuList;
end