function probabilities = MovementProbabilities(pheromoneLevel, visibility, alpha, beta, tabuList, currentCity)
  tau = pheromoneLevel.^alpha;
  eta = visibility.^beta;
  x = tau.*eta;
  
  frame = x(currentCity,:);
  lower = frame;

  indexes = 1:length(frame);  
  indexes(ismember(indexes,tabuList))=0;
  indexes(indexes>0) = 1;
  
  lower = lower.*indexes;
   
  for i = 1:length(frame)
    probabilities(i) = lower(i)/(sum(lower));
  end
end