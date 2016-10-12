function crossedGeneration = PerformCrossover(generation,pCross,maxCrossoverLength)
  nbrOfIndividuals = size(generation,2);
  
  for i = 1:2:nbrOfIndividuals 
    r = rand;
    firstChromosome = generation(i);
    secondChromosome = generation(i+1);
    if(pCross>r)
      [firstChromosome,secondChromosome] = Cross(firstChromosome,secondChromosome,maxCrossoverLength);
    end    
    crossedGeneration(i) = firstChromosome;
    crossedGeneration(i+1) = secondChromosome;

  end 
end
