function individual = RouletteWheelSelect(fitnessList)
  r = rand;
  totalFitness = sum(fitnessList);
  
  for i = 1:length(fitnessList)
    currentFitness = sum(fitnessList(1:i));
    relativeFitness = currentFitness/totalFitness;
    if relativeFitness > r
      individual = i;
      break
    end
  end  
end