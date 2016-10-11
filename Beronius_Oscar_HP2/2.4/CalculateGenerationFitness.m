function generationFitness = CalculateGenerationFitness(generationValues,targetOutput)
  nbrOfIndividuals = size(generationValues,1);
  
  for i = 1:nbrOfIndividuals
    currentOutput = generationValues(i,:);
    currentFitness = CalculateFitness(currentOutput, targetOutput);
    generationFitness(i) = currentFitness;
  end
end