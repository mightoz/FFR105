function positions = InitializePositions(dimensions, populationSize, variableRange)
  
  positions = zeros(populationSize,dimensions);
  min = variableRange(1);
  max = variableRange(2);
  
  for i = 1:populationSize 
    for j = 1:dimensions  
      r = rand;
      position = min+r*(max-min);
      positions(i,j) = position;      
    end
  end  
end