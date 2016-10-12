function mutatedGeneration = PerformMutation(generation,alleleRanges)
  nbrOfIndividuals = size(generation,2);
  
  for i = 1:nbrOfIndividuals 
    chromosome = generation(i);
    
    mutatedChromosome = Mutate(chromosome,alleleRanges);
    mutatedGeneration(i) = mutatedChromosome;    

  end
  
end