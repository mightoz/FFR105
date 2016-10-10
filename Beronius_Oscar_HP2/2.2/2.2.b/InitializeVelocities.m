function velocities = InitializeVelocities(dimensions, populationSize, variableRange, alpha, deltaT)
  min = variableRange(1);
  max = variableRange(2);
  
  x = max-min;
  a = alpha/deltaT;
  
  for i = 1:populationSize 
    for j = 1:dimensions  
      r = rand;
      velocity = a*(-x/2 + r*x);
      velocities(i,j) = velocity;      
    end
  end

end