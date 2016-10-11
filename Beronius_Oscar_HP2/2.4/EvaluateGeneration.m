function generationValues = EvaluateGeneration(generation,operands,operators,inputValues)
  nbrOfIndividuals = size(generation,2);
  for i = 1:nbrOfIndividuals
    currentChromosome = generation(i);  
    chromosomeValues = EvaluateChromosome(currentChromosome,operands,operators,inputValues);
    generationValues(i,:) = chromosomeValues;
  end
  
end