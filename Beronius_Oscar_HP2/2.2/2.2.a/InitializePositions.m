function positions = InitializePositions(dimensions, populationSize, interval)
  
  positions = zeros(populationSize,dimensions);
  min = interval(1);
  max = interval(2);
  
  for i = 1:populationSize 
    for j = 1:dimensions  
      r = rand;
      position = min+r*(max-min);
      positions(i,j) = position;      
    end
  end  
end