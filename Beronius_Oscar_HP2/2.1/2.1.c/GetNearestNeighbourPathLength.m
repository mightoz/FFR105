function pathLength = GetNearestNeighbourPathLength(cityLocation)
  startingCity = ceil(rand(1)*size(cityLocation,1));
  currentCity = startingCity;
  
  tabuList = [startingCity];
  citiesToCheck = 1:50;
  citiesToCheck(startingCity) = [];
  
  path = [startingCity];
  
  while(length(tabuList)<50)
    paths = [];    
    for i = 1:length(citiesToCheck)
      cityToCheck = citiesToCheck(i);
      if(not(any(cityToCheck==tabuList)))
        x1 = cityLocation(currentCity,1);
        y1 = cityLocation(currentCity,2);
        x2 = cityLocation(cityToCheck,1);
        y2 = cityLocation(cityToCheck,2);
        pathLength = PathLength(x1,y1,x2,y2);   
        paths(end+1) = pathLength; 
      end
    end    
    [m,i] = min(paths);
    nextCity = citiesToCheck(i);
    citiesToCheck(i) = [];
    tabuList(end+1) = nextCity;
    path(end+1) = nextCity;
    currentCity = nextCity;   
  end
  pathLength = GetPathLength(path,cityLocation);
end