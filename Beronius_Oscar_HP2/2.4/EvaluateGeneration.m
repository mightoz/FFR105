function generationValues = EvaluateGeneration(generation,operands,operations,inputValues)
  nbrOfIndividuals = size(generation,2);
  for i = 1:nbrOfIndividuals
    currentChromosome = generation(i);  
    chromosomeValues = EvaluateChromosome(currentChromosome,operands,operations,inputValues);
    generationValues(i,:) = chromosomeValues;
  end
  
end